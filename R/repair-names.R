#' Repair object names
#'
#' `set_tidy_names()` ensures its input has non-missing and
#' unique names (duplicated names get a suffix of the format `..#`
#' where `#` is the position in the vector).
#' Valid names are left unchanged, with the exception that existing suffixes
#' are reorganized.
#' @param x A named vector.
#' @param syntactic Should all names be made syntactically valid via [make.names()]?
#' @param quiet If `TRUE` suppresses output from this function
#' @return `x` with valid names.
#' @examples
#' # Works for lists and vectors, too:
#' set_tidy_names(3:5)
#' set_tidy_names(list(3, 4, 5))
#'
#' # Clean data frames are left unchanged:
#' set_tidy_names(mtcars)
#'
#' # By default, all rename operations are printed to the console:
#' tbl <- as_tibble(structure(list(3, 4, 5), class = "data.frame"),
#'                  validate = FALSE)
#' set_tidy_names(tbl)
#'
#' # Optionally, names can be made syntactic:
#' tidy_names("a b", syntactic = TRUE)
#' @export
#' @rdname tidy_names
set_tidy_names <- function(x, syntactic = FALSE, quiet = FALSE) {
  repair_info <- tidy_names(names2(x), syntactic, quiet)
  x <- set_names(x, repair_info)
  attr(x, "repair_info") <- repair_info
  x
}

#' @description
#' `tidy_names()` is the workhorse behind `set_tidy_names()`, it treats the
#' argument as a string to be used to name a data frame or a vector.
#' @param name A character vector representing names.
#' @export
tidy_names <- function(name, syntactic = FALSE, quiet = FALSE) {
  new_name <- na_to_empty(name)
  new_name <- make_syntactic(new_name, syntactic)
  new_name <- append_pos(new_name)

  new_repair_info(name, new_name)
}

na_to_empty <- function(x) {
  x[is.na(x)] <- ""
  x
}

make_syntactic <- function(name, syntactic) {
  if (!syntactic) return(name)

  fix_syntactic <- (name != "") & !is_syntactic(name)
  name[fix_syntactic] <- make.names(name[fix_syntactic])
  name
}

append_pos <- function(name) {
  need_append_pos <- duplicated(name) | duplicated(name, fromLast = TRUE) | name == ""
  if (any(need_append_pos)) {
    rx <- "[.][.][1-9][0-9]*$"
    has_suffix <- grepl(rx, name)
    name[has_suffix] <- gsub(rx, "", name[has_suffix])
    need_append_pos <- need_append_pos | has_suffix
  }

  need_append_pos <- which(need_append_pos)
  name[need_append_pos] <- paste0(name[need_append_pos], "..", need_append_pos)
  name
}

new_repair_info <- function(orig_name, name) {
  info <- set_names(name, orig_name)
  structure(info, class = "tibble_repair_info")
}

#' @export
print.tibble_repair_info <- function(x, ..., n = 6, full = FALSE) {
  cat(format(x, ..., n = n, full = full), sep = "\n")
  invisible(x)
}

#' @export
format.tibble_repair_info <- function(x, ..., n = 6, full = FALSE) {
  changed <- is.na(names(x)) | names(x) != x
  if (full) {
    report <- rep_along(changed, TRUE)
  } else {
    report <- changed
  }

  report <- which(report)
  if (length(report) > n) {
    arrows <- report[seq_len(n - 1)]
  } else {
    arrows <- report
  }

  if (length(report) == 0) {
    return(pluralise(paste0("<", length(x), " name(s) unchanged>"), x))
  }

  ret <- paste0(tick_if_needed(names(x)[arrows]), " -> ", tick_if_needed(x[arrows]))
  missing <- length(report) - length(arrows)
  if (missing > 0) {
    ret <- c(ret, paste0(cli::symbol$ellipsis, " and ", missing, " more"))
  }
  ret
}

#' @rdname tidy_names
#' @description
#' `repair_names()` is an older version with different renaming heuristics,
#' kept for backward compatibility.  New code should prefer `tidy_names()`.
#'
#' @param prefix A string, the prefix to use for new column names.
#' @param sep A string inserted between the column name and de-duplicating
#'    number.
#' @export
repair_names <- function(x, prefix = "V", sep = "") {
  if (length(x) == 0) {
    names(x) <- character()
    return(x)
  }

  new_names <- make_unique(names2(x), prefix = prefix, sep = sep)
  set_names(x, new_names)
}

make_unique <- function(x, prefix = "V", sep = "") {
  blank <- x == ""

  # Ensure existing names are unique
  x[!blank] <- make.unique(x[!blank], sep = sep)

  # Replace blank names
  new_vars <- setdiff(paste(prefix, seq_along(x), sep = sep), x)
  x[blank] <- new_vars[seq_len(sum(blank))]

  x
}
