LoadPackage("glabella");
LoadPackage("unitalsz");

test_blocks:=function(bls,isdirected,solver)
	local nrpts,edges,start_time,cl;
	nrpts:=Maximum(Concatenation(bls));
	if isdirected then 
		edges:=Concatenation(ListWithIdenticalEntries(nrpts,[]),bls);
	else
		edges:=List([1..nrpts],i->Filtered([1..Length(bls)],j->i in bls[j])+nrpts);
		Append(edges,bls);;
	fi;
	start_time:=Runtime();
	cl:=GraphCanonicalLabelling@glabella(Size(bls)+nrpts,edges,0,isdirected,solver);
	Print( "# " );
	if isdirected then Print( "DIGRAPH " ); else Print( "GRAPH   " ); fi;
	Print( "solver = ", solver, " :: " );
	Print( "|gr| = ", Size( Group( cl[1] ) ), " :: " );
	Print( "time = ", Runtime()-start_time, "\n" );
	return cl;
end;

all_tests:=function(bls)
	local solver,cl;
	for solver in [ "bliss", "densenauty", "sparsenauty" ] do
		cl:=test_blocks(bls,true,solver);
	od;
	for solver in [ "bliss", "densenauty", "sparsenauty", "traces" ] do
		cl:=test_blocks(bls,false,solver);
	od;
end;

# Fano plane
fano:=Set([[1,2,4],[2,3,5],[3,4,6],[4,5,7],[1,5,6],[2,6,7],[1,3,7]]);;
all_tests(fano);

# Her(5)
bls:=BlocksOfUnital(HermitianAbstractUnital(5));;
all_tests(bls);

# Her(9)
bls:=BlocksOfUnital(HermitianAbstractUnital(9));;
all_tests(bls);

# BT(8)
bls:=BlocksOfUnital(BuekenhoutTitsAbstractUnital(8));;
while true do
	test_blocks(bls,true,"bliss");
	test_blocks(bls,true,"sparsenauty");
	test_blocks(bls,false,"bliss");
	test_blocks(bls,false,"densenauty");
	test_blocks(bls,false,"sparsenauty");
	test_blocks(bls,false,"traces");
	break;
od;
