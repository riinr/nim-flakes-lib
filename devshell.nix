{
  imports = [
    ./modules/nimcfg-example.nix
    ./modules/nimpkg-example.nix
    ./docs/readme.nix
    ./docs/book.nix
  ];

  # configure direnv .envrc file
  files.direnv.enable = true;
  # copy contents from https://github.com/github/gitignore
  # to our .gitignore
  files.gitignore.enable  = true;
  files.gitignore.pattern.".direnv"          = true;
  files.gitignore.pattern."nim.cfg"          = true;
  files.gitignore.template."Global/Archives" = true;
  files.gitignore.template."Global/Backup"   = true;
  files.gitignore.template."Global/Diff"     = true;

  files.license.enable    = true;
  files.license.spdx.name = "MIT";
  files.license.spdx.vars."copyright holders" = "RiiNR";
  files.license.spdx.vars.year                = "2022";
  # look at https://cruel-intentions.github.io/devshell-files/builtins.html
  # for more builtins options
  files.cmds.gcc  = true;

  # look at https://cruel-intentions.github.io/devshell-files/modules.html
  # for how to create modules
}
