#' Check validity/format of a data.frame or tbl.
#'
#' Ensure the tbl or data.frame has legitimate and optionally unique
#' column names.
#' @param x tbl, tbl__df, or data.frame
#' @param unique logical (default \code{TRUE}), force column names to
#'     be unique (\code{TRUE}) or allow duplicates (\code{FALSE});
#'     ignored if \code{check.names} is \code{FALSE}
#' @return data.frame, with optionally different column names
#' @export
repair_names <- function(x, unique=TRUE) {
    col_names <- colnames(x)
    if (is.null(col_names)) {
        col_names <- rep('', ncol(x))
    }
    col_names <- make.names(col_names, unique=unique)
    colnames(x) <- col_names
    x
}
