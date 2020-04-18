# This is just an example to get you started. You may wish to put all of your
# tests into a single file, or separate them into multiple `test1`, `test2`
# etc. files (better names are recommended, just make sure the name starts with
# the letter 't').
#
# To run these tests, simply execute `nimble test`.

import unittest

import nimpari

suite "Testing global constants":
  setup:
    pari_init(500_000, 2)

  teardown:
    pari_close()

  test "basic constants":
    var
      p = gen_0

    pari_printf("This is gen_0: %Ps\n", p)

    p = gen_1
    pari_printf("This is gen_1: %Ps\n", p)

    p = gen_2
    pari_printf("This is gen_2: %Ps\n", p)

    p = gen_m1
    pari_printf("This is gen_m1: %Ps\n", p)

    p = gen_m2
    pari_printf("This is gen_m2: %Ps\n", p)

    p = ghalf
    pari_printf("This is ghalf: %Ps\n", p)

suite "Testing implemented functions":
  setup:
    pari_init(500_000, 2)

  teardown:
    pari_close()

  test "testing gp_read_str":

    var
      t = gp_read_str("12345")

    pari_fprintf(stdout, "t should be 12345: %Ps\n", t)
