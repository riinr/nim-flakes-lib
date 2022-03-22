with builtins;
let 
  mkProjectOutputFor = system: { self, nixpkgs, refs, meta }:
  let
    lib = nixpkgs.lib;
    buildNimPackage = nixpkgs.legacyPackages.${system};
    lowerName = lib.toLower meta.name;
    refNames = attrNames refs;
    firstRef = head refNames;
    mainPkg =
      refs."${lowerName}-master"   or
      refs."${lowerName}-main"     or
      refs."${lowerName}-unstable" or
      refs."${lowerName}-develop"  or
      (trace refNames refs.${firstRef});
    baseOutput = { inherit meta; };
    output = {
      defaultPackage.${system} = mainPkg.defaultPackage.${system};
      packages.${system} = mapAttrs (k: v: v.defaultPackage.${system}) refs;
      dependencies.${system} = mapAttrs (k: v: v.dependencies) refs;
    };
  in 
    if builtins.length refNames > 0
    then baseOutput // output
    else trace 
      "No branch or tags for project ${lowerName}" 
      baseOutput;
in
{
  inherit mkProjectOutputFor;
  mkProjectOutput = mkProjectOutputFor "x86_64-linux";
}
