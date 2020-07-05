NBSP <- "\U00A0"

wrap <- function(..., indent = 0, prefix = "", width) {
  x <- paste0(..., collapse = "")
  wrapped <- strwrap2(x, width - nchar_width(prefix), indent)
  wrapped <- paste0(prefix, wrapped)
  wrapped <- gsub(NBSP, " ", wrapped)

  paste0(wrapped, collapse = "\n")
}

strwrap2 <- function(x, width, indent) {
  col_strwrap(x, width = max(width, 0), indent = indent, exdent = indent + 2)
}

make_color_aware <- function(fun) {
  nchar <- function(x, ...) pillar::get_extent(x)
  nchar

  environment(fun) <- environment()
  fun
}

col_strwrap <- make_color_aware(strwrap)
