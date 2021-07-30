name_or_pos <- function(names, positions) {
  empty <- (names == "")
  names[!empty] <- tick(names[!empty])
  names[empty] <- positions[empty]
  names
}

# FIXME: Also exists in pillar, do we need to export?
tick <- function(x) {
  ifelse(is.na(x), "NA", encodeString(x, quote = "`"))
}

tick_if_needed <- function(x) {
  needs_ticks <- !is_syntactic(x)
  x[needs_ticks] <- tick(x[needs_ticks])
  x
}

is_syntactic <- function(x) {
  ret <- rep_along(x, FALSE)
  valid <- which(!is.na(x))
  ret[valid] <- is_syntactic_impl(x[valid])
  ret
}

is_syntactic_impl <- function(x) {
  unchanged_after_repair <- (x == make.names(x))
  # https://r.789695.n4.nabble.com/Dots-are-not-fixed-by-make-names-td4752920.html
  dot_dot_dot_or_numbers <- grepl("^(?:(?:[.][.][.])|(?:[.][.][0-9]+))$", x)

  unchanged_after_repair & !dot_dot_dot_or_numbers
}
