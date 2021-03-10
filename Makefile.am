#
# glabella: Low level interface to graph automorphism canonical labelling tools
#
# This file is part of the build system of a GAP kernel extension.
# Requires automake.
#
ACLOCAL_AMFLAGS = -I m4

glabella_INCLUDE = -I$(top_srcdir)/extern/

BINARCHDIR = bin/$(GAPARCH)
GAPINSTALLLIB = $(abs_top_srcdir)/$(BINARCHDIR)/glabella.so

lib_LTLIBRARIES = glabella.la

pkginclude_HEADERS = extern/bliss-0.73/graph.hh
pkginclude_HEADERS += extern/bliss-0.73/partition.hh
pkginclude_HEADERS += extern/bliss-0.73/orbit.hh
pkginclude_HEADERS += extern/bliss-0.73/heap.hh
pkginclude_HEADERS += extern/bliss-0.73/timer.hh

glabella_la_SOURCES = src/glabella.cc 

glabella_la_SOURCES += extern/bliss-0.73/graph.cc 
glabella_la_SOURCES += extern/bliss-0.73/partition.cc
glabella_la_SOURCES += extern/bliss-0.73/orbit.cc 
glabella_la_SOURCES += extern/bliss-0.73/heap.cc
glabella_la_SOURCES += extern/bliss-0.73/timer.cc

pkginclude_HEADERS += extern/bliss-0.73/defs.hh
pkginclude_HEADERS += extern/bliss-0.73/uintseqhash.hh
pkginclude_HEADERS += extern/bliss-0.73/utils.hh

glabella_la_SOURCES += extern/bliss-0.73/defs.cc 
glabella_la_SOURCES += extern/bliss-0.73/uintseqhash.cc
glabella_la_SOURCES += extern/bliss-0.73/utils.cc


pkginclude_HEADERS += extern/nauty27r1/nauty.h
pkginclude_HEADERS += extern/nauty27r1/naututil.h
pkginclude_HEADERS += extern/nauty27r1/schreier.h
pkginclude_HEADERS += extern/nauty27r1/gtools.h
pkginclude_HEADERS += extern/nauty27r1/nautinv.h
pkginclude_HEADERS += extern/nauty27r1/naugroup.h
pkginclude_HEADERS += extern/nauty27r1/nautycliquer.h
pkginclude_HEADERS += extern/nauty27r1/traces.h

glabella_la_SOURCES += extern/nauty27r1/nauty.c
glabella_la_SOURCES += extern/nauty27r1/naugraph.c
glabella_la_SOURCES += extern/nauty27r1/nausparse.c
glabella_la_SOURCES += extern/nauty27r1/schreier.c
glabella_la_SOURCES += extern/nauty27r1/naurng.c
glabella_la_SOURCES += extern/nauty27r1/traces.c
glabella_la_SOURCES += extern/nauty27r1/gtools.c
glabella_la_SOURCES += extern/nauty27r1/naututil.c
glabella_la_SOURCES += extern/nauty27r1/nautinv.c
glabella_la_SOURCES += extern/nauty27r1/gutil1.c
glabella_la_SOURCES += extern/nauty27r1/gutil2.c
glabella_la_SOURCES += extern/nauty27r1/gtnauty.c
glabella_la_SOURCES += extern/nauty27r1/naugroup.c
glabella_la_SOURCES += extern/nauty27r1/nautycliquer.c
glabella_la_SOURCES += extern/nauty27r1/nautil.c

glabella_la_CPPFLAGS = $(GAP_CPPFLAGS)
glabella_la_CFLAGS = $(GAP_CFLAGS)
glabella_la_LDFLAGS = $(GAP_LDFLAGS) -module -avoid-version
if SYS_IS_CYGWIN
glabella_la_LDFLAGS += -no-undefined -version-info 0:0:0 -Wl,$(GAPROOT)/bin/$(GAPARCH)/gap.dll
endif

all-local: glabella.la
	$(mkdir_p) $(top_srcdir)/$(BINARCHDIR)
if SYS_IS_CYGWIN
	cp .libs/glabella.dll $(GAPINSTALLLIB)
else
	cp .libs/glabella.so $(GAPINSTALLLIB)
endif
	@echo "SUCCESS!"

distclean-local:
	rm -rf bin/*
	(cd doc ; ./clean)

.PHONY: doc

doc:
	($(GAPROOT)/bin/gap.sh -A makedoc.g)


