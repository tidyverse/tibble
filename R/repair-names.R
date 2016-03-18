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
  blank <- xnames == ""

  # Ensure existing names are unique
  xnames[!blank] <- make.unique(xnames[!blank], sep = sep)

  # Replace blank names
  new_vars <- setdiff(paste(prefix, seq_along(x), sep = sep), xnames)
  xnames[blank] <- new_vars[seq_len(sum(blank))]

  names(x) <- xnames
  x
}

