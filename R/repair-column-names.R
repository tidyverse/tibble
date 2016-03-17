#' Check validity/format of a data.frame or tbl.
#'
#' Ensure the object (e.g., tbl, data.frame or list) has legitimate and unique
#' names without leading or trailing blanks.
#'
#' The function does not change any names that are correct already.
#'
#' @param x named object
#' @param prefix character, the prefix to use for new column names
#' @param sep character, a character string to separate the terms. Not
#'     \code{NA_character_}.
#' @return input with reparied names
#' @export
#' @examples
#' repair_names(list(3, 4, 5)) # works for lists, too
#' repair_names(mtcars) # a no-op
#' tbl <- as_data_frame(structure(list(3, 4, 5), class = "data.frame"))
#' repair_names(tbl)
repair_names <- function(x, prefix = "V", sep = "") {
  if (length(x) == 0)
    return(x)

  xnames <- init_names(x)
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

init_names <- function(x) {
  xnames <- names(x)
  if (is.null(xnames))
    rep("", length(x))
  else
    ifelse(is.na(xnames), "", trim_ws(xnames))
}
