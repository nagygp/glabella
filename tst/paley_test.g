LoadPackage("glabella");

paley:=p->List([0..p-1],x->Filtered([1..p],y->Jacobi(p,x-y)=1));
NautyGraphCanonicalLabelling(41,paley(41),0,true);

