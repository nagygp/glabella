LoadPackage("glabella");
LoadPackage("unitalsz");
LoadPackage("design");

###
res:=[];;
for q in [3,4,5,7,8,9,11] do
	u:=HermitianAbstractUnital(q); 
	nrpts:=Order(u)^3+1;
	bls:=BlocksOfUnital(u);;
	edges:=Concatenation(ListWithIdenticalEntries(nrpts,[]),bls);;
	cl:=GraphCanonicalLabelling@glabella(Size(bls)+nrpts,edges,0,false,"bliss");
	Add(res,[q,cl]);
	Print(q,": ", StructureDescription(Group(cl[1])), "\n");
od;
time; # 28 sec

res:=[];;
for q in [3,4,5,7,8,9,11] do
	u:=HermitianAbstractUnital(q); 
	nrpts:=Order(u)^3+1;
	bls:=BlocksOfUnital(u);;
	edges:=Concatenation(ListWithIdenticalEntries(nrpts,[]),bls);;
	cl:=GraphCanonicalLabelling@glabella(Size(bls)+nrpts,edges,0,true,"bliss");
	Add(res,[q,cl]);
	Print(q,": ", StructureDescription(Group(cl[1])), "\n");
od;
time; # 30 sec

###

res:=[];;
for q in [3,4,5,7,8,9,11] do
	u:=HermitianAbstractUnital(q); 
	nrpts:=Order(u)^3+1;
	bls:=BlocksOfUnital(u);;
	edges:=Concatenation(ListWithIdenticalEntries(nrpts,[]),bls);;
	cl:=GraphCanonicalLabelling@glabella(Size(bls)+nrpts,edges,0,false,"densenauty");
	Add(res,[q,cl]);
	Print(q,": ", StructureDescription(Group(cl[1])), "\n");
od;
time; # stacks at q=11, 101 sec

res:=[];;
for q in [3,4,5,7,8,9,11] do
	u:=HermitianAbstractUnital(q); 
	nrpts:=Order(u)^3+1;
	bls:=BlocksOfUnital(u);;
	edges:=Concatenation(ListWithIdenticalEntries(nrpts,[]),bls);;
	cl:=GraphCanonicalLabelling@glabella(Size(bls)+nrpts,edges,0,true,"densenauty");
	Add(res,[q,cl]);
	Print(q,": ", StructureDescription(Group(cl[1])), "\n");
od;
time; # stacks at q=8

###

res:=[];;
for q in [3,4,5,7,8,9,11] do
	u:=HermitianAbstractUnital(q); 
	nrpts:=Order(u)^3+1;
	bls:=BlocksOfUnital(u);;
	edges:=Concatenation(ListWithIdenticalEntries(nrpts,[]),bls);;
	cl:=GraphCanonicalLabelling@glabella(Size(bls)+nrpts,edges,0,true,"sparsenauty");
	Add(res,[q,cl]);
	Print(q,": ", StructureDescription(Group(cl[1])), "\n");
od;
time; # stacks at q=11, 205 sec

res:=[];;
for q in [3,4,5,7,8,9,11] do
	u:=HermitianAbstractUnital(q); 
	nrpts:=Order(u)^3+1;
	bls:=BlocksOfUnital(u);;
	edges:=List([1..nrpts],i->Filtered([1..Length(bls)],j->i in bls[j])+nrpts);
	Append(edges,bls);;
	cl:=GraphCanonicalLabelling@glabella(Size(bls)+nrpts,edges,0,false,"sparsenauty");
	Add(res,[q,cl]);
	Print(q,": ", StructureDescription(Group(cl[1])), "\n");
od;
time; # 34 sec

###

res:=[];;
for q in [3,4,5,7,8,9,11] do
	u:=HermitianAbstractUnital(q); 
	nrpts:=Order(u)^3+1;
	bls:=BlocksOfUnital(u);;
	edges:=List([1..nrpts],i->Filtered([1..Length(bls)],j->i in bls[j])+nrpts);
	Append(edges,bls);;
	cl:=GraphCanonicalLabelling@glabella(Size(bls)+nrpts,edges,0,false,"traces");
	Add(res,[q,cl]);
	Print(q,": ", StructureDescription(Group(cl[1])), "\n");
od;
time; # 32 sec

###

LoadPackage("glabella");
LoadPackage("unitalsz");
LoadPackage("design");

u:=BuekenhoutTitsAbstractUnital(8); 
nrpts:=Order(u)^3+1;
bls:=BlocksOfUnital(u);;
edges_simple:=List([1..nrpts],i->Filtered([1..Length(bls)],j->i in bls[j])+nrpts);;
Append(edges_simple,bls);;
edges_dir:=Concatenation(ListWithIdenticalEntries(nrpts,[]),bls);;

cl:=GraphCanonicalLabelling@glabella(Size(bls)+nrpts,edges_simple,0,false,"bliss");; time; Print("# ", Size(Group(cl[1])), "\n"); # 1840 ms
cl:=GraphCanonicalLabelling@glabella(Size(bls)+nrpts,edges_dir,0,true,"bliss");; time; Print("# ", Size(Group(cl[1])), "\n"); # 1840 ms

cl:=GraphCanonicalLabelling@glabella(Size(bls)+nrpts,edges_simple,0,false,"traces");; time; Print("# ", Size(Group(cl[1])), "\n"); # 1160 ms

cl:=GraphCanonicalLabelling@glabella(Size(bls)+nrpts,edges_simple,0,false,"sparsenauty");; time; Print("# ", Size(Group(cl[1])), "\n"); # 19847 ms
cl:=GraphCanonicalLabelling@glabella(Size(bls)+nrpts,edges_dir,0,true,"sparsenauty");; time; Print("# ", Size(Group(cl[1])), "\n"); # 19007 ms

cl:=GraphCanonicalLabelling@glabella(Size(bls)+nrpts,edges_simple,0,false,"densenauty");; time; Print("# ", Size(Group(cl[1])), "\n"); # 320116 ms
#cl:=GraphCanonicalLabelling@glabella(Size(bls)+nrpts,edges_dir,0,true,"densenauty");; time; Print("# ", Size(Group(cl[1])), "\n"); # hopeless, even with dreadnaut




