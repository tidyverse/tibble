#' Superseded functions for name repair
#'
#' @description
#' `r lifecycle::badge("superseded")`
#'
#' @description
#' `tidy_names()`, `set_tidy_names()`, and `repair_names()` were early efforts
#' to facilitate *post hoc* name repair in tibble, given that [tibble()] and
#' [as_tibble()] did not do this.
#'
#' From tibble v2.0.0, the `.name_repair` argument gives direct access to three
#' specific levels of name repair: `minimal`, `unique`, and `universal`.
#' See [vctrs::vec_as_names()] for the implementation of the underlying logic.
#'
#' @section Life cycle:
#'
#' These functions are superseded. The `repair_names()` logic
#' will also remain available in [vctrs::vec_as_names_legacy()].
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
#' @name name-repair-superseded
#' @aliases name-repair-retired
#' @keywords internal
tidy_names <- function(name, syntactic = FALSE, quiet = FALSE) {
  # Local functions to preserve behavior in v1.4.2
  is_syntactic <- function(x) {
    ret <- make.names(x) == x
    ret[is.na(x)] <- FALSE
    ret
  }

  make_syntactic <- function(name, syntactic) {
    if (!syntactic) {
      return(name)
    }

    blank <- name == ""
    fix_syntactic <- (name != "") & !is_syntactic(name)
    name[fix_syntactic] <- make.names(name[fix_syntactic])
    name
  }

  append_pos <- function(name) {
    need_append_pos <- duplicated(name) |
      duplicated(name, fromLast = TRUE) |
      name == ""
    if (any(need_append_pos)) {
      rx <- "[.][.][1-9][0-9]*$"
      has_suffix <- grepl(rx, name)
      name[has_suffix] <- gsub(rx, "", name[has_suffix])
      need_append_pos <- need_append_pos | has_suffix
    }

    need_append_pos <- which(need_append_pos)
    name[need_append_pos] <- paste0(
      name[need_append_pos],
      "..",
      need_append_pos
    )
    name
  }

  describe_tidying <- function(orig_name, name, quiet) {
    stopifnot(length(orig_name) == length(name))
    if (quiet) {
      return()
    }
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
#' @rdname name-repair-superseded
set_tidy_names <- function(x, syntactic = FALSE, quiet = FALSE) {
  x <- set_repaired_names(x, repair_hint = FALSE, "minimal", quiet = TRUE)
  new_names <- tidy_names(names(x), syntactic = syntactic, quiet = quiet)
  set_names(x, new_names)
}

#' @param prefix A string, the prefix to use for new column names.
#' @param sep A string inserted between the column name and de-duplicating
#'   number.
#' @export
#' @rdname name-repair-superseded
repair_names <- function(x, prefix = "V", sep = "") {
  if (length(x) == 0) {
    names(x) <- character()
    return(x)
  }

  new_names <- vec_as_names_legacy(names2(x), prefix = prefix, sep = sep)
  set_names(x, new_names)
}
