# nim-flakes-lib

[Nix](https://nixos.org/) flake library to help create [Nim](https://nim-lang.org/) package using Nix.

## Why

Nix is a package manager, it install dependencies for us,
can be used to install any [Nix package](https://search.nixos.org/) (nim, c libraries, tools, etc).

Nix is a config language, it can be used to generate our [CI config](https://cruel-intentions.github.io/gh-actions/), [nim.cfg](https://riinr.github.io/nim-flakes-lib/nimcfg-options.html), [documentation](https://github.com/riinr/nim-flakes-lib/blob/master/docs/book.nix), [etc](https://cruel-intentions.github.io/devshell-files/builtins.html), and these configurations could be shared with other nix packages.
