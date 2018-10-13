#' Constructor
#'
#' Creates a subclass of a tibble.
#' This function is mostly useful for package authors that implement subclasses
#' of a tibble, like \pkg{sf} or \pkg{tibbletime}.
#'
#' @param x A tibble-like object
#' @param ... Passed on to [structure()]
#' @param nrow The number of rows, required
#' @param subclass Subclasses to assign to the new object, default: none
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
  #' @details
  #' `x` must be a list.
  stopifnot(is.list(x))

  #' @details
  #' The `...` argument allows adding more attributes to the subclass.
  x <- update_tibble_attrs(x, ...)

  #' @details
  #' The `new_tibble()` constructor requires an `nrow` argument.
  if (is.null(nrow)) {
    abort(error_new_tibble_needs_nrow())
  }
  #' It makes sure that the `row.names` attribute
  #' is consistent with the data before returning.
  validate_nrow(names(x), col_lengths(x), nrow)

  new_valid_tibble(x, nrow, subclass)
}

#' @rdname new_tibble
#' @usage NULL
new_valid_tibble <- function(x, nrow, subclass = NULL) {
  #' @details
  #' `x` must have names (or be empty),
  #' but the names are not checked for correctness.
  if (length(x) == 0) names(x) <- character()
  check_minimal_names(x)

  #' @details
  #' 1d arrays are always converted to vectors.
  x[] <- map(x, strip_dim)

  #' @details
  #' The `row.names` attribute will be created from the `nrow` argument,
  #' overriding any existing attribute of this name in `x` or in the `...`
  #' arguments.
  attr(x, "row.names") <- .set_row_names(nrow)

  #' @details
  #' The `class` attribute of the returned object always consists of
  #' `c("tbl_df", "tbl", "data.frame")`. If the `subclass` argument is set,
  #' it will be prepended to that list of classes.
  set_tibble_class(x, subclass)
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

  # reduce2() is not in the purrr compat layer
  nested_attribs <- map2(names(attribs), attribs, function(name, value) set_names(list(value), name))
  x <- reduce(
    .init = x,
    nested_attribs,
    function(x, attr) {
      if (!is.null(attr[[1]])) {
        attr(x, names(attr)) <- attr[[1]]
      }
      x
    }
  )

  x
}

set_tibble_class <- function(x, subclass = NULL) {
  class(x) <- c(subclass, "tbl_df", "tbl", "data.frame")
  x
}
