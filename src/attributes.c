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
