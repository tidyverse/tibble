.onLoad <- function(libname, pkgname) {
  if (getRversion() == "3.3.0") {
    safe_match <<- safe_match_3_0
  } else {
    safe_match <<- safe_match_default
  }

  replace_if_pillar_has(glimpse)
  register_if_pillar_hasnt(glimpse.default, glimpse.data.frame, glimpse.tbl)
  replace_if_pillar_has(tbl_sum)
  register_if_pillar_hasnt(tbl_sum.default, tbl_sum.tbl)
  register_if_pillar_hasnt(format.tbl)
  register_if_pillar_hasnt(print.tbl)
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
