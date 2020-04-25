# This example is taken from p. 47 of
# https://pari.math.u-bordeaux.fr/pub/pari/manuals/2.11.1/libpari.pdf
# and adapted to nim-pari

import nimpari

proc extgcd(A, B: GEN, U, V: var GEN): GEN =
  var
    av: pari_sp = avma
    ux = gen_1
    vx = gen_0
    a = A
    b = B
  # not sure how to implement this right now
  # if typ(a) != t_INT:
  #   pari_err_TYPE("extgcd", a)
  # if typ(b) != t_INT:
  #   pari_err_TYPE("extgcd", b)
  if gsigne(a) < 0:
    a = negi(a)
    ux = negi(ux)
  while not(gequal0(b) == 1):
    var
      r: GEN
      q = dvmdii(a, b, addr r)
      v = vx
    vx = subii(ux, mulii(q, vx))
    ux = v
    a = b
    b = r
  U = ux
  V = diviiexact(subii(a, mulii(A, ux)), B)
  gerepileall(av, 3, addr a, addr U, addr V)
  return a

pari_init(1000000, 2)
var
  x, y, d, u, v: GEN
pari_printf "x = "
x = gp_read_stream(stdin)
pari_printf "y = "
y = gp_read_stream(stdin)
d = extgcd(x, y, u, v)
pari_printf("gcd = %Ps\nu = %Ps\nv = %Ps\n", d, u, v)
pari_close()
