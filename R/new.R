#' Constructor and validator
#'
#' @description
#' Creates or validates a subclass of a tibble.
#' These function is mostly useful for package authors that implement subclasses
#' of a tibble, like \pkg{sf} or \pkg{tibbletime}.
#'
#' `new_tibble()` creates a new object as a subclass of `tbl_df`, `tbl` and `data.frame`.
#' This function is optimized for performance, checks are reduced to a minimum.
#'
#' @param x A tibble-like object
#' @param ... Passed on to [structure()]
#' @param nrow The number of rows, required
#' @param subclass Subclasses to assign to the new object, default: none
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
new_tibble <- function(x, ..., nrow = NULL, subclass = NULL) {
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
  if (is.null(nrow)) {
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

  set_tibble_class(x, nrow, subclass)
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
  #' and that the `row.names` attribute is consistent with the data.
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

set_tibble_class <- function(x, nrow, subclass = NULL) {
  attr(x, "row.names") <- .set_row_names(nrow)
  class(x) <- c(subclass, "tbl_df", "tbl", "data.frame")
  x
}
