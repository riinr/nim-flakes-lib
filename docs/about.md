# nim-flakes-lib

[Nix](https://nixos.org/) flake library to help create [Nim](https://nim-lang.org/) package using Nix.


## Why

Nix is a package manager, 
can be used to install any [Nix Package](https://search.nixos.org/) 
like nim, nodejs, python, c libraries, tools, etc (more than 40 000 pkgs).

Nix is also a config language, 
it can be used to generate our [nim.cfg](https://riinr.github.io/nim-flakes-lib/nimcfg-options.html), 
[CI config](https://cruel-intentions.github.io/gh-actions/), 
[documentation](https://github.com/riinr/nim-flakes-lib/blob/master/docs/book.nix), 
[etc](https://cruel-intentions.github.io/devshell-files/builtins.html), 
and these configurations could be shared with others as nix packages.


