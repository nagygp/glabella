LoadPackage("glabella");

paley:=p->List([0..p-1],x->Filtered([1..p],y->Jacobi(p,x-y)=1));

397; paley(last);; GraphCanonicalLabelling@glabella(last2,last,0,true,"bliss"); time;
397; paley(last);; GraphCanonicalLabelling@glabella(last2,last,0,true,"nauty"); time;
397; paley(last);; GraphCanonicalLabelling@glabella(last2,last,0,true,"sparsenauty"); time;

