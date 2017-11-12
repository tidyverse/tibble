#' Constructor
#'
#' Creates a subclass of a tibble.
#'
#' @param x A tibble-like object
#' @param ... Passed on to [structure()]
#' @param nrow The number of rows, guessed from the data by default
#' @param subclass Subclasses to assign to the new object, default: none
#' @export
new_tibble <- function(x, ..., nrow = NULL, subclass = NULL) {
  stopifnot(is.list(x))
  stopifnot(has_nonnull_names(x))

  x <- update_tibble_attrs(x, ...)
  x <- set_tibble_class(x, subclass = subclass)
  # Make sure that we override any row names that
  # may have been there previously, in x or in ...
  if (is.null(nrow)) nrow <- guess_nrow(x)
  attr(x, "row.names") <- .set_row_names(nrow)
  validate_nrow(x)
  x
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

guess_nrow <- function(x) {
  if (!is.null(.row_names_info(x, 0L))) .row_names_info(x, 2L)
  else if (length(x) == 0) 0L
  else NROW(x[[1L]])
}

validate_nrow <- function(x) {
  # Validate column lengths, don't recycle
  lengths <- map_int(x, NROW)
  first <- .row_names_info(x, 2L)

  bad_len <- lengths != first
  if (any(bad_len)) {
    invalid_df_msg(
      paste0("must be length ", first, ", not "), x, bad_len, lengths[bad_len]
    )
  }

  invisible(x)
}
