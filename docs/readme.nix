{
  files.text."/README.md" = builtins.concatStringsSep "\n" [
    (builtins.readFile ./about.md)
    (builtins.readFile ./usage.md)
    (builtins.readFile ./see-also.md)
  ];
}

