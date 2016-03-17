#' Row names
#'
#' \code{has_rownames} checks if a data frame has row names.
#' @param df Input data frame
#' @export
#' @rdname rownames
#' @examples
#' has_rownames(mtcars)
#' has_rownames(iris)
has_rownames <- function(df) {
  stopifnot(is.data.frame(df))
  .row_names_info(df) > 0L
}

#' \code{remove_rownames} removes all row names.
#' @export
#' @rdname rownames
#' @examples
#' rownames(remove_rownames(mtcars))
remove_rownames <- function(df) {
  stopifnot(is.data.frame(df))
  rownames(df) <- NULL
  df
}

#' \code{rownames_to_column} convert row names to an explicit variable.
#'
#' @param var Name of variable to use
#' @export
#' @rdname rownames
#' @importFrom stats setNames
#' @examples
#' rownames_to_column(mtcars)
#'
#' mtcars_tbl <- rownames_to_column(tbl_df(mtcars))
#' mtcars_tbl
rownames_to_column <- function(df, var = "rowname") {
  stopifnot(is.data.frame(df))

  if (var %in% colnames(df))
    stop("There is a column named ", var, " already!", call. = FALSE)

  rn <- data_frame(rownames(df))
  names(rn) <- var

  attribs <- attributes(df)

  new_df <- c(rn, df)
  attribs[["names"]] <- names(new_df)

  attributes(new_df) <- attribs[names(attribs) != "row.names"]
  attr(new_df, "row.names") <- .set_row_names(nrow(df))
  new_df
}

#' \code{column_to_rownames} convert a column variable to row names. This is an
#' inverted operation of \code{rownames_to_column}.
#'
#' @rdname rownames
#' @export
#' @examples
#'
#' column_to_rownames(mtcars_tbl)
column_to_rownames <- function(df, var = "rowname") {
  stopifnot(is.data.frame(df))

  if (has_rownames(df))
    stop("This data frame already has row names.", call. = FALSE)

  if (!var %in% colnames(df))
    stop("This data frame has no column named ", var, ".", call. = FALSE)

  rownames(df) <- df[[var]]
  df[[var]] <- NULL
  df
}
