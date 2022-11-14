{pkgs, config, lib, extraModules,...}:
let
  opts-attrs = import ./nimcfg-options-attrs.nix { inherit lib; };
in
{
  options.nimpkg = lib.mkOption {
    default     = {};
    description = ''setup a nim package'';
    type        = lib.types.attrsOf (lib.types.submodule { options = opts-attrs.nim-pkg; });
    example.yourPkgName-default.default = true;
    example.yourPkgName-default.version = "0.1.0";
    example.yourPkgName-default.cmd     = "build";
    example.yourPkgName-default.opts.threads = true;
    example.yourPkgName-default.opts.define.ssl = true;
  };
}
