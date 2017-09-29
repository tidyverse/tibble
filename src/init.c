#include <stddef.h>
#include "tibble.h"

// According to the C standard, names starting with underscore are reserved
static const R_CallMethodDef CallEntries[] = {
    {"tibble_matrixToDataFrame", (DL_FUNC) &tibble_matrixToDataFrame, 1},
    {NULL, NULL, 0}
};

void R_init_tibble(DllInfo *dll) {
    R_registerRoutines(dll, NULL, CallEntries, NULL, NULL);
    R_useDynamicSymbols(dll, FALSE);
}
