#include "tibble.h"

SEXP tibble_update_attrs(SEXP x, SEXP dots) {
  while(!Rf_isNull(dots)) {
    SEXP tag = TAG(dots);
    if (!Rf_isNull(tag)) {
      Rf_setAttrib(x, tag, CAR(dots));
    }
    dots = CDR(dots);
  }
  return x;
}
