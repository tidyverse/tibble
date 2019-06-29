
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

strip_names <- function(x) {
  vctrs:::set_names2(x, NULL)
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

is_rstudio <- function() {
  !is.na(Sys.getenv("RSTUDIO", unset = NA))
}
