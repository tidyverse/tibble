
has_dim <- function(x) {
  length(dim(x)) > 0L || has_nonnull_names(x)
}

needs_dim <- function(x) {
  length(dim(x)) > 1L
}

has_null_names <- function(x) {
  is.null(names(x))
}

has_nonnull_names <- function(x) {
  !has_null_names(x)
}

set_class <- `class<-`

check_no_dim <- function(x) {
  if (is_atomic(x) && has_dim(x)) {
    abort(error_1d_array_column())
  }
  invisible(x)
}

strip_dim <- function(x) {
  if (is.matrix(x)) {
    rownames(x) <- NULL
  } else if (is.data.frame(x)) {
    x <- remove_rownames(x)
    x[] <- map(x, strip_dim)
  } else if (is_atomic(x) && has_dim(x)) {
    # Careful update only if necessary, to avoid copying which is checked by
    # the "copying" test in dplyr
    dim(x) <- NULL
  }
  x
}

needs_list_col <- function(x) {
  is_list(x) || length(x) != 1L
}

# Work around bug in R 3.3.0
# Can be ressigned during loading (#544)
safe_match <- match


warningc <- function(...) {
  warn(paste0(...))
}

nchar_width <- function(x) {
  nchar(x, type = "width")
}

cat_line <- function(...) {
  cat(paste0(..., "\n"), sep = "")
}

is_rstudio <- function() {
  !is.na(Sys.getenv("RSTUDIO", unset = NA))
}
