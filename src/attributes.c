#include "tibble.h"

SEXP tibble_update_attrs(SEXP x, SEXP dots) {
  x = PROTECT(Rf_shallow_duplicate(x));

  while(!Rf_isNull(dots)) {
    SEXP tag = TAG(dots);
    if (!Rf_isNull(tag)) {
      Rf_setAttrib(x, tag, CAR(dots));
    }
    dots = CDR(dots);
  }
  UNPROTECT(1);
  return x;
}
