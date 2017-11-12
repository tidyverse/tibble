#' Constructor
#'
#' Creates a subclass of a tibble.
#'
#' @param x A tibble-like object
#' @param nrow The number of rows, guessed from the data by default
#' @param subclass Subclasses to assign to the new object, default: none
#' @export
new_tibble <- function(x, nrow = NULL, subclass = NULL) {
  stopifnot(is.list(x))
  stopifnot(is_named(x))

  x <- set_tibble_class(x, subclass = subclass)
  if (is.null(nrow)) nrow <- guess_nrow(x)
  attr(x, "row.names") <- .set_row_names(nrow)
  validate_nrow(x)
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

set_tibble_class <- function(x, subclass = NULL) {
  class(x) <- c(subclass, "tbl_df", "tbl", "data.frame")
  x
}
