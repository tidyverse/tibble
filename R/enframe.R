#' Converting vectors to data frames, and vice versa
#'
#' @description
#' `enframe()` converts named atomic vectors or lists to one- or two-column
#' data frames.
#' For a list, the result will be a nested tibble with a column of type `list`.
#' For unnamed vectors, the natural sequence is used as name column.
#'
#' @param x A vector (for `enframe()`) or a data frame with one or two columns
#'   (for `deframe()`).
#' @param name,value Names of the columns that store the names and values.
#'   If `name` is `NULL`, a one-column tibble is returned; `value` cannot be `NULL`.
#'
#' @return For `enframe()`, a [tibble] with two columns (if `name` is not `NULL`, the default)
#'   or one column (otherwise).
#' @export
#'
#' @examples
#' enframe(1:3)
#' enframe(c(a = 5, b = 7))
#' enframe(list(one = 1, two = 2:3, three = 4:6))
enframe <- function(x, name = "name", value = "value") {
  if (is.null(value)) {
    abort_enframe_value_null()
  }

  if (is.null(x)) {
    x <- logical()
  }

  # FIXME: Enable again for data frames, add test
  if (!vec_is(x) || is.data.frame(x)) {
    abort_enframe_must_be_vector(x)
  }

  if (is.null(name)) {
    df <- list(vectbl_set_names(x))
  } else if (is.null(vec_names(x))) {
    df <- list(seq_len(vec_size(x)), x)
  } else {
    df <- list(vec_names2(x), vectbl_set_names(x))
  }

  names(df) <- c(name, value)
  new_tibble(df, nrow = vec_size(x))
}

#' @rdname enframe
#' @description
#' `deframe()` converts two-column data frames to a named vector or list,
#' using the first column as name and the second column as value.
#' If the input has only one column, an unnamed vector is returned.
#' @return For `deframe()`, a vector (named or unnamed).
#' @export
#' @examples
#' deframe(enframe(3:1))
#' deframe(tibble(a = 1:3))
#' deframe(tibble(a = as.list(1:3)))
deframe <- function(x) {
  if (length(x) == 1) {
    return(x[[1]])
  } else if (length(x) != 2) {
    warn("`x` must be a one- or two-column data frame in `deframe()`.")
  }

  value <- x[[2L]]
  name <- x[[1L]]
  vectbl_set_names(value, as.character(name))
}

abort_enframe_value_null <- function() {
  tibble_abort("`value` can't be NULL.")
}

abort_enframe_must_be_vector <- function(x) {
  tibble_abort(paste0(
    "The `x` argument to `enframe()` must be a vector, not ", class(x)[[1]], "."
  ))
}
