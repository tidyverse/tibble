NBSP <- "\U00A0"

wrap <- function(..., indent = 0, prefix = "", width) {
  x <- paste0(..., collapse = "")
  wrapped <- col_strwrap(x, indent, width - nchar_width(prefix))
  wrapped <- paste0(prefix, wrapped)
  wrapped <- gsub(NBSP, " ", wrapped)

  paste0(wrapped, collapse = "\n")
}

col_strwrap <- function(x, indent, width) {
  strwrap(
    x, indent = indent, exdent = indent + 2,
    width = max(width, 0)
  )
}
