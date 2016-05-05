#' Converting atomic vectors to data frames
#'
#' A helper function that converts named atomic vectors or lists to two-column
#' data frames.
#' For unnamed vectors, the natural sequence is used as name column.
#'
#' @param x An atomic vector
#' @param name,value Names of the columns that store the names and values
#'
#' @return A \code{\link{data_frame}}
#' @export
#'
#' @examples
#' enframe(1:3)
#' enframe(c(a = 5, b = 7))
enframe <- function(x, name = "name", value = "value") {
  if (is.null(names(x))) {
    df <- data_frame(seq_along(x), x)
  } else {
    df <- data_frame(names(x), unname(x))
  }
  names(df) <- c(name, value)
  df
}
