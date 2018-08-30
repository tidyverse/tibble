#' Repair the names of a vector
#'
#' @description
#' tibble deals with a few levels of name repair:
#'   * `minimal` names exist. The `names` attribute is not `NULL`. The name of
#'   an unnamed element is `""` and never `NA`. Enforced internally by
#'   [tibble()] and [as_tibble()], even when `.name_repair = "none"`, and there
#'   is no opt-out.
#'   * `unique` names are `minimal`, have no duplicates, and are never empty
#'   (literally, no `""`s).
#'   * `syntactic` names are `unique` and syntactic (see Details for more).
#'
#' `syntactic` implies `unique`, `unique` implies `minimal`.
#'
#' The `.name_repair` argument of [tibble()] and [as_tibble()] refers to these
#' levels. Alternatively, the user can pass their own name repair function. It
#' should anticipate `minimal` names as input and should, likewise, return names
#' that are at least `minimal`.
#'
#' @section `minimal` names:
#'
#' `minimal` names exist. The `names` attribute is not `NULL`. The name of an
#' unnamed element is `""` and never `NA`.
#'
#' `tbl_df` objects created by tibble will have variable names that are
#' `minimal`, at the very least, Why? General name repair can be be implemented
#' more simply if the baseline strategy ensures that `names(x)` returns a
#' character vector of the correct length.
#'
#' Examples:
#' ```
#' Original names of a vector with length 3: NULL
#'                          `minimal` names: "" "" ""
#'
#'                           Original names: "x" NA
#'                          `minimal` names: "x" ""
#' ```
#'
#' Related: [rlang::names2()] returns the names of an object, after making them
#' `minimal`.
#'
#' @section `unique` names:
#'
#' `unique` names are `minimal`, have no duplicates, and are never empty
#'  (literally, no `""`s).
#'
#' You usually want `unique` variable names in a tibble, because they ensure
#' that any variable can be identified, uniquely, by its name.
#'
#' There are many ways to make names `unique`. We do so by appending a suffix of
#' the form `..j` to any name that is `""` or a duplicate, where `j` is the
#' position. Why?
#' * An absolute position `j` is more helpful than numbering within the columns
#' that share a name. Context: troubleshooting data import with lots of columns
#' and dysfunctional names.
#' * We hypothesize that it's better have a "level playing field" when repairing
#' names, i.e. if `foo` appears twice, they both get repaired, not just the
#' second occurence.
#'
#' Example:
#' ```
#' Original names:    ""    "x"    "" "y"    "x"
#' `unique` names: "..1" "x..2" "..3" "y" "x..5"
#' ```
#'
#' Why would you ever want `minimal` names, instead of `unique` or `syntactic`
#' ones? Sometimes the first row of a data source -- allegedly variable names --
#' actually contains **data** and the resulting tibble will be reshaped with,
#' e.g., `tidyr::gather()`. In this case, it is better to not munge the names at
#' import.
#'
#' Pre-existing suffixes of the form `..j` are always stripped, prior to making
#' names `unique`, i.e. reconstructing the suffixes. If this interacts poorly
#' with your names, you should take control of name repair.
#'
#' @section `syntactic` names:
#'
#' `syntactic` names are `unique` and syntactic (quoting from [make.names()]),
#' meaning they:
#'   - Have no duplicates (inherited from `unique`).
#'   - Consist of letters, numbers, and the dot `.` or underscore `_`
#'     characters.
#'   - Start with a letter or the dot `.`, not followed by a number.
#'   - Not a reserved word.
#'
#' `syntactic` names are easy to use "as is" in code. They do not require
#' quoting and work well with nonstandard evaluation, such as list indexing via
#' `$` or in packages like dplyr and ggplot2.
#'
#' There are many ways to make names `syntactic`. For example, we choose to
#' define `syntactic` names as an extension of `unique`, i.e. `syntactic`
#' implies unique. Why? Because the need for syntactic names is strongly
#' associated with the need for uniqueness and this makes the name repair system
#' simpler.
#'
#' @param x A vector.
#' @param name A `names` attribute, usually a character vector.
#' @param quiet Whether to suppress messages about name repair.
#'
#' @return `x` with repaired names or a repaired version of `name`.
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
#' set_tidy_names(tbl)
#'
#' # Alternatively, use tidy_names() to assign the result manually:
#' new_names <- tidy_names(names(tbl))
#' rlang::set_names(tbl, new_names)
#'
#' # Optionally, names can be made syntactic:
#' tidy_names("a b")
#' @name name-repair
NULL

set_repaired_names <- function(x,
                               .name_repair = c("assert_unique", "unique", "syntactic", "none")) {
  x <- set_minimal_names(x)
  names(x) <- repaired_names(names(x), .name_repair = .name_repair)
  x
}

repaired_names <- function(name,
                           .name_repair = c("assert_unique", "unique", "syntactic", "none")) {
  if (is_function(.name_repair)) {
    repair_fun <- .name_repair
  } else {
    if (!is.character(.name_repair)) {
      abort(error_name_repair_arg())
    }
    .name_repair <- match.arg(.name_repair)
    repair_fun <- switch(
      .name_repair,
      none          =     ,
      assert_unique = NULL,
      unique        = unique_names,
      syntactic     = syntactic_names,
      abort(error_name_repair_arg())
    )
  }
  new_name <- if (is_function(repair_fun)) repair_fun(name) else name

  if (is.character(.name_repair) &&
    .name_repair %in% c("assert_unique", "unique", "syntactic")) {
    check_unique(new_name)
  } else {
    check_minimal(new_name)
  }
}

minimal_names <- function(name, n) {
  if (is.null(name) && missing(n)) {
    abort(error_name_length_required())
  }
  ## TODO: address scenarios where name is not NULL and n != length(name)?
  new_name <- name %||% rep_len("", n)
  new_name %|% ""
}

set_minimal_names <- function(x) {
  new_names <- minimal_names(names(x), n = length(x))
  set_names(x, new_names)
}

unique_names <- function(name, quiet = FALSE) {
  new_name <- minimal_names(name)
  new_name <- strip_pos(name)
  new_name <- append_pos(new_name)

  if (!quiet) {
    describe_repair(name, new_name)
  }

  new_name
}

set_unique_names <- function(x, quiet = FALSE) {
  x <- set_minimal_names(x)
  new_names <- unique_names(names(x), quiet = quiet)
  set_names(x, new_names)
}

## TODO: this is just a placeholder = near copy of tidy_names()
##       but may see more refactoring
syntactic_names <- function(name, quiet = FALSE) {
  new_name <- minimal_names(name)
  new_name <- strip_pos(name)
  new_name <- make_syntactic(new_name)
  new_name <- unique_names(new_name, quiet = TRUE)

  if (!quiet) {
    describe_repair(name, new_name)
  }

  new_name
}

set_syntactic_names <- function(x, quiet = FALSE) {
  x <- set_minimal_names(x)
  new_names <- syntactic_names(names(x), quiet = quiet)
  set_names(x, new_names)
}

check_minimal <- function(name) {
  if (is.null(name)) {
    abort(error_names_must_be_non_null())
  }

  bad_name <- which(is.na(name))
  if (has_length(bad_name)) {
    msg <- paste0(
      error_column_must_be_named(bad_name), "\n",
      "Use `.name_repair` to specify repair."
    )
    abort(msg)
  }

  invisible(name)
}

check_minimal_names <- function(x) {
  check_minimal(names(x))
  invisible(x)
}

check_unique <- function(name) {
  check_minimal(name)

  bad_name <- which(name == "")
  if (has_length(bad_name)) {
    msg <- paste0(
      error_column_must_be_named(bad_name), "\n",
      "Use `.name_repair` to specify a fix."
    )
    abort(msg)
  }

  dups <- which(duplicated(name))
  if (has_length(dups)) {
    msg <- paste0(
      error_column_names_must_be_unique(name[dups]), "\n",
      "Use `.name_repair` to specify a fix."
    )
    abort(msg)
  }

  invisible(name)
}

check_unique_names <- function(x) {
  check_unique(names(x))
  invisible(x)
}

make_syntactic <- function(name) {
  fix_syntactic <- (name != "") & !is_syntactic(name)
  name[fix_syntactic] <- make.names(name[fix_syntactic])
  name
}

## TODO: do we need checks around "syntactic"-ness?

append_pos <- function(name) {
  need_append_pos <- duplicated(name) |
    duplicated(name, fromLast = TRUE) |
    name == ""
  need_append_pos <- which(need_append_pos)
  name[need_append_pos] <- paste0(name[need_append_pos], "..", need_append_pos)
  name
}

strip_pos <- function(name) {
  rx <- "[.][.][1-9][0-9]*$"
  gsub(rx, "", name) %|% ""
}

describe_repair <- function(orig_name, name) {
  stopifnot(length(orig_name) == length(name))

  new_names <- name != minimal_names(orig_name)
  if (any(new_names)) {
    msg <- bullets(
      "New names:",
      paste0(
        tick_if_needed(orig_name[new_names]),
        " -> ",
        tick_if_needed(name[new_names])
      ),
      .problem = ""
    )
    message(msg)
  }
}

#' @description `tidy_names()` and `set_tidy_names()` ... WHAT I WANT TO SAY:
#'   they were our first pass as providing access to our name repair strategies,
#'   which we still want to do. That is, we'd like to export utilities around
#'   `minimal` and (our take on) `unique` and `syntactic` names. But ... not yet
#'   and probably not here. The old "tidy with `syntactic = FALSE`" is the new
#'   `unique` and the old "tidy with `syntactic = TRUE` is new `syntactic`.
#'
#' @param syntactic Should all names be made syntactically valid via
#'   [make.names()]?
#' @export
#' @rdname name-repair
tidy_names <- function(name, syntactic = FALSE, quiet = FALSE) {
  new_name <- minimal_names(name)
  new_name <- strip_pos(new_name)
  if (syntactic) {
    new_name <- make_syntactic(new_name)
  }
  new_name <- unique_names(new_name, quiet = TRUE)

  if (!quiet) {
    describe_repair(name, new_name)
  }

  new_name
}

#' @export
#' @rdname name-repair
set_tidy_names <- function(x, quiet = FALSE) {
  x <- set_minimal_names(x)
  new_names <- tidy_names(names(x), quiet = quiet)
  set_names(x, new_names)
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
# as_tibble(df, .name_repair = "unique")
repair_names <- function(x, prefix = "V", sep = "") {

  ## TODO: `dplyr::bind_cols()` calls this function, so this might just
  ## irritate people who have no way to switch over
  message("`tibble::repair_names()` is soft-deprecated. Please switch to `as_tibble() and specify `.name_repair`.")

  if (length(x) == 0) {
    names(x) <- character()
    return(x)
  }

  new_names <- make_unique(names2(x), prefix = prefix, sep = sep)
  set_names(x, new_names)
}

make_unique <- function(name, prefix = "V", sep = "") {
  blank <- name == ""

  # Ensure existing names are unique
  name[!blank] <- make.unique(name[!blank], sep = sep)

  # Replace blank names
  new_vars <- setdiff(paste(prefix, seq_along(name), sep = sep), name)
  name[blank] <- new_vars[seq_len(sum(blank))]

  name
}
