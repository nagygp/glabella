#############################################################################
##
#A  glabella.tst             glabella package                Gábor P. Nagy
##
##  To create a test file, place GAP prompts, input and output exactly as
##  they must appear in the GAP session. Do not remove lines containing 
##  START_TEST and STOP_TEST statements.
##
##  The first line starts the test. START_TEST reinitializes the caches and 
##  the global random number generator, in order to be independent of the 
##  reading order of several test files. Furthermore, the assertion level 
##  is set to 2 by START_TEST and set back to the previous value in the 
##  subsequent STOP_TEST call.
##
##  The argument of STOP_TEST may be an arbitrary identifier string.
## 
gap> START_TEST("glabella package: glabella.tst");
gap> SizeScreen([72,23]);
[ 72, 23 ]
gap> 
gap> ExtendRootDirectories([Concatenation(GAPInfo.UserHome,"/MyGAP/")]);
gap> LoadPackage( "glabella", false );
true
gap> 
gap> ###################################
gap> v:=Combinations([1..10],5);;
gap> johnson:=List(v,x->Filtered([1..Size(v)],i->Size(Intersection(x,v[i]))=2));;
gap> bl1:=GraphCanonicalLabelling@glabella(Size(v),johnson,0,false);;
gap> Size(bl1[1]);
6
gap> bl1[3];
-137676942
gap> Print(StructureDescription(Group(bl1[1])),"\n");
C2 x S10
gap> 
gap> bl1n:=GraphCanonicalLabelling@glabella(Size(v),johnson,0,false,"densenauty");;
gap> Size(bl1n[1]);
9
gap> bl1n[3];
247418998
gap> Print(StructureDescription(Group(bl1n[1])),"\n");
C2 x S10
gap> 
gap> SetInfoLevel( InfoGlabella, 1 );
gap> bl1sn:=GraphCanonicalLabelling@glabella(Size(v),johnson,0,false,"sparsenauty");;
#I  Invalid plain format colouring, set to 0
#I  Invalid nauty format colouring, set to [0,0]
gap> Size(bl1sn[1]);
7
gap> bl1sn[3];
483636399
gap> Print(StructureDescription(Group(bl1sn[1])),"\n");
C2 x S10
gap> 
gap> bl1tr:=GraphCanonicalLabelling@glabella(Size(v),johnson,0,false,"traces");;
#I  Invalid plain format colouring, set to 0
#I  Invalid nauty format colouring, set to [0,0]
gap> Size(bl1tr[1]);
3
gap> bl1tr[3];
54775416
gap> Print(StructureDescription(Group(bl1tr[1])),"\n");
C2 x S10
gap> 
gap> petersen:=[[2,5,6],[1,3,7],[2,4,8],[3,5,9],[1,4,10],
>     [1,8,9],[2,9,10],[3,6,10],[4,6,7],[5,7,8]];
[ [ 2, 5, 6 ], [ 1, 3, 7 ], [ 2, 4, 8 ], [ 3, 5, 9 ], [ 1, 4, 10 ], 
  [ 1, 8, 9 ], [ 2, 9, 10 ], [ 3, 6, 10 ], [ 4, 6, 7 ], [ 5, 7, 8 ] ]
gap> bl2:=GraphCanonicalLabelling@glabella(10, petersen, false, false);
#I  Invalid plain format colouring, set to 0
[ [ (4,8)(5,6)(9,10), (2,5,6)(3,4,9,7,10,8), (1,2,3,4,9,6)(5,7,8) ], 
  (1,10)(2,9)(3,6,8,4,5,7), 209617178 ]
gap> Print(StructureDescription(Group(bl2[1])),"\n");
S5
gap> 
gap> bl2c:=GraphCanonicalLabelling@glabella(10, petersen, 
>     [1,1,1,1,1,2,2,2,2,2], false);
[ [ (2,5)(3,4)(7,10)(8,9), (1,2,3,4,5)(6,7,8,9,10) ], 
  (1,5,3,2,4)(6,10,7)(8,9), 293067930 ]
gap> Print(StructureDescription(Group(bl2c[1])),"\n");
D10
gap> 
gap> bl2cn:=GraphCanonicalLabelling@glabella(10, petersen, 
>     [1,1,1,1,1,2,2,2,2,2], false, "densenauty");
#I  Convert colouring to nauty format
[ [ (2,5)(3,4)(7,10)(8,9), (1,2)(3,5)(6,7)(8,10) ], (3,5,4)(7,8,9), 
  1719978 ]
gap> Print(StructureDescription(Group(bl2cn[1])),"\n");
D10
gap> 
gap> SetInfoLevel( InfoGlabella, 2 );
gap> bl2csn:=GraphCanonicalLabelling@glabella(10, petersen, 
>     [1,1,1,1,1,2,2,2,2,2], false, "sparsenauty");
#I  Convert colouring to nauty format
#I  SPARSENAUTY_GRAPH_CANONICAL_LABELING called
[ [ (2,5)(3,4)(7,10)(8,9), (1,2,3,4,5)(6,7,8,9,10) ], 
  (2,3,4,5)(6,7,10)(8,9), -152113 ]
gap> Print(StructureDescription(Group(bl2csn[1])),"\n");
D10
gap> 
gap> bl2ctr:=GraphCanonicalLabelling@glabella(10, petersen, 
>     [1,1,1,1,1,2,2,2,2,2], false, "traces");
#I  Convert colouring to nauty format
#I  TRACES_GRAPH_CANONICAL_LABELING called
[ [ (1,2)(3,5)(6,7)(8,10), (1,4,2,5,3)(6,9,7,10,8) ], 
  (1,4,2,3,5)(6,10)(8,9), 17177191 ]
gap> Print(StructureDescription(Group(bl2ctr[1])),"\n");
D10
gap> 
gap> dir_edges:=[
>     [1,2],[2,3],[3,1],[4,5],[5,6],[6,4],[7,8],[8,9],[9,7],
>     [1,4],[4,7],[7,1],[2,5],[5,8],[8,2],[3,6],[6,9],[9,3]
> ];
[ [ 1, 2 ], [ 2, 3 ], [ 3, 1 ], [ 4, 5 ], [ 5, 6 ], [ 6, 4 ], 
  [ 7, 8 ], [ 8, 9 ], [ 9, 7 ], [ 1, 4 ], [ 4, 7 ], [ 7, 1 ], 
  [ 2, 5 ], [ 5, 8 ], [ 8, 2 ], [ 3, 6 ], [ 6, 9 ], [ 9, 3 ] ]
gap> dg:=List([1..9],i->Filtered([1..9],j->[i,j] in dir_edges));
[ [ 2, 4 ], [ 3, 5 ], [ 1, 6 ], [ 5, 7 ], [ 6, 8 ], [ 4, 9 ], 
  [ 1, 8 ], [ 2, 9 ], [ 3, 7 ] ]
gap> bl3:=GraphCanonicalLabelling@glabella(9, dg, false, true);
#I  Invalid plain format colouring, set to 0
#I  BLISS_GRAPH_CANONICAL_LABELING called
[ [ (2,4)(3,7)(6,8), (1,2,3)(4,5,6)(7,8,9) ], (1,9)(2,7,5,4,8)(3,6), 
  -177864343 ]
gap> Print(StructureDescription(Group(bl3[1])),"\n");
C3 x S3
gap> 
gap> dg_undir:=List([1..9],i->Filtered([1..9],j->
>     ([i,j] in dir_edges) or ([j,i] in dir_edges)));
[ [ 2, 3, 4, 7 ], [ 1, 3, 5, 8 ], [ 1, 2, 6, 9 ], [ 1, 5, 6, 7 ], 
  [ 2, 4, 6, 8 ], [ 3, 4, 5, 9 ], [ 1, 4, 8, 9 ], [ 2, 5, 7, 9 ], 
  [ 3, 6, 7, 8 ] ]
gap> bl4:=GraphCanonicalLabelling@glabella(9, dg_undir, false, false);
#I  Invalid plain format colouring, set to 0
#I  BLISS_GRAPH_CANONICAL_LABELING called
[ [ (2,3)(5,6)(8,9), (2,4)(3,7)(6,8), (1,2)(4,5)(7,8) ], 
  (1,9)(2,7,5,4,8)(3,6), 407536658 ]
gap> Print(StructureDescription(Group(bl4[1])),"\n");
(S3 x S3) : C2
gap> 
gap> path:=[[2],[3],[]];
[ [ 2 ], [ 3 ], [  ] ]
gap> GraphCanonicalLabelling@glabella(3, path, false, true);
#I  Invalid plain format colouring, set to 0
#I  BLISS_GRAPH_CANONICAL_LABELING called
[ [  ], (1,2,3), -270956424 ]
gap> GraphCanonicalLabelling@glabella(3, path, false, false);
Error, Glabella: for undirected graphs the list of adjacencies must be\
 symmetric.
gap> path_undir:=[[2],[1,3],[2]];
[ [ 2 ], [ 1, 3 ], [ 2 ] ]
gap> GraphCanonicalLabelling@glabella(3, path_undir, false, false);
#I  Invalid plain format colouring, set to 0
#I  BLISS_GRAPH_CANONICAL_LABELING called
[ [ (1,3) ], (1,2,3), -184501359 ]
gap> ###################################
gap> 
gap> STOP_TEST( "glabella.tst", 10000 );

