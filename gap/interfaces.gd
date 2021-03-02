#
# labelface: Low level interface to graph automorphism canonical labeling tools
#
#! @Chapter Usage of the package
#! @Section Interfaces
#! 
#! This section will describe the funtions of <Package>labelface</Package>, 
#! and their nonchecking counterparts. 
#! 
#! Let $\Gamma$ be a graph on the set $\{1,\ldots,n\}$ of vertices. $G$ may be directed or not; loops and duplicate edges are ignored. The graph is given by the list of its adjacencies $N_1,\ldots,N_n$, where $N_i$ is the set of (out)neighbors of the vertex $i$. 
#! 
#! A vertex colouring of $\Gamma$ can be given in two different formats. The <E>plain</E> format is a list $c_1,\ldots,c_n$ of integers; $c_i$ being the colour of the vertex $i$. The <E>nauty</E> format consists of two lists: $u_1,\ldots,u_n$ is a permutation of $\{1,\ldots,n\}$, and $s_1,\ldots,s_n \in \{0,1\}$. The second list indicates the division of the vertices into colours: if $s_i=0$, then a colour class ends at position $i$. For example, the lists
#! $$u=[3,4,6,7,2,1,5,8,9], \quad s=[0,0,1,1,1,0,1,1,0]$$
#! represent the colour classes $\{\{3\},\{4\},\{1,2,6,7\},\{5,8,9\}\}$. In plain format, the same colouring can be given by the list $c=[1,1,2,3,4,1,1,4,4]$. 
#! 
#! The solver programs (recently bliss 0.73, nauty 2.7R1) compute the generators of the automorphism group of the (coloured) graph $\Gamma$. Moreover a canonical labelling of $\Gamma$ is computed, this is a permutation of the vertices that bring the graph in a canonical format. Isomorphic graphs in canonical format are equal. Notice that canonical labellings can depend on the solver used, the version of the solver, the version of this packages, the version of GAP, parameter settings of the solver, and possibly even the compiler and computer used. 
#! 
#! The solver programs also compute a 32-bit hash value of the graph. The same as above: this hash value is an isomorphy invariant that depends on your software and hardware environment. It also depends on the colouring in bliss, but not in nauty.
#!  
#! 
#! This section will describe the funtions of <Package>labelface</Package>,  and their nonchecking counterparts. The nonchecking versions are slightly faster but it must be used with extreme care. Bad parameters may result in unpredictable behaviour. 
#!
#! @BeginGroup G1
#! @Description
#!   The coloured graph <C>G</C> has vertices <C>[1..n]</C>. 
#!   If <A>isdirected</A> is <C>true</C> then <C>G</C> is directed. (Default: <C>false</C>.)
#!   The edges of <C>G</C> are given by <A>outneigh</A>, which is a list 
#!   <C>[N_1,...,N_n]</C>, such that <C>N_i</C> is the list of (out)neighbors 
#!   of the vertex <C>i</C>. Duplicate edges between vertices and loops are ignored.
#!   <P />For coloured graphs, <A>colouring</A> is either a list of length <C>n</C> (plain format), or a pair of two lists of length <C>n</C> (nauty format). For malformatted colourings, all vertices have colour <C>0</C>.
#!   <P />The solver can be specified by the strings <C>"bliss"</C> or <C>"nauty"</C>. (Default: <C>"bliss"</C>.)
#! @Arguments n, outneigh, colouring[, isdirected[, solver]]
#! @Returns
#!   The triple <C>[gens,cl,hash]</C> as GAP object, where <C>gens</C> is a list
#!   of generators for the group of colour preserving automorphisms of 
#!   the graph <C>G</C>, <C>cl</C> is a canonical labeling of <C>G</C>, 
#!   and <C>hash</C> is an integer valued 32-bit hash of the permuted graph.
DeclareGlobalFunction( "GraphCanonicalLabeling@" );
#! @EndGroup

#! @Description
#!   <C>GraphCanonicalLabelingNC</C> is the operation that is called by the function
#!   <C>GraphCanonicalLabeling</C>, using the same arguments. Results are 
#!   unpredictable if the parameters are not well-formed. 
#! @Group G1
#! @Arguments n, outneigh, colours, isdirected, solver
DeclareGlobalFunction( "GraphCanonicalLabelingNC@" );

#! @Description
#!   An infoclass for the package. Its default value is $0$.
DeclareInfoClass( "Infolabelface" );