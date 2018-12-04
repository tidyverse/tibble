.onLoad <- function(libname, pkgname) {
  if (getRversion() == "3.3.0") {
    safe_match <<- safe_match_3_0
  }
}

safe_match_3_0 <- function(x, table) {
  # nocov start
  match(x, table, incomparables = character())
  # nocov end
}
