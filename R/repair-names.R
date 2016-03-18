#' Repair object names.
#'
#' \code{repair_names} ensures its input has non-missing and
#' unique names (duplicated names get a numeric suffix). Valid names are
#' left as is.
#'
#' @param x A named vector.
#' @param prefix A string, the prefix to use for new column names.
#' @param sep A string inserted between the column name and de-duplicating
#'    number.
#' @return \code{x} with valid names.
#' @export
#' @examples
#' repair_names(list(3, 4, 5)) # works for lists, too
#' repair_names(mtcars) # a no-op
#' tbl <- as_data_frame(structure(list(3, 4, 5), class = "data.frame"))
#' repair_names(tbl)
repair_names <- function(x, prefix = "V", sep = "") {
  if (length(x) == 0)
    return(x)

  xnames <- names2(x)
  blanks <- xnames == ""

  # The order vector defines the order in which make.unique() should process the
  # entries.  Blanks are initialized with the prefix. The index of the first
  # blank entry appears twice in this vector if there's no column named like the
  # prefix, to make sure that blank columns always start with V1 (or a higher
  # index if appropriate).  See also the "pathological cases" test.
  order <- c(
    which(!blanks),
    if (all(xnames[!blanks] != prefix) && any(blanks))
      which.max(blanks),
    which(blanks))
  xnames[blanks] <- prefix
  xnames[order] <- make.unique(xnames[order], sep = sep)

  names(x) <- xnames
  x
}

