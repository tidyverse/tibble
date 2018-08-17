#' Constructor
#'
#' Creates a subclass of a tibble.
#' This function is mostly useful for package authors that implement subclasses
#' of a tibble, like \pkg{sf} or \pkg{tibbletime}.
#'
#' @param x A tibble-like object
#' @param ... Passed on to [structure()]
#' @param nrow The number of rows, guessed from the data by default
#' @param subclass Subclasses to assign to the new object, default: none
#' @export
#' @examples
#' new_tibble(list(a = 1:3, b = 4:6))
#'
#' # One particular situation where the nrow argument is essential:
#' new_tibble(list(), nrow = 150, subclass = "my_tibble")
#'
#' # It's safest to always pass it along:
#' new_tibble(list(a = 1:3, b = 4:6), nrow = 3)
#'
#' # All columns must be the same length:
#' try(new_tibble(list(a = 1:3, b = 4:5)))
#'
#' # The length must be consistent with the nrow argument if available:
#' try(new_tibble(list(a = 1:3, b = 4:6), nrow = 2))
new_tibble <- function(x, ..., nrow = NULL, subclass = NULL) {
  #' @details
  #' `x` must be a named (or empty) list, but the names are not currently
  #' checked for correctness.
  stopifnot(is.list(x))
  if (length(x) == 0) names(x) <- character()
  stopifnot(has_nonnull_names(x))

  #' @details
  #' The `...` argument allows adding more attributes to the subclass.
  x <- update_tibble_attrs(x, ...)

  #' @details
  #' The `row.names` attribute will be computed from the `nrow` argument,
  #' overriding any existing attribute of this name in `x` or in the `...`
  #' arguments.
  #' If `nrow` is `NULL`, the number of rows will be guessed from the data.
  if (is.null(nrow)) {
    guess <- guess_nrow(x)
    nrow <- guess$nrow
    nrow_set_method <- guess$method
  } else {
    nrow_set_method <- "`nrow`"
  }
  attr(x, "row.names") <- .set_row_names(nrow)
  #' The `new_tibble()` constructor makes sure that the `row.names` attribute
  #' is consistent with the data before returning.
  # Validate column lengths, don't recycle
  lengths <- map_int(x, NROW)
  bad_len <- which(lengths != nrow)
  if (has_length(bad_len)) {
    abort(error_inconsistent_cols(
      nrow, nrow_set_method, names(x)[bad_len], lengths[bad_len]
    ))
  }

  #' @details
  #' The `class` attribute of the returned object always consists of
  #' `c("tbl_df", "tbl", "data.frame")`. If the `subclass` argument is set,
  #' it will be prepended to that list of classes.
  set_tibble_class(x, subclass)
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

guess_nrow <- function(x) {
  if (!is.null(.row_names_info(x, 0L))) {
    list(nrow = .row_names_info(x, 2L), method = "row.names attribute")
  } else if (length(x) == 0) {
    list(nrow = 0L, method = "detected empty list")
  } else {
    col_lens <- map_int(x, NROW)
    longest_cols <- names(col_lens)[col_lens == max(col_lens)]
    list(nrow = max(map_int(x, NROW)),
         method = paste("the longest", pluralise("column(s)", longest_cols),
                        paste(tick(longest_cols), collapse = ",")))
  }
}

set_tibble_class <- function(x, subclass = NULL) {
  class(x) <- c(subclass, "tbl_df", "tbl", "data.frame")
  x
}
