#include "tibble.h"

R_xlen_t fast_nrow(SEXP x);

SEXP tbl_subassign_col(SEXP x, SEXP j_, SEXP value) {
  R_xlen_t nrow = fast_nrow(x);
  R_xlen_t n_x = Rf_xlength(x);

  R_xlen_t n_j = Rf_xlength(j_);
  R_xlen_t* j = (R_xlen_t*)R_alloc(n_j + 1, sizeof(R_xlen_t));
  if (TYPEOF(j_) == INTSXP) {
    const int* j_int = INTEGER(j_);
    for (R_xlen_t jj = 0; jj < n_j; ++jj) {
      j[jj] = j_int[jj] - 1;
    }
  } else if (TYPEOF(j_) == REALSXP) {
    const double* j_real = REAL(j_);
    for (R_xlen_t jj = 0; jj < n_j; ++jj) {
      j[jj] = (R_xlen_t)j_real[jj] - 1;
    }
  } else {
    Rf_error("Internal: tbl_subassign_col: invalid type for j_.");
  }

  // Add sentinel value
  j[n_j] = -1;

  // Compute n_new and n_old
  R_xlen_t j_max = n_x;
  R_xlen_t n_old = 0;
  for (R_xlen_t jj = 0; jj < n_j; ++jj) {
    if (j_max <= j[jj]) {
      j_max = j[jj] + 1;
    }
    if (VECTOR_ELT(value, jj) == R_NilValue) {
      ++n_old;
    }
  }

  R_xlen_t n_xo = j_max - n_old;

  R_xlen_t* xo_idx = (R_xlen_t*)R_alloc(n_xo, sizeof(R_xlen_t));
  bool* xo_is_value = (bool*)R_alloc(n_xo, sizeof(bool));

  for (R_xlen_t jj = 0, xoj = 0, xj = 0; xoj < n_xo; ++xj) {
    bool is_value = (xj == j[jj]);
    xo_is_value[xoj] = is_value;

    if (is_value) {
      if (VECTOR_ELT(value, jj) != R_NilValue) {
        xo_idx[xoj++] = jj;
      }
      jj++;
    } else {
      xo_idx[xoj++] = xj;
    }
  }

  SEXP xo = Rf_allocVector(VECSXP, n_xo);
  Rf_copyMostAttrib(x, xo);

  SEXP xo_names = Rf_allocVector(STRSXP, n_xo);
  SEXP j_names = Rf_getAttrib(j_, R_NamesSymbol);
  SEXP x_names = Rf_getAttrib(x, R_NamesSymbol);

  for (R_xlen_t xoj = 0; xoj < n_xo; ++xoj) {
    R_xlen_t xj = xo_idx[xoj];
    if (xo_is_value[xoj]) {
      SET_VECTOR_ELT(xo, xoj, VECTOR_ELT(value, xj));
      SET_STRING_ELT(xo_names, xoj, STRING_ELT(j_names, xj));
    } else {
      if (xj >= n_x) {
        Rf_error("Internal: tbl_subassign_col: x_j >= n_x, %d >= %d", xj, n_x);
      }
      SET_VECTOR_ELT(xo, xoj, VECTOR_ELT(x, xj));
      SET_STRING_ELT(xo_names, xoj, STRING_ELT(x_names, xj));
    }
  }

  Rf_setAttrib(xo, R_NamesSymbol, xo_names);
  SEXP new_row_names_ = Rf_allocVector(INTSXP, 2);
  int* new_row_names = INTEGER(new_row_names_);

  new_row_names[0] = NA_INTEGER;
  new_row_names[1] = -nrow;
  Rf_setAttrib(xo, R_RowNamesSymbol, new_row_names_);

  return xo;
}

R_xlen_t fast_nrow(SEXP x) {
  SEXP row_names = Rf_getAttrib(x, R_RowNamesSymbol);

  if (Rf_xlength(row_names) == 0) {
    return 0;
  }

  if (TYPEOF(row_names) == INTSXP && INTEGER_ELT(row_names, 0) == NA_INTEGER) {
    int out = INTEGER_ELT(row_names, 1);
    if (out < 0) {
      out = -out;
    }
    return out;
  } else {
    return Rf_xlength(row_names);
  }
}
