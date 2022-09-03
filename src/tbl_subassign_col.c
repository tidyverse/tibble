#include "tibble.h"

R_xlen_t fast_nrow(SEXP x);

// Performs a variant of x[j] <- value, growing x as necessary
// NULL values are supported
// First, creates the storage for the resulting x
// Then, populates that storage by copying the correct values exactly once
//
// Requires j to be sorted on input
SEXP tbl_subassign_col(SEXP x, SEXP j_, SEXP value) {
  // Naming conventions:
  // n_x: length of x
  // x_idx: index into vector x
  // x_names: names of x
  // n_old: number of elements with some property
  // j_max: maximum value of j
  // j_/j: SEXP and native version of bare vector
  // xo: output vector
  R_xlen_t nrow = fast_nrow(x);
  R_xlen_t n_x = Rf_xlength(x);

  // Compute j from j_, converting 1-based j_ to zero-based j
  R_xlen_t n_j = Rf_xlength(j_);
  R_xlen_t* j = (R_xlen_t*)R_alloc(n_j + 1, sizeof(R_xlen_t));
  if (TYPEOF(j_) == INTSXP) {
    const int* j_int = INTEGER(j_);
    for (R_xlen_t j_idx = 0; j_idx < n_j; ++j_idx) {
      j[j_idx] = j_int[j_idx] - 1;
    }
  } else if (TYPEOF(j_) == REALSXP) {
    const double* j_real = REAL(j_);
    for (R_xlen_t j_idx = 0; j_idx < n_j; ++j_idx) {
      j[j_idx] = (R_xlen_t)j_real[j_idx] - 1;
    }
  } else {
    Rf_error("Internal: tbl_subassign_col: invalid type for j_.");
  }

  // Add sentinel value
  j[n_j] = -1;

  // Compute j_max and n_old
  R_xlen_t j_max = n_x;
  R_xlen_t n_old = 0;
  for (R_xlen_t j_idx = 0; j_idx < n_j; ++j_idx) {
    if (j_max <= j[j_idx]) {
      j_max = j[j_idx] + 1;
    }
    if (VECTOR_ELT(value, j_idx) == R_NilValue) {
      ++n_old;
    }
  }

  R_xlen_t n_xo = j_max - n_old;

  // For each target element, position of source element in the x or value vectors
  R_xlen_t* xo_src_idx = (R_xlen_t*)R_alloc(n_xo, sizeof(R_xlen_t));
  bool* xo_is_value = (bool*)R_alloc(n_xo, sizeof(bool));

  for (R_xlen_t j_idx = 0, xo_idx = 0, x_idx = 0; xo_idx < n_xo; ++x_idx) {
    // Is the next xo element taken from x or from value?
    bool is_value = (x_idx == j[j_idx]);
    xo_is_value[xo_idx] = is_value;

    if (is_value) {
      // If the next value is not NULL, use it, otherwise skip it
      if (VECTOR_ELT(value, j_idx) != R_NilValue) {
        xo_src_idx[xo_idx++] = j_idx;
      }
      j_idx++;
    } else {
      // Use next x
      xo_src_idx[xo_idx++] = x_idx;
    }
  }

  // Allocate output vector and output names with final size
  SEXP xo = Rf_allocVector(VECSXP, n_xo);
  Rf_copyMostAttrib(x, xo);

  SEXP xo_names = Rf_allocVector(STRSXP, n_xo);
  SEXP j_names = Rf_getAttrib(j_, R_NamesSymbol);
  SEXP x_names = Rf_getAttrib(x, R_NamesSymbol);

  // Populate xo, copying from x or value as planned
  for (R_xlen_t xo_idx = 0; xo_idx < n_xo; ++xo_idx) {
    R_xlen_t x_idx = xo_src_idx[xo_idx];
    if (xo_is_value[xo_idx]) {
      SET_VECTOR_ELT(xo, xo_idx, VECTOR_ELT(value, x_idx));
      SET_STRING_ELT(xo_names, xo_idx, STRING_ELT(j_names, x_idx));
    } else {
      if (x_idx >= n_x) {
        Rf_error("Internal: tbl_subassign_col: x_j >= n_x, %d >= %d", x_idx, n_x);
      }
      SET_VECTOR_ELT(xo, xo_idx, VECTOR_ELT(x, x_idx));
      SET_STRING_ELT(xo_names, xo_idx, STRING_ELT(x_names, x_idx));
    }
  }

  // Set output names
  Rf_setAttrib(xo, R_NamesSymbol, xo_names);

  // Set output row names
  // FIXME: Reuse original vector?
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
