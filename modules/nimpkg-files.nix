{pkgs, config, lib, extraModules,...}:
let
  cfgs    = config.nimpkg;
  cmd     = name: opts:
  if opts.nimble.enable 
  then
    if opts.nimble.package == null 
    then "${pkgs.nimble-unwrapped}/bin/nimble"
    else "${opts.nimble.package}/bin/nimble"
  else 
    if opts.nim == null 
    then "${pkgs.nim-unwrapped}/bin/nim" 
    else "${opts.nim}/bin/nim";
  cLibs   = name: opts: 
    if      opts.cLibs == null
    then "" 
    else if builtins.typeOf opts.cLibs == "list" 
    then builtins.concatStringsSep ":" (map (v: "::${v}") opts.cLibs)
    else "${builtins.typeOf opts.cLibs}";
  runLibs = name: opts: 
    if      opts.cLibs == null
    then "" 
    else if builtins.typeOf opts.runLibs == "list" 
    then builtins.concatStringsSep ":" (map (v: "::${v}") opts.runLibs)
    else "${builtins.typeOf opts.runLibs}";
  deps = name: opts: 
    if      opts.deps == null
    then "" 
    else if builtins.typeOf opts.deps == "list" 
    then builtins.concatStringsSep ":" (map (v: "::${v}") opts.deps)
    else "${builtins.typeOf opts.runLibs}";
  pkg     = name: opts: ''
    cd $PRJ_ROOT
    # name ${name}
    # clibs ${cLibs name opts}
    # runLibs ${runLibs name opts}
    # deps ${deps name opts}
    ${cmd name opts} ${opts.cmd} ${toString opts.file}

  '';
  alias   = builtins.mapAttrs pkg cfgs;
  packages = [];
in
{
    inherit packages;
  files.alias = alias;
} 
