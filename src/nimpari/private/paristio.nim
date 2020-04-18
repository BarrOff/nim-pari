import nimpari/pari

{.push header: "pari/pari.h"}
# declarations from pari/paristio.h
var pari_mstack* {.importc: "pari_mainstack".}: ptr pari_mainstack
var GP_DATA* {.importc: "GP_DATA".}: ptr gp_data
var pariOut* {.importc: "pariOut".}: ptr PariOUT
# var pariErr* {.importc: "pariErr".}: ptr PariOUT

var pari_outfile* {.importc: "pari_outfile".}: File
var pari_logfile* {.importc: "pari_logfile".}: File
var pari_infile* {.importc: "pari_infile".}: File
var pari_errfile* {.importc: "pari_errfile".}: File
var logstyle* {.importc: "logstyle".}: pari_ulong
var avma* {.importc: "avma".}: pari_sp
var diffptr* {.importc: "diffptr".}: byteptr
var current_psfile* {.importc: "current_psfile".}: cstring
var pari_datadir* {.importc: "pari_datadir".}: cstring

{.pop.}
