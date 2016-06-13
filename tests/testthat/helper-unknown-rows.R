as_unknown_rows <- function(x) {
  x <- as_data_frame(x)
  class(x) <- c("unknown_rows", class(x))
  x
}

dim.unknown_rows <- function(x) {
  c(NA_integer_, length(x))
}

registerS3method("dim", "unknown_rows", dim.unknown_rows)

head.unknown_rows <- function(x, n) {
  head(as.data.frame(x), n)
}

registerS3method("head", "unknown_rows", head.unknown_rows)

type_sum.unknown_rows <- function(x) "unknown_rows"

registerS3method("type_sum", "unknown_rows", type_sum.unknown_rows)
