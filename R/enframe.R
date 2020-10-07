#' Converting vectors to data frames, and vice versa
#'
#' @description
#' `r lifecycle::badge("maturing")`
#'
#' `enframe()` converts named atomic vectors or lists to two-column data frames.
#' For a list, the result will be a nested tibble with a column of type `list`.
#' For unnamed vectors, the natural sequence is used as name column.
#'
#' @param x
#'   For `enframe()`, a vector.
#'   For `deframe()`, a data frame with two columns.
#'   Passing a one-column data frame is deprecated, use `x[[1]]` instead.
#' @param name,value Names of the columns that store the names and values.
#'   Passing `NULL` is deprecated, use [as_tibble_col()] instead.
#'
#' @return
#'   For `enframe()`, a [tibble] with two columns.
#'   For `deframe()`, a named vector.
#' @export
#'
#' @examples
#' enframe(1:3)
#' enframe(c(a = 5, b = 7))
#' enframe(list(one = 1, two = 2:3, three = 4:6))
#' enframe(trees)
#' enframe(matrix(1:6, ncol = 2))
enframe <- function(x, name = "name", value = "value") {
  if (is.null(value)) {
    cnd_signal(error_enframe_value_null())
  }

  if (is_null(x)) {
    x <- logical()
  }

  if (!vec_is(x)) {
    cnd_signal(error_enframe_must_be_vector(x))
  }

  if (is.null(name)) {
    deprecate_warn("3.0.4", what = "tibble::enframe(name = 'can\\'t be NULL')",
      with = "as_tibble_col()")

    df <- list(vec_set_names(x, NULL))
  } else if (is.null(vec_names(x))) {
    df <- list(seq_len(vec_size(x)), x)
  } else {
    df <- list(vec_names2(x), vec_set_names(x, NULL))
  }

  names(df) <- c(name, value)
  new_tibble(df, nrow = vec_size(x))
}

#' @rdname enframe
#' @description
#' `deframe()` converts two-column data frames to a named vector or list,
#' using the first column as name and the second column as value.
#' @export
#' @examples
#' deframe(enframe(3:1))
#' deframe(tibble(a = 1:3))
#' deframe(tibble(a = as.list(1:3)))
deframe <- function(x) {
  if (length(x) == 1) {
    deprecate_soft("3.0.4", "tibble::deframe(x = 'can\\'t be a one-column data frame')",
      details = "Please use `x[[1]]` instead.")

    return(x[[1]])
  } else if (length(x) != 2) {
    warn("`x` must be a one- or two-column data frame in `deframe()`.")
  }

  value <- x[[2L]]
  name <- x[[1L]]
  vec_set_names(value, name)
}

# Errors ------------------------------------------------------------------

error_enframe_value_null <- function() {
  tibble_error("`value` can't be NULL.")
}

error_enframe_must_be_vector <- function(x) {
  tibble_error(paste0(
    "The `x` argument to `enframe()` must be a vector, not ", class(x)[[1]], "."
  ))
}
