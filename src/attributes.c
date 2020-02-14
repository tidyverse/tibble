#include "tibble.h"

SEXP tibble_update_attrs(SEXP x, SEXP dots) {
  x = PROTECT(Rf_shallow_duplicate(x));

  while(dots != R_NilValue) {
    SEXP tag = TAG(dots);
    if (tag != R_NilValue) {
      Rf_setAttrib(x, tag, CAR(dots));
    }
    dots = CDR(dots);
  }
  UNPROTECT(1);
  return x;
}

SEXP tibble_restore_impl(SEXP xo, SEXP x) {
  xo = PROTECT(Rf_shallow_duplicate(xo));

  // copy over all attributes except `names` and `row.names`
  SEXP attr_x = ATTRIB(x);
  while(attr_x != R_NilValue) {
    SEXP tag = TAG(attr_x);
    if (tag != R_NamesSymbol && tag != R_RowNamesSymbol) {
      Rf_setAttrib(xo, tag, CAR(attr_x));
    }
    attr_x = CDR(attr_x);
  }

  // set row.names if needed
  SEXP rn = Rf_getAttrib(xo, R_RowNamesSymbol);
  if(!(Rf_isInteger(rn) && LENGTH(rn) == 2 && INTEGER(rn)[0] == NA_INTEGER) && rn != R_NilValue) {
    int n = LENGTH(rn);
    rn = PROTECT(Rf_allocVector(INTSXP, 2));
    INTEGER(rn)[0] = NA_INTEGER;
    INTEGER(rn)[1] = -n;
    Rf_setAttrib(xo, R_RowNamesSymbol, rn);
    UNPROTECT(1);
  }

  UNPROTECT(1);
  return xo;
}
