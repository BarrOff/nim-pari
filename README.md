# nim-pari

nim-pari is a [Nim](https://nim-lang.org) wrapper for the [PARI](https://pari.math.u-bordeaux.fr/) library.

## Status

**This library is still subject to development!**
Nim-pari is distributed as a [Nimble](https://github.com/nim-lang/nimble) package and currently depends on the #head version of [nimterop](https://github.com/nimterop/nimterop) to generate the wrapper. I could not find a way to tell nimble to use the #head version of nimterop, so the nimble file states it depends on "nimterop >= 0.4.4".
In the current state, a previous installation of pari is required for usage. Building PARI from source might be added in the future.

I started this a side project of mine to learn using Nim's [FFI](https://nim-lang.org/docs/backends.html) and [nimterop](https://github.com/nimterop/nimterop/). Nimterop is used to process most of PARI's header files, however itis not able to convert functions as parameters of C functions. These are added manually. Breakage of those functions is therefore likely. 

### Usage

Please refer to the [documentation of libpari](https://pari.math.u-bordeaux.fr/pub/pari/manuals/2.11.1/libpari.pdf) for now. Before implementing a higher level API the bindings to libpari have to be completed.
Examples can be found in the example folder and are taken from the documentation.


### To-do

[ ] add option to build pari from source
[ ] add all symbols skipped by nimterop
[ ] build higher level API
[ ] add more examples
[ ] add a testsuite
[ ] add more documentation

### Credits

- [Nim](https://nim-lang.org) for this great programming language
- [The PARI group](https://pari.math.u-bordeaux.fr/) for developing PARI
- [nimterop](https://github.com/nimterop/nimterop) for making wrapping C libraries easy
- [nim-gmp](https://github.com/subsetpark/nim-gmp) and [nimarchive](https://github.com/genotrance/nimarchive) as examples and inspiration for writing a wrapper
- [Hugo Granström](https://github.com/HugoGranstrom) thanks to him I started publishing code on github and creating libraries. Check out his [numericalnim library](https://github.com/HugoGranstrom/numericalnim)!

### Feedback

nim-pari is a work in progress and any feedback or suggestions are welcome. It is hosted on GitHub with an MIT license so issues, forks and PRs are most appreciated.
