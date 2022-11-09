{
  inputs.nixpkgs.url  = "github:nixos/nixpkgs";
  inputs.dsf.url      = "github:cruel-intentions/devshell-files";
  inputs.gha.url      = "github:cruel-intentions/gh-actions";
  inputs.dsf.inputs.nixpkgs.follows = "nixpkgs";
  inputs.gha.inputs.dfs.follows     = "dfs";

  outputs = { self, nixpkgs, dsf, ...}@inputs:
    let lib = import ./lib.nix;
    in 
    (lib.mkMainOutput { inherit self nixpkgs inputs; })
    //
    (dsf.lib.shell    { inherit self nixpkgs dsf; } [
      "${inputs.gha}/gh-actions.nix"
      ./modules/nimcfg-options.nix
      ./modules/nimcfg-files.nix
      ./devshell.nix
    ]);
}
