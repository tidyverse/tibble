#' Converting atomic vectors to data frames, and vice versa
#'
#' `enframe()` converts named atomic vectors or lists to one- or two-column
#' data frames.
#' For unnamed vectors, the natural sequence is used as name column.
#'
#' @param x An atomic vector (for `enframe()`) or a data frame with one or two columns
#'   (for `deframe()`).
#' @param name,value Names of the columns that store the names and values.
#'   If `name` is `NULL`, a one-column tibble is returned; `value` cannot be `NULL`.
#'
#' @return A [tibble] with two columns (if `name` is not `NULL`, the default)
#'   or one column (otherwise).
#' @export
#'
#' @examples
#' enframe(1:3)
#' enframe(c(a = 5, b = 7))
enframe <- function(x, name = "name", value = "value") {
  if (is_null(value)) {
    abort(error_enframe_value_null())
  }

  if (is_null(x)) x <- logical()

  if (is_null(name)) {
    df <- list(unname(x))
  } else if (is_null(names(x))) {
    df <- list(seq_along(x), x)
  } else {
    df <- list(names(x), unname(x))
  }

  names(df) <- c(name, value)
  new_tibble(df, nrow = length(x))
}

#' @rdname enframe
#' @description
#' `deframe()` converts two-column data frames to a named vector or list,
#' using the first column as name and the second column as value.
#' If the input has only one column, an unnamed vector is returned.
#' @export
deframe <- function(x) {
  if (length(x) == 1) {
    return(x[[1]])
  } else if (length(x) != 2) {
    warn("The input to `deframe()` must be a one- or two-column data frame.")
  }

  value <- x[[2L]]
  name <- x[[1L]]
  names(value) <- name
  value
}
