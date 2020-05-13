# nim-pari

nim-pari is a [Nim](https://nim-lang.org) wrapper for the [PARI](https://pari.math.u-bordeaux.fr/) library.

## Status

**This library is still subject to development!**
Nim-pari is distributed as a [Nimble](https://github.com/nim-lang/nimble) package and currently depends on the #head version of [nimterop](https://github.com/nimterop/nimterop) to generate the wrapper.
In the current state, a previous installation of pari is required for usage. Building PARI from source might be added in the future.

I started this a side project of mine to learn using Nim's [FFI](https://nim-lang.org/docs/backends.html) and [nimterop](https://github.com/nimterop/nimterop/). Nimterop is used to process most of PARI's header files, however some things still have to be converted manually. Breakage of those is therefore likely. 

As Nim is case- and underscore-insensitive, some functions of pari have to be renamed to avoid naming collisions. One example are `ZM_ZC_mul`, `ZM_zc_mul` and `zm_zc_mul`. All renamed objects will be listed in the following table:

|Original Name    |Type             |New Name          |
|-----------------|-----------------|------------------|
|`alg_hasse`      |function         |`alg_hasse2`      |
|`alg_type`       |function         |`alg_type2`       |
|`ZV_chinsetree`  |function         |`ZV_chinese_tree2`|
|`nfinit`         |function         |`nfinit2`         |
|`hnfmodid`       |function         |`hnfmodid2`       |
|`checkMF_i`      |function         |`checkMF_g`       |
|`perm_order`     |function         |`permorder2`      |
|`perm_sign`      |function         |`permsign2`       |
|`ZC_z_mul`       |function         |`ZC_z_mul2`       |
|`ZM_zc_mul`      |function         |`ZM_zc_mul2`      |
|`zm_zc_mul`      |function         |`zm_zc_mul3`      |
|`ZX_Q_mul`       |function         |`ZX_Q_mul2`       |
|`powis`          |function         |`powIs2`          |
|`quad_disc`      |function         |`quaddisc2`       |

### Usage

Please refer to the [documentation of libpari](https://pari.math.u-bordeaux.fr/pub/pari/manuals/2.11.1/libpari.pdf) for now. Before implementing a higher level API the bindings to libpari have to be completed.
Examples can be found in the example folder and are taken from the documentation.


### To-do

- [ ] add option to build pari from source
- [ ] add all symbols skipped by nimterop
- [ ] build higher level API
- [ ] add more examples
- [x] add a testsuite
- [ ] add more documentation

### Credits

- [Nim](https://nim-lang.org) for this great programming language
- [The PARI group](https://pari.math.u-bordeaux.fr/) for developing PARI
- [nimterop](https://github.com/nimterop/nimterop) for making wrapping C libraries easy
- [nim-gmp](https://github.com/subsetpark/nim-gmp) and [nimarchive](https://github.com/genotrance/nimarchive) as examples and inspiration for writing a wrapper
- [Hugo Granström](https://github.com/HugoGranstrom) thanks to him I started publishing code on github and creating libraries. Check out his [numericalnim library](https://github.com/HugoGranstrom/numericalnim)!

### Feedback

nim-pari is a work in progress and any feedback or suggestions are welcome. It is hosted on GitHub with an MIT license so issues, forks and PRs are most appreciated.
