#' Provide a succinct summary of an object
#'
#' `tbl_sum()` gives a brief textual description of a table-like object,
#' which should include the dimensions, the data source, and possible grouping
#' (for `dplyr`).  The default implementation forwards to [pillar::obj_sum()].
#' @seealso [pillar::type_sum()], [pillar::is_vector_s3()]
#' @param x Object to summarise
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
  paste0(format_dim, collapse = spaces_around(mult_sign()))
}

size_sum <- function(x) {
  if (!is_vector_s3(x)) return("")

  paste0(" [", dim_desc(x), "]")
}

#' @importFrom pillar obj_sum
#' @export
pillar::obj_sum

#' @importFrom pillar type_sum
#' @export
pillar::type_sum

#' @export
type_sum.tbl_df <- function(x) "tibble"

#' @importFrom pillar is_vector_s3
#' @export
pillar::is_vector_s3
