#
# glabella: Low level interface to graph automorphism canonical labelling tools
#
# Implementations
#

InstallGlobalFunction( GraphCanonicalLabellingNC@,
function( n, outneigh, colours, isdirected, solver )
    if solver = "bliss" then
		Info( InfoGlabella, 2, "BLISS_GRAPH_CANONICAL_LABELING called" );
    	return BLISS_GRAPH_CANONICAL_LABELING( n, outneigh, colours, isdirected );
    elif solver = "densenauty" then
		Info( InfoGlabella, 2, "DENSENAUTY_GRAPH_CANONICAL_LABELING called" );
        return DENSENAUTY_GRAPH_CANONICAL_LABELING( n, outneigh, colours[1], colours[2], isdirected );
    elif solver = "sparsenauty" then
		Info( InfoGlabella, 2, "SPARSENAUTY_GRAPH_CANONICAL_LABELING called" );
        return SPARSENAUTY_GRAPH_CANONICAL_LABELING( n, outneigh, colours[1], colours[2], isdirected );
    elif solver = "traces" then
		Info( InfoGlabella, 2, "TRACES_GRAPH_CANONICAL_LABELING called" );
        return TRACES_GRAPH_CANONICAL_LABELING( n, outneigh, colours[1], colours[2], isdirected );
	else
		Error("unknown solver");
    fi;
end );

InstallGlobalFunction( GraphCanonicalLabelling@,
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
		Error( "Glabella: <1> must be a positive integer." );
	fi;
	if not (IsList(outneigh) and Length(outneigh)=n and ForAll(outneigh, x->IsList(x) and ForAll(x,y->IsPosInt(y) and (y<=n)))) then
		Error( "Glabella: <2> must be a list of lists of integers between 1 and <1>." );
	fi;
	if not IsBool(isdirected) then
		Error( "Glabella: <4> must be true or false.");
	fi;
	# check symmetry for undirected graphs
	if (not isdirected) and 
		ForAny( [1..Length(outneigh)], i -> ForAny( outneigh[i], j-> not i in outneigh[j] ) ) 
	then 
		Error( "Glabella: for undirected graphs the list of adjacencies must be symmetric." );
	fi;
	# Traces only works with undirected graphs
	if solver = "traces" and isdirected then 
		Error( "Glabella: Traces only works with undirected graphs." );
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
		Info( InfoGlabella, 1, "Invalid plain format colouring, set to 0" );
        colouring := 0;
    fi;
    # if solver and colouring format mismatch
    if colouring_format = "plain" and solver in ["densenauty","sparsenauty","traces"] then
        if colouring = 0 then
			Info( InfoGlabella, 1, "Invalid nauty format colouring, set to [0,0]" );
            colouring := [0,0];
        else
			Info( InfoGlabella, 1, "Convert colouring to nauty format" );
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
			Info( InfoGlabella, 1, "Invalid plain format colouring, set to 0" );
            colouring := 0;
        else
			Info( InfoGlabella, 1, "Convert colouring to plain format" );
			colouring[2] := Concatenation([0],1-colouring[2]);
			colouring[2] := List([1..n],i->Sum(colouring[2]{[1..i]}));
			StableSortParallel(colouring[1],colouring[2]);
            colouring := colouring[2];
        fi;
    fi;
	return GraphCanonicalLabellingNC@( n, outneigh, colouring, isdirected, solver );
end );


