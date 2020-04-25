import nimpari/pari

{.push header: "pari/pari.h".}
# declarations from pari/paricom.h
const M_PI* {.importc: "M_PI".} = 3.141592653589793
const M_LN2* {.importc: "M_LN2".} = 0.6931471805599453
var CATCH_ALL* {.importc: "CATCH_ALL".}: clong
var LOG10_2* {.importc: "LOG10_2".}: cdouble
var LOG2_10* {.importc: "LOG2_10".}: cdouble
var new_galois_format* {.importc: "new_galois_format".}: cint
var factor_add_primes* {.importc: "factor_add_primes".}: cint
var factor_proven* {.importc: "factor_proven".}: cint
var DEBUGFILES* {.importc: "DEBUGFILES".}: culong
var DEBUGLEVEL* {.importc: "DEBUGLEVEL".}: culong
var DEBUGMEM* {.importc: "DEBUGSYSTEM".}: culong
var precdl* {.importc: "precdl".}: culong
var DEBUGVAR* {.importc: "DEBUGVAR".}: clong
var pari_mt_nbthreads* {.importc: "pari_mt_nbthreads".}: culong
var bernzone* {.importc: "bernzone".}: GEN
var primetab* {.importc: "primetab".}: GEN
var gen_m1* {.importc: "gen_m1".}: GEN
var gen_1* {.importc: "gen_1".}: GEN
var gen_2* {.importc: "gen_2".}: GEN
var gen_m2* {.importc: "gen_m2".}: GEN
var ghalf* {.importc: "ghalf".}: GEN
var gen_0* {.importc: "gen_0".}: GEN
var gnil* {.importc: "gnil".}: GEN
var err_e_STACK* {.importc: "err_e_STACK".}: GEN
var PARI_SIGINT_block* {.importc: "PARI_SIGINT_block".}: cint
var PARI_SIGINT_pending* {.importc: "PARI_SIGINT_pending".}: cint
var lontyp* {.importc: "lontyp".}: ptr clong
var pari_library_path* {.importc: "pari_library_path".}: cstring
var varpriority* {.importc: "varpriority".}: ptr clong

{.pop.}
