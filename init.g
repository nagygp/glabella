#
# labelface: Low level interface to the bliss graph automorphism tool
#
# Reading the declaration part of the package.
#
_PATH_SO:=Filename(DirectoriesPackagePrograms("labelface"), "labelface.so");
if _PATH_SO <> fail then
    LoadDynamicModule(_PATH_SO);
fi;
Unbind(_PATH_SO);

ReadPackage( "labelface", "gap/interfaces.gd");
