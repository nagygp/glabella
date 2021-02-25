#
# labelface: Low level interface to the bliss graph automorphism tool
#
# This file is part of the build system of a GAP kernel extension.
# Requires automake.
#
ACLOCAL_AMFLAGS = -I m4

labelface_INCLUDE = -I$(top_srcdir)/extern/

BINARCHDIR = bin/$(GAPARCH)
GAPINSTALLLIB = $(abs_top_srcdir)/$(BINARCHDIR)/labelface.so

lib_LTLIBRARIES = labelface.la

pkginclude_HEADERS = extern/bliss-0.73/graph.hh
pkginclude_HEADERS += extern/bliss-0.73/partition.hh
pkginclude_HEADERS += extern/bliss-0.73/orbit.hh
pkginclude_HEADERS += extern/bliss-0.73/heap.hh
pkginclude_HEADERS += extern/bliss-0.73/timer.hh

labelface_la_SOURCES = src/labelface.cc 
labelface_la_SOURCES += extern/bliss-0.73/graph.cc 
labelface_la_SOURCES += extern/bliss-0.73/partition.cc
labelface_la_SOURCES += extern/bliss-0.73/orbit.cc 
labelface_la_SOURCES += extern/bliss-0.73/heap.cc
labelface_la_SOURCES += extern/bliss-0.73/timer.cc

pkginclude_HEADERS += extern/bliss-0.73/defs.hh
pkginclude_HEADERS += extern/bliss-0.73/uintseqhash.hh
pkginclude_HEADERS += extern/bliss-0.73/utils.hh

labelface_la_SOURCES += extern/bliss-0.73/defs.cc 
labelface_la_SOURCES += extern/bliss-0.73/uintseqhash.cc
labelface_la_SOURCES += extern/bliss-0.73/utils.cc

pkginclude_HEADERS += extern/nauty27r1/nauty.h

labelface_la_SOURCES += extern/nauty27r1/nauty.c
labelface_la_SOURCES += extern/nauty27r1/naugraph.c
labelface_la_SOURCES += extern/nauty27r1/nautil.c
labelface_la_SOURCES += extern/nauty27r1/nausparse.c
labelface_la_SOURCES += extern/nauty27r1/schreier.c
labelface_la_SOURCES += extern/nauty27r1/naurng.c
labelface_la_SOURCES += extern/nauty27r1/traces.c
labelface_la_SOURCES += extern/nauty27r1/gtools.c
labelface_la_SOURCES += extern/nauty27r1/naututil.c
labelface_la_SOURCES += extern/nauty27r1/nautinv.c
labelface_la_SOURCES += extern/nauty27r1/gutil1.c
labelface_la_SOURCES += extern/nauty27r1/gutil2.c
labelface_la_SOURCES += extern/nauty27r1/gtnauty.c
labelface_la_SOURCES += extern/nauty27r1/naugroup.c
labelface_la_SOURCES += extern/nauty27r1/nautycliquer.c

labelface_la_CPPFLAGS = $(GAP_CPPFLAGS)
labelface_la_CFLAGS = $(GAP_CFLAGS)
labelface_la_LDFLAGS = $(GAP_LDFLAGS) -module -avoid-version
if SYS_IS_CYGWIN
labelface_la_LDFLAGS += -no-undefined -version-info 0:0:0 -Wl,$(GAPROOT)/bin/$(GAPARCH)/gap.dll
endif

all-local: labelface.la
	$(mkdir_p) $(top_srcdir)/$(BINARCHDIR)
if SYS_IS_CYGWIN
	cp .libs/labelface.dll $(GAPINSTALLLIB)
else
	cp .libs/labelface.so $(GAPINSTALLLIB)
endif
	@echo "SUCCESS!"

distclean-local:
	rm -rf bin/*
	(cd doc ; ./clean)

.PHONY: doc

doc:
	($(GAPROOT)/bin/gap.sh -A makedoc.g)


