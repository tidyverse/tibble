#' Add rows to a data frame
#'
#' This is a convenient way to add one or more rows of data to an existing data
#' frame. See \code{\link{nibble}} for an easy way to create an complete
#' data frame row-by-row.
#'
#' @param .data Data frame to append to.
#' @param ... Name-value pairs. If you don't supply the name of a variable,
#'   it'll be given the value \code{NA}.
#' @family addition
#' @examples
#' # add_row ---------------------------------
#' df <- tibble(x = 1:3, y = 3:1)
#'
#' add_row(df, x = 4, y = 0)
#'
#' # You can supply vectors, to add multiple rows (this isn't
#' # recommended because it's a bit hard to read)
#' add_row(df, x = 4:5, y = 0:-1)
#'
#' # Absent variables get missing values
#' add_row(df, x = 4)
#'
#' # You can't create new variables
#' \dontrun{
#' add_row(df, z = 10)
#' }
#' @export
add_row <- function(.data, ...) {
  df <- tibble(...)
  attr(df, "row.names") <- .set_row_names(max(1L, nrow(df)))

  extra_vars <- setdiff(names(df), names(.data))
  if (length(extra_vars) > 0) {
    stopc(
      "This row would add new variables: ", format_n(extra_vars)
    )
  }

  missing_vars <- setdiff(names(.data), names(df))
  df[missing_vars] <- NA
  df <- df[names(.data)]

  rbind(.data, df)
}

#' Add columns to a data frame
#'
#' This is a convenient way to add one or more columns to an existing data
#' frame.
#'
#' @param .data Data frame to append to.
#' @param ... Name-value pairs, all values must have one element for each row
#'   in the data frame, or be of length 1
#' @family addition
#' @examples
#' # add_row ---------------------------------
#' df <- tibble(x = 1:3, y = 3:1)
#'
#' add_column(df, z = -1:1, w = 0)
#'
#' # You can't overwrite existing columns
#' \dontrun{
#' add_column(df, x = 4:6)
#' }

#' # You can't create new observations
#' \dontrun{
#' add_column(df, z = 1:5)
#' }
#' @export
add_column <- function(.data, ...) {
  df <- tibble(...)

  if (ncol(df) == 0L) {
    return(.data)
  }

  if (nrow(df) != nrow(.data)) {
    stopc("Expected ", nrow(.data), " rows, got ", nrow(df))
  }

  extra_vars <- intersect(names(df), names(.data))
  if (length(extra_vars) > 0) {
    stopc(
      "Columns already in data frame: ", format_n(extra_vars)
    )
  }

  structure(cbind(.data, df), class = class(.data))
}
