with builtins;
let
  resolveDep = system: lib: meta: depProject:
  let
    depPkg = depProject.defaultPackage.${system};
    subDeps = depProject.dependencies.${system};
  in [ depPkg ]; # ++ subDeps;
  resolveDeps = system: lib: meta: deps:
    concatMap
    (resolveDep system lib meta)
    (attrValues deps);
  fn = args: drvArgs: drvArgs;
  mkRefOutputFor = system: { self, nixpkgs, src, deps, meta, override ? fn}:
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
    inherit meta;
    dependencies.${system}   = dependencies;
    packages.${system}.src   = runCommand "nimpkgs-${name}-${version}" ''
      cp -R ${src} $out
    '';
    defaultPackage.${system} = buildNimPackage (
      (override)
        { inherit self nixpkgs src deps meta system; }
        {
          inherit src version;
          pname = meta.name;
          propagatedBuildInputs = dependencies;
          meta.description = 
            meta.desc        or
            meta.description or 
            "nim package ${meta.name}";
        }
    );
  };
in 
{
  inherit mkRefOutputFor;
  mkRefOutput = mkRefOutputFor "x86_64-linux";
}
