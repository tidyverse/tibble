#' Check validity/format of a data.frame or tbl.
#'
#' Ensure the tbl or data.frame has legitimate and optionally unique
#' column names.
#' @param x tbl, tbl_df, or data.frame
#' @param prefix character, the prefix to use for new column names
#' @param sep character, a character string to separate the terms. Not
#'     \code{NA_character_}.
#' @return data.frame with possibly-repaired column names
#' @export
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
    ifelse(is.na(xnames), "", trimws(xnames))
}
