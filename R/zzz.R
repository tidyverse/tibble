# nocov start
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
}

safe_match_3_0 <- function(x, table) {
  match(x, table, incomparables = character())
}

safe_match_default <- function(x, table) {
  match(x, table)
}
# nocov end
