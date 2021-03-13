[![Build Status](https://github.com/nagygp/glabella/workflows/CI/badge.svg?branch=master)](https://github.com/nagygp/glabella/actions?query=workflow%3ACI+branch%3Amaster)
[![Code Coverage](https://codecov.io/github/nagygp/glabella/coverage.svg?branch=master&token=)](https://codecov.io/gh/nagygp/glabella)

# The glabella package

* Website: https://nagygp.github.io/glabella/
* Repository: https://github.com/nagygp/glabella

This package provides a low level interface to softwware that can compute automorphisms, isomorphisms and canonical labellings of graphs. Recently, the following programs are avaible:

* [***bliss:*** A Tool for Computing Automorphism Groups and Canonical Labellings of Graphs](http://www.tcs.hut.fi/Software/bliss/), written by Tommi Junttila and Petteri Kaski. 
* [***nauty:*** Graph Canonical Labelling and Automorphism Group Computation](https://pallini.di.uniroma1.it/), written by Brendan McKay and Adolfo Piperno.

The **glabella** package uses external binaries and GAP kernel modules, and therefore a complete installation only works on UNIX systems or systems that support a UNIX-like environment, e.g. OS X, Windows with Cygwin, or WSL2. 

On the package website precompiled binaries are available for certain environments. To compile the package, change to the `/pkg/glabella*` directory  of your GAP installation and then call

	./configure <path>

where <path> is a path to the main GAP root directory; so normally you would call

	./configure ../..

(the `../..` is the default and so may be omitted) and then call

	make 

to compile the binary.

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

## License

glabella is free software; you can redistribute it and/or modify it under the terms of the Version 2 of the GNU General Public License. For details see the file LICENSE.

## Credits

This package uses open source components of the GAP packages [**Digraphs**](https://github.com/gap-packages/Digraphs) and [**NautyTracesInterface**](https://github.com/gap-packages/NautyTracesInterface). You can find the source code of its open source project along with license information on their websites. 
