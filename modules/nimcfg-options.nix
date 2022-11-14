{pkgs, config, lib, extraModules, ...}:
let
 opts-attrs = import ./nimcfg-options-attrs.nix { inherit lib; };
in
{
  options.nimcfg = lib.mkOption {
    default     = {};
    description = ''
      Generates a file with config into your project.

      **FAQ**

      _Why there is no array?_
      
      Nix has array but there is no way to define how to disable one item from a array.

      Like we can override one attr value with [lib.mkDefault, lib.mkForce, lib.mkOverride](https://nixos.org/manual/nixos/stable/index.html#sec-option-definitions-setting-priorities).


      **LICENSE NOTICE**:

      - Descriptions comes from [Nim Docs](https://nim-lang.org/docs/nimc.html)
      - Please read [Nim copyright](https://github.com/nim-lang/Nim/blob/devel/copying.txt)
    '';
    example."/nim.cfg" = {
      app                 = "console";
      asm                 = true;
      assertions          = true;
      backend             = "c";
      benchmarkVM         = false;
      boundChecks         = true;
      cc                  = "gcc";
      checkStyle          = false;
      checks              = true;
      cincludes           = "DIR";
      clearNimblePath     = false;
      clib                = "LIBNAME";
      clibdir             = "DIR";
      colors              = true;
      compileOnly         = false;
      cpu                 = "x86-64";
      debugger            = "native";
      debuginfo           = true;
      declaredLocs        = true;
      deepcopy            = true;
      docCmd              = "CMD";
      docInternal         = true;
      docRoot             = "PATH";
      docSeeSrcUrl        = "URL";
      dynlibOverrideAll   = false;
      embedsrc            = false;
      errorMax            = 1;
      exceptions          = "setjmp";
      excessiveStackTrace = false;
      fieldChecks         = true;
      filenames           = "abs";
      forceBuild          = true;
      genScript           = true;
      hints               = true;
      hotCodeReloading    = false;
      implicitStatic      = true;
      incremental         = true;
      index               = true;
      infChecks           = true;
      lib                 = "PATH";
      lineDir             = true;
      lineTrace           = true;
      listCmd             = true;
      maxLoopIterationsVM = 100000;
      mm                  = "arc";
      multimethods        = false;
      nanChecks           = true;
      nimMainPrefix       = "PREFIX";
      nimblePath          = "PATH";
      nimcache            = "PATH";
      noLinking           = true;
      noMain              = true;
      noNimblePath        = false;
      objChecks           = true;
      opt                 = "speed";
      os                  = "linux";
      out                 = "FILE";
      outdir              = "DIR";
      overflowChecks      = true;
      panics              = false;
      parallelBuild       = 4;
      passC               = "OPTION";
      passL               = "OPTION";
      processing          = "dots";
      profileVM           = false;
      project             = true;
      rangeChecks         = true;
      showAllMismatches   = false;
      sinkInference       = true;
      skipCfg             = false;
      skipParentCfg       = true;
      skipProjCfg         = true;
      skipUserCfg         = true;
      spellSuggest        = 10;
      stackTrace          = true;
      stackTraceMsgs      = false;
      stdout              = true;
      threads             = true;
      tlsEmulation        = false;
      trmacros            = false;
      unitsep             = true;
      useVersion          = "1.2";
      usenimcache         = true;
      verbosity           = 3;
      warnings            = true;

      cppCompileToNamespace."NS" = true;
      define.defineSomething     = "your defined option";
      dynlibOverride."SYMBOL"    = true;
      excludePath."PATH"         = false;
      expandArc."PROCNAME"       = true;
      expandMacro."MACRO"        = true;
      experimental."FEAT"        = true;
      hint.someHint              = true;
      hintAsError.someHint       = true;
      import."someImport"        = true;
      include."someInclude"      = true;
      legacy."FEAT"              = true;
      path."somePath"            = true;
      putenv.someKey             = true;
      warning.someWarning        = true;
      warningAsError.someWarning = true;
      defusages."FILE,LINE,COL"  = true;
    };
    type = lib.types.attrsOf (lib.types.submodule { options = opts-attrs.nim-cfg; });
  };
}
