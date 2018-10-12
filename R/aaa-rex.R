rex <- function(...) {
  paste0(...)
}

group <- function(...) {
  paste0("(?:", ..., ")")
}

capture <- function(x) {
  paste0("(", x, ")")
}

or <- function(...) {
  paste0(map_chr(c(...), group), collapse = "|")
}

zero_or_more <- function(x) {
  paste0(group(x), "*")
}

escape <- function(x) {
  paste0("\\", x)
}

one_of <- function(...) {
  paste0("[", ..., "]")
}

range <- function(from, to) {
  one_of(paste0(from, "-", to))
}

any <- "."

nothing <- ""

anything <- zero_or_more(any)

start <- "^"

end <- "$"
