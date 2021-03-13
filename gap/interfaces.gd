#
# glabella: Low level interface to graph automorphism canonical labelling tools
#
#! @Chapter Usage of the package
#! @Section Interfaces
#! 
#! This section will describe the funtions of <Package>glabella</Package>,  and their nonchecking counterparts. The nonchecking versions are slightly faster but it must be used with extreme care. Bad parameters may result in unpredictable behaviour. 
#!
#! @BeginGroup G1
#! @Description
#!   The coloured graph <C>G</C> has vertices <C>[1..n]</C>. 
#!   If <A>isdirected</A> is <C>true</C> then <C>G</C> is directed. (Default: <C>false</C>.)
#!   The edges of <C>G</C> are given by <A>outneigh</A>, which is a list 
#!   <C>[N_1,...,N_n]</C>, such that <C>N_i</C> is the list of (out)neighbors 
#!   of the vertex <C>i</C>. Duplicate edges between vertices and loops are ignored.
#!   <P />For coloured graphs, <A>colouring</A> is either a list of length <C>n</C> (plain format), or a pair of two lists of length <C>n</C> (nauty format). For malformatted colourings, all vertices have colour <C>0</C>.
#!   <P />The solver can be specified by the strings <C>"bliss"</C>, <C>"densenauty"</C>, <C>"sparsenauty"</C> or <C>"traces"</C>. (Default: <C>"bliss"</C>.)
#! @Arguments n, outneigh, colouring[, isdirected[, solver]]
#! @Returns
#!   The triple <C>[gens,cl,hash]</C> as GAP object, where <C>gens</C> is a list
#!   of generators for the group of colour preserving automorphisms of 
#!   the graph <C>G</C>, <C>cl</C> is a canonical labelling of <C>G</C>, 
#!   and <C>hash</C> is an integer valued 32-bit hash of the permuted graph.
DeclareGlobalFunction( "GraphCanonicalLabelling@" );
#! @EndGroup

#! @Description
#!   <P /><C>GraphCanonicalLabellingNC</C> is the operation that is called by the function
#!   <C>GraphCanonicalLabelling</C>, using the same arguments. Results are 
#!   unpredictable if the parameters are not well-formed. 
#! @Group G1
#! @Arguments n, outneigh, colours, isdirected, solver
DeclareGlobalFunction( "GraphCanonicalLabellingNC@" );

#! @Description
#!   An infoclass for the package. Its default value is $0$.
DeclareInfoClass( "InfoGlabella" );