#' @importFrom pillar tbl_sum
#' @export
pillar::tbl_sum

#' @export
tbl_sum.tbl_df <- function(x) {
  c("A tibble" = dim_desc(x))
}

dim_desc <- function(x) {
  dim <- dim(x) %||% length(x)
  format_dim <- map_chr(dim, big_mark)
  paste0(format_dim, collapse = spaces_around(mult_sign()))
}

#' @importFrom pillar obj_sum
#' @export
pillar::obj_sum

#' @importFrom pillar type_sum
#' @export
pillar::type_sum

#' @importFrom pillar size_sum
#' @export
pillar::size_sum

#' @export
vec_ptype_abbr.tbl_df <- function(x, ...) {
  abbr <- class(x)[[1]]
  if (abbr == "tbl_df") {
    abbr <- "tibble"
  }
  abbr
}
