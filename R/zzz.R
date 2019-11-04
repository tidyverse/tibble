.onLoad <- function(libname, pkgname) {
  if (getRversion() == "3.3.0") {
    safe_match <<- safe_match_3_0
  } else {
    safe_match <<- safe_match_default
  }

  vctrs::s3_register("vctrs::vec_proxy", "rematch_records")
  vctrs::s3_register("vctrs::vec_proxy", "rematch_allrecords")
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
