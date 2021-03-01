#
# labelface: Low level interface to graph automorphism canonical labeling tools
#
# Implementations
#

InstallGlobalFunction( GraphCanonicalLabelingNC@,
function( n, outneigh, colours, isdirected, solver )
    if solver = "bliss" then
    	return BLISS_GRAPH_CANONICAL_LABELING( n, outneigh, colours, isdirected );
    elif solver = "nauty" then
        return NAUTY_GRAPH_CANONICAL_LABELING( n, outneigh, colours[1], colours[2], isdirected );
    elif solver = "sparsenauty" then
        return NAUTY_SPARSEGRAPH_CANONICAL_LABELING( n, outneigh, colours[1], colours[2], isdirected );
	else
		Error("unknown solver");
    fi;
end );

InstallGlobalFunction( GraphCanonicalLabeling@,
function( n, outneigh, colouring, args... )
    local vertices, stops, solver, colouring_format, isdirected;
	if Length(args) > 0 then 
		isdirected := args[1];
	else 
		isdirected := false;
	fi;
	if Length(args) > 1 then
		solver := args[2];
	else
		solver := "bliss";
	fi;
	if not IsPosInt(n) then
		Error( "BI: <1> must be a positive integer.");
	fi;
	if not (IsList(outneigh) and Length(outneigh)=n and ForAll(outneigh, x->IsList(x) and ForAll(x,y->IsPosInt(y) and (y<=n)))) then
		Error( "BI: <2> must be a list of lists of integers between 1 and <1>.");
	fi;
	if not IsBool(isdirected) then
		Error( "BI: <4> must be true or false.");
	fi;
    # identify colouring format
	if IsList(colouring) and Length(colouring)=2 and 
		IsList(colouring[1]) and Length(colouring[1])=n and ForAll(colouring[1],IsPosInt) and
		IsList(colouring[2]) and Length(colouring[2])=n and ForAll(colouring[2],IsPosInt)
	then 
		colouring_format := "nauty";
	else 
		colouring_format := "plain";
	fi;
    # invalid colouring formats are replaced by 0 or [0,0]
    if colouring_format = "plain" and
        not (IsList(colouring) and Length(colouring)=n and ForAll(colouring,IsInt)) 
	then
        colouring := 0;
    fi;
    # if solver and colouring format mismatch
    if colouring_format = "plain" and solver in ["nauty","sparsenauty","traces"] then
        if colouring = 0 then
            colouring := [0,0];
        else
            stops:=ShallowCopy(colouring);
            vertices:=[1..n];
            StableSortParallel(stops,vertices);
            stops:=List([1..n],
                function(i) if i=n or stops[i]<>stops[i+1] then return 0; else return 1; fi; end
		    ); 
            colouring := [vertices, stops];
        fi;
    fi;
    if colouring_format = "nauty" and solver = "bliss" then
        if colouring = [0,0] then
            colouring := 0;
        else
			colouring[2] := Concatenation([0],1-colouring[2]);
			colouring[2] := List([1..n],i->Sum(colouring[2]{[1..i]}));
			StableSortParallel(colouring[1],colouring[2]);
            colouring := colouring[2];
        fi;
    fi;
	return GraphCanonicalLabelingNC@( n, outneigh, colouring, isdirected, solver );
end );


# # upper vertices [1..n], lower vertcies n+[1..m]
# InstallGlobalFunction( BipartiteCanonicalLabeling@,
# function( n, m, outneigh, ucolours, lcolours, arg... )
# 	local isdirected;
# 	if Length(arg)>0 and IsBool(arg[1]) then
# 		isdirected := arg[1];
# 	else
# 		isdirected := true;
# 	fi;
# 	if not (IsPosInt(n) and IsPosInt(m)) then
# 		Error( "BI: <1> and <2> must be a positive integer.");
# 	fi;
# 	if not (IsList(outneigh) and Length(outneigh)=m and ForAll(outneigh, x->IsList(x) and ForAll(x,y->IsPosInt(y) and (y<=n)))) then
# 		Error( "BI: <3> must be a list of lists of integers between 1 and <1>.");
# 	fi;
# 	if not (IsList(ucolours) and Length(ucolours)=n and ForAll(ucolours,IsInt)) then
# 		ucolours := ListWithIdenticalEntries(n,0);
# 	fi;
# 	if not (IsList(lcolours) and Length(lcolours)=m and ForAll(lcolours,IsInt)) then
# 		lcolours := ListWithIdenticalEntries(m,0);
# 	fi;

#     return GraphCanonicalLabelingNC@(
# 		n+m, 
# 		Concatenation(ListWithIdenticalEntries(n,[]),outneigh), 
# 		Concatenation(ucolours,lcolours), 
# 		isdirected
# 	); 
# end );

# InstallGlobalFunction( BipartiteCanonicalLabelingNC@,
# function( n, m, outneigh, ucolours, lcolours, isdirected )
# 	return GraphCanonicalLabelingNC@( 
# 		n+m, 
# 		Concatenation(ListWithIdenticalEntries(n,[]),outneigh), 
# 		Concatenation(ucolours,lcolours), 
# 		isdirected
# 	); 
# end );



