#' @export
Ops.tbl_df <- function(e1, e2 = NULL) {
  as_tibble(NextMethod())
}
