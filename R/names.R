vectbl_names2 <- function(x,
                          .name_repair = c("check_unique", "unique", "universal", "minimal"),
                          quiet = FALSE,
                          call = my_caller_env()) {
  name <- vec_names2(x, repair = "minimal", quiet = quiet)
  repaired_names(name, repair_hint = TRUE, .name_repair = .name_repair, quiet = quiet, call = call)
}

set_repaired_names <- function(x,
                               repair_hint,
                               .name_repair = c("check_unique", "unique", "universal", "minimal"),
                               quiet = FALSE,
                               call = my_caller_env()) {
  names <- repaired_names(names2(x), repair_hint, .name_repair = .name_repair, quiet = quiet, call = call)
  set_names(x, names)
}

repaired_names <- function(name,
                           repair_hint,
                           .name_repair = c("check_unique", "unique", "universal", "minimal"),
                           quiet = FALSE,
                           details = NULL,
                           call = caller_env()) {
  subclass_name_repair_errors(
    name = name, details = details, repair_hint = repair_hint,
    vec_as_names(name, repair = .name_repair, quiet = quiet || !is_character(.name_repair)),
    call = call
  )
}

# Errors ------------------------------------------------------------------

abort_column_names_cannot_be_empty <- function(names, repair_hint, details = NULL, parent = NULL, call = caller_env()) {
  tibble_abort(invalid_df("must be named", names, use_repair(repair_hint)), names = names, parent = parent, call = call)
}

abort_column_names_cannot_be_dot_dot <- function(names, repair_hint, parent = NULL, call = caller_env()) {
  tibble_abort(invalid_df("must not have names of the form ... or ..j", names, use_repair(repair_hint)), names = names, parent = parent, call = call)
}

abort_column_names_must_be_unique <- function(names, repair_hint, parent = NULL, call = caller_env()) {
  tibble_abort(invalid_df("must not be duplicated", names, use_repair(repair_hint), message = "Column name(s)"), names = names, parent = parent, call = call)
}

# Subclassing errors ------------------------------------------------------

subclass_name_repair_errors <- function(expr, name, details = NULL, repair_hint = FALSE, call) {
  withCallingHandlers(
    expr,

    # FIXME: use cnd$names with vctrs >= 0.3.0
    vctrs_error_names_cannot_be_empty = function(cnd) {
      abort_column_names_cannot_be_empty(detect_empty_names(name), details = details, parent = cnd, repair_hint = repair_hint, call = call)
    },
    vctrs_error_names_cannot_be_dot_dot = function(cnd) {
      abort_column_names_cannot_be_dot_dot(detect_dot_dot(name), parent = cnd, repair_hint = repair_hint, call = call)
    },
    vctrs_error_names_must_be_unique = function(cnd) {
      abort_column_names_must_be_unique(detect_duplicates(name), parent = cnd, repair_hint = repair_hint, call = call)
    }
  )
}

# Anticipate vctrs 0.3.0 release: locations replaced by names
detect_empty_names <- function(names) {
  which(names == "")
}
detect_dot_dot <- function(names) {
  grep("^[.][.](?:[.]|[1-9][0-9]*)$", names)
}
detect_duplicates <- function(names) {
  names[which(duplicated(names))]
}
