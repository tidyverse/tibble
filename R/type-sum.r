#' Provide a succinct summary of an object
#'
#' `tbl_sum()` gives a brief textual description of a table-like object,
#' which should include the dimensions, the data source, and possible grouping
#' (for `dplyr`).  The default implementation forwards to [colformat::obj_sum()].
#' @seealso [colformat::type_sum()], [colformat::is_vector_s3()]
#' @export
tbl_sum <- function(x) UseMethod("tbl_sum", x)

#' @export
tbl_sum.default <- function(x) obj_sum(x)

#' @export
tbl_sum.tbl <- function(x) {
  c("A tibble" = dim_desc(x))
}

dim_desc <- function(x) {
  dim <- dim(x) %||% length(x)
  format_dim <- map_chr(dim, big_mark)
  format_dim[is.na(dim)] <- "??"
  paste0(format_dim, collapse = spaces_around(mult_sign()))
}

size_sum <- function(x) {
  if (!is_vector_s3(x)) return("")

  paste0(" [", dim_desc(x), "]" )
}

#' @importFrom colformat obj_sum
#' @export
colformat::obj_sum

#' @importFrom colformat type_sum
#' @export
colformat::type_sum

#' @importFrom colformat is_vector_s3
#' @export
colformat::is_vector_s3
