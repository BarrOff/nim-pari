import nimpari/pari

{.push header: "pari/pari.h".}
# declarations from pari/paridecl.h
proc gen_FpM_Wiedemann*(E: pointer, f: proc(f1: pointer, f2: GEN): GEN, B: GEN, p: GEN): GEN {.importc: "gen_FpM_Wiedemann".}
proc gen_ZpM_Dixon*(E: pointer, f: proc(f1: pointer, f2: GEN): GEN, B: GEN, p: GEN, e: clong): GEN {.importc: "gen_ZpM_Dixon".}
proc ZpX_ZpXQ_liftroot_ea*(P: GEN, S: GEN, T: GEN, p: GEN, n: clong, E: pointer, early: proc(E: pointer, x: GEN, q: GEN): cint): GEN {.importc: "ZpX_ZpXQ_liftroot_ea".}
proc gen_ZpM_Dixon*(F: GEN, V: GEN, q: GEN, p: GEN, N: clong, E: pointer,
                    lin: proc(E: pointer, F: GEN, d: GEN, q: GEN): GEN,
                    invl: proc(E: pointer, d: GEN): GEN): GEN {.importc: "gen_ZpM_Dixon".}
proc gen_ZpX_Newton*(x: GEN, p: GEN, n: clong, E: pointer,
                     eval: proc(E: pointer, f: GEN, q: GEN): GEN,
                     invd: proc(E: pointer, V: GEN, v: GEN, q: GEN, M: clong): GEN): GEN {.importc: "gen_ZpX_Newton".}
proc gen_bkeval*(Q: GEN, d: clong, x: GEN, use_sqr: cint, E: pointer,
                 ff: ptr bb_algebra, cmul: proc(E: pointer, P: GEN, a: clong, x: GEN): GEN): GEN {.importc: "gen_bkeval".}
proc gen_bkeval_powers*(P: GEN, d: clong, V: GEN, E: pointer,
                 ff: ptr bb_algebra, cmul: proc(E: pointer, P: GEN, a: clong, x: GEN): GEN): GEN {.importc: "gen_bkeval_powers".}
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
proc gen_digits*(x: GEN, B: GEN, n: clong, E: pointer, r: ptr bb_ring,
                 div2: proc(x: GEN, y: GEN, r: GEN): GEN): GEN {.importc: "gen_digits".}
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
proc forqfvec*(E: pointer, fun: proc(f1: pointer, f2: GEN, f3: GEN, f4: cdouble): clong, a: GEN, BORNE: GEN) {.importc: "forqfvec".}

proc negi*(x: GEN): GEN {.importc: "negi".}
proc subii*(x: GEN, y: GEN): GEN {.importc: "subii".}
proc gerepileall*(av: pari_sp, n: cint) {.importc: "gerepileall", varargs.}

{.pop.}
