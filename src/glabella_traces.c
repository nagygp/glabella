/*
 * glabella: Low level interface to graph automorphism canonical labelling tools
 */

#include "compiled.h" // GAP headers

#include "../extern/nauty27r1/nautinv.h"
#include "../extern/nauty27r1/naututil.h"

#include "../extern/nauty27r1/traces.h"
#include "../extern/nauty27r1/nauty.h"
#include "../extern/nauty27r1/naurng.h"
#include "../extern/nauty27r1/schreier.h"
#include "../extern/nauty27r1/nausparse.h"


/***************** THINGS *********************/

static Obj automorphism_list;

static Obj PermToGAP(int *perm, int n) {
  Obj p = NEW_PERM4(n);
  UInt4 *ptr = ADDR_PERM4(p);

  for (int v = 0; v < n; v++) {
    ptr[v] = perm[v];
  }

  return p;
}

static void userautomproc_traces(int count, int *perm,  int n) {
  Obj p = PermToGAP(perm, n);
  AddList(automorphism_list, p);
}

/***************** TRACES STARTS *********************/

Obj FuncTRACES_GRAPH_CANONICAL_LABELING(Obj self, Obj nr_vert, Obj outneigh,
                                       Obj vertices, Obj stops,
                                       Obj isdirected) {

  // allocate, declare, initialize 
  DYNALLSTAT(int,lab,lab_sz);
  DYNALLSTAT(int,ptn,ptn_sz);
  DYNALLSTAT(int,orbits,orbits_sz);
  DYNALLSTAT(int,map,map_sz);
  static DEFAULTOPTIONS_TRACES(options);
  TracesStats stats;

  SG_DECL(sg); 
  SG_DECL(cg);

  options.getcanon = TRUE;
  size_t n = INT_INTOBJ(nr_vert);
  size_t m = SETWORDSNEEDED(n);

  m = SETWORDSNEEDED(n);
  nauty_check(WORDSIZE,m,n,NAUTYVERSIONID);

  DYNALLOC1(int,lab,lab_sz,n,"malloc");
  DYNALLOC1(int,ptn,ptn_sz,n,"malloc");
  DYNALLOC1(int,orbits,orbits_sz,n,"malloc");
  DYNALLOC1(int,map,map_sz,n,"malloc");

  // set the edges
  size_t nredges = 0;
  size_t p = 0;
  for (UInt i = 1; i <= n; i++) {
    nredges += LEN_PLIST( ELM_PLIST( outneigh, i ) );
  }

  SG_ALLOC(sg,n,nredges,"malloc");
  sg.nv = n;              /* Number of vertices */
  sg.nde = nredges;       /* Number of directed edges */

  for (size_t i = 0; i < n; i++) {
    Obj block = ELM_PLIST(outneigh, i+1 );
    UInt b_size = LEN_PLIST(block);

    sg.v[i] = p;
    sg.d[i] = b_size;

    for (size_t j = 0; j < b_size; j++) {
      sg.e[p] = INT_INTOBJ(ELM_PLIST(block, j + 1)) - 1;
      ++p;
    }
  }

  // set nauty's parameters
  if (IS_LIST(vertices) && (LEN_LIST(vertices) == n)) {
    options.defaultptn = FALSE; // lab, ptn are used
    for (int i = 0; i < n; i++) {
      lab[i] = INT_INTOBJ(ELM_PLIST(vertices, i + 1)) - 1;
      ptn[i] = INT_INTOBJ(ELM_PLIST(stops, i + 1));
    }
  } else {
    options.defaultptn = TRUE; // lab, ptn are ignored
  }
  options.userautomproc = userautomproc_traces;

  // call Traces
  automorphism_list = NEW_PLIST(T_PLIST, 0);
  Traces(&sg,lab,ptn,orbits,&options,&stats,&cg);

  // compute 32-bit hashvalue
  long hash = hashgraph_sg(&cg, 255);

  // collect results
  Obj return_list = NEW_PLIST(T_PLIST, 0);
  AddList(return_list, automorphism_list);
  AddList(return_list, PermToGAP(lab, n));
  AddList(return_list, INTOBJ_INT(hash));
  automorphism_list = 0;

  // free pointers
  SG_FREE(sg);
  SG_FREE(cg);
  DYNFREE(lab,lab_sz);
  DYNFREE(ptn,ptn_sz);
  DYNFREE(orbits,orbits_sz);
  
  return return_list;
}

/*****************  TRACES ENDS  *********************/

/***************************************************************************/

// Table of functions to export

/*
 * "GVarFuncs" is not workin in C++, due to
 * "invalid conversion from ‘void*’ to ‘Obj‘" error
 */

// static StructGVarFunc GVarFuncs [] = {
//    GVAR_FUNC(TestCommand, 0, ""),
//    GVAR_FUNC(TestCommandWithParams, 2, "param, param2"),
//
//    { 0 } /* Finish with an empty entry */
//};

typedef Obj (*GVarFuncTypeDef)(/*arguments*/);

#define GVAR_FUNC_TABLE_ENTRY(name, nparam, params)                            \
  { #name, nparam, params, (GVarFuncTypeDef)Func##name, __FILE__ ":" #name }

// Table of functions to export
static StructGVarFunc GVarFuncs[] = {
    GVAR_FUNC_TABLE_ENTRY(TRACES_GRAPH_CANONICAL_LABELING, 5,
                          "n, outneigh, vertices, stops, isdirected"),
    {0} /* Finish with an empty entry */

};

/****************************************************************************
**
*F  InitKernel( <module> ) . . . . . . . .  initialise kernel data structures
*/
static Int InitKernel(StructInitInfo *module) {
  /* init filters and functions */
  InitHdlrFuncsFromTable(GVarFuncs);

  /* return success */
  return 0;
}

/****************************************************************************
**
*F  InitLibrary( <module> ) . . . . . . .  initialise library data structures
*/
static Int InitLibrary(StructInitInfo *module) {
  /* init filters and functions */
  InitGVarFuncsFromTable(GVarFuncs);

  /* return success */
  return 0;
}

/****************************************************************************
**
*F  Init__Dynamic() . . . . . . . . . . . . . . . . . table of init functions
*/
static StructInitInfo module = {
    /* type        = */ MODULE_DYNAMIC,
    /* name        = */ "glabella",
    /* revision_c  = */ 0,
    /* revision_h  = */ 0,
    /* version     = */ 0,
    /* crc         = */ 0,
    /* initKernel  = */ InitKernel,
    /* initLibrary = */ InitLibrary,
    /* checkInit   = */ 0,
    /* preSave     = */ 0,
    /* postSave    = */ 0,
    /* postRestore = */ 0,
};

StructInitInfo *Init__Dynamic(void) { return &module; }
