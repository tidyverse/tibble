.onLoad <- function(libname, pkgname) {
  if (getRversion() == "3.3.0") {
    safe_match <<- safe_match_3_0
  } else {
    safe_match <<- safe_match_default
  }

  replace_if_pillar_has(glimpse)
  replace_if_pillar_has(tbl_sum)
  register_if_pillar_hasnt(
    glimpse.default, glimpse.data.frame, glimpse.tbl,
    tbl_sum.default, tbl_sum.tbl, format.tbl, print.tbl
  )

  if (utils::packageVersion("pillar") >= "1.4.99") {
    vctrs::s3_register("pillar::tbl_sum", "tbl_df")
  }
}

safe_match_3_0 <- function(x, table) {
  # nocov start
  match(x, table, incomparables = character())
  # nocov end
}

safe_match_default <- function(x, table) {
  # nocov start
  match(x, table)
  # nocov end
}
