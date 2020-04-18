import os
import nimterop/cimport

const
  dynpari =
    when defined(windows):
      when defined(cpu64):
        "pari64.dll"
      else:
        "pari32.dll"
    elif hostOS == "macosx":
      "libpari(.3|.1|).dylib"
    else:
      "libpari.so(.3|.1|.6|)"

static:
  # cDebug()

  # does not compile without
  cDisableCaching()

  # The following symbols have to be skipped for now in order for nimterop to work
  cSkipSymbol @["ZC_z_mul", "ZM_zc_mul", "zm_zc_mul", "gp_context", "gp_context_save", "gp_context_restore"]

  # Add standard directories to search for the header files
  cAddStdDir()

  cOverride:
    const c_NONE* {.importc: "c_NONE", header: "pari/pari.h".} = 0xffff'u32

    type
      pariFILE* {.bycopy, importc: "struct pariFILE", header: "pari/pari.h".} = object
        file*: FILE
        `type`*: cint
        name*: cstring
        prev*: ptr pariFILE
        next*: ptr pariFILE

    # The following functions are created with ptr FILE in their
    # declaration by nimterop but they need just normal Nim File
    proc file_is_binary*(f: File): cint {.importc: "file_is_binary", header: "pari/pari.h".}
    proc gp_read_stream*(f: File): GEN {.importc: "gp_read_stream", header: "pari/pari.h".}
    proc gp_readvec_stream*(f: File): GEN {.importc: "gp_readvec_stream", header: "pari/pari.h".}
    proc pari_fprintf*(file: File, fmt: cstring) {.importc: "pari_fprintf", header: "pari/pari.h", varargs.}
    proc pari_fread_chars*(b: pointer, n: uint, f: File) {.importc: "pari_fread_chars", header: "pari/pari.h".}
    proc pari_vfprintf*(file: File, fmt: cstring, ap: va_list) {.importc: "pari_vfprintf", header: "pari/pari.h".}
    proc switchin*(name: cstring): File {.importc: "switchin", header: "pari/pari.h".}

    # The folloting functions can take a variable number of
    # parameters. Nimterop does not include the  varargs
    # pragma so they are inserted here
    proc strtoclosure*(s: cstring, n: clong): GEN {.importc: "strtoclosure", header: "pari/pari.h", varargs.}
    proc err_printf*(pat: cstring) {.importc: "err_printf", header: "pari/pari.h", varargs.}
    proc gsprintf*(fmt: cstring): GEN {.importc: "gsprintf", header: "pari/pari.h", varargs.}
    proc pari_printf*(fmt: cstring) {.importc: "pari_printf", header: "pari/pari.h", varargs.}
    proc pari_sprintf*(fmt: cstring): cstring {.importc: "pari_sprintf", header: "pari/pari.h", varargs.}
    proc out_printf*(`out`: ptr PariOUT, fmt: cstring) {.importc: "out_printf", header: "pari/pari.h", varargs.}
    proc stack_sprintf*(fmt: cstring): cstring {.importc: "stack_sprintf", header: "pari/pari.h", varargs.}
    proc str_printf*(S: ptr pari_str, fmt: cstring) {.importc: "str_printf", header: "pari/pari.h", varargs.}
    proc closure_callgenall*(C: GEN, n: clong): GEN {.importc: "closure_callgenall", header: "pari/pari.h", varargs.}
    proc mkcoln*(n: clong): GEN {.importc: "mkcoln", header: "pari/pari.h", varargs.}
    proc mkintn*(n: clong): GEN {.importc: "mkintn", header: "pari/pari.h", varargs.}
    proc mkpoln*(n: clong): GEN {.importc: "mkpoln", header: "pari/pari.h", varargs.}
    proc mkvecn*(n: clong): GEN {.importc: "mkvecn", header: "pari/pari.h", varargs.}
    proc mkvecsmalln*(n: clong): GEN {.importc: "mkvecsmalln", header: "pari/pari.h", varargs.}
    proc gerepileallsp*(av: pari_sp, tetpil: pari_sp, n: cint) {.importc: "gerepileallsp", header: "pari/pari.h", varargs.}
    proc timer_printf*(T: ptr pari_timer, format: cstring) {.importc: "timer_printf", header: "pari/pari.h", varargs.}
    proc msgtimer*(format: cstring) {.importc: "msgtimer", header: "pari/pari.h", varargs.}
    proc pari_err*(numerr: cint) {.importc: "pari_err", header: "pari/pari.h", varargs.}
    proc pari_warn*(numerr: cint) {.importc: "pari_warn", header: "pari/pari.h", varargs.}

doAssert cSearchPath("pari/pari.h").existsFile

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
    elif sym.kind == nskParam and sym.name == "pt_r":
      # a few functions have a parameter called pt_t
      # which collides with the ptr keyword in Nim
      sym.name = "genptr"

{.passL: "-lpari".}

cImport(cSearchPath("pari/pari.h"), dynlib="dynpari", recurse = true, flags = "-c")
