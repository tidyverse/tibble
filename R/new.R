#' Tibble constructor and validator
#'
#' @description
#' \Sexpr[results=rd, stage=render]{tibble:::lifecycle("maturing")}
#'
#' Creates or validates a subclass of a tibble.
#' These function is mostly useful for package authors that implement subclasses
#' of a tibble, like \pkg{sf} or \pkg{tsibble}.
#'
#' `new_tibble()` creates a new object as a subclass of `tbl_df`, `tbl` and `data.frame`.
#' This function is optimized for performance, checks are reduced to a minimum.
#'
#' @param x A tibble-like object
#' @param ... Passed on to [structure()]
#' @param nrow The number of rows, required
#' @param class Subclasses to assign to the new object, default: none
#' @param subclass Deprecated, retained for compatibility. Please use the `class` argument.
#'
#' @seealso
#' [tibble()] and [as_tibble()] for ways to construct a tibble
#' with recycling of scalars and automatic name repair.
#'
#' @export
#' @examples
#' # The nrow argument is always required:
#' new_tibble(list(a = 1:3, b = 4:6), nrow = 3)
#'
#' # Existing row.names attributes are ignored:
#' try(new_tibble(iris, nrow = 3))
#'
#' # The length of all columns must be consistent with the nrow argument:
#' try(new_tibble(list(a = 1:3, b = 4:6), nrow = 2))
new_tibble <- function(x, ..., nrow, class = NULL, subclass = NULL) {
  # For compatibility with tibble < 2.0.0
  if (is.null(class)) {
    class <- subclass
  }

  #' @section Construction:
  #'
  #' For `new_tibble()`, `x` must be a list.
  x <- unclass(x)

  if (!is.list(x)) {
    stop(error_new_tibble_must_be_list())
  }

  #' The `...` argument allows adding more attributes to the subclass.
  x <- update_tibble_attrs(x, ...)

  #' An `nrow` argument is required.
  if (missing(nrow)) {
    if (length(x) >= 1) {
      signal_soft_deprecated(error_new_tibble_needs_nrow())
      nrow <- NROW(x[[1]])
    } else {
      abort(error_new_tibble_needs_nrow())
    }
  }
  #' This should be an integer of length 1,
  #' and every element of the list `x` should have [NROW()]
  #' equal to this value.
  #' (But this is not checked by the constructor).
  #' This takes the place of the "row.names" attribute in a data frame.
  if (!is_integerish(nrow, 1)) {
    abort(error_new_tibble_needs_nrow())
  }

  #' `x` must have names (or be empty),
  #' but the names are not checked for correctness.
  if (length(x) == 0) {
    # Leaving this because creating a named list of length zero seems difficult
    names(x) <- character()
  } else if (is.null(names(x))) {
    abort(error_names_must_be_non_null())
  }

  set_tibble_subclass(x, nrow, class)
}

#' @description
#' `validate_tibble()` checks a tibble for internal consistency.
#' Correct behavior can be guaranteed only if this function
#' runs without raising an error.
#'
#' @rdname new_tibble
#' @export
validate_tibble <- function(x) {
  #' @section Validation:
  #' `validate_tibble()` checks for "minimal" names
  check_minimal_names(x)

  #' and that all columns are vectors, data frames or matrices.
  check_valid_cols(x)

  #' It also makes sure that all columns have the same length,
  #' and that [NROW()] is consistent with the data.
  validate_nrow(names(x), col_lengths(x), NROW(x))

  #' 1d arrays are not supported.
  map(x, check_no_dim)

  x
}

col_lengths <- function(x) {
  map_int(x, NROW)
}

validate_nrow <- function(names, lengths, nrow) {
  # Validate column lengths, don't recycle
  bad_len <- which(lengths != nrow)
  if (has_length(bad_len)) {
    abort(error_inconsistent_cols(nrow, names, lengths, "`nrow` argument"))
  }
}

update_tibble_attrs <- function(x, ...) {
  # Can't use structure() here because it breaks the row.names attribute
  attribs <- list(...)
  if (has_length(attribs)) {
    attributes(x)[names(attribs)] <- attribs
  }

  x
}

tibble_class <- c("tbl_df", "tbl", "data.frame")

# Two dedicated functions for faster subsetting
set_tibble_class <- function(x, nrow) {
  attr(x, "row.names") <- .set_row_names(nrow)
  class(x) <- tibble_class
  x
}

set_tibble_subclass <- function(x, nrow, subclass) {
  attr(x, "row.names") <- .set_row_names(nrow)
  class(x) <- c(subclass, tibble_class)
  x
}
