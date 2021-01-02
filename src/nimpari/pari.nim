import os
import nimterop/cimport

{.experimental: "codeReordering".}

when defined(windows):
  const dynpari =
    when defined(cpu64):
      "pari64.dll"
    else:
      "pari32.dll"
elif defined(posix):
  when defined(linux) or defined(FreeBSD):
    const dynpari = "libpari.so(.3|.1|.6|)"
  elif defined(osx):
    const dynpari = "libpari(.3|.1|).dylib"
  else:
    static: doAssert false
else:
  static: doAssert false

static:
  # cDebug()
  # cDisableCaching()

  # The following symbols have to be skipped for now in order for nimterop to work
  cSkipSymbol @["gp_context", "gp_context_save", "gp_context_restore",
      "ONLY_REM", "ONLY_DIVIDES", "lontyp", "struct"]

  # Add standard directories to search for the header files
  cAddStdDir()

cOverride:
  const c_NONE* {.importc: "c_NONE", header: "pari/pari.h".} = 0xffff'u32

cDefine("DISABLE_INLINE", "")

cPlugin:
  import strutils
  # Symbol renaming
  proc onSymbol*(sym: var Symbol) {.exportc, dynlib.} =
    # Get rid of leading and trailing underscores
    sym.name = sym.name.strip(chars = {'_'})
    if sym.kind == nskProc:
      # The following tests rename functions which create name
      # collisions due to Nim being caseinsensitive and ignoring
      # underscores
      if sym.name == "alg_hasse":
        sym.name = "alg_hasse2"
      elif sym.name == "alg_type":
        sym.name = "alg_type2"
      elif sym.name == "ZV_chinesetree":
        sym.name = "ZV_chinese_tree2"
      elif sym.name == "nfinit":
        sym.name = "nfinit2"
      elif sym.name == "hnfmodid":
        sym.name = "hnfmodid2"
      elif sym.name == "checkMF_i":
        sym.name = "checkMF_g"
      elif sym.name == "perm_order":
        sym.name = "permorder2"
      elif sym.name == "perm_sign":
        sym.name = "permsign2"
      elif sym.name == "ZC_z_mul":
        sym.name = "ZC_z_mul2"
      elif sym.name == "ZM_zc_mul":
        sym.name = "ZM_zc_mul2"
      elif sym.name == "zm_zc_mul":
        sym.name = "zm_zc_mul3"
      elif sym.name == "ZX_Q_mul":
        sym.name = "ZX_Q_mul2"
      elif sym.name == "powis":
        sym.name = "powIs2"
      elif sym.name == "quad_disc":
        sym.name = "quaddisc2"
      elif sym.name == "pari_err":
        sym.name = "pariErr2"
      elif sym.name == "pari_err_FILE":
        sym.name = "pariErrFile2"
      elif sym.name == "RgM_ZM_mul":
        sym.name = "RgM_ZM_mul2"
      elif sym.name == "str_printf":
        sym.name = "str_printf2"
      elif sym.name == "get_localprec":
        sym.name = "get_localprec2"
      elif sym.name == "get_localbitprec":
        sym.name = "get_localbitprec2"
      elif sym.name == "perm_cycles":
        sym.name = "perm_cycles2"
      elif sym.name == "identity_zv":
        sym.name = "identity_zv2"
    elif sym.name == "pt_r":
      # a few functions have a parameter called pt_t
      # which collides with the ptr keyword in Nim
      sym.name = "genptr"

{.passL: "-lpari".}

doAssert cSearchPath("pari/pari.h").existsFile

cImport(cSearchPath("pari/pari.h"), dynlib = "dynpari", recurse = true,
    flags = "-c -p -f=ast2")

# const are used before types, therefore GEN is not available as const type
# this can be removed when https://github.com/nimterop/nimterop/issues/206 is solved
const ONLY_REM* {.importc: "ONLY_REM", header: "pari/pari.h".} = cast[ptr GEN](0x00000001'i32)
const ONLY_DIVIDES* {.importc: "ONLY_DIVIDES", header: "pari/pari.h".} = cast[
    ptr GEN](0x00000002'i32)
var lontyp* {.importc: "lontyp", header: "pari/pari.h".}: ptr UncheckedArray[clong]
var pari_mstack* {.importc: "pari_mainstack",
    header: "pari/pari.h".}: ptr pari_mainstack
