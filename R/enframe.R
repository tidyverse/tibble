#' Converting atomic vectors to data frames, and vice versa
#'
#' `enframe()` converts named atomic vectors or lists to two-column
#' data frames.
#' For unnamed vectors, the natural sequence is used as name column.
#'
#' @param x An atomic vector (for `enframe()`) or a data frame (for `deframe()`)
#' @param name,value Names of the columns that store the names and values
#'
#' @return A [tibble]
#' @export
#'
#' @examples
#' enframe(1:3)
#' enframe(c(a = 5, b = 7))
enframe <- function(x, name = "name", value = "value") {
  if (is.null(x)) x <- logical()
  if (is_null(names(x))) {
    df <- list(seq_along(x), x)
  } else {
    df <- list(names(x), unname(x))
  }
  names(df) <- c(name, value)
  new_tibble(df)
}

#' @rdname enframe
#' @description
#' `deframe()` converts two-column data frames to a named vector or list,
#' using the first column as name and the second column as value.
#' @export
deframe <- function(x) {
  value <- x[[2L]]
  name <- x[[1L]]
  names(value) <- name
  value
}
