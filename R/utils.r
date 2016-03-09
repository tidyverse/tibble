names2 <- function(x) {
  names(x) %||% rep("", length(x))
}

"%||%" <- function(x, y) {
  if(is.null(x)) y else x
}

# is.atomic() is TRUE for atomic vectors AND NULL!
is_atomic <- function(x) {
  is.atomic(x) && !is.null(x)
}

is_1d <- function(x) {
  # dimension check is for matrices and data.frames
  (is_atomic(x) || is.list(x)) && length(dim(x)) <= 1
}

needs_list_col <- function(x) {
  is.list(x) || length(x) != 1L
}

tibble_opt <- function(x, default) {
  getOption(paste0("tibble.", x)) %||%
  if (!is.null(res))
    return(res)

  res <- getOption(paste0("dplyr.", x))
  if (!is.null(res))
    return(res)

  default
}
