#' @export
str.tbl_df <- function(object, ..., indent.str = " ", nest.lev = 0) {
  if (nest.lev != 0L) {
    cat(" ")
  }
  cat(
    tibble::obj_sum(object),
    " (S3: ",
    paste0(class(object), collapse = "/"),
    ")",
    "\n",
    sep = ""
  )

  utils::str(
    as.list(object),
    no.list = TRUE,
    ...,
    nest.lev = nest.lev + 1L,
    indent.str = indent.str
  )
}
