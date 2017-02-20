
has_dim <- function(x) {
  length(dim(x)) > 0L || is_named(x)
}

needs_dim <- function(x) {
  length(dim(x)) > 1L
}

set_class <- `class<-`

is_1d <- function(x) {
  # dimension check is for matrices and data.frames
  is_vector(x) && !needs_dim(x)
}

strip_dim <- function(x) {
  # Careful update only if necessary, to avoid copying which is checked by
  # the "copying" test in dplyr
  if (is_atomic(x) && has_dim(x)) {
    dim(x) <- NULL
  }
  x
}

needs_list_col <- function(x) {
  is_list(x) || length(x) != 1L
}

# Work around bug in R 3.3.0
safe_match <- function(x, table) {
  # nocov start
  if (getRversion() == "3.3.0") {
    match(x, table, incomparables = character())
  } else {
    match(x, table)
  }
  # nocov end
}

stopc <- function(...) {
  stop(..., call. = FALSE, domain = NA)
}

warningc <- function(...) {
  warning(..., call. = FALSE, domain = NA)
}

nchar_width <- function(x) {
  nchar(x, type = "width")
}

cat_line <- function(...) {
  cat(..., "\n", sep = "")
}

is_syntactic <- function(x) {
  ret <- make.names(x) == x
  ret[is.na(x)] <- FALSE
  ret
}

tickit <- function(x) {
  needs_ticks <- !is_syntactic(x)
  x[needs_ticks] <- paste0("`", gsub("`", "\\\\`", x[needs_ticks]), "`")
  x
}

warn_underscored <- function() {
  warn(paste(
    "The underscored versions are deprecated in favour of",
    "tidy evaluation idioms. Please see unquoting documentation",
    "in rlang."
  ))
}
warn_text_se <- function() {
  warn("Text parsing is deprecated, please supply an expression or formula")
}

compat_lazy_dots <- function(dots, env = caller_env()) {
  warn_underscored()

  warned <- FALSE
  compat_lazy <- function(lazy, env = caller_env()) {
    if (inherits(lazy, "lazy")) {
      new_tidy_quote(lazy$expr, lazy$env)
    } else if (is_string(lazy)) {
      if (!warned) {
        warn_text_se()
        warned <<- TRUE
      }
      parse_f(lazy, env)
    } else if (is_lang(lazy)) {
      new_tidy_quote(lazy, env)
    }
  }

  dots <- as.list(dots)
  map(dots, compat_lazy, env = env)
}
