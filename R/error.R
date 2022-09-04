invalid_df <- function(problem, vars, extra = NULL, message = "Column(s)") {
  if (is.character(vars)) {
    vars <- tick(vars)
  }

  c(
    pluralise_commas(paste0(message, " "), vars, paste0(" ", problem, ".")),
    extra
  )
}

use_repair <- function(repair_hint) {
  if (repair_hint) "Use `.name_repair` to specify repair."
}

tibble_error_class <- function(class) {
  c(paste0("tibble_error_", class), "tibble_error")
}

# Errors get a class name derived from the name of the calling function
tibble_abort <- function(x, ..., parent = NULL) {
  abort_call <- sys.call(-1)
  fn_name <- as_name(abort_call[[1]])
  class <- tibble_error_class(gsub("^abort_", "", fn_name))

  call <- my_caller_call()

  abort(x, class, ..., call = call, parent = parent, use_cli_format = TRUE)
}

tibble_error <- function(x, ..., parent = NULL) {
  call <- sys.call(-1)
  fn_name <- as_name(call[[1]])
  class <- tibble_error_class(gsub("^error_", "", fn_name))
  error_cnd(class, ..., message = x, parent = parent, use_cli_format = TRUE)
}
