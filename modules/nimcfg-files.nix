{pkgs, config, lib, extraModules,...}:
let
  concatMapAttr = fn: attrs: builtins.concatStringsSep "\n" (filterEmpty (builtins.attrValues (builtins.mapAttrs fn attrs)));
  filterEmpty   = builtins.filter (v: v != "");
  cfgs    = config.nimcfg;
  defOpt  = name: val: 
    concatMapAttr (k: v: 
      if builtins.typeOf v == "string"   then ''--${name}:${k}="${v}"''
      else if builtins.typeOf v == "int" then ''--${name}:${k}=${toString v}''
      else if v                          then ''--${name}:${k}=true''
      else  ''--${name}:${k}=false''
    ) val;
  envOpt  = name: val: concatMapAttr (k: v: ''--${name}:"${k}=${v}"'') val;
  boolOpt = name: val:
  if builtins.any (v: v == name) ["usenimcache" "project" "docInternal" "noNimblePath" "clearNimblePath" "dynlibOverrideAll" "listCmd" "asm"]
  then if val then "--${name}"    else ""
  else if val then "--${name}:on"
  else "--${name}:off";
  strOpt  = name: val:
  if builtins.any (v: v == name) ["opt" "debugger" "app" "filenames" "processing" "styleCheck" "backend" "mm" "exceptions" "useVersion"]
  then ''--${name}:${val}''
  else ''--${name}:"${val}"'';
  intOpt  = name: val: ''--${name}:${toString val}'';
  setOpt  = name: val:
  if builtins.any (v: v == name) ["hint" "hintAsError" "warning" "warningAsError" ""] 
  then concatMapAttr (k: v: opt "${name}:${k}" v) val
  else if name == "define" then defOpt name val
  else if name == "putenv" then envOpt name val
  else concatMapAttr (k: v: if v == true then opt name k else "") val;
  opt     = name: val: 
  if val == null || name == "HEADER" || name == "FOOTER" then "" 
  else if builtins.typeOf val == "bool"                  then boolOpt name val
  else if builtins.typeOf val == "string"                then strOpt  name val
  else if builtins.typeOf val == "int"                   then intOpt  name val
  else if builtins.typeOf val == "set"                   then setOpt  name val
  else ''# --${name}  ${builtins.typeOf val}'';
  file    = name: opts: 
    ''
    ${opts.HEADER}
    ${concatMapAttr opt opts}
    ${opts.FOOTER}
    '';
  texts   = builtins.mapAttrs file cfgs;
in
{
  files.text = texts;
}
