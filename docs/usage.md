## Usage

- Add it to your inputs.

- Call the mkRefOutput function from lib

Example:

```nix
{
  description = "Your flake package description"; # optional

  inputs.dsf.url            = "github:cruel-intentions/devshell-files";  # optional
  inputs.flakeNimbleLib.url = "github:riinr/nim-flakes-lib";
  inputs.nixpkgs.url        = "github:nixos/nixpkgs";

  inputs.dsf.inputs.nixpkgs.follows            = "nixpkgs";              # optional
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";

  outputs = inputs:
    (inputs.flakeNimbleLib.lib.mkRefOutput {
      nixpkgs = inputs.nixpkgs;
      self    = inputs.self;
      src     = ./.;                                                     # source could be an input also
      meta.ref     = "master";
      meta.version = "0.1.0";
      meta.name    = "my_package_name";
      meta.desc    = "My package description";
    })
    //                                                                   # this means merge previous object with this one
    (inputs.dsf.lib.shell inputs [ ./nix/project.nix ]);                 # optional
}
```

Add this as `flake.nix` in your repository then run `nix flake show`, it display what packages this libs generates for you.
Currently only `defaultPackage` and `src` package, but in future we're planning to add `musl` and `cosmopolitan` packages, and maybe some other archs.

To build `defaultPackage` run `nix build`, it compiles your project to `result/bin/my_package_name`

