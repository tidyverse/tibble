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

tibble_opt <- function(x) {
  x_tibble <- paste0("tibble.", x)
  res <- getOption(x_tibble)
  if (!is.null(res))
    return(res)

  x_dplyr <- paste0("dplyr.", x)
  res <- getOption(x_dplyr)
  if (!is.null(res))
    return(res)

  op.tibble[[x_tibble]]
}
