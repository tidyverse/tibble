
has_dim <- function(x) {
  length(dim(x)) > 0L || has_nonnull_names(x)
}

needs_dim <- function(x) {
  length(dim(x)) > 1L
}

has_null_names <- function(x) {
  is.null(names(x))
}

has_nonnull_names <- function(x) {
  !has_null_names(x)
}

set_class <- `class<-`

check_no_dim <- function(x) {
  if (is_atomic(x) && has_dim(x)) {
    abort(error_1d_array_column())
  }
  invisible(x)
}

strip_dim <- function(x) {
  if (is.matrix(x)) {
    rownames(x) <- NULL
  } else if (is.data.frame(x)) {
    x <- remove_rownames(x)
    x[] <- map(x, strip_dim)
  } else if (is_atomic(x) && has_dim(x)) {
    # Careful update only if necessary, to avoid copying which is checked by
    # the "copying" test in dplyr
    dim(x) <- NULL
  }
  x
}

needs_list_col <- function(x) {
  is_list(x) || length(x) != 1L
}

# Work around bug in R 3.3.0
# Can be ressigned during loading (#544)
safe_match <- match


warningc <- function(...) {
  warn(paste0(...))
}

nchar_width <- function(x) {
  nchar(x, type = "width")
}

cat_line <- function(...) {
  cat(paste0(..., "\n"), sep = "")
}

# FIXME: Also exists in pillar, do we need to export?
tick <- function(x) {
  ifelse(is.na(x), "NA", encodeString(x, quote = "`"))
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

## from rematch2, except we don't add tbl_df or tbl classes to the return value
re_match <- function(text, pattern, perl = TRUE, ...) {

  stopifnot(is.character(pattern), length(pattern) == 1, !is.na(pattern))
  text <- as.character(text)

  match <- regexpr(pattern, text, perl = perl, ...)

  start  <- as.vector(match)
  length <- attr(match, "match.length")
  end    <- start + length - 1L

  matchstr <- substring(text, start, end)
  matchstr[ start == -1 ] <- NA_character_

  res <- data.frame(
    stringsAsFactors = FALSE,
    .text = text,
    .match = matchstr
  )

  if (!is.null(attr(match, "capture.start"))) {

    gstart  <- attr(match, "capture.start")
    glength <- attr(match, "capture.length")
    gend    <- gstart + glength - 1L

    groupstr <- substring(text, gstart, gend)
    groupstr[ gstart == -1 ] <- NA_character_
    dim(groupstr) <- dim(gstart)

    res <- cbind(groupstr, res, stringsAsFactors = FALSE)
  }

  names(res) <- c(attr(match, "capture.names"), ".text", ".match")
  res
}
