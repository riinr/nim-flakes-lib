let
  projectLib = import ./project.nix;
  referenceLib = import ./reference.nix;
  lib = {
    inherit (projectLib) mkProjectOutput mkProjectOutputFor;
    inherit (referenceLib) mkRefOutput mkRefOutputFor;
  };
  mkMainOutput = { self, nixpkgs, inputs }: {
    inherit lib;
  };
in lib // { inherit mkMainOutput; }
