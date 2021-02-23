# nocov start
.onLoad <- function(libname, pkgname) {
  if (getRversion() == "3.3.0") {
    safe_match <<- safe_match_3_0
  } else {
    safe_match <<- safe_match_default
  }

  # Simplify once pillar 1.5.0 is on CRAN
  register_if_pillar_hasnt(c(
    "format.tbl", "print.tbl"
  ))
}

safe_match_3_0 <- function(x, table) {
  match(x, table, incomparables = character())
}

safe_match_default <- function(x, table) {
  match(x, table)
}
# nocov end
