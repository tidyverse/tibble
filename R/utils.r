
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

is_1d <- function(x) {
  # dimension check is for matrices and data.frames
  (is_vector(x) && !needs_dim(x)) || is.data.frame(x) || is.matrix(x)
}

strip_dim <- function(x) {
  if (is.matrix(x)) {
    rownames(x) <- NULL
  } else if (is.data.frame(x)) {
    x <- remove_rownames(x)
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
safe_match <- function(x, table) {
  # nocov start
  if (getRversion() == "3.3.0") {
    match(x, table, incomparables = character())
  } else {
    match(x, table)
  }
  # nocov end
}

warningc <- function(...) {
  warn(paste0(...))
}

nchar_width <- function(x) {
  nchar(x, type = "width")
}

cat_line <- function(...) {
  cat(paste0(..., "\n"), sep = "")
}

is_syntactic <- function(x) {
  ret <- make.names(x) == x
  ret[is.na(x)] <- FALSE
  ret
}

tick_non_syntactic <- function(x) {
  needs_ticks <- !is_syntactic(x)
  x[needs_ticks] <- tick(x[needs_ticks])
  x
}
