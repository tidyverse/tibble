needs_dim <- function(x) {
  length(dim(x)) > 1L
}

has_null_names <- function(x) {
  is.null(names(x))
}

needs_list_col <- function(x) {
  is_list(x) || !vec_is(x) || vec_size(x) != 1L
}

# Work around bug in R 3.3.0
# Can be reassigned during loading (#544)
safe_match <- match


nchar_width <- function(x) {
  nchar(x, type = "width")
}

is_rstudio <- function() {
  !is.na(Sys.getenv("RSTUDIO", unset = NA))
}
