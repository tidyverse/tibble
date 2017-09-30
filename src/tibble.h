#ifndef TIBBLE_H
#define TIBBLE_H

#include <Rdefines.h>

/**
 * Keep matrix row names by default. Change to
 *
 *     #define TIBBLE_DROP_ROWNAMES 1
 *
 * if you want to drop them.
 */
#undef TIBBLE_DROP_ROWNAMES

SEXP tibble_matrixToDataFrame(SEXP xSEXP);

#endif /* TIBBLE_H */
