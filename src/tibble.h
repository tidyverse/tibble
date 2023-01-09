#ifndef TIBBLE_H
#define TIBBLE_H

#define R_NO_REMAP
#include <Rinternals.h>

#include "stdbool.h"

SEXP tibble_matrixToDataFrame(SEXP xSEXP);
SEXP tibble_string_to_indices(SEXP x);
SEXP tibble_need_coerce(SEXP x);
SEXP tibble_update_attrs(SEXP x, SEXP dots);
SEXP tibble_restore_impl(SEXP xo, SEXP x);
SEXP tbl_subassign_col(SEXP x, SEXP j, SEXP value);

#endif /* TIBBLE_H */
