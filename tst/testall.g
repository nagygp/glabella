#
# glabella: Low level interface to graph automorphism canonical labelling tools
#
# This file runs package tests. It is also referenced in the package
# metadata in PackageInfo.g.
#
LoadPackage( "glabella" );

dir := DirectoriesPackageLibrary( "glabella", "tst" );
if GAPInfo.BytesPerVariable=8 then 
  toexclude := [ "glabella_32bit.tst", "nautyinterface_32bit.tst" ]; 
else
  toexclude := [ "glabella_64bit.tst", "nautyinterface_64bit.tst" ];
fi;

TestDirectory( dir,
  rec(
    exitGAP := true,
    testOptions := rec(compareFunction := "uptowhitespace"),
    exclude := toexclude
  )
);

FORCE_QUIT_GAP(1); # if we ever get here, there was an error
