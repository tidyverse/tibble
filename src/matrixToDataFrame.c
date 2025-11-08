#include <inttypes.h>
#include <limits.h>
#include <stdint.h>
#include <string.h>
#include "tibble.h"

static SEXP pairlist_shallow_copy(SEXP p) {
  SEXP attr;
  PROTECT(attr = Rf_cons(CAR(p), R_NilValue));
  SEXP q = attr;
  SET_TAG(q, TAG(p));
  p = CDR(p);

  while (!Rf_isNull(p)) {
    SEXP s;
    s = Rf_cons(CAR(p), R_NilValue);
    SETCDR(q, s);
    q = CDR(q);
    SET_TAG(q, TAG(p));
    p = CDR(p);
  }

  UNPROTECT(1);
  return attr;
}

static void copy_attributes(SEXP out, SEXP data) {
  SEXP att = ATTRIB(data);
  if (!Rf_isNull(att)) {
    SET_ATTRIB(out, pairlist_shallow_copy(ATTRIB(data)));
  }
  // SET_OBJECT no longer available:
  if (Rf_isObject(data)) {
    Rf_setAttrib(out, R_ClassSymbol, Rf_getAttrib(data, R_ClassSymbol));
  }
  if (Rf_isS4(data)) {
    Rf_asS4(out, TRUE, FALSE);
  }
}

// same as copy_attributes but without names
static void copy_most_attributes(SEXP out, SEXP data) {
  copy_attributes(out, data);
  Rf_setAttrib(out, R_NamesSymbol, R_NilValue);
}

static void get_dim(SEXP x, R_xlen_t* nrowptr, R_xlen_t* ncolptr) {
  int nprot = 0;

  SEXP dim;
  PROTECT(dim = Rf_getAttrib(x, R_DimSymbol));
  nprot++;
  if (dim == R_NilValue || XLENGTH(dim) != 2) {
    Rf_error("`x` is not a matrix");
  }

  R_xlen_t nrow = 0, ncol = 0;
  switch (TYPEOF(dim)) {
  case INTSXP:
    nrow = (R_xlen_t)INTEGER(dim)[0];
    ncol = (R_xlen_t)INTEGER(dim)[1];
    break;

  case REALSXP:
    nrow = (R_xlen_t)REAL(dim)[0];
    ncol = (R_xlen_t)REAL(dim)[1];
    break;

  default:
    Rf_error("`x` is not a matrix");
    break;
  }

  if (nrowptr) {
    *nrowptr = nrow;
  }
  if (ncolptr) {
    *ncolptr = ncol;
  }
  UNPROTECT(nprot);
}

static SEXP get_rownames(SEXP x, R_xlen_t nrow) {
  int nprot = 0;

  SEXP rownames = R_NilValue;

  // check for row names, use them if present
  SEXP dimnames;
  PROTECT(dimnames = Rf_getAttrib(x, R_DimNamesSymbol));
  nprot++;
  if (TYPEOF(dimnames) == VECSXP && XLENGTH(dimnames) == 2) {
    rownames = VECTOR_ELT(dimnames, 0);
    if (TYPEOF(rownames) != STRSXP) {
      rownames = R_NilValue;
    }
  }

  // otherwise, allocate new row names attribute
  if (Rf_isNull(rownames)) {
    if (nrow <= INT_MAX) {
      PROTECT(rownames = Rf_allocVector(INTSXP, 2));
      nprot++;
      INTEGER(rownames)[0] = NA_INTEGER;
      INTEGER(rownames)[1] = -(int)nrow;
    } else {
      PROTECT(rownames = Rf_allocVector(REALSXP, 2));
      nprot++;
      REAL(rownames)[0] = NA_REAL;
      REAL(rownames)[1] = -(double)nrow;
    }
  }

  UNPROTECT(nprot);
  return rownames;
}

// don't use DATAPTR, it's not part of the public API
static void* get_data(SEXP x, size_t* widthptr) {
  size_t width = 0;
  void* ptr = NULL;

  switch (TYPEOF(x)) {
  case LGLSXP:
    ptr = LOGICAL(x);
    width = sizeof(int);
    break;

  case INTSXP:
    ptr = INTEGER(x);
    width = sizeof(int);
    break;

  case REALSXP:
    ptr = REAL(x);
    width = sizeof(double);
    break;

  case CPLXSXP:
    ptr = COMPLEX(x);
    width = sizeof(Rcomplex);
    break;

  default:
    Rf_error("`x` has non-atomic type");
    break;
  }

  if (widthptr) {
    *widthptr = width;
  }
  return ptr;
}

static void copy_columns_atomic(
  SEXP out,
  SEXP x,
  R_xlen_t nrow,
  R_xlen_t ncol
) {
  SEXPTYPE type = TYPEOF(x);
  size_t eltsize;
  const char* src = get_data(x, &eltsize);
  size_t colsize = nrow * eltsize;

  for (R_xlen_t j = 0; j < ncol; j++) {
    SEXP col = Rf_allocVector(type, nrow);
    SET_VECTOR_ELT(out, j, col);
    char* dst = get_data(col, NULL);
    memcpy(dst, src, colsize);
    src += colsize;
  }
}

static void copy_columns_str(SEXP out, SEXP x, R_xlen_t nrow, R_xlen_t ncol) {
  R_xlen_t src = 0;
  for (R_xlen_t j = 0; j < ncol; j++) {
    SEXP col = Rf_allocVector(STRSXP, nrow);
    SET_VECTOR_ELT(out, j, col);
    for (R_xlen_t i = 0; i < nrow; i++) {
      SEXP elt = STRING_ELT(x, src);
      SET_STRING_ELT(col, i, elt);
      src++;
    }
  }
}

static void copy_columns_vec(SEXP out, SEXP x, R_xlen_t nrow, R_xlen_t ncol) {
  R_xlen_t src = 0;
  for (R_xlen_t j = 0; j < ncol; j++) {
    SEXP col = Rf_allocVector(VECSXP, nrow);
    SET_VECTOR_ELT(out, j, col);
    for (R_xlen_t i = 0; i < nrow; i++) {
      SEXP elt = VECTOR_ELT(x, src);
      SET_VECTOR_ELT(col, i, elt);
      src++;
    }
  }
}

static void copy_column_attributes(SEXP out, SEXP x, R_xlen_t ncol) {
  for (R_xlen_t j = 0; j < ncol; j++) {
    SEXP col = VECTOR_ELT(out, j);
    copy_most_attributes(col, x);
    Rf_setAttrib(col, R_DimSymbol, R_NilValue);
  }
}

static SEXP get_class(void) {
  SEXP cls;

  PROTECT(cls = Rf_allocVector(STRSXP, 1));
  SET_STRING_ELT(cls, 0, Rf_mkChar("data.frame"));
  UNPROTECT(1);

  return cls;
}

SEXP tibble_matrixToDataFrame(SEXP x) {
  int nprot = 0;

  R_xlen_t nrow = 0, ncol = 0;
  get_dim(x, &nrow, &ncol);

  SEXP out;
  PROTECT(out = Rf_allocVector(VECSXP, ncol));
  nprot++;

  switch (TYPEOF(x)) {
  case LGLSXP:
  case INTSXP:
  case REALSXP:
  case CPLXSXP:
    copy_columns_atomic(out, x, nrow, ncol);
    break;

  case STRSXP:
    copy_columns_str(out, x, nrow, ncol);
    break;

  case VECSXP:
    copy_columns_vec(out, x, nrow, ncol);
    break;

  default:
    Rf_error("data type not handled");
    break;
  }

  copy_column_attributes(out, x, ncol);

  Rf_setAttrib(out, R_RowNamesSymbol, get_rownames(x, nrow));
  Rf_setAttrib(out, R_ClassSymbol, get_class());

  UNPROTECT(nprot);
  return out;
}
