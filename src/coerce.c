#include <inttypes.h>
#include <limits.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include "tibble.h"

static long long string_to_int64(const char* x) {
  char* px = NULL;
  long long xi = strtoll(x, &px, 10);
  if (*px) return LLONG_MIN;
  if (xi == LLONG_MAX) return LLONG_MIN;
  if (xi < 1) return LLONG_MIN;
  return xi;
}

static SEXP string_to_numeric_indexes(SEXP x, R_xlen_t int_i, SEXP int_out) {
  const int* int_out_vec = INTEGER(int_out);

  const R_xlen_t len = Rf_length(x);
  SEXP out = PROTECT(Rf_allocVector(REALSXP, len));
  double* out_vec = REAL(out);

  for (R_xlen_t i = 0; i < int_i; ++i) {
    out_vec[i] = (double)int_out_vec[i];
  }

  for (R_xlen_t i = int_i; i < len; ++i) {
    long long xi = string_to_int64(CHAR(STRING_ELT(x, i)));
    if (xi == LLONG_MIN) {
      out_vec[i] = NA_REAL;
    } else {
      out_vec[i] = (double)xi;
    }
  }

  UNPROTECT(1);
  return out;
}

SEXP tibble_string_to_indices(SEXP x) {
  const R_xlen_t len = Rf_length(x);
  SEXP out = PROTECT(Rf_allocVector(INTSXP, len));
  int* out_vec = INTEGER(out);

  for (R_xlen_t i = 0; i < len; ++i) {
    long long xi = string_to_int64(CHAR(STRING_ELT(x, i)));
    if (xi == LLONG_MIN) {
      out_vec[i] = NA_INTEGER;
    } else if (xi <= INT_MIN || xi > INT_MAX) {
      out = string_to_numeric_indexes(x, i, out);
      break;
    } else {
      out_vec[i] = (int)xi;
    }
  }

  UNPROTECT(1);
  return out;
}

SEXP tibble_need_coerce(SEXP x) {
  if (TYPEOF(x) != LGLSXP) {
    return (Rf_ScalarLogical(0));
  }

  const R_xlen_t len = Rf_xlength(x);
  const int* px = LOGICAL(x);
  for (R_xlen_t i = 0; i < len; ++i) {
    if (px[i] != NA_LOGICAL) {
      return (Rf_ScalarLogical(0));
    }
  }

  return (Rf_ScalarLogical(1));
}
