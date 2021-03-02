#
# glabella: Low level interface to graph automorphism canonical labeling tools
#
# Reading the declaration part of the package.
#
_PATH_SO:=Filename(DirectoriesPackagePrograms("glabella"), "glabella.so");
if _PATH_SO <> fail then
    LoadDynamicModule(_PATH_SO);
fi;
Unbind(_PATH_SO);

ReadPackage( "glabella", "gap/interfaces.gd");
