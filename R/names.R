set_repaired_names <- function(x,
                               .name_repair = c("check_unique", "unique", "universal", "minimal"),
                               quiet = FALSE) {
  set_names(x, repaired_names(names2(x), .name_repair = .name_repair, quiet = quiet))
}

repaired_names <- function(name,
                           .name_repair = c("check_unique", "unique", "universal", "minimal"),
                           quiet = FALSE,
                           repair = FALSE,
                           details = NULL) {

  subclass_name_repair_errors(name = name, details = details, repair = repair,
    vec_as_names(name, repair = .name_repair, quiet = quiet || !is_character(.name_repair))
  )
}

# Errors ------------------------------------------------------------------

error_column_names_cannot_be_empty <- function(names, repair = has_tibble_arg(".name_repair"), parent = NULL) {
  tibble_error(invalid_df("must be named", names, use_repair(repair)), names = names, parent = parent)
}

error_column_names_cannot_be_dot_dot <- function(names, repair = has_tibble_arg(".name_repair"), parent = NULL) {
  tibble_error(invalid_df("must not have names of the form ... or ..j", names, use_repair(repair)), names = names, parent = parent)
}

error_column_names_must_be_unique <- function(names, repair = has_tibble_arg(".name_repair"), parent = NULL) {
  tibble_error(pluralise_commas("Column name(s) ", tick(names), " must not be duplicated.", use_repair(repair)), names = names, parent = parent)
}

# Subclassing errors ------------------------------------------------------

subclass_name_repair_errors <- function(expr, name, details = NULL, repair = FALSE) {
  withCallingHandlers(
    expr,

    # FIXME: use cnd$names with vctrs >= 0.3.0
    vctrs_error_names_cannot_be_empty = function(cnd) {
      cnd <- error_column_names_cannot_be_empty(detect_empty_names(name), parent = cnd, repair = repair)
      cnd$body <- details

      cnd_signal(cnd)
    },
    vctrs_error_names_cannot_be_dot_dot = function(cnd) {
      cnd <- error_column_names_cannot_be_dot_dot(detect_dot_dot(name), parent = cnd, repair = repair)
      cnd_signal(cnd)
    },
    vctrs_error_names_must_be_unique = function(cnd) {
      cnd <- error_column_names_must_be_unique(detect_duplicates(name), parent = cnd, repair = repair)
      cnd_signal(cnd)
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
