print_without_body <- function(x, ...) {
  class(x) <- c("tbl_df_without_body", class(x))
  print(x, ...)
}

tbl_format_body.tbl_df_without_body <- function(x, ...) {
  "<body created by pillar>"
}

# Need explicit method because can't be found in method env
vctrs::s3_register(
  "pillar::tbl_format_body", "tbl_df_without_body",
  tbl_format_body.tbl_df_without_body
)
