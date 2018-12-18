.onLoad <- function(libname, pkgname) {
  if (getRversion() == "3.3.0") {
    safe_match <<- safe_match_3_0
  } else {
    safe_match <<- safe_match_default
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
