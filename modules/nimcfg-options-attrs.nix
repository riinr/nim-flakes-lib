# LICENSE NOTICE:
# Descriptions comes from: https://github.com/nim-lang/Nim/blob/devel/doc/nimc.md
# Please refer to https://github.com/nim-lang/Nim/blob/devel/copying.txt

{ lib }:
let
  mkBool  = description: {
    inherit description;
    default = null;
    example = true;
    type    = lib.types.nullOr lib.types.bool;
  };
  mkOptions = builtins.mapAttrs (k: opt: lib.mkOption opt);
  meta    = mkOptions { 
    description.default         = null;
    description.description     = "package description";
    description.example         = "my package description";
    description.type            = lib.types.nullOr lib.types.str;
    homepage.default            = null;
    homepage.description        = "Package Home Page ";
    homepage.example            = "https://github.com/riinr/nim-flakes-lib";
    homepage.type               = lib.types.nullOr lib.types.str;
    license.default             = null;
    license.description         = "Package License";
    license.example             = "mit";
    license.type                = lib.types.nullOr (lib.types.enum (builtins.attrNames lib.licenses));
    longDescription.default     = null;
    longDescription.description = "package long description";
    longDescription.example     = "my package long description";
    longDescription.type        = lib.types.nullOr lib.types.lines;
    platforms.default           = null;
    platforms.description       = "Package Plataforms";
    platforms.example           = lib.platforms.all;
    platforms.type              = lib.types.nullOr (lib.types.enum (builtins.attrNames lib.platforms));
    mainProgram.default         = null;
    mainProgram.description     = "main executable name";
    mainProgram.example         = "myexec";
    mainProgram.type            = lib.types.nullOr lib.types.str;
  };

  nim-cfg = mkOptions {
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
    passC.type                 = lib.types.nullOr lib.types.lines;
    passL.default              = null;
    passL.description          = ''OPTION: pass an option to the linker'';
    passL.example              = "-flto";
    passL.type                 = lib.types.nullOr lib.types.lines;
    
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
    
    define.default = {};
    define.example.logGC = true;
    define.example.ssl   = true;
    define.example.X     = "some value";
    define.example.Y     = true;
    define.example.Z     = 42;
    define.type          = lib.types.attrsOf (lib.types.oneOf [lib.types.bool lib.types.int lib.types.str]);
    define.description   = builtins.readFile ./nimcfg-options-define.md;
    putenv.default       = {};
    putenv.example.X     = "some value";
    putenv.example.LANG  = "en_US.UTF-8";
    putenv.type          = lib.types.attrsOf lib.types.str;
    putenv.description   = ''set an environment variable'';
  };

  nimble  = mkOptions {
    enable.default     = true;
    enable.description = "enable use of nimble or um nim instead";
    enable.example     = false;
    enable.type        = lib.types.bool;
    package.default     = null;
    package.description = "nimble package to be used";
    package.example     = "pkgs.nimble-unwrapped";
    package.type        = lib.types.nullOr lib.types.package;
  };

  patch-elf = mkOptions {
    allowed-rpath-prefix.default     = null;
    allowed-rpath-prefix.description = "allowed-rpath-prefix";
    allowed-rpath-prefix.example     = "a b c";
    allowed-rpath-prefix.type        = lib.types.nullOr lib.types.lines;
    clear-symbol-version.default     = null;
    clear-symbol-version.description = "celar SYMBOL version";
    clear-symbol-version.example     = "";
    clear-symbol-version.type        = lib.types.nullOr lib.types.str;

    add-need.default           = null;
    add-need.description       = "add needed LIBRARY";
    add-need.example           = "";
    add-need.type              = lib.types.nullOr lib.types.str;
    add-rpath.default          = null;
    add-rpath.description      = "add 'RPATH'";
    add-rpath.example          = "";
    add-rpath.type             = lib.types.nullOr lib.types.str;
    enable.default             = true;
    enable.description         = "patch elf change dynamic library loader";
    enable.example             = true;
    enable.type                = lib.types.bool;
    file.description           = "celar SYMBOL version";
    file.example               = "myexectuable";
    file.type                  = lib.types.nullOr lib.types.str;
    interpreter.default        = null;
    interpreter.description    = "add --set-interpreter INTERPRETER";
    interpreter.example        = "/lib64/ld-linux-x86-64.so.2";
    interpreter.type           = lib.types.nullOr lib.types.str;
    no-default-lib.default     = false;
    no-default-lib.description = "shrink rpath";
    no-default-lib.example     = true;
    no-default-lib.type        = lib.types.bool;
    output.default             = null;
    output.description         = "celar SYMBOL version";
    output.example             = "";
    output.type                = lib.types.nullOr lib.types.str;
    package.default            = null;
    package.description        = "nim package to be used";
    package.example            = "pkgs.nim-unwrapped";
    package.type               = lib.types.nullOr lib.types.package;
    page-size.default          = null;
    page-size.description      = "add --page-size SIZE";
    page-size.example          = 64;
    page-size.type             = lib.types.nullOr lib.types.ints.unsigned;
    remove-need.default        = null;
    remove-need.description    = "remove needed LIBRARY";
    remove-need.example        = "";
    remove-need.type           = lib.types.nullOr lib.types.str;
    remove-rpath.default       = false;
    remove-rpath.description   = "remove rpath";
    remove-rpath.example       = true;
    remove-rpath.type          = lib.types.bool;
    replace-need.default       = null;
    replace-need.description   = "replace needed LIBRARY";
    replace-need.example       = "";
    replace-need.type          = lib.types.nullOr lib.types.str;
    set-rpath.default          = null;
    set-rpath.description      = "Sets 'RPATH' to RPATH";
    set-rpath.example          = "";
    set-rpath.type             = lib.types.nullOr lib.types.str;
    set-soname.default         = null;
    set-soname.description     = "Sets 'DT_SONAME' entry to SONAME";
    set-soname.example         = "";
    set-soname.type            = lib.types.nullOr lib.types.str;
    shrink-rpath.default       = false;
    shrink-rpath.description   = "shrink rpath";
    shrink-rpath.example       = true;
    shrink-rpath.type          = lib.types.bool;
  };

  nim-pkg = mkOptions {
    cmd.default           = "build";
    cmd.description       = "package compile command";
    cmd.example           = "c";
    cmd.type              = lib.types.enum [
      "build"    "run"        "e"
      "c"        "cpp"        "objc"      "js"
      "check"    "test"       "doc"       "lock"
      "rst2html" "rst2tex"    "doc2tex"   "jsondoc"
      "ctags"    "buildIndex" "genDepend" "dump"
    ];
    default.default       = false;
    default.description   = "make this package default for flake";
    default.example       = true;
    default.type          = lib.types.bool;
    file.default          = null;
    file.description      = "file to be compiled";
    file.example          = "src/bla.nim";
    file.type             = lib.types.nullOr lib.types.path;
    meta.default          = {};
    meta.example.homepage = "https://github.com/riinr/nim-flakes-lib";
    meta.example.license  = "mit";
    meta.type             = lib.types.submodule { options = meta; };
    nimble.default        = {};
    nimble.description    = "Configure Nimble";
    nimble.example.enable = false;
    nimble.type           = lib.types.submodule { options = nimble; };
    nim.default           = null;
    nim.description       = "nim package to be used";
    nim.example           = "pkgs.nim-unwrapped";
    nim.type              = lib.types.nullOr lib.types.package;
    deps.default          = [];
    deps.description      = "Nim libraries, c headers or executables needed to compile";
    deps.example          = ["zerofunctional" "muslc" "libressl" "gcc" "binutils" "upx"];
    deps.type             = lib.types.listOf lib.types.package;
    runDeps.default       = [];
    runDeps.description   = "Runtime dependencies like libraries or executables";
    runDeps.example       = ["openssl" "jq" "nodejs"];
    runDeps.type          = lib.types.listOf lib.types.package;
    opts.default          = {};
    opts.description      = "nim compiler flags";
    opts.type             = lib.types.submodule { options = nim-cfg; };
    opts.example.threads = true;
    opts.example.define.ssl = true;
    patch-elf.default     = {};
    patch-elf.example     = {};
    patch-elf.description = "patch elf after build using (https://github.com/NixOS/patchelf)";
    patch-elf.type        = lib.types.attrsOf (lib.types.submodule { options = patch-elf; });
    src.default           = null;
    src.description       = "src to be compiled";
    src.example           = "./.";
    src.type              = lib.types.nullOr lib.types.path;
    strip.default         = true;
    strip.description     = "strip executable";
    strip.example         = false;
    strip.type            = lib.types.bool;
    version.default       = null;
    version.description   = "package version";
    version.example       = "0.1.0";
    version.type          = lib.types.nullOr lib.types.str;
  };
in
{
  inherit nimble nim-pkg meta nim-cfg patch-elf;
}
