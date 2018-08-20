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
#' tbl <- as_tibble(structure(list(3, 4, 5), class = "data.frame"), .tidy_names = FALSE)
#' set_tidy_names(tbl)
#'
#' # Alternatively, use tidy_names() to assign the result manually:
#' new_names <- tidy_names(names(tbl))
#' rlang::set_names(tbl, new_names)
#'
#' # Optionally, names can be made syntactic:
#' tidy_names("a b", syntactic = TRUE)
#' @export
#' @rdname tidy_names
set_tidy_names <- function(x, syntactic = FALSE, quiet = FALSE) {
  new_names <- tidy_names(names2(x), syntactic, quiet)
  set_names(x, new_names)
}

#' @description
#' `tidy_names()` is the workhorse behind `set_tidy_names()`, it treats the
#' argument as a string to be used to name a data frame or a vector.
#' To make the rename information available to callers, call `tidy_names()`
#' and assign the result via [names()] or [rlang::set_names()].
#'
#' @param name A character vector representing names.
#' @export
tidy_names <- function(name, syntactic = FALSE, quiet = FALSE) {
  new_name <- na_to_empty(name)
  new_name <- make_syntactic(new_name, syntactic)
  new_name <- append_pos(new_name)

  if (!quiet) {
    describe_tidying(name, new_name)
  }

  new_name
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

describe_tidying <- function(orig_name, name) {
  stopifnot(length(orig_name) == length(name))

  new_names <- name != na_to_empty(orig_name)
  if (any(new_names)) {
    msg <- bullets(
      "New names:",
      paste0(tick_if_needed(orig_name[new_names]), " -> ", tick_if_needed(name[new_names])),
      .problem = ""
    )
    message(msg)
  }
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
