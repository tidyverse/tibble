#' Repair the names of a vector
#'
#' @description
#' \Sexpr[results=rd, stage=render]{tibble:::lifecycle("maturing")}
#'
#' tibble deals with a few levels of name repair:
#'   * `minimal` names exist. The `names` attribute is not `NULL`. The name of
#'     an unnamed element is `""` and never `NA`. Tibbles created by the tibble
#'     package have names that are, at least, `minimal`.
#'   * `unique` names are `minimal`, have no duplicates, and can be used where a variable name is expected.
#'     Empty names, and `...` or `..` followed by a sequence of digits are banned.
#'     - All columns can be accessed by name via `df[["name"]]` and `` df$`name` `` and ``with(df, `name`)``.
#'   * `universal` names are `unique` and syntactic (see Details for more).
#'     - Names work everywhere, without quoting: `df$name` and `with(df, name)` and
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
#' `unique` names are `minimal`, have no duplicates, and can be used (possibly with backticks)
#'  in contexts where a variable is expected. Empty names, and `...` or `..` followed by a
#'  sequence of digits are banned
#'  If a data frame has `unique` names, you can index it by name, and also access the columns
#'  by name.
#'  In particular, `df[["name"]]` and `` df$`name` `` and also ``with(df, `name`)`` always work.
#'
#' There are many ways to make names `unique`. We append a suffix of the form
#' `...j` to any name that is `""` or a duplicate, where `j` is the position.
#' We also change `..#` and `...` to `...#`.
#'
#' Example:
#' ```
#' Original names:     ""     "x"     "" "y"     "x"  "..2"  "..."
#'   unique names: "...1" "x...2" "...3" "y" "x...5" "...6" "...7"
#' ```
#'
#' Pre-existing suffixes of the form `...j` are always stripped, prior to making
#' names `unique`, i.e. reconstructing the suffixes. If this interacts poorly
#' with your names, you should take control of name repair.
#'
#' @section `universal` names:
#'
#' `universal` names are `unique` and syntactic, meaning they:
#'   * Are never empty (inherited from `unique`).
#'   * Have no duplicates (inherited from `unique`).
#'   * Are not `...`. Do not have the form `..i`, where `i` is a number (inherited from `unique`).
#'   * Consist of letters, numbers, and the dot `.` or underscore `_`
#'     characters.
#'   * Start with a letter or start with the dot `.` not followed by a number.
#'   * Are not a [reserved] word, e.g., `if` or `function` or `TRUE`.
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
#'  Original names:     ""     "x"    NA      "x"
#' universal names: "...1" "x...2" "...3" "x...4"
#'
#'   Original names: "(y)"  "_z"  ".2fa"  "FALSE"
#'  universal names: ".y." "._z" "..2fa" ".FALSE"
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

  dot_dot_name <- grep("^[.][.](?:[.]|[1-9][0-9]*)$", name)
  if (has_length(dot_dot_name)) {
    abort(error_column_must_not_be_dot_dot(dot_dot_name))
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
