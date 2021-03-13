#
# glabella: Low level interface to graph automorphism canonical labelling tools
#
# This file contains package meta data. For additional information on
# the meaning and correct usage of these fields, please consult the
# manual of the "Example" package as well as the comments in its
# PackageInfo.g file.
#
SetPackageInfo( rec(

PackageName := "glabella",
Subtitle := "Low level interfaces to graph automorphism and canonical labelling tools",
Version := "0.32",
Date := "13/03/2021", # dd/mm/yyyy format
License := "GPL-2.0-or-later",

Persons := [
  rec(
    IsAuthor := true,
    IsMaintainer := true,
    FirstNames := "Gábor P.",
    LastName := "Nagy",
    WWWHome := "https://algebra.math.bme.hu/nagy-gabor",
    Email := "nagyg@math.bme.hu",
    PostalAddress := Concatenation(
               "Department of Algebra, Budapest University of Technology\n",
               "Egry József utca 1\n",
               "H-1111 Budapest (Hungary)" ),
    Place := "Budapest",
    Institution := "Budapest University of Technology and Economics",
  ),
],

SourceRepository := rec(
    Type := "git",
    URL := "https://github.com/nagygp/glabella",
),
IssueTrackerURL := Concatenation( ~.SourceRepository.URL, "/issues" ),
PackageWWWHome  := "https://nagygp.github.io/glabella/",
PackageInfoURL  := Concatenation( ~.PackageWWWHome, "PackageInfo.g" ),
README_URL      := Concatenation( ~.PackageWWWHome, "README.md" ),
ArchiveURL      := Concatenation( ~.SourceRepository.URL,
                                 "/releases/download/v", ~.Version,
                                 "/", ~.PackageName, "-", ~.Version ),

ArchiveFormats := ".tar.gz",

##  Status information. Currently the following cases are recognized:
##    "accepted"      for successfully refereed packages
##    "submitted"     for packages submitted for the refereeing
##    "deposited"     for packages for which the GAP developers agreed
##                    to distribute them with the core GAP system
##    "dev"           for development versions of packages
##    "other"         for all other packages
##
Status := "dev",

AbstractHTML   :=  Concatenation( 
  "The GAP package <strong>glabella</strong> provides a low level interface to softwares ",
  "that can compute automorphisms, isomorphisms and canonical labellings of graphs. ",
  "The graphs can be directed or undirected, and a vertex colouring can be specified. ",
  "In the present version, the package provides interfaces to the programs ",
  "<em>bliss, nauty</em> and <em>Traces.</em>"
),

PackageDoc := rec(
  BookName  := "glabella",
  ArchiveURLSubset := ["doc"],
  HTMLStart := "doc/chap0.html",
  PDFFile   := "doc/manual.pdf",
  SixFile   := "doc/manual.six",
  LongTitle := "Low level interface to graph automorphism canonical labelling tools",
),

Dependencies := rec(
  GAP := ">= 4.10",
  NeededOtherPackages := [ ],
  SuggestedOtherPackages := [ ],
  ExternalConditions := [ ],
),

AvailabilityTest := function()
  local dir, lib;
  dir := DirectoriesPackagePrograms("glabella");
  lib := Filename(dir, "glabella.so");
  if lib = fail then
    LogPackageLoadingMessage(PACKAGE_WARNING,
                             "failed to load kernel module of package glabella");
    return fail;
  fi;
  return true;
end,

TestFile := "tst/testall.g",

Keywords := [ "bliss", "nauty", "traces", "graph isomorphism", "canonical labelling", "automorphism group" ],

));


