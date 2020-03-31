# Looks into top-level tibble function,
# returns TRUE if that function has a given argument.
has_tibble_arg <- function(arg_name, n_frames = 5) {
  frames <- utils::tail(sys.frames(), n_frames)
  frame_env <- map(frames, parent.env)
  frame_is_namespace <- which(map_lgl(frame_env, identical, ns_env()))

  if (is_empty(frame_is_namespace)) return(FALSE)

  my_vars <- names(formals(sys.function(frame_is_namespace[[1]])))

  arg_name %in% my_vars
}

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

use_repair <- function(repair) {
  if (repair) "\nUse .name_repair to specify repair."
}

tibble_error_class <- function(class) {
  c(paste0("tibble_error_", class), "tibble_error")
}

# Errors get a class name derived from the name of the calling function
tibble_error <- function(x, ..., parent = NULL) {
  call <- sys.call(-1)
  fn_name <- as_name(call[[1]])
  class <- tibble_error_class(gsub("^error_", "", fn_name))
  error_cnd(.subclass = class, ..., message = x, parent = parent)
}
