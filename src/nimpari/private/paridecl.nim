import nimpari/pari

{.push header: "pari/pari.h".}
# declarations from pari/paridecl.h

# FpV.c
proc gen_FpM_Wiedemann*(E: pointer, f: proc(f1: pointer, f2: GEN): GEN, B: GEN, p: GEN): GEN {.importc: "gen_FpM_Wiedemann".}
proc gen_ZpM_Dixon*(E: pointer, f: proc(f1: pointer, f2: GEN): GEN, B: GEN, p: GEN, e: clong): GEN {.importc: "gen_ZpM_Dixon".}

# Hensel.c
proc ZpX_ZpXQ_liftroot_ea*(P: GEN, S: GEN, T: GEN, p: GEN, n: clong, E: pointer, early: proc(E: pointer, x: GEN, q: GEN): cint): GEN {.importc: "ZpX_ZpXQ_liftroot_ea".}
proc gen_ZpM_Dixon*(F: GEN, V: GEN, q: GEN, p: GEN, N: clong, E: pointer,
                    lin: proc(E: pointer, F: GEN, d: GEN, q: GEN): GEN,
                    invl: proc(E: pointer, d: GEN): GEN): GEN {.importc: "gen_ZpM_Dixon".}
proc gen_ZpX_Newton*(x: GEN, p: GEN, n: clong, E: pointer,
                     eval: proc(E: pointer, f: GEN, q: GEN): GEN,
                     invd: proc(E: pointer, V: GEN, v: GEN, q: GEN, M: clong): GEN): GEN {.importc: "gen_ZpX_Newton".}

# RgX.c
proc gen_bkeval*(Q: GEN, d: clong, x: GEN, use_sqr: cint, E: pointer,
                 ff: ptr bb_algebra, cmul: proc(E: pointer, P: GEN, a: clong, x: GEN): GEN): GEN {.importc: "gen_bkeval".}
proc gen_bkeval_powers*(P: GEN, d: clong, V: GEN, E: pointer,
                 ff: ptr bb_algebra, cmul: proc(E: pointer, P: GEN, a: clong, x: GEN): GEN): GEN {.importc: "gen_bkeval_powers".}

# alglin3.c
proc genapply*(E: pointer, f: proc(E: pointer, x: GEN): GEN, A: GEN): GEN {.importc: "genapply".}
proc genfold*(E: pointer, f: proc(E: pointer, x: GEN, y: GEN): GEN, A: GEN): GEN {.importc: "genfold".}
proc genindexselect*(E: pointer, f: proc(E: pointer, x: GEN): clong, A: GEN): GEN {.importc: "genindexselect".}
proc genselect*(E: pointer, f: proc(E: pointer, x: GEN): clong, A: GEN): GEN {.importc: "genselect".}
proc parfor*(a: GEN, b: GEN, code: GEN, E: pointer, call: proc(c1: pointer, c2: GEN, c3: GEN): clong) {.importc: "parfor".}
proc parforprime*(a: GEN, b: GEN, code: GEN, E: pointer, call: proc(c1: pointer, c2: GEN, c3: GEN): clong) {.importc: "parforprime".}
proc parforvec*(x: GEN, code: GEN, flag: clong, E: pointer, call: proc(c1: pointer, c2: GEN, c3: GEN): clong) {.importc: "parforvec".}
proc vecapply*(E: pointer, f: proc(E: pointer, x: GEN): GEN, x: GEN): GEN {.importc: "vecapply".}
proc veccatapply*(E: pointer, f: proc(E: pointer, x: GEN): GEN, x: GEN): GEN {.importc: "veccatapply".}
proc veccatselapply*(Epred: pointer, pred: proc(E: pointer, x: GEN): clong, Efun: pointer,
                     fun: proc(E: pointer, x: GEN): GEN, A: GEN): GEN {.importc: "veccatselapply".}
proc vecselapply*(Epred: pointer, pred: proc(E: pointer, x: GEN): clong, Efun: pointer,
                     fun: proc(E: pointer, x: GEN): GEN, A: GEN): GEN {.importc: "vecselapply".}
proc vecselect*(E: pointer, f: proc(E: pointer, x: GEN): clong, A: GEN): GEN {.importc: "vecselect".}

# arith2.c
proc gen_digits*(x: GEN, B: GEN, n: clong, E: pointer, r: ptr bb_ring,
                 div2: proc(x: GEN, y: GEN, r: GEN): GEN): GEN {.importc: "gen_digits".}

# bb_group.c
proc gen_ellgens*(d1: GEN, d2: GEN, m: GEN, E: pointer, grp: ptr bb_group,
                  pairorder: proc(E: pointer, P: GEN, Q: GEN, m: GEN, F: GEN): GEN): GEN {.importc: "gen_ellgens".}
proc gen_ellgroup*(N: GEN, F: GEN, pt_m: GEN, E: pointer, grp: ptr bb_group,
                  pairorder: proc(E: pointer, P: GEN, Q: GEN, m: GEN, F: GEN): GEN): GEN {.importc: "gen_ellgroup".}
proc gen_pow*(x: GEN, n: GEN, E: pointer, sqr: proc(sqr1: pointer, sqr2: GEN): GEN,
              mul: proc(m1: pointer, m2: GEN, m3: GEN): GEN): GEN {.importc: "gen_pow".}
proc gen_pow_fold*(x: GEN, n: GEN, E: pointer, sqr: proc(sqr1: pointer, sqr2: GEN): GEN,
              msqr: proc(m1: pointer, m2: GEN): GEN): GEN {.importc: "gen_pow_fold".}
proc gen_pow_fold_i*(x: GEN, n: GEN, E: pointer, sqr: proc(sqr1: pointer, sqr2: GEN): GEN,
              msqr: proc(m1: pointer, m2: GEN): GEN): GEN {.importc: "gen_pow_fold_i".}
proc gen_pow_i*(x: GEN, n: GEN, E: pointer, sqr: proc(sqr1: pointer, sqr2: GEN): GEN,
              mul: proc(m1: pointer, m2: GEN, m3: GEN): GEN): GEN {.importc: "gen_pow_i".}
proc gen_pow_init*(x: GEN, n: GEN, k: clong, E: pointer, sqr: proc(sqr1: pointer, sqr2: GEN): GEN,
              mul: proc(m1: pointer, m2: GEN, m3: GEN): GEN): GEN {.importc: "gen_pow_init".}
proc gen_pow_table*(R: GEN, n: GEN, E: pointer, one: proc(o: pointer): GEN,
              mul: proc(m1: pointer, m2: GEN, m3: GEN): GEN): GEN {.importc: "gen_pow_table".}
proc gen_powers*(x: GEN, l: clong, use_sqr: cint, E: pointer, sqr: proc(sqr1: pointer, sqr2: GEN): GEN,
              mul: proc(m1: pointer, m2: GEN, m3: GEN): GEN,
              one: proc(o: pointer): GEN): GEN {.importc: "gen_powers".}
proc gen_powu*(x: GEN, n: culong, E: pointer, sqr: proc(sqr1: pointer, sqr2: GEN): GEN,
              mul: proc(m1: pointer, m2: GEN, m3: GEN): GEN): GEN {.importc: "gen_powu".}
proc gen_powu_fold*(x: GEN, n: culong, E: pointer, sqr: proc(sqr1: pointer, sqr2: GEN): GEN,
              msqr: proc(m1: pointer, m2: GEN): GEN): GEN {.importc: "gen_pow_foldu".}
proc gen_powu_fold_i*(x: GEN, n: culong, E: pointer, sqr: proc(sqr1: pointer, sqr2: GEN): GEN,
              msqr: proc(m1: pointer, m2: GEN): GEN): GEN {.importc: "gen_powu_fold_i".}
proc gen_powu_i*(x: GEN, n: culong, E: pointer, sqr: proc(sqr1: pointer, sqr2: GEN): GEN,
              mul: proc(m1: pointer, m2: GEN, m3: GEN): GEN): GEN {.importc: "gen_powu_i".}
proc gen_product*(x: GEN, data: pointer, mul: proc(m1: pointer, m2: GEN, m3: GEN): GEN): GEN {.importc: "gen_product".}

# bibli1.c
proc forqfvec*(E: pointer, fun: proc(f1: pointer, f2: GEN, f3: GEN, f4: cdouble): clong, a: GEN, BORNE: GEN) {.importc: "forqfvec".}

# bibli2.c
proc gen_indexsort*(x: GEN, E: pointer, comp: proc(c1: pointer, c2: GEN, c3: GEN): cint): GEN {.importc: "gen_indexsort".}
proc gen_indexsort_uniq*(x: GEN, E: pointer, comp: proc(c1: pointer, c2: GEN, c3: GEN): cint): GEN {.importc: "gen_indexsort_uniq".}
proc gen_search*(x: GEN, y: GEN, flag: clong, data: pointer, comp: proc(c1: pointer, c2: GEN, c3: GEN): cint): clong {.importc: "gen_search".}
proc gen_setminus*(set1: GEN, set2: GEN, comp: proc(c1: GEN, c2: GEN): cint): GEN {.importc: "gen_setminus".}
proc gen_sort*(x: GEN, E: pointer, comp: proc(c1: pointer, c2: GEN, c3: GEN): cint): GEN {.importc: "gen_sort".}
proc gen_sort_inplace*(x: GEN, E: pointer, comp: proc(c1: pointer, c2: GEN, c3: GEN): cint, perm: GEN) {.importc: "gen_sort_inplace".}
proc gen_sort_uniq*(x: GEN, E: pointer, comp: proc(c1: pointer, c2: GEN, c3: GEN): cint): GEN {.importc: "gen_sort_uniq".}
proc merge_factor*(fx: GEN, fy: GEN, data: pointer, comp: proc(c1: pointer, c2: GEN, c3: GEN): cint): GEN {.importc: "merge_factor".}
proc merge_sort_uniq*(fx: GEN, fy: GEN, data: pointer, comp: proc(c1: pointer, c2: GEN, c3: GEN): cint): GEN {.importc: "merge_sort_uniq".}
proc sort_factor*(y: GEN, data: pointer, comp: proc(c1: pointer, c2: GEN, c3: GEN): cint): GEN {.importc: "sort_factor".}
proc tablesearch*(T: GEN, x: GEN, comp: proc(c1: GEN, c2: GEN): cint): clong {.importc: "tablesearch".}

# dirichlet.c
proc direuler*(E: pointer, evals: proc(e1: pointer, e2: GEN): GEN, a: GEN, b: GEN, c: GEN): GEN {.importc: "direuler".}

# elldata.c
proc forell*(E: pointer, cal: proc(c1: pointer, c2: GEN): clong, a: clong, b: clong, flag: clong) {.importc: "forell".}

# gen2.c
proc gassoc_proto*(f: proc(f1: GEN, f2: GEN): GEN, g1: GEN, g2: GEN): GEN {.importc: "gassoc_proto".}
proc map_proto_G*(f: proc(f1: GEN): GEN, x: GEN): GEN {.importc: "map_proto_G".}
proc map_proto_lG*(f: proc(f1: GEN): clong, x: GEN): GEN {.importc: "map_proto_lG".}
proc map_proto_lGL*(f: proc(f1: GEN, f2: clong): clong, x: GEN, y: clong): GEN {.importc: "map_proto_lG".}

# hash.c
proc hash_create*(minsize: pari_ulong, hash: proc(h1: pointer): pari_ulong, eq: proc(e1: pointer, e2: pointer): cint, use_stack: cint): ptr hashtable {.importc: "hash_create".}
proc hash_init_GEN*(h: ptr hashtable, hash: proc(h1: pointer): pari_ulong, eq: proc(e1: pointer, e2: pointer): cint, use_stack: cint) {.importc: "hash_init_GEN".}
proc hash_select*(h: ptr hashtable, k: pointer, E: pointer, select: proc(s1: pointer, s2: ptr hashentry): cint): hashentry {.importc: "hash_select".}
proc hash_remove_select*(h: ptr hashtable, k: pointer, E: pointer, select: proc(s1: pointer, s2: ptr hashentry): cint): hashentry {.importc: "hash_remove_select".}

# init.c
proc gerepilemanysp*(av: pari_sp, tetpil: pari_sp, g: GEN, n: cint) {.importc: "gerepilemanysp".}
proc obj_checkbuild*(S: GEN, tag: clong, build: proc(b1: GEN): GEN): GEN {.importc: "obj_checkbuild".}
proc obj_checkbuild_padicprec*(S: GEN, tag: clong, build: proc(b1: GEN, b2: clong): GEN, prec: clong): GEN {.importc: "obj_checkbuild_padicprec".}
proc obj_checkbuild_realprec*(S: GEN, tag: clong, build: proc(b1: GEN, b2: clong): GEN, prec: clong): GEN {.importc: "obj_checkbuild_realprec".}
proc obj_checkbuild_prec*(S: GEN, tag: clong, build: proc(b1: GEN, b2: clong): GEN, pr: proc(p1: GEN): clong, prec: clong): GEN {.importc: "obj_checkbuild_prec".}
# CAUTION: I AM NOT SURE HOW TO TRANSLATE THIS INTO NIM!
proc os_signal*(sig: cint, f: proc(f1: cint))
proc pari_sig_init*(f: proc(f1: cint)) {.importc: "pari_sig_init".}
proc traverseheap*(f: proc(f1: GEN, f2: pointer), data: pointer) {.importc: "traverseheap".}

# intnum.c
proc intcirc*(E: pointer, evals: proc(e1: pointer, e2: GEN): GEN, a: GEN, R: GEN, tab: GEN, prec: clong): GEN {.importc: "intcirc".}
proc intfuncinit*(E: pointer, evals: proc(e1: pointer, e2: GEN): GEN, a: GEN, b: GEN, m: clong, prec: clong): GEN {.importc: "intfuncinit".}
proc intnum*(E: pointer, evals: proc(e1: pointer, e2: GEN): GEN, a: GEN, b: GEN, tab: GEN, prec: clong): GEN {.importc: "intnum".}
proc intnumgauss*(E: pointer, evals: proc(e1: pointer, e2: GEN): GEN, a: GEN, b: GEN, tab: GEN, prec: clong): GEN {.importc: "intnumgauss".}
proc intnumromb*(E: pointer, evals: proc(e1: pointer, e2: GEN): GEN, a: GEN, b: GEN, flag: clong, prec: clong): GEN {.importc: "intnumromb".}
proc intnumromb_bitprec*(E: pointer, evals: proc(e1: pointer, e2: GEN): GEN, a: GEN, b: GEN, flag: clong, bit: clong): GEN {.importc: "intnumromb_bitprec".}
proc sumnum*(E: pointer, evals: proc(e1: pointer, e2: GEN): GEN, a: GEN, tab: GEN, prec: clong): GEN {.importc: "sumnum".}
proc sumnumap*(E: pointer, evals: proc(e1: pointer, e2: GEN): GEN, a: GEN, tab: GEN, prec: clong): GEN {.importc: "sumnumap".}
proc sumnumlagrange*(E: pointer, evals: proc(e1: pointer, e2: GEN, e3: clong): GEN, a: GEN, tab: GEN, prec: clong): GEN {.importc: "sumnumlagrange".}
proc sumnummonien*(E: pointer, evals: proc(e1: pointer, e2: GEN): GEN, a: GEN, tab: GEN, prec: clong): GEN {.importc: "sumnummonien".}

# paricfg.c
var paricfg_datadir* {.importc: "paricfg_datadir".}: string
var paricfg_version* {.importc: "paricfg_version".}: string
var paricfg_buildinfo* {.importc: "paricfg_buildinfo".}: string
var paricfg_version_code* {.importc: "paricfg_version_code".}: clong
var paricfg_vcsversion* {.importc: "paricfg_vcsversion".}: string
var paricfg_compiledate* {.importc: "paricfg_compiledate".}: string
var paricfg_mt_engine* {.importc: "paricfg_mt_engine".}: string
var paricfg_gphelp* {.importc: "paricfg_gphelp".}: string

# part.c
proc forpart*(E: pointer, calls: proc(c1: pointer, c2: GEN): clong, k: clong, nbound: GEN, abound: GEN) {.importc: "forpart".}

# forperm.c
proc forperm*(E: pointer, calls: proc(c1: pointer, c2: GEN): clong, k: GEN) {.importc: "forperm".}

# plotport.c
proc pari_set_plot_engine*(plot: proc(p: ptr PARI_plot)) {.importc: "pari_set_plot_engine".}
proc ploth*(E: pointer, f: proc(f1: pointer, f2: GEN): GEN, a: GEN, b: GEN, flags: clong, n: clong, prec: clong): GEN {.importc: "ploth".}
proc plothexport*(fmt: GEN, E: pointer, f: proc(f1: pointer, f2: GEN): GEN, a: GEN, b: GEN, flags: clong, n: clong, prec: clong): GEN {.importc: "plothexport".}
proc plothrecth*(E: pointer, f: proc(f1: pointer, f2: GEN): GEN, ne: clong, a: GEN, b: GEN, flags: pari_ulong, n: clong, prec: clong): GEN {.importc: "plothrecth".}
proc psploth*(E: pointer, f: proc(f1: pointer, f2: GEN): GEN, a: GEN, b: GEN, flags: clong, n: clong, prec: clong): GEN {.importc: "psploth".}

# polarit2.c
proc gen_factorback*(L: GEN, e: GEN, mul: proc(m1: pointer, m2: GEN, m3: GEN): GEN, pows: proc(p1: pointer, p2: GEN, p3: GEN): GEN, data: pointer): GEN {.importc: "gen_factorback".}

# subgroup.c
proc forsubgroup*(E: pointer, f: proc(f1: pointer, f2: GEN): clong, cyc: GEN, B: GEN) {.importc: "forsubgroup".}

# sumiter.c
proc asympnum*(E: pointer, f: proc(f1: pointer, f2: GEN, f3: clong): GEN, muli: clong, alpha: GEN, prec: clong): GEN {.importc: "asympnum".}
proc derivnum*(E: pointer, evals: proc(e1: pointer, e2: GEN, e3: clong): GEN, x: GEN, prec: clong): GEN {.importc: "derivnum".}
proc derivnumk*(E: pointer, evals: proc(e1: pointer, e2: GEN, e3: clong): GEN, x: GEN, ind0: GEN, prec: clong): GEN {.importc: "derivnumk".}
proc derivfun*(E: pointer, evals: proc(e1: pointer, e2: GEN, e3: clong): GEN, x: GEN, prec: clong): GEN {.importc: "derivfun".}
proc derivfunk*(E: pointer, evals: proc(e1: pointer, e2: GEN, e3: clong): GEN, x: GEN, ind0: GEN, prec: clong): GEN {.importc: "derivfunk".}
proc laurentseries*(E: pointer, f: proc(f1: pointer, f2: GEN, f3: clong): GEN, M: clong, v: clong, prec: clong): GEN {.importc: "laurentseries".}
proc prodeuler*(E: pointer, evals: proc(e1: pointer, e2: GEN, e3: clong): GEN, ga: GEN, gb: GEN, prec: clong): GEN {.importc: "prodeuler".}
proc prodinf*(E: pointer, evals: proc(e1: pointer, e2: GEN, e3: clong): GEN, a: GEN, prec: clong): GEN {.importc: "prodinf".}
proc prodinf1*(E: pointer, evals: proc(e1: pointer, e2: GEN, e3: clong): GEN, a: GEN, prec: clong): GEN {.importc: "prodinf1".}
proc sumalt*(E: pointer, evals: proc(e1: pointer, e2: GEN, e3: clong): GEN, a: GEN, prec: clong): GEN {.importc: "sumalt".}
proc sumalt2*(E: pointer, evals: proc(e1: pointer, e2: GEN, e3: clong): GEN, a: GEN, prec: clong): GEN {.importc: "sumalt2".}
proc sumpos*(E: pointer, evals: proc(e1: pointer, e2: GEN, e3: clong): GEN, a: GEN, prec: clong): GEN {.importc: "sumpos".}
proc sumpos2*(E: pointer, evals: proc(e1: pointer, e2: GEN, e3: clong): GEN, a: GEN, prec: clong): GEN {.importc: "sumpos2".}
proc suminf*(E: pointer, evals: proc(e1: pointer, e2: GEN, e3: clong): GEN, a: GEN, prec: clong): GEN {.importc: "suminf".}
proc zbrent*(E: pointer, evals: proc(e1: pointer, e2: GEN, e3: clong): GEN, a: GEN, b: GEN, prec: clong): GEN {.importc: "zbrent".}
proc solvestep*(E: pointer, evals: proc(e1: pointer, e2: GEN, e3: clong): GEN, a: GEN, b: GEN, step: GEN, flag: clong, prec: clong): GEN {.importc: "solvestep".}

# trans1.c
proc trans_eval*(fn: cstring, f: proc(f1: GEN, f2: clong): GEN, x: GEN, prec: clong): GEN {.importc: "trans_eval".}

# level1.h
proc Fl_add*(a: pari_ulong, b: pari_ulong, c: pari_ulong): pari_ulong {.importc: "Fl_add".}
proc Fl_addmul_pre*(x0, x1, y0, p, pi: pari_ulong): pari_ulong {.importc: "Fl_addmul_pre".}
proc Fl_addmulmul_pre*(x0, y0, x1, y1, p, pi: pari_ulong): pari_ulong {.importc: "Fl_addmulmul_pre".}
proc Fl_center*(u: pari_ulong, p: pari_ulong, ps2: pari_ulong): clong {.importc: "Fl_center".}
proc Fl_div*(a: pari_ulong, b: pari_ulong, p: pari_ulong): pari_ulong {.importc: "Fl_div".}
proc Fl_double*(a: pari_ulong, p: pari_ulong): pari_ulong {.importc: "Fl_double".}
proc Fl_ellj_pre*(a4, a6, p, pi: pari_ulong): pari_ulong {.importc: "Fl_ellj_pre".}
proc Fl_halve*(y: pari_ulong, p: pari_ulong): pari_ulong {.importc: "Fl_halve".}
proc Fl_mul*(a: pari_ulong, b: pari_ulong, p: pari_ulong): pari_ulong {.importc: "Fl_mul".}
proc Fl_mul_pre*(a, b, p, p1: pari_ulong): pari_ulong {.importc: "Fl_mul_pre".}
proc Fl_neg*(x: pari_ulong, p: pari_ulong): pari_ulong {.importc: "Fl_neg".}
proc Fl_sqr*(a: pari_ulong, p: pari_ulong): pari_ulong {.importc: "Fl_sqr".}
proc Fl_sqr_pre*(a: pari_ulong, p: pari_ulong, pi: pari_ulong): pari_ulong {.importc: "Fl_sqr_pre".}
proc Fl_sub*(a: pari_ulong, b: pari_ulong, p: pari_ulong): pari_ulong {.importc: "Fl_sub".}
proc Fl_triple*(a: pari_ulong, p: pari_ulong): pari_ulong {.importc: "Fl_triple".}
proc Mod2*(x: GEN): pari_ulong {.importc: "Mod2".}
proc Mod4*(x: GEN): pari_ulong {.importc: "Mod4".}
proc Mod8*(x: GEN): pari_ulong {.importc: "Mod8".}
proc Mod16*(x: GEN): pari_ulong {.importc: "Mod16".}
proc Mod32*(x: GEN): pari_ulong {.importc: "Mod32".}
proc Mod64*(x: GEN): pari_ulong {.importc: "Mod64".}

proc negi*(x: GEN): GEN {.importc: "negi".}
proc subii*(x: GEN, y: GEN): GEN {.importc: "subii".}
proc gerepileall*(av: pari_sp, n: cint) {.importc: "gerepileall", varargs.}

{.pop.}
