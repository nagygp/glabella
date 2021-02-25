[![Build Status](https://travis-ci.com/gap-packages/labelface.svg?branch=master)](https://travis-ci.com/gap-packages/labelface)
[![AppVeyor Build Status](https://ci.appveyor.com/api/projects/status/github/gap-packages/labelface?branch=master&svg=true)](https://ci.appveyor.com/project/nagygp/labelface)
[![Code Coverage](https://codecov.io/github/gap-packages/labelface/coverage.svg?branch=master&token=)](https://codecov.io/gh/gap-packages/labelface)

# The labelface package

* Website: https://gap-packages.github.io/labelface/
* Repository: https://github.com/gap-packages/labelface

This package provides a low level interface to the software [***bliss:*** A Tool for Computing Automorphism Groups and Canonical Labelings of Graphs](http://www.tcs.hut.fi/Software/bliss/), written by Tommi Junttila and Petteri Kaski. 

The labelface package uses an external binary and therefore a complete installation only works on UNIX systems or systems that support a UNIX-like environment, e.g. OS X, or Windows with Cygwin. 

On the package website precompiled binaries are available for certain environments. To compile the package, change to the `/pkg/labelface*` directory  of your GAP installation and then call
	
	./configure <path>

where <path> is a path to the main GAP root directory; so normally you would call

	./configure ../..

(the `../..` is the default and so may be omitted) and then call

	make 
  
to compile the binary.

Now start GAP and type

	LoadPackage("labelface");

to load the package. You will see the package banner. If you have not compiled the external binary, you should receive a warning.

For details on how to use the labelface package see the package documentation in the `doc` subdirectory (view its HTML version or  `manual.pdf`  via a PDF viewer). 

## Contact

Maintainer:

* [Gábor P. Nagy](https://algebra.math.bme.hu/nagy-gabor), Budapest University of Technology, Hungary.

For questions, remarks and issues please use the [issue tracker](https://github.com/gap-packages/labelface/issues).

## License

labelface is free software; you can redistribute it and/or modify it under the terms of the Version 2 of the GNU General Public License. For details see the file LICENSE.

## Credits

This package uses open source components of the GAP package **Digraphs**. You can find the source code of its open source project along with license information on  https://github.com/gap-packages/Digraphs. 