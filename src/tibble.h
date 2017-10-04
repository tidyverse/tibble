#ifndef TIBBLE_H
#define TIBBLE_H

#define R_NO_REMAP
#include <Rdefines.h>

SEXP tibble_matrixToDataFrame(SEXP xSEXP);

#endif /* TIBBLE_H */
