invalid_df <- function(problem, vars, ...) {
  if (is.character(vars)) {
    vars <- tick(vars)
  }

  pluralise_commas(
    "Column(s) ",
    vars,
    paste0(" ", problem, ".", ...)
  )
}

use_repair <- function(repair_hint) {
  if (repair_hint) "\nUse `.name_repair` to specify repair."
}

tibble_error_class <- function(class) {
  c(paste0("tibble_error_", class), "tibble_error")
}

# Errors get a class name derived from the name of the calling function
tibble_error <- function(x, ..., parent = NULL) {
  call <- sys.call(-1)
  fn_name <- as_name(call[[1]])
  class <- tibble_error_class(gsub("^error_", "", fn_name))
  error_cnd(class, ..., message = x, parent = parent)
}
