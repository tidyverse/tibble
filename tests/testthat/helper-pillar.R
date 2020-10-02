if (packageVersion("pillar") >= "1.4.99") {
  tbl_format_body.tbl_df_without_body <- function(x, ...) {
    "<body created by pillar>"
  }

  vctrs::s3_register("pillar::tbl_format_body", "tbl_df_without_body")
}
