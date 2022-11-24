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
  runDeps = name: opts: 
    if      opts.runDeps == null
    then "" 
    else if builtins.typeOf opts.runDeps == "list" 
    then builtins.concatStringsSep ":" (map (v: "::${v}") opts.runDeps)
    else "${builtins.typeOf opts.runDeps}";
  deps = name: opts: 
    if      opts.deps == null
    then "" 
    else if builtins.typeOf opts.deps == "list" 
    then builtins.concatStringsSep ":" (map (v: "::${v}") opts.deps)
    else "${builtins.typeOf opts.deps}";
  pkg     = name: opts: ''
    cd $PRJ_ROOT
    # name ${name}
    # deps ${deps name opts}
    # runDeps ${runDeps name opts}
    ${cmd name opts} ${opts.cmd} ${toString opts.file}

  '';
  alias   = builtins.mapAttrs pkg cfgs;
  packages = [];
in
{
    inherit packages;
  files.alias = alias;
} 
