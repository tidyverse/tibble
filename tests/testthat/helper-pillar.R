print_without_body <- function(x, ...) {
  if (utils::packageVersion("pillar") >= "1.4.99") {
    class(x) <- c("tbl_df_without_body", class(x))
    print(x, ...)
  } else {
    print_with_mocked_format_body(x, ...)
  }
}

if (utils::packageVersion("pillar") >= "1.4.99") {
  tbl_format_body.tbl_df_without_body <- function(x, ...) {
    "<body created by pillar>"
  }

  # Need explicit method, because can't be found in method env
  vctrs::s3_register(
    "pillar::tbl_format_body", "tbl_df_without_body",
    tbl_format_body.tbl_df_without_body
  )
}
