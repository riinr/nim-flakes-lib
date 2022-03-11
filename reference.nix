with builtins;
let
  compVerKind = k: a: b:
    if k == "verEq"
    then compareVersions a b == 0
    else if k == "verLater"
    then compareVersions a b > 0
    else if k == "verEqLater"
    then compareVersions a b >= 0
    else if k == "verEarlier"
    then compareVersions a b < 0
    else if k == "verEqEarlier"
    then compareVersions a b <= 0
    else false;
  compVer = compVerKind "verLater";
  compVerEq = compVerKind "verEqLater";
  resolveDep = system: lib: meta: depProject:
  let
    depName = lib.toLower depProject.meta.name; 
    like = (spec: (lib.toLower spec.name) == depName);
    depSpec = head (filter like meta.requires);
    depPkgs = depProject.packages.${system};
    depDeps = (depProject.dependencies or {}).${system} or {};
    depPkgNames = attrNames depPkgs;
    name2Version = name: replaceStrings
      [depName "-" "v" "_"]
      [""      ""  ""  "."]
      name;
    depVersions = map name2Version depPkgNames;
    firstRef = head depPkgNames;
    defaultPkgName = 
      if hasAttr "${depName}-master" depPkgs 
      then "${depName}-master"
      else if hasAttr "${depName}-main" depPkgs 
      then "${depName}-main"
      else if hasAttr "${depName}-unstable" depPkgs 
      then "${depName}-unstable"
      else if hasAttr "${depName}-develop" depPkgs 
      then "${depName}-develop"
      else  (trace depPkgNames firstRef);
    kind = depSpec.ver.kind;
    ver = depSpec.ver.ver;
    algs = {
      verAny = defaultPkgName;
      verEq = 
      let 
        vSuffix = replaceStrings ["."] ["_"] ver;
      in
        if hasAttr "${depName}-v${vSuffix}" depPkgs
        then "${depName}-v${vSuffix}"
        else if hasAttr "${depName}-${vSuffix}" depPkgs
        then "${depName}-${vSuffix}"
        else (trace "${meta.name} using default for ${depName}, no ${vSuffix}" defaultPkgName);
      verLater = 
      let 
        validVersions = filter (v: compVerKind kind v ver) depVersions;
        lastVersion = head (sort compVer validVersions);
        vSuffix = 
          if length validVersions > 0
          then replaceStrings ["."] ["_"] lastVersion
          else "tag like ${depSpec.str}";
      in
        if hasAttr "${depName}-v${vSuffix}" depPkgs
        then "${depName}-v${vSuffix}"
        else if hasAttr "${depName}-${vSuffix}" depPkgs
        then "${depName}-${vSuffix}"
        else (trace "${meta.name} using default for ${depName}, no ${vSuffix}" defaultPkgName);
      verEarlier =
      let 
        validVersions = filter (v: compVerKind kind v ver) depVersions;
        lastVersion = head (sort compVer validVersions);
        vSuffix = 
          if length validVersions > 0
          then replaceStrings ["."] ["_"] lastVersion
          else "tag like ${depSpec.str}";
      in
        if hasAttr "${depName}-v${vSuffix}" depPkgs
        then "${depName}-v${vSuffix}"
        else if hasAttr "${depName}-${vSuffix}" depPkgs
        then "${depName}-${vSuffix}"
        else (trace "${meta.name} using default for ${depName}, no ${vSuffix}" defaultPkgName);
      verEqLater = 
      let 
        validVersions = filter (v: compVerKind kind v ver) depVersions;
        lastVersion = head
          (sort compVer validVersions);
        vSuffix = 
          if length validVersions > 0
          then replaceStrings ["."] ["_"] lastVersion
          else "tag like ${depSpec.str}";
      in
        if hasAttr "${depName}-v${vSuffix}" depPkgs
        then "${depName}-v${vSuffix}"
        else if hasAttr "${depName}-${vSuffix}" depPkgs
        then "${depName}-${vSuffix}"
        else (trace "${meta.name} using default for ${depName}, no ${vSuffix}" defaultPkgName);
      verEqEarlier = 
      let 
        validVersions = filter (v: compVerKind kind v ver) depVersions;
        lastVersion = head 
          (sort compVer validVersions);
        vSuffix = 
          if length validVersions > 0
          then replaceStrings ["."] ["_"] lastVersion
          else "tag like ${depSpec.str}";
      in
        if hasAttr "${depName}-v${vSuffix}" depPkgs
        then "${depName}-v${vSuffix}"
        else if hasAttr "${depName}-${vSuffix}" depPkgs
        then "${depName}-${vSuffix}"
        else (trace "${meta.name} using default for ${depName}, no ${vSuffix}" defaultPkgName);
      verIntersect = 
      let
        lVer = depSpec.ver.verILeft.ver;
        lKind = depSpec.ver.verILeft.kind;
        rVer = depSpec.ver.verIRight.ver;
        rKind = depSpec.ver.verIRight.kind;
        validVersions = filter 
          (v: compVerKind lKind v lVer && compVerKind rKind v rVer)
          depVersions;
        lastVersion = head 
          (sort compVer validVersions);
        vSuffix = 
          if length validVersions > 0
          then replaceStrings ["."] ["_"] lastVersion
          else "tag like ${depSpec.str}";
      in
        if hasAttr "${depName}-v${vSuffix}" depPkgs
        then "${depName}-v${vSuffix}"
        else if hasAttr "${depName}-${vSuffix}" depPkgs
        then "${depName}-${vSuffix}"
        else (trace "${meta.name} using default for ${depName}, no ${vSuffix}" defaultPkgName);
      verSpecial = 
      let 
        ver = depSpec.ver.spe;
        vSuffix = replaceStrings ["#"] [""] ver;
      in
        if hasAttr "${depName}-${vSuffix}" depPkgs
        then "${depName}-${vSuffix}"
        else (trace "${meta.name} using default for ${depName}, no ${vSuffix}" defaultPkgName);
    };
    pkgName = 
      algs.${kind} or 
      (
        trace
        ''
          not implemented ${kind} version resolution,
          using default (${firstRef}) for ${depName}
        ''
        defaultPkgName);
  in [ depPkgs.${pkgName} ]; # ++ (depDeps.${pkgName} or []);
  resolveDeps = system: lib: meta: deps:
    concatMap
    (resolveDep system lib meta)
    (attrValues deps);
  mkRefOutputFor = system: { self, nixpkgs, src, deps, meta }:
  let
    lib = nixpkgs.lib;
    pkgs = nixpkgs.legacyPackages.${system};
    buildNimPackage = pkgs.nimPackages.buildNimPackage;
    ref = replaceStrings 
      ["refs/" "heads/" "tags/v" "tags/" "_"]
      [""      ""       ""       ""      "."]
      meta.ref;
    version = 
      if ref == meta.version
      then meta.version
      else ref;
    dependencies = resolveDeps system lib meta deps;
  in {
    inherit meta dependencies;
    defaultPackage.${system} =  buildNimPackage {
      inherit src version;
      pname = meta.name;
      propagatedBuildInputs = dependencies;
      meta.description = 
        meta.desc        or
        meta.description or 
        "nim package ${meta.name}";
    };
  };
in 
{
  inherit mkRefOutputFor;
  mkRefOutput = mkRefOutputFor "x86_64-linux";
}
