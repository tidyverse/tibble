#' Repair the names of a vector
#'
#' @description
#' tibble deals with a few levels of name repair:
#'   * `minimal` names exist. The `names` attribute is not `NULL`. The name of
#'     an unnamed element is `""` and never `NA`. Tibbles created by the tibble
#'     package have names that are, at least, `minimal`.
#'   * `unique` names are `minimal`, have no duplicates, and are never empty
#'     (literally, no `""`s).
#'     - All columns can be accessed by name via `df[["name"]]`.
#'   * `universal` names are `unique` and syntactic (see Details for more).
#'     - Names work everywhere, without quoting: `df$name` and
#'     `lm(name1 ~ name2, data = df)` and `dplyr::select(df, name)` all work.
#'
#' `universal` implies `unique`, `unique` implies `minimal`. These levels are
#' nested.
#'
#' The `.name_repair` argument of [tibble()] and [as_tibble()] refers to these
#' levels. Alternatively, the user can pass their own name repair function. It
#' should anticipate `minimal` names as input and should, likewise, return names
#' that are at least `minimal`.
#'
#' The existing functions [tidy_names()], [set_tidy_names()],
#' and [repair_names()] are soft-deprecated.
#'
#' @section `minimal` names:
#'
#' `minimal` names exist. The `names` attribute is not `NULL`. The name of an
#' unnamed element is `""` and never `NA`.
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
#' Request `.name_repair = "minimal"` to suppress almost all name munging. This
#' is useful when the first row of a data source -- allegedly variable names --
#' actually contains *data* and the resulting tibble is destined for reshaping
#' with, e.g., `tidyr::gather()`.
#'
#' @section `unique` names:
#'
#' `unique` names are `minimal`, have no duplicates, and are never empty
#'  (literally, no `""`s). If a data frame has `unique` names, you can index it
#'  by name, e.g., `df[["name"]]` works.
#'
#' There are many ways to make names `unique`. We append a suffix of the form
#' `..j` to any name that is `""` or a duplicate, where `j` is the position.
#'
#' Example:
#' ```
#' Original names:    ""    "x"    "" "y"    "x"
#'   unique names: "..1" "x..2" "..3" "y" "x..5"
#' ```
#'
#' Pre-existing suffixes of the form `..j` are always stripped, prior to making
#' names `unique`, i.e. reconstructing the suffixes. If this interacts poorly
#' with your names, you should take control of name repair.
#'
#' @section `universal` names:
#'
#' `universal` names are `unique` and syntactic, meaning they:
#'   * Are never empty (inherited from `unique`).
#'   * Have no duplicates (inherited from `unique`).
#'   * Consist of letters, numbers, and the dot `.` or underscore `_`
#'     characters.
#'   * Start with a letter or start with the dot `.` not followed by a number.
#'   * Are not a [reserved] word, e.g., `if` or `function` or `TRUE`.
#'   * Are not `...`. Do not have the form `..i`, where `i` is a number.
#'
#' If a data frame has `universal` names, variable names can be used "as is" in
#' code. They work well with nonstandard evaluation, e.g., `df$name` works.
#'
#' Tibble has a different method of making names syntactic than
#' [base::make.names()]. In general, tibble prepends one or more dots `.` until
#' the name is syntactic.
#'
#' Examples:
#' ```
#'  Original names:     ""    "x"    NA     "x"
#' universal names: "...1" "x..2" "...3" "x..4"
#'
#'   Original names: "(y)"  "_z"  ".2fa"  "FALSE"  "..."  "..3"
#'  universal names: ".y." "._z" "..2fa" ".FALSE" "...." "...6"
#' ```
#'
#' @seealso
#' [rlang::names2()] returns the names of an object, after making them
#'   `minimal`.
#'
#'
#' The [Names attribute](https://principles.tidyverse.org/names-attribute.html)
#' section in the "tidyverse package development principles".
#'
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
#' df <- tibble(`a 1` = 1, `a 2` = 2, .name_repair = "universal")
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
#' ## purrr-style anonymous functions and constants
#' ## are also supported
#' tibble(x = 1, x = 2, .name_repair = ~ make.names(., unique = TRUE))
#'
#' tibble(x = 1, x = 2, .name_repair = ~ c("a", "b"))
#'
#' ## the names attibute will be non-NULL, with "" as the default element
#' df <- as_tibble(list(1:3, letters[1:3]), .name_repair = "minimal")
#' names(df)
#' @name name-repair
NULL

set_repaired_names <- function(x,
                               .name_repair = c("check_unique", "unique", "universal", "minimal")) {
  x <- set_minimal_names(x)
  set_names(x, repaired_names(names(x), .name_repair = .name_repair))
}

repaired_names <- function(name,
                           .name_repair = c("check_unique", "unique", "universal", "minimal")) {

  if (is_formula(.name_repair, lhs = FALSE)) {
    .name_repair <- as_function(.name_repair)
  }

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
      universal     = universal_names,
      abort(error_name_repair_arg())
    )
  }
  new_name <- if (is_function(repair_fun)) repair_fun(name) else name

  if (is.character(.name_repair) &&
    .name_repair %in% c("check_unique", "unique", "universal")) {
    check_unique(new_name)
  } else {
    check_minimal(new_name)
  }

  new_name
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

unique_names <- function(name, quiet = FALSE, transform = identity) {
  min_name <- minimal_names(name)
  naked_name <- strip_pos(min_name)
  naked_is_empty <- (naked_name == "")

  new_name <- transform(naked_name)

  new_name <- append_pos(new_name, needs_suffix = naked_is_empty)

  duped_after <- duplicated(new_name) | duplicated(new_name, fromLast = TRUE)
  new_name <- append_pos(new_name, duped_after)

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

universal_names <- function(name, quiet = FALSE) {
  unique_names(name, quiet = quiet, transform = make_syntactic)
}

set_universal_names <- function(x, quiet = FALSE) {
  x <- set_minimal_names(x)
  new_names <- universal_names(names(x), quiet = quiet)
  set_names(x, new_names)
}

check_names_non_null <- function(name, abort = rlang::abort) {
  if (is.null(name)) {
    abort(error_names_must_be_non_null())
  }
  invisible(name)
}

check_names_non_na <- function(name, abort = rlang::abort) {
  bad_name <- which(is.na(name))
  if (has_length(bad_name)) {
    abort(error_column_must_be_named(bad_name))
  }

  invisible(name)
}

check_minimal <- function(name) {
  check_names_non_null(name)
  check_names_non_na(name)
}

check_minimal_names <- function(x) {
  check_minimal(names(x))
  invisible(x)
}

check_unique <- function(name) {
  check_minimal(name)

  bad_name <- which(name == "")
  if (has_length(bad_name)) {
    abort(error_column_must_be_named(bad_name))
  }

  dups <- which(duplicated(name))
  if (has_length(dups)) {
    abort(error_column_names_must_be_unique(name[dups]))
  }

  invisible(name)
}

check_unique_names <- function(x) {
  check_unique(names(x))
  invisible(x)
}

check_syntactic <- function(name) {
  check_minimal(name)
  check_unique(name)

  bad_name <- !is_syntactic(name)
  if (has_length(bad_name)) {
    abort(error_column_names_must_be_syntactic(name[bad_name]))
  }

  invisible(name)
}

check_syntactic_names <- function(x) {
  check_syntactic(names(x))
  invisible(x)
}

## makes each individual name syntactic
## does not enforce unique-ness
make_syntactic <- function(name) {
  name[is.na(name)]       <- ""
  name[name == ""]        <- "."
  name[name == "..."]     <- "...."
  name <- sub("^_", "._", name)

  new_name <- make.names(name)

  X_prefix <- grepl("^X", new_name) & !grepl("^X", name)
  new_name[X_prefix] <- sub("^X", "", new_name[X_prefix])

  dot_suffix <- which(new_name == paste0(name, "."))
  new_name[dot_suffix] <- sub("^(.*)[.]$", ".\\1", new_name[dot_suffix])
  ## illegal characters have been replaced with '.' via make.names()
  ## however, we have:
  ##   * declined its addition of 'X' prefixes
  ##   * turned its '.' suffixes to '.' prefixes

  regex <- paste0(
    "^(?<leading_dots>[.]{0,2})",
    "(?<numbers>[0-9]*)",
    "(?<leftovers>[^0-9]?.*$)"
  )

  re <- re_match(new_name, pattern = regex)
  needs_dots <- which(re$numbers != "")
  needs_third_dot <- (re$leftovers[needs_dots] == "")
  re$leading_dots[needs_dots] <- ifelse(needs_third_dot, "...", "..")
  new_name <- paste0(re$leading_dots, re$numbers, re$leftovers)

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

#' Retired functions for name repair
#'
#' @description
#' \Sexpr[results=rd, stage=render]{tibble:::lifecycle("soft-deprecated")}
#'
#' @description
#' `tidy_names()`, `set_tidy_names()`, and `repair_names()` were early efforts
#' to facilitate *post hoc* name repair in tibble, given that [tibble()] and
#' [as_tibble()] did not do this.
#'
#' From tibble v2.0.0, the `.name_repair` argument gives direct access to three
#' specific levels of name repair: `minimal`, `unique`, and `universal`. We
#' recommend that new code use this instead of `tidy_names()`,
#' `set_tidy_names()`, or `repair_names()`. After a period of use, the repair
#' stategies behind `minimal`, `unique`, and `universal` are likely to be
#' exposed in standalone functions and this could affect the behaviour of
#' `tidy_names()`. `repair_names()` should be considered deprecated.
#'
#' ```
#' tibble(..., `.name_repair = "unique"`)
#' ## is preferred to
#' df <- tibble(...)
#' set_tidy_names(df, syntactic = FALSE)
#'
#' tibble(..., `.name_repair = "universal"`)
#' ## is preferred to
#' df <- tibble(...)
#' set_tidy_names(df, syntactic = TRUE)
#' ```
#'
#' @param x A vector.
#' @param name A `names` attribute, usually a character vector.
#' @param syntactic Should names be made syntactically valid? If `FALSE`, uses
#'   same logic as `.name_repair = "unique"`. If `TRUE`, uses same logic as
#'   `.name_repair = "universal"`.
#' @param quiet Whether to suppress messages about name repair.
#'
#' @return `x` with repaired names or a repaired version of `name`.
#'
#' @export
#' @rdname name-repair-retired
#' @keywords internal
tidy_names <- function(name, syntactic = FALSE, quiet = FALSE) {
  # Local functions to preserve behavior in v1.4.2
  is_syntactic <- function(x) {
    ret <- make.names(x) == x
    ret[is.na(x)] <- FALSE
    ret
  }

  make_syntactic <- function(name, syntactic) {
    if (!syntactic) return(name)

    blank <- name == ""
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

  describe_tidying <- function(orig_name, name, quiet) {
    stopifnot(length(orig_name) == length(name))
    if (quiet) return()
    new_names <- name != orig_name
    if (any(new_names)) {
      message(
        "New names:\n",
        paste0(orig_name[new_names], " -> ", name[new_names], collapse = "\n")
      )
    }
  }

  name[is.na(name)] <- ""
  orig_name <- name

  name <- make_syntactic(name, syntactic)
  name <- append_pos(name)

  describe_tidying(orig_name, name, quiet)
  name
}

#' @export
#' @rdname name-repair-retired
set_tidy_names <- function(x, syntactic = FALSE, quiet = FALSE) {
  x <- set_minimal_names(x)
  new_names <- tidy_names(names(x), syntactic = syntactic, quiet = quiet)
  set_names(x, new_names)
}

#' @param prefix A string, the prefix to use for new column names.
#' @param sep A string inserted between the column name and de-duplicating
#'   number.
#' @export
#' @rdname name-repair-retired
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
  blank <- (name == "")

  # Ensure existing names are unique
  name[!blank] <- make.unique(name[!blank], sep = sep)

  # Replace blank names
  new_vars <- setdiff(paste(prefix, seq_along(name), sep = sep), name)
  name[blank] <- new_vars[seq_len(sum(blank))]

  name
}
