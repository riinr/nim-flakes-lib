# nim-flakes-lib

[Nix](https://nixos.org/) flake library to help create [Nim](https://nim-lang.org/) package using Nix.

## Why

Nix is a package manager, it install dependencies for us,
can be used to install any [Nix package](https://search.nixos.org/) (nim, c libraries, tools, etc).

Nix is a config language, it will (TODO) help configure your build, it can be used to generate our CI config, nim.cfg, and documentation, this configuration could be easy share with other nix packages.

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


## See also

- [Flake Nimble](https://github.com/nix-community/flake-nimble), auto generated flakes from [packages.json](https://github.com/nim-lang/packages/)
- [Flake Crown](https://github.com/riinr/flake-crown), hard fork of Flake Nimble to use flake for pinning using this lib.
- [Cosmonim](https://github.com/Yardanico/cosmonim), compile Nim with Cosmopolitan libc.
- [Hello Musl](https://github.com/kaushalmodi/hello_musl), compile Nim with Musl + PCRE + libressl.
- [Nim Emscripten Tutorial](https://github.com/treeform/nim_emscripten_tutorial), compile Nim for WASM.


## Todo

- [Devshell](https://github.com/numtide/devshell) ([Files](https://github.com/cruel-intentions/devshell-files)) Modules to configure nim.cfg
- Make it generate packages for:
  - Cosmopolitan
  - Musl
  - LibreSSL
  - Emscripten
