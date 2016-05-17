as_unknown_rows <- function(x) {
  x <- as_data_frame(x)
  class(x) <- c("unknown_rows", class(x))
  x
}

dim.unknown_rows <- function(x) {
  c(NA_integer_, length(x))
}

head.unknown_rows <- function(x, n) {
  head(as.data.frame(x), n)
}
