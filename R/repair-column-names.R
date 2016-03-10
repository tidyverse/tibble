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
  if (! isTRUE(length(x) > 0)) return(x)
  xnames <- names(x)
  xnames <-
    if (is.null(xnames)) {
      rep('', length(x))
    } else {
      ifelse(is.na(xnames) | grepl('^ +$', xnames), '', xnames)
    }
  blanks <- xnames == ''

  sub_names <- xnames[!blanks]
  sub_names <- make.unique(sub_names, sep = sep)
  xnames[!blanks] <- sub_names

  if (any(blanks)) {
    new_names <- paste(prefix, 1:length(x), sep = sep)
    new_names <- head(setdiff(new_names, xnames), n = sum(blanks))
    xnames[blanks] <- new_names
  }

  names(x) <- xnames
  x
}
