#' Provide a succinct summary of an object
#'
#' `tbl_sum()` gives a brief textual description of a table-like object,
#' which should include the dimensions and the data source in the first element,
#' and additional information in the other elements (such as grouping for \pkg{dplyr}).
#' The default implementation forwards to [pillar::obj_sum()].
#'
#' This generic will be moved to \pkg{pillar}, and reexported from there
#' as soon as it becomes available.
#'
#' @return A named character vector, describing the dimensions in the first element
#'   and the data source in the name of the first element.
#'
#' @seealso [pillar::type_sum()]
#' @param x Object to summarise.
#' @export
# Can be overridden in .onLoad()
tbl_sum <- function(x) {
  UseMethod("tbl_sum", x)
}

# If needed, exported in .onLoad() via replace_if_pillar_has()
tbl_sum.default <- function(x) {
  c("Description" = obj_sum(x))
}

# If needed, exported in .onLoad() via replace_if_pillar_has()
tbl_sum.tbl <- function(x) {
  c("A data frame" = dim_desc(x))
}

# Must be registered in .onLoad() until pillar 1.5.0 is on CRAN
tbl_sum.tbl_df <- function(x) {
  c("A tibble" = dim_desc(x))
}

dim_desc <- function(x) {
  dim <- dim(x) %||% length(x)
  format_dim <- map_chr(dim, big_mark)
  paste0(format_dim, collapse = spaces_around(mult_sign()))
}

size_sum <- function(x) {
  if (!vec_is(x)) return("")

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
