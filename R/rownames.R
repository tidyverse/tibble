#' Tools for working with row names
#'
#' Generally, it is best to avoid row names, because they are basically a
#' character column with different semantics to every other column. These
#' functions allow to you detect if a data frame has row names
#' (\code{has_rownames}), remove them (\code{remove_rownames}), or convert
#' them back-and-forth between an explicit column (\code{rownames_to_column},
#' and \code{column_to_rownames}).
#'
#' @param df A data frame
#' @param var Name of column to use for rownames.
#' @examples
#' has_rownames(mtcars)
#' has_rownames(iris)
#' has_rownames(remove_rownames(mtcars))
#'
#' head(rownames_to_column(mtcars))
#'
#' mtcars_tbl <- rownames_to_column(tbl_df(mtcars))
#' mtcars_tbl
#' column_to_rownames(mtcars_tbl)
#' @name rownames
NULL


#' @export
#' @rdname rownames
has_rownames <- function(df) {
  stopifnot(is.data.frame(df))
  .row_names_info(df) > 0L
}

#' @export
#' @rdname rownames
remove_rownames <- function(df) {
  stopifnot(is.data.frame(df))
  rownames(df) <- NULL
  df
}

#' @export
#' @rdname rownames
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

#' @rdname rownames
#' @export
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
