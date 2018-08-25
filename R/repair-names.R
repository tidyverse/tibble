#' Repair the names of a vector
#'
#' @description
#' tibble implements several, increasing levels of name repair for vectors
#' (TODO: re-visit all this thinking about tibble's support for lists and not
#' just tibbles):
#'   * `minimal` names exist, i.e. the `names` attribute is not `NULL`.
#'   Accomplished by setting all names to `""`. Enforced internally by
#'   [tibble()] and [as_tibble()] and there is no opt-out. The objective is to
#'   produce a substrate of the correct length for other name repair strategies.
#'   TODO: decide if this should include replacing `NA` names with `""`
#'   * `valid` names contain no empty names (no `NA`s, no `""`s) and no
#'   duplicate names. Accomplished by appending a suffix of the form `..j` where
#'   `j` is the position. The objective is to ensure that any variable in a
#'   data.frame can be identified, uniquely, by its name.
#'   * `tidy` names are `valid` and also fulfill these criteria laid out in
#'   [make.names()]:
#'     - Consist of letters, numbers and the dot or underline characters and
#'     starts with a letter or the dot not followed by a number.
#'     - Not a reserved word.
#'
#'   The objective is to produce variable names that users can handle in the
#'   "usual" way, e.g. that do not require backticks. TODO: highlight how
#'   munging differs from `make.names()`, i.e. uses conventions more consistent
#'   with `valid_names()` and the tidyverse. TODO: something about suffix
#'   reorganization.
#'   * Functions that offer a `.name_repair` argument accept a user-supplied
#'   function for name repair.
#'
#' All `tidy` names are `valid`, all `valid` names are `minimal`.
#'
#' For each LEVEL in ("minimal", "valid", "tidy"), there is a family of utility
#' functions:
#'   * `LEVEL_names()` repairs a vector of names
#'   * `set_LEVEL_names()` repairs the names of the input
#'   * `check_LEVEL()` checks a vector of names
#'   * `check_LEVEL_names()` checks the names of the input
#'
#' Each family has 2 * 2 = 4 functions, for all combinations of "repairs vs.
#' checks" and "works on names vs. on named vector".
#'
#' @param x A vector.
#' @param name A `names` attribute, usually a character vector.
#' @param quiet Whether to suppress messages about name repair.
#'
#' @return `x` with repaired names.
#' @examples
#' # Works for lists and vectors, too:
#' set_tidy_names(3:5)
#' set_tidy_names(list(3, 4, 5))
#'
#' # Clean data frames are left unchanged:
#' set_tidy_names(mtcars)
#'
#' # By default, all rename operations are printed to the console:
#' tbl <- as_tibble(structure(list(3, 4, 5), class = "data.frame"), .name_repair = "none")
#' set_valid_names(tbl)
#'
#' # Alternatively, use valid_names() to assign the result manually:
#' new_names <- valid_names(names(tbl))
#' rlang::set_names(tbl, new_names)
#'
#' # Optionally, names can be made syntactic:
#' tidy_names("a b")
#' @name name-repair
NULL

#' @export
#' @rdname name-repair
rationalize_names <- function(x, .name_repair) {
  .name_repair <- .name_repair %||% "none_passive"

  x <- set_minimal_names(x)

  if (is_function(.name_repair)) {
    repair_fun <- .name_repair
  } else {
    repair_fun <- switch(
      .name_repair,
      none         = ,
      none_passive = identity,
      valid        = valid_names,
      tidy         = tidy_names,
      abort(error_name_repair_arg())
    )
  }
  names(x) <- repair_fun(names(x))
  if (is.character(.name_repair) &&
      .name_repair %in% c("none_passive", "valid", "tidy")) {
    check_valid_names(x)
  }
  ## TODO: check minimal names?
  x
}

#' @param n Specifies output length; consulted only when `name` is `NULL`.
#' @export
#' @rdname name-repair
minimal_names <- function(name, n) {
  if (is.null(name) && missing(n)) {
    error_name_length_required()
  }
  ## TODO: address scenarios where name is not NULL and n != length(name)?
  ## TODO: replace NAs with "" here?
  name %||% rep_len("", n)
}

#' @export
#' @rdname name-repair
valid_names <- function(name, quiet = FALSE) {
  check_minimal(name)
  new_name <- name %|% ""
  new_name <- append_pos(new_name)

  if (!quiet) {
    describe_tidying(name, new_name)
  }

  new_name
}

#' @export
#' @rdname name-repair
tidy_names <- function(name, quiet = FALSE) {
  new_name <- valid_names(name, quiet = TRUE)
  new_name <- make_syntactic(new_name)
  new_name <- append_pos(new_name)

  if (!quiet) {
    describe_tidying(name, new_name)
  }

  new_name
}

#' @export
#' @rdname name-repair
set_minimal_names <- function(x) {
  new_names <- minimal_names(names(x), n = length(x))
  set_names(x, new_names)
}

#' @export
#' @rdname name-repair
set_valid_names <- function(x, quiet = FALSE) {
  x <- set_minimal_names(x)
  new_names <- valid_names(names(x), quiet = quiet)
  set_names(x, new_names)
}

#' @export
#' @rdname name-repair
set_tidy_names <- function(x, quiet = FALSE) {
  x <- set_minimal_names(x)
  new_names <- tidy_names(names(x), quiet = quiet)
  set_names(x, new_names)
}

#' @export
#' @rdname name-repair
check_minimal <- function(name) {
  if (is.null(name)) {
    abort(error_names_must_be_non_null())
  }
  invisible(name)
}

#' @export
#' @rdname name-repair
check_minimal_names <- function(x) {
  check_minimal(names(x))
  invisible(x)
}

#' @export
#' @rdname name-repair
check_valid <- function(name) {
  check_minimal(name)

  bad_name <- which(is.na(name) | name == "")
  if (has_length(bad_name)) {
    abort(error_column_must_be_named(bad_name))
  }

  dups <- which(duplicated(name))
  if (has_length(dups)) {
    abort(error_column_must_have_unique_name(name[dups]))
  }

  invisible(name)
}

#' @export
#' @rdname name-repair
check_valid_names <- function(x) {
  check_valid(names(x))
  invisible(x)
}


na_to_empty <- function(x) {
  x[is.na(x)] <- ""
  x
}

make_syntactic <- function(name) {
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

#' @rdname name-repair
#' @description `repair_names()` is an older function with different renaming
#'   heuristics and is being deprecated. In new code, use `as_tibble()` and
#'   specify a `.name_repair` strategy.
#'
#' @param prefix A string, the prefix to use for new column names.
#' @param sep A string inserted between the column name and de-duplicating
#'   number.
#' @export
# for possible inclusion in NEWS or blog post
# library(tibble)
# df <- setNames(tibble(1, 2), c("x", "x"))
# df
# repair_names(df)
# as_tibble(df, .name_repair = "valid")
repair_names <- function(x, prefix = "V", sep = "") {

  ## TODO: confront the fact that `dplyr::bind_cols()` calls this function
  message("`repair_names()` is soft-deprecated. Please switch to `as_tibble() and specify `.name_repair`.")

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
