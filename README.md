[![Build Status](https://github.com/nagygp/glabella/workflows/CI/badge.svg?branch=master)](https://github.com/nagygp/glabella/actions?query=workflow%3ACI+branch%3Amaster)
[![AppVeyor Build Status](https://ci.appveyor.com/api/projects/status/github/nagygp/glabella?branch=master&svg=true)](https://ci.appveyor.com/project/nagygp/glabella)
[![Code Coverage](https://codecov.io/github/nagygp/glabella/coverage.svg?branch=master&token=)](https://codecov.io/gh/nagygp/glabella)

# The glabella package

* Website: https://nagygp.github.io/glabella/
* Repository: https://github.com/nagygp/glabella

This package provides a low-level interface to software that can compute automorphisms, isomorphisms and canonical labelings of graphs. Recently, the following programs are available:

* [***bliss:*** A Tool for Computing Automorphism Groups and Canonical Labellings of Graphs](http://www.tcs.hut.fi/Software/bliss/), written by Tommi Junttila and Petteri Kaski.
* [***nauty:*** Graph Canonical Labelling and Automorphism Group Computation](https://pallini.di.uniroma1.it/), written by Brendan McKay and Adolfo Piperno.

The **glabella** package uses external binaries and GAP kernel modules, and therefore a complete installation only works on UNIX systems or systems that support a UNIX-like environment, e.g. OS X, Windows with Cygwin, or WSL2. 

To compile the package, change to the `/pkg/glabella*` directory of your GAP installation and then call

	./configure --with-gaproot=<path>

where `<path>` is a path to the main GAP root directory. Often, **glabella** is in `<path>/pkg` and `--with-gaproot=../..` may be omitted. Then then call

	make 

to compile the binary. 

In certain cases, you may need to start by executing `./autogen.sh`; this assumes you have `libtool` and `libtool-dev` environments on your system.  

Now start GAP and type

	LoadPackage("glabella");

to load the package. You will see the package banner. If you have not compiled the external binary, you should receive a warning.

For details on how to use the glabella package see the package documentation in the `doc` subdirectory (view its HTML version or  `manual.pdf`  via a PDF viewer). 

## Contact

### Maintainer

* [Gábor P. Nagy](https://algebra.math.bme.hu/nagy-gabor), Budapest University of Technology, Hungary.

For questions, remarks and issues please use the [issue tracker](https://github.com/nagygp/glabella/issues).

### Plans and TODOs

* Testing, benchmarking
* Add further nauty features (e.g. vertex-invariants)
* Add further Traces features (e.g. known automorphisms)

## License

**glabella** is free software; you can redistribute it and/or modify it under the terms of Version 2 of the GNU General Public License. For details see the file LICENSE.

## Credits

This package uses open source components of the GAP packages [**Digraphs**](https://github.com/gap-packages/Digraphs) and [**NautyTracesInterface**](https://github.com/gap-packages/NautyTracesInterface). You can find the source code of its open source project along with license information on their websites. 
