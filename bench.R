cpp11::cpp_source(
  code = '
#include <cpp11/R.hpp>
#include <Rinternals.h>

[[cpp11::register]]
int row_names_simple(SEXP x) {
  SEXP row_names = Rf_getAttrib(x, R_RowNamesSymbol);
  R_xlen_t nrow = Rf_xlength(row_names);
  return (int)nrow;
}

[[cpp11::register]]
int row_names_new(SEXP x) {
  return (int)R_nrow(x);
}'
)

data <- data.frame(a = 1:20)
bench::mark(
  row_names_simple(data),
  row_names_new(data),
  max_iterations = 1e7
)
