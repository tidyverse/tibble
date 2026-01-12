#include "tibble.h"

SEXP tibble_restore_impl(SEXP xo, SEXP x) {
  xo = PROTECT(Rf_shallow_duplicate(xo));

  // copy over all attributes except `names` and `row.names`:
  // get number of rows, copy most attributes, set number of rows.
  // This is still fast if Rf_getAttrib() returns a compact integer sequence.
  SEXP row_names = Rf_getAttrib(xo, R_RowNamesSymbol);
  R_xlen_t nrow = Rf_xlength(row_names);
  Rf_copyMostAttrib(x, xo);
  Rf_setAttrib(xo, R_RowNamesSymbol, tibble_make_rownames(nrow));

  UNPROTECT(1);
  return xo;
}

SEXP tibble_make_rownames(R_xlen_t nrow) {
  SEXP rownames;
  if (nrow <= INT_MAX) {
    PROTECT(rownames = Rf_allocVector(INTSXP, 2));
    INTEGER(rownames)[0] = NA_INTEGER;
    INTEGER(rownames)[1] = -(int)nrow;
  } else {
    PROTECT(rownames = Rf_allocVector(REALSXP, 2));
    REAL(rownames)[0] = NA_REAL;
    REAL(rownames)[1] = -(double)nrow;
  }
  UNPROTECT(1);
  return rownames;
}
