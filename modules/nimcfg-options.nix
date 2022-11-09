# LICENSE NOTICE:
# Descriptions comes from: https://github.com/nim-lang/Nim/blob/devel/doc/nimc.md
# Please refer to https://github.com/nim-lang/Nim/blob/devel/copying.txt

{pkgs, config, lib, extraModules,...}:
let
  mkBool = description: {
    inherit description;
    default = null;
    example = true;
    type    = lib.types.nullOr lib.types.bool;
  };

  options = builtins.mapAttrs (k: opt: lib.mkOption opt) {
    asm                 = mkBool ''produce assembler code'';
    assertions          = mkBool ''turn assertions on|off'';
    benchmarkVM         = mkBool ''turn benchmarking of VM code with cpuTime() on|off'';
    boundChecks         = mkBool ''turn bound checks on|off'';
    checks              = mkBool ''turn all runtime checks on|off'';
    clearNimblePath     = mkBool ''empty the list of Nimble package search paths'';
    colors              = mkBool ''turn compiler messages coloring on|off'';
    compileOnly         = mkBool ''compile Nim files only; do not assemble or link'';
    debuginfo           = mkBool ''enables debug information'';
    declaredLocs        = mkBool ''show declaration locations in messages'';
    deepcopy            = mkBool ''enable 'system.deepCopy' for --mm:arc|orc'';
    docInternal         = mkBool ''also generate documentation for non-exported symbols'';
    dynlibOverrideAll   = mkBool ''disables the effects of the dynlib pragma'';
    embedsrc            = mkBool ''embeds the original source code as comments in the generated output'';
    excessiveStackTrace = mkBool ''stack traces use full file paths'';
    fieldChecks         = mkBool ''turn case variant field checks on|off'';
    floatChecks         = mkBool ''turn all floating point (NaN/Inf) checks on|off'';
    forceBuild          = mkBool ''force rebuilding of all modules'';
    genScript           = mkBool ''generate a compile script (in the 'nimcache' subdirectory named 'compile_$$project$$scriptext'), and a '.deps' file containing the dependencies; implies --compileOnly'';
    hints               = mkBool ''on|off enables or disables hints. list reports which hints are selected.'';
    implicitStatic      = mkBool ''turn implicit compile time evaluation on|off'';
    incremental         = mkBool ''only recompile the changed modules (experimental!)'';
    index               = mkBool ''turn index file generation on|off'';
    infChecks           = mkBool ''turn Inf checks on|off'';
    lineDir             = mkBool ''generation of #line directive on|off'';
    lineTrace           = mkBool ''turn line tracing on|off'';
    listCmd             = mkBool ''list the compilation commands; can be combined with --hint:exec:on and --hint:link:on'';
    multimethods        = mkBool ''turn multi-methods on|off'';
    hotCodeReloading    = mkBool ''turn support for hot code reloading on|off'';
    nanChecks           = mkBool ''turn NaN checks on|off'';
    noLinking           = mkBool ''compile Nim and generated files but do not link'';
    noMain              = mkBool ''do not generate a main procedure'';
    noNimblePath        = mkBool ''deactivate the Nimble path'';
    objChecks           = mkBool ''turn obj conversion checks on|off'';
    overflowChecks      = mkBool ''turn int over-/underflow checks on|off'';
    panics              = mkBool ''turn panics into process terminations (default: off)'';
    profileVM           = mkBool ''turn compile time VM profiler on|off'';
    project             = mkBool ''document the whole project (doc)'';
    rangeChecks         = mkBool ''turn range checks on|off'';
    showAllMismatches   = mkBool ''show all mismatching candidates in overloading resolution'';
    sinkInference       = mkBool ''turn sink parameter inference on|off (default: on)'';
    skipCfg             = mkBool ''do not read the nim installation's configuration file'';
    skipParentCfg       = mkBool ''do not read the parent dirs' configuration files'';
    skipProjCfg         = mkBool ''do not read the project's configuration file'';
    skipUserCfg         = mkBool ''do not read the user's configuration file'';
    stackTrace          = mkBool ''turn stack tracing on|off'';
    stackTraceMsgs      = mkBool ''enable user defined stack frame msgs via setFrameMsg'';
    stdout              = mkBool ''output to stdout'';
    threads             = mkBool ''turn support for multi-threading on|off'';
    tlsEmulation        = mkBool ''turn thread local storage emulation on|off'';
    trmacros            = mkBool ''turn term rewriting macros on|off'';
    unitsep             = mkBool ''use the ASCII unit separator (31) between error messages, useful for IDE-like tooling'';
    usenimcache         = mkBool ''will use $$nimcache, whichever it resolves to after all options have been processed'';
    warnings            = mkBool ''same as --hints but for warnings.'';
    
    HEADER.default             = "";
    HEADER.description         = ''Insert this at begin of cfg file'';
    HEADER.example             = "# IM your HEADER";
    HEADER.type                = lib.types.nullOr lib.types.lines;
    FOOTER.default             = "";
    FOOTER.description         = ''Insert this at end of cfg file'';
    FOOTER.example             = "# IM your FOOTER";
    FOOTER.type                = lib.types.nullOr lib.types.lines;
    
    app.default                = null;
    app.description            = ''generate a CONSOLE app|GUI app|DLL|STATIC library'';
    app.example                = "gui";
    app.type                   = lib.types.nullOr (lib.types.enum ["console" "gui" "lib" "staticlib"]);
    backend.default            = null;
    backend.description        = ''sets backend to use with commands like nim doc or nim r'';
    backend.example            = "js";
    backend.type               = lib.types.nullOr (lib.types.enum ["c" "cpp" "js" "objc"]);
    debugger.default           = null;
    debugger.description       = ''use native debugger (gdb)'';
    debugger.example           = "native";
    debugger.type              = lib.types.nullOr (lib.types.enum ["native"]);
    exceptions.default         = null;
    exceptions.description     = ''select the exception handling implementation'';
    exceptions.example         = "setjmp";
    exceptions.type            = lib.types.nullOr (lib.types.enum ["setjmp" "cpp" "goto" "quirky"]);
    filenames.default          = null;
    filenames.description      = ''customize how filenames are rendered in compiler messages, defaults to abs (absolute)'';
    filenames.example          = "abs";
    filenames.type             = lib.types.nullOr (lib.types.enum ["abs" "canonical" "legacyRelProj"]);
    mm.default                 = null;
    mm.description             = ''select which memory management to use; default is 'refc' recommended is 'orc' '';
    mm.example                 = "orc";
    mm.type                    = lib.types.nullOr (lib.types.enum ["orc" "arc" "refc" "markAndSweep" "boehm" "go" "none" "regions"]);
    opt.default                = null;
    opt.description            = ''optimize not at all or for speed|size Note: use -d:release for a release build!'';
    opt.example                = "speed";
    opt.type                   = lib.types.nullOr (lib.types.enum ["none" "speed" "size"]);
    processing.default         = null;
    processing.description     = ''show files as they're being processed by nim compiler'';
    processing.example         = "filenames";
    processing.type            = lib.types.nullOr (lib.types.enum ["dots" "filenames" "off"]);
    styleCheck.default         = null;
    styleCheck.description     = ''produce hints or errors for Nim identifiers that do not adhere to Nim's [official style guide](https://nim-lang.org/docs/nep1.html). styleCheck:usages - only enforce consistent spellings of identifiers, do not enforce the style on declarations'';
    styleCheck.example         = "hint";
    styleCheck.type            = lib.types.nullOr (lib.types.enum ["off" "hint" "error" "usages"]);
    useVersion.default         = null;
    useVersion.description     = ''emulate Nim version X of the Nim compiler, for testing'';
    useVersion.example         = "1.2";
    useVersion.type            = lib.types.nullOr (lib.types.enum ["1.0" "1.2"]);
    verbosity.default          = null;
    verbosity.description      = ''set Nim's verbosity level (1 is default)'';
    verbosity.example          = 3;
    verbosity.type             = lib.types.nullOr (lib.types.enum [0 1 2 3]);
    
    errorMax.default           = null;
    errorMax.description       = ''stop compilation after N errors; 0 means unlimited'';
    errorMax.example           = 4;
    errorMax.type              = lib.types.nullOr lib.types.ints.unsigned;
    maxLoopIterationsVM.default = null;
    maxLoopIterationsVM.description  = ''set max iterations for all VM loops'';
    maxLoopIterationsVM.example = 10000;
    maxLoopIterationsVM.type    = lib.types.nullOr lib.types.ints.positive;
    parallelBuild.default      = null;
    parallelBuild.description  = ''perform a parallel build value = number of processors (0 for auto-detect)'';
    parallelBuild.example      = 4;
    parallelBuild.type         = lib.types.nullOr lib.types.ints.unsigned;
    spellSuggest.default       = null;
    spellSuggest.description   = ''show at most num >= 0 spelling suggestions on typos. if num is not specified (or auto), return an implementation defined set of suggestions.'';
    spellSuggest.example       = 10;
    spellSuggest.type          = lib.types.nullOr lib.types.ints.positive;
    
    cc.default                 = null;
    cc.description             = ''SYMBOL: specify the C compiler'';
    cc.example                 = "gcc";
    cc.type                    = lib.types.nullOr lib.types.str;
    cpu.default                = null;
    cpu.description            = ''SYMBOL: set the target processor (cross-compilation)'';
    cpu.example                = "x86-64";
    cpu.type                   = lib.types.nullOr lib.types.str;
    docCmd.default             = null;
    docCmd.description         = ''CMD: if cmd eq skip, skips runnableExamples else, runs runnableExamples with given options'';
    docCmd.example             = "-d:foo --threads:on";
    docCmd.type                = lib.types.nullOr lib.types.str;
    docRoot.default            = null;
    docRoot.description        = ''PATH: nim doc --docRoot:/foo --project --outdir:docs /foo/sub/main.nim generates: docs/sub/main.html if path eq @pkg, will use nimble file enclosing dir if path eq @path, will use first matching dir in --path if path eq @default (the default and most useful), will use best match among @pkg,@path. if these are nonexistent, will use project path'';
    docRoot.example            = "/foot";
    docRoot.type               = lib.types.nullOr lib.types.str;
    docSeeSrcUrl.default       = null;
    docSeeSrcUrl.description   = ''URL: activate 'see source' for doc command (see doc.item.seesrc in config/nimdoc.cfg)'';
    docSeeSrcUrl.example       = "https://github.com/riinr/nim-flake-lib/";
    docSeeSrcUrl.type          = lib.types.nullOr lib.types.str;
    lib.default                = null;
    lib.description            = ''PATH: set the system library path'';
    lib.example                = "./my_nim";
    lib.type                   = lib.types.nullOr lib.types.str;
    nimMainPrefix.default      = null;
    nimMainPrefix.description  = ''PREFIX: use {prefix}NimMain instead of NimMain in the produced C/C++ code'';
    nimMainPrefix.example      = "nim_c_";
    nimMainPrefix.type         = lib.types.nullOr lib.types.str;
    nimcache.default           = null;
    nimcache.description       = ''PATH: set the path used for generated files [see also](https://nim-lang.org/docs/nimc.html#compiler-usage-generated-c-code-directory)'';
    nimcache.example           = "./cache";
    nimcache.type              = lib.types.nullOr lib.types.str;
    os.default                 = null;
    os.description             = ''SYMBOL: set the target operating system (cross-compilation)'';
    os.example                 = "linux";
    os.type                    = lib.types.nullOr lib.types.str;
    out.default                = null;
    out.description            = ''FILE: set the output filename'';
    out.example                = "my_bin";
    out.type                   = lib.types.nullOr lib.types.str;
    outdir.default             = null;
    outdir.description         = ''DIR: set the path where the output file will be written'';
    outdir.example             = "./bin";
    outdir.type                = lib.types.nullOr lib.types.str;
    passC.default              = null;
    passC.description          = ''OPTION: pass an option to the C compiler'';
    passC.example              = "-flto";
    passC.type                 = lib.types.nullOr lib.types.str;
    passL.default              = null;
    passL.description          = ''OPTION: pass an option to the linker'';
    passL.example              = "-flto";
    passL.type                 = lib.types.nullOr lib.types.str;
    
    cincludes.default          = {};
    cincludes.description      = ''modify the C compiler header search PATH'';
    cincludes.example.X        = true;
    cincludes.type             = lib.types.attrsOf lib.types.bool;
    clib.default               = {};
    clib.description           = ''link an additional C LIBRARY (you should omit platform-specific extensions)'';
    clib.example.X             = true;
    clib.type                  = lib.types.attrsOf lib.types.bool;
    clibdir.default            = {};
    clibdir.description        = ''modify the linker library search PATH'';
    clibdir.example.X          = true;
    clibdir.type               = lib.types.attrsOf lib.types.bool;
    defusages.default          = {};
    defusages.example.X        = true;
    defusages.type             = lib.types.attrsOf lib.types.bool;
    defusages.description      = ''find the definition and all usages of a symbol'';
    dynlibOverride.default     = {};
    dynlibOverride.description = ''marks SYMBOL so that dynlib:SYMBOL has no effect and can be statically linked instead; symbol matching is fuzzy so that --dynlibOverride:lua matches dynlib: "liblua.so.3"'';
    dynlibOverride.example.X   = true;
    dynlibOverride.type        = lib.types.attrsOf lib.types.bool;
    excludePath.default        = {};
    excludePath.description    = ''exclude a PATH from the list of search paths'';
    excludePath.example.X      = true;
    excludePath.type           = lib.types.attrsOf lib.types.bool;
    expandArc.default          = {};
    expandArc.description      = ''show how PROCNAME looks like after diverse optimizations before the final backend phase (mostly ARC/ORC specific)'';
    expandArc.example.X        = true;
    expandArc.type             = lib.types.attrsOf lib.types.bool;
    expandMacro.default        = {};
    expandMacro.description    = ''dump every generated AST from MACRO'';
    expandMacro.example.X      = true;
    expandMacro.type           = lib.types.attrsOf lib.types.bool;
    experimental.default       = {};
    experimental.description   = ''enable experimental language FEATURE'';
    experimental.example.X     = true;
    experimental.type          = lib.types.attrsOf lib.types.bool;
    hint.default               = {};
    hint.description           = ''turn specific HINT X on|off. hint:X means hint:X:on, as with similar flags. all is the set of all hints (only all:off is supported).'';
    hint.example.X             = true;
    hint.type                  = lib.types.attrsOf lib.types.bool;
    hintAsError.default        = {};
    hintAsError.description    = ''turn specific HINT X into an error on|off'';
    hintAsError.example.X      = true;
    hintAsError.type           = lib.types.attrsOf lib.types.bool;
    import.default             = {};
    import.description         = ''add an automatically imported MODULE see also patchFile in nimscript which offers more flexibility.'';
    import.example.X           = true;
    import.type                = lib.types.attrsOf lib.types.bool;
    include.default            = {};
    include.description        = ''add an automatically included MODULE'';
    include.example.X          = true;
    include.type               = lib.types.attrsOf lib.types.bool;
    legacy.default             = {};
    legacy.description         = ''enable obsolete/legacy language FEATURE'';
    legacy.example.X           = true;
    legacy.type                = lib.types.attrsOf lib.types.bool;
    path.default               = {};
    path.description           = ''add PATH to search paths'';
    path.example.X             = true;
    path.type                  = lib.types.attrsOf lib.types.bool;
    undef.default              = {};
    undef.description          = ''undefine a conditional SYMBOL'';
    undef.example.X            = true;
    undef.type                 = lib.types.attrsOf lib.types.bool;
    warning.default            = {};
    warning.description        = ''turn on|off WARNING'';
    warning.example.X          = true;
    warning.type               = lib.types.attrsOf lib.types.bool;
    warningAsError.default     = {};
    warningAsError.description = ''turn some WARNING in ERROR'';
    warningAsError.example.X   = true;
    warningAsError.type        = lib.types.attrsOf lib.types.bool;

    cppCompileToNamespace.default     = {};
    cppCompileToNamespace.description = ''use the provided NAMESPACE for the generated C++ code, if no namespace is provided "Nim" will be used'';
    cppCompileToNamespace.example.X   = true;
    cppCompileToNamespace.type        = lib.types.attrsOf lib.types.bool;
    NimblePath.default                = {};
    NimblePath.description            = ''add a PATH for Nimble support'';
    NimblePath.example.X              = true;
    NimblePath.type                   = lib.types.attrsOf lib.types.bool;
    
    define.default     = {};
    define.example.X   = "some value";
    define.example.Y   = true;
    define.example.z   = 42;
    define.type        = lib.types.attrsOf (lib.types.oneOf [lib.types.bool lib.types.int lib.types.str]);
    define.description = ''define a conditional symbol (Optionally: Define the value for that symbol, see: "compile time define pragmas")'';
    putenv.default     = {};
    putenv.example.X   = "some value";
    putenv.type        = lib.types.attrsOf lib.types.str;
    putenv.description = ''set an environment variable'';
  };
  nim-cfg = lib.types.submodule { inherit options; };
in
{
  options.nimcfg = lib.mkOption {
    default = {};
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
    type = lib.types.attrsOf nim-cfg;
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
  };
}
