Define a conditional symbol 

Optionally: Define the value for that symbol, see [compile time define pragmas](https://nim-lang.org/docs/manual.html#implementation-specific-pragmas-compileminustime-define-pragmas).

Unlike other symbols that follow [identifier equality of nim](https://nim-lang.org/docs/manual.html#lexical-analysis-identifier-equality), define sysymbols are full case insensitive.

Example:
All defined will match with `-d:A_B`

```nim
when defined aB:
  echo "aB"

when defined Ab:
  echo "Ab"

when defined a_b:
  echo "a_b"
```


### Some `define` options

This is a list of some define options found in Nim/Nim stdlib source code.

Look at your dependency documentation to check if they define theirs own or require some of them.


- consoleapp
- guiapp
- release


#### Hardware:

- avr
- amd64
- arm
- arm64
- atari
- cpu16
- cpu32
- cpu64
- e2k
- hppa
- hp9000
- hp9000s300
- hp9000s700
- hp9000s800
- hp9000s820
- i386
- ia64
- loongarch64
- m68k
- mips
- mips64
- mips64el
- mipsel
- msp430
- nintendoswitch
- parisc
- powerpc
- powerpc64
- powerpc64el
- riscv32
- riscv64
- sparc
- sparc64
- sparcv9
- x86
- wasm
- wasm32

##### Arch Related

- nimPinToCpu


#### OS:

- aix
- amiga
- alpha
- android
- android4
- bsd
- dmc
- dos
- dragonfly
- freebsd
- freertos
- genode
- haiku
- hpux
- ios
- irix
- linux
- macos
- macosx
- morphos
- netbsd
- netware
- openbsd
- os2
- osx
- palmos
- posix
- qnx
- riscos
- standalone
- skyos
- solaris
- sunos
- unix
- windows
- zephyr
- vxworks

##### OS Related

- kqcache (BSD)
- SocketMaxConnections = 32  (freertos)


#### Compillers:

- bcc
- clang
- clangcl
- gcc
- icc
- icl
- llvm\_gcc
- tcc
- vcc
- wcc


#### Languages

- c
- cpp
- js
- nimscript

##### Lang Related

- nimble
- nimconfig
- nimdoc
- nimsuggest
- booting
- nodejs
- vm
- kwin
- nimJsMathTruncPolyfill
- nimJsonGet
- nimLegacyJsRound
- noCppExceptions


#### Lib C

- emscripten
- nimNoLibc
- uClibc

##### Lib Related

- lwip
- lwip6
- nimNetLite
- ODBCVER
- staticSqlite
- usePcreHeader
- nimExperimentalLinenoiseExtra


#### SSL

- ssl
- libressl

##### SSL Related

- openssl10
- sslVersion = ""
- useOpenssl3 = sslVersion.startsWith('3')
- noOpenSSLHacks
- nimDisableCertificateValidation
- nimTlsSize = 16000


#### Memory Management

- boehmgc
- boehmNoIntPtr
- gcArc
- gcOrc
- gogc
- nogc

##### MM Related

- builtinOverflow
- gcDestructors
- gcHooks
- gcMarkAndSweep
- gcRegions
- gcUseBitvectors
- ignoreAllocationSize
- logGC
- memProfiler
- memtracker (memTracker)
- nimAlignPragma
- nimAllocNoUnmap
- nimAllocPagesViaMalloc
- nimAllocStats
- nimArcDebug
- nimArcIds
- nimEmulateOverflowChecks
- nimFixedOrc
- nimFixedOwned
- nimHasLentIterators
- nimHasSinkInference
- nimLeakDetector
- nimMaxHeap = 0
- nimMemAlignTiny
- nimMinHeapPages = 128
- nimMinHeapPages = 4
- nimNoAllocForSSL
- nimNoLentIterators
- nimOwnedEnabled
- nimPage1k
- nimPage256
- nimPage512
- nimStressOrc
- sizeofInt128
- StandaloneHeapSize = 1024 * PageSize
- traceArc
- useGcAssert
- useMalloc
- useRealtimeGC
- zephyrUseLibcMalloc


#### Threads

- threadsafe
- MaxDistinguishedThread = 32
- MaxThreadPoolSize = 256
- nimThreadStackGuard = 128
- nimThreadStackSize = 8192
- threadpoolWaitMs = 100


#### Debug

- androidNDK
- debugFmtDsl
- debugHeapLinks
- debugScanp
- futureLogging
- hotcodereloading
- hotCodeReloading
- nativeStacktrace
- nativeStackTrace
- nimAuditDelete
- nimDebugDlOpen
- nimDoesntTrackDefects
- nimDumpAsync
- nimFulldebug
- nimQuirky
- nimTracing
- nimTrMacros
- nimStackTraceOverride
- nimTasksDebug
- profiler
- testing
- testNimHcr
- traceHcr


#### Others

- avlcorruption and nimAvlcorruption
- createNimHcr
- createNimRtl
- nimCallDepthLimit = 2000
- globalSymbols
- net\_ipv4
- net\_ipv6
- net\_raw
- nimBuiltinSetjmp
- nimCoroutines
- nimCoroutinesSetjmp
- nimCoroutinesSetjmpBundled
- nimCoroutinesUcontext
- nimCorruption
- nimCycleBreaker
- nimDontSetUtf8CodePage
- nimFixedForwardGeneric
- nimHasCallsitePragma
- nimHasCursor
- nimHasDeclaredMagic
- nimHasEffectsOf
- nimHasEnforceNoRaises
- nimHasExceptionsQuery
- nimHasInvariant
- nimHasIsNamedTuple
- nimHasIterable
- nimHasOutParams
- nimHasStacktraceMsgs
- nimHasStyleChecks
- nimHasTemplateRedefinitionPragma
- nimHasTopDownInference
- nimHasTrace
- nimHasUsed
- nimHasWorkaround14720
- nimHashOrdinalFixed
- nimIcIntegrityChecks
- nimImportutilsExample
- nimInheritHandles
- nimIntHash1
- nimLagacyOptionsDollar
- nimLegacyCopyFile
- nimLegacyMacrosCollapseSymChoice
- nimLegacyParseQueryStrict
- nimLegacyRandomInitRand
- nimLegacySigpipeHandler
- nimMacrosGetNodeId
- nimMaxDescriptorsFallback = 16000 (asynchttpserver)
- nimNewIntegerOps
- nimNewShared
- nimNoArrayToString
- nimNoGetRandom
- nimNoQuit
- nimNoZeroExtendMagic
- nimOldCaseObjects
- nimOldDlls
- nimOldEcho
- nimOldRelativePathBehavior
- nimOldShiftRight
- nimOptimizedSplitChunk
- nimPanics
- nimPollHasEventFds
- nimPreviewFloatRoundtrip
- nimPreviewHashRef
- nimPreviewJsonutilsHoleyEnum
- nimPreviewSlimSystem
- nimRawSetjmp
- nimRecursiveSpawn
- nimSeqsV2
- nimShallowStrings
- nimSigSetjmp
- nimSmokeCycles
- nimStdSetjmp
- nimStrictDelete
- nimSymImplTransform
- nimTempPathLength = 8
- nimThinout
- nimToOpenArrayCString
- nimTypeNames
- nimUnittestAbortOnError
- nimUnittestOutputLevel = "..."
- nimUnittestColor = "auto" (auto|on|off)
- nimUse64BitCTime
- nimV2
- nimfix
- noIntrinsicsBitOpts
- noNimCoroutines
- noSignalHandler
- noUndefinedBitOpts
- noUnidecodeTable
- posixRealtime
- reportMissedDeadlines
- tempDir = "..."
- useClone
- useFork
- useNimRtl
- useShPath = "..."
- useStdoutAsStdmsg
- useSysAssert
- useWinAnsi

