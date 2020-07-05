if (getRversion() < "3.3.0") {
  strrep <- function(x, times) {
    map_chr(
      times,
      function(n) paste(rep(x, n), collapse = "")
    )
  }
}
