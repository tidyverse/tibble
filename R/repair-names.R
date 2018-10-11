#' Repair the names of a vector
#'
#' @description
#' tibble deals with a few levels of name repair:
#'   * `minimal` names exist. The `names` attribute is not `NULL`. The name of
#'   an unnamed element is `""` and never `NA`.
#'   * `unique` names are `minimal`, have no duplicates, and are never empty
#'   (literally, no `""`s).
#'   * `syntactic` names are `unique` and syntactic (see Details for more).
#'
#' `syntactic` implies `unique`, `unique` implies `minimal`. These levels are
#' nested.
#'
#' The `.name_repair` argument of [tibble()] and [as_tibble()] refers to these
#' levels. Alternatively, the user can pass their own name repair function. It
#' should anticipate `minimal` names as input and should, likewise, return names
#' that are at least `minimal`.
#'
#' The "Life cycle" section explains the status of the existing functions
#' `tidy_names()`, `set_tidy_names()`, and `repair_names()`.
#'
#' @section `minimal` names:
#'
#' `minimal` names exist. The `names` attribute is not `NULL`. The name of an
#' unnamed element is `""` and never `NA`.
#'
#' `tbl_df` objects created by [tibble()] and [as_tibble()] have variable names
#' that are `minimal`, at the very least.
#' Why? General name repair can be be implemented more simply if the baseline
#' strategy ensures that `names(x)` returns a character vector of the correct
#' length.
#'
#' Examples:
#' ```
#' Original names of a vector with length 3: NULL
#'                            minimal names: "" "" ""
#'
#'                           Original names: "x" NA
#'                            minimal names: "x" ""
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
#' You usually want `unique` variable names in a data.frame, because they ensure
#' that any variable can be identified, uniquely, by its name. Indexing by name
#' works.
#'
#' There are many ways to make names `unique`. We append a suffix of the form
#' `..j` to any name that is `""` or a duplicate, where `j` is the position.
#' Why?
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
#'   unique names: "..1" "x..2" "..3" "y" "x..5"
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
#' `syntactic` names are `unique` and syntactic, meaning they:
#'   - Have no duplicates (inherited from `unique`).
#'   - Consist of letters, numbers, and the dot `.` or underscore `_`
#'     characters.
#'   - Start with a letter or start with the dot `.` not followed by a number.
#'   - Are not a reserved word, e.g., `if` or `function` or `TRUE`.
#'   - Are not `...`. Do not have the form `..i`, where `i` is a number.
#'
#' `syntactic` names are easy to use "as is" in code. They do not require
#' quoting and work well with nonstandard evaluation, such as list indexing via
#' `$` or in packages like dplyr and ggplot2.
#'
#' There are many ways to fix a non-syntactic name. Here's how our logic
#' compares to [base::make.names()] for a single name:
#'   - Same: Definition of what is syntactically valid.
#'   - Same: Invalid characters are replaced with `.`.
#'   - Different: We always fix a name by prepending a `.`. [base::make.names()]
#'     sometimes prefixes with `X` and at other times appends a `.`.
#'   - Different: We treat `NA` and `""` the same: both become `.`.
#'     [base::make.names()] turns `NA` in `"NA."` and `""` into `"X"`.
#'   - Different: We turn `...` into `....` and `..i` into `...i` (`i` is a
#'     number). [base::make.names()] does not modify `...` or `..i`, which could
#'     be regarded as a bug (?).
#'
#' Additionally, when dealing with the vector of names for a tibble, we choose
#' to implement `syntactic` names as an extension of `unique`, i.e. `syntactic`
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
#' \dontrun{
#' ## by default, duplicate names are not allowed
#' tibble(x = 1, x = 2)
#' }
#' ## you can authorize duplicate names
#' tibble(x = 1, x = 2, .name_repair = "minimal")
#' ## or request that the names be made unique
#' tibble(x = 1, x = 2, .name_repair = "unique")
#'
#' ## by default, non-syntactic names are allowed
#' df <- tibble(`a 1` = 1, `a 2` = 2)
#' ## because you can still index by name
#' df[["a 1"]]
#' df$`a 1`
#'
#' ## syntactic names are easier to work with, though, and you can request them
#' df <- tibble(`a 1` = 1, `a 2` = 2, .name_repair = "syntactic")
#' df$a.1
#'
#' ## you can specify your own name repair function
#' tibble(x = 1, x = 2, .name_repair = make.unique)
#'
#' fix_names <- function(x) gsub("%", " percent", x)
#' tibble(`25%` = 1, `75%` = 2, .name_repair = fix_names)
#'
#' fix_names <- function(x) gsub("\\s+", "_", x)
#' tibble(`year 1` = 1, `year 2` = 2, .name_repair = fix_names)
#'
#' ## the names attibute will be non-NULL, with "" as the default element
#' df <- as_tibble(list(1:3, letters[1:3]), .name_repair = "minimal")
#' names(df)
#' @name name-repair
NULL

set_repaired_names <- function(x,
                               .name_repair = c("check_unique", "unique", "syntactic", "minimal")) {
  x <- set_minimal_names(x)
  names(x) <- repaired_names(names(x), .name_repair = .name_repair)
  x
}

repaired_names <- function(name,
                           .name_repair = c("check_unique", "unique", "syntactic", "minimal")) {
  if (is_function(.name_repair)) {
    repair_fun <- .name_repair
  } else {
    if (!is.character(.name_repair)) {
      abort(error_name_repair_arg())
    }
    .name_repair <- match.arg(.name_repair)
    repair_fun <- switch(
      .name_repair,
      minimal       =     ,
      check_unique  = NULL,
      unique        = unique_names,
      syntactic     = syntactic_names,
      abort(error_name_repair_arg())
    )
  }
  new_name <- if (is_function(repair_fun)) repair_fun(name) else name

  if (is.character(.name_repair) &&
    .name_repair %in% c("check_unique", "unique", "syntactic")) {
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
  new_name <- strip_pos(new_name)

  needs_suffix <- duplicated(new_name) |
    duplicated(new_name, fromLast = TRUE) |
    new_name == ""
  new_name <- append_pos(new_name, needs_suffix)

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

syntactic_names <- function(name, quiet = FALSE) {
  new_name <- minimal_names(name)
  new_name <- strip_pos(new_name)

  empty_before <- new_name == ""
  new_name <- make_syntactic(new_name)
  new_name <- append_pos(new_name, needs_suffix = empty_before)

  duped_after <- duplicated(new_name) | duplicated(new_name, fromLast = TRUE)
  new_name <- append_pos(new_name, duped_after)

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

## makes each individual name syntactic
## does not enforce unique-ness
make_syntactic <- function(name) {
  name[is.na(name)] <- ""
  new_name <- make.names(name)

  X_prefix <- grepl("^X", new_name) & !grepl("^X", name)
  new_name[X_prefix] <- gsub("^X", "", new_name[X_prefix])

  dot_suffix <- nchar(new_name) == (nchar(name) + 1) &
    grepl("[.]$", new_name) & !grepl("[.]$", name)
  new_name[dot_suffix] <- gsub("[.]$", "", new_name[dot_suffix])
  new_name[dot_suffix] <- paste0(".", new_name[dot_suffix])
  ## illegal characters have been replaced with '.' via make.names()
  ## however, we have:
  ##   * declined its addition of 'X' prefixes
  ##   * turned its '.' suffixes to '.' prefixes

  ## ".i" --> "..i", so it's caught in next step
  new_name <- gsub("^([.][1-9][0-9]*)$", ".\\1", new_name)

  new_name <- gsub(
    "^(|[_].*|[.][.][.]|[.][.][1-9][0-9]*|[.][1-9].*)$",
    ".\\1",
    new_name
  )

  new_name
}

append_pos <- function(name, needs_suffix) {
  need_append_pos <- which(needs_suffix)
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

#' @section Life cycle:
#' `tidy_names()`, `set_tidy_names()`, and `repair_names()` were early efforts
#' to facilitate *post hoc* name repair in tibble, given that `tibble()` and
#' `as_tibble()` did not do this.
#'
#' From tibble v1.5.0, the `.name_repair` argument gives direct access to three
#' specific levels of name repair: `minimal`, `unique`, and `syntactic`. We
#' recommend that new code use this instead of `tidy_names()`,
#' `set_tidy_names()`, or `repair_names()`. After a period of use, the repair
#' stategies behind `minimal`, `unique`, and `syntactic` are likely to be
#' exposed in standalone functions and this could affect the behaviour of
#' `tidy_names()`. `repair_names()` should be considered deprecated.
#'
#' ```
#' tibble(..., `.name_repair = "unique"`)
#' ## is preferred to
#' df <- tibble(...)
#' set_tidy_names(df, syntactic = FALSE)
#'
#' tibble(..., `.name_repair = "syntactic"`)
#' ## is preferred to
#' df <- tibble(...)
#' set_tidy_names(df, syntactic = TRUE)
#' ```
#'
#' @param syntactic Should names be made syntactically valid? If `FALSE`, uses
#'   same logic as `.name_repair = "unique"`. If `TRUE`, uses same logic as
#'   `.name_repair = "syntactic"`.
#' @export
#' @rdname name-repair
tidy_names <- function(name, syntactic = FALSE, quiet = FALSE) {
  if (syntactic) {
    syntactic_names(name, quiet = quiet)
  } else {
    unique_names(name, quiet = quiet)
  }
}

#' @export
#' @rdname name-repair
set_tidy_names <- function(x, syntactic = FALSE, quiet = FALSE) {
  x <- set_minimal_names(x)
  new_names <- tidy_names(names(x), syntactic = syntactic, quiet = quiet)
  set_names(x, new_names)
}

#' @param prefix A string, the prefix to use for new column names.
#' @param sep A string inserted between the column name and de-duplicating
#'   number.
#' @export
#' @rdname name-repair
repair_names <- function(x, prefix = "V", sep = "") {
  ## TODO: plot a deprecation strategy once we deal with the fact that
  ## `dplyr::bind_cols()` calls this function

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
