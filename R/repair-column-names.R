#' Check validity/format of a data.frame or tbl.
#'
#' Ensure the tbl or data.frame has legitimate and optionally unique
#' column names.
#' @param x tbl, tbl_df, or data.frame
#' @param prefix character, the prefix to use for new colum names
#' @param sep character, a character string to separate the terms. Not
#'     \code{NA_character_}.
#' @return data.frame with possibly-repaired column names
#' @export
repair_names <- function(x, prefix = "V", sep = "") {
  col_names <- colnames(x)
  col_names <-
    if (is.null(col_names)) {
      col_names <- rep('', ncol(x))
    } else {
      ifelse(is.na(col_names), '', col_names)
    }
  sub_names <- col_names[ col_names != '' ]
  sub_names <- make.unique(sub_names, sep = sep)
  col_names[ col_names != '' ] <- sub_names

  nmissing <- sum(col_names == '')
  new_names <- paste(prefix, 1:ceiling(1.5 * nmissing), sep = sep)
  new_names <- head(setdiff(new_names,
                            intersect(col_names, new_names)),
                    n = sum(col_names == ''))

  col_names[ col_names == '' ] <- new_names

  colnames(x) <- col_names
  x
}
