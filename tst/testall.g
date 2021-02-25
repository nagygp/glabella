#
# labelface: Low level interface to graph automorphism canonical labeling tools
#
# This file runs package tests. It is also referenced in the package
# metadata in PackageInfo.g.
#
LoadPackage( "labelface" );

dir := DirectoriesPackageLibrary( "labelface", "tst" );
if GAPInfo.BytesPerVariable=8 then 
  toexclude := [ "labelface_32bit.tst", "nautyinterface_32bit.tst" ]; 
else
  toexclude := [ "labelface_64bit.tst", "nautyinterface_64bit.tst" ];
fi;

TestDirectory( dir,
  rec(
    exitGAP := true,
    testOptions := rec(compareFunction := "uptowhitespace"),
    exclude := toexclude
  )
);

FORCE_QUIT_GAP(1); # if we ever get here, there was an error
