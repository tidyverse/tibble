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

col_strwrap <- function(x, width, indent, exdent) {
  space_rx <- "[[:space:]]+"
  words <- crayon::col_strsplit(x, space_rx, perl = TRUE)[[1L]]
  words_bw <- strsplit(crayon::strip_style(x), space_rx, perl = TRUE)[[1L]]
  stopifnot(length(words) == length(words_bw))

  # strrep() requires R 3.3.0
  dots <- strrep(".", nchar_width(words_bw))

  wrapped_dots <- strwrap(
    paste(dots, collapse = " "),
    width = width,
    indent = indent,
    exdent = exdent,
    prefix = "",
    simplify = TRUE,
    initial = ""
  )
  wrapped_dots_string <- paste(wrapped_dots, collapse = "\n")

  space <- strsplit(wrapped_dots_string, "[.]+")[[1L]]
  wrapped_styled_string <- paste0(c("", words), c(space, ""), collapse = "")
  strsplit(wrapped_styled_string, "\n", fixed = TRUE)[[1L]]
}
