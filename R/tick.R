# FIXME: Also exists in pillar, do we need to export?
tick <- function(x) {
  ifelse(is.na(x), "NA", encodeString(x, quote = "`"))
}

make_syntactic <- function(x) {
  vctrs:::make_syntactic(x)
}

is_syntactic <- function(x) {
  ret <- (make_syntactic(x) == x)
  ret[is.na(x)] <- FALSE
  ret
}

tick_if_needed <- function(x) {
  needs_ticks <- !is_syntactic(x)
  x[needs_ticks] <- tick(x[needs_ticks])
  x
}
