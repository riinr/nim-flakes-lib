# nim-flakes-lib

[Nix](https://nixos.org/) flake library to help create [Nim](https://nim-lang.org/) package using Nix.

## Why

Nix is a package manager, it install dependencies for us,
can be used to install any [Nix package](https://search.nixos.org/) (nim, c libraries, tools, etc).

Nix is a config language, it will (TODO) help configure your build, it can be used to generate our CI config, nim.cfg, and documentation, this configuration could be easy share with other nix packages.
