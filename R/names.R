set_repaired_names <- function(x,
                               .name_repair = c("check_unique", "unique", "universal", "minimal"),
                               quiet = FALSE) {
  set_names(x, repaired_names(names2(x), .name_repair = .name_repair, quiet = quiet))
}

repaired_names <- function(name,
                           .name_repair = c("check_unique", "unique", "universal", "minimal"),
                           quiet = FALSE,
                           details = NULL) {

  subclass_name_repair_errors(name = name, details = details,
    vec_as_names(name, repair = .name_repair, quiet = quiet)
  )
}

# Errors ------------------------------------------------------------------

error_column_must_be_named <- function(names, repair = has_tibble_arg(".name_repair"), parent = NULL) {
  tibble_error(invalid_df("must be named", names, use_repair(repair)), names = names, parent = parent)
}

error_column_must_not_be_dot_dot <- function(names, repair = has_tibble_arg(".name_repair"), parent = NULL) {
  tibble_error(invalid_df("must not have names of the form ... or ..j", names, use_repair(repair)), names = names, parent = parent)
}

error_column_names_must_be_unique <- function(names, repair = has_tibble_arg(".name_repair"), parent = NULL) {
  tibble_error(pluralise_commas("Column name(s) ", tick(names), " must not be duplicated.", use_repair(repair)), names = names, parent = parent)
}

# Subclassing errors ------------------------------------------------------

subclass_name_repair_errors <- function(expr, name, details = NULL) {
  tryCatch(
    force(expr),

    vctrs_error_names_cannot_be_empty = function(cnd) {
      cnd <- error_column_must_be_named(detect_empty_names(cnd$names), parent = cnd)
      cnd$body <- details

      cnd_signal(cnd)
    },
    vctrs_error_names_cannot_be_dot_dot = function(cnd) {
      cnd <- error_column_must_not_be_dot_dot(detect_dot_dot(cnd$names), parent = cnd)
      cnd_signal(cnd)
    },
    vctrs_error_names_must_be_unique = function(cnd) {
      cnd <- error_column_names_must_be_unique(detect_duplicates(cnd$names), parent = cnd)
      cnd_signal(cnd)
    }
  )
}

detect_empty_names <- function(names) {
  which(names == "")
}
detect_dot_dot <- function(names) {
  grep("^[.][.](?:[.]|[1-9][0-9]*)$", names)
}
detect_duplicates <- function(names) {
  names[which(duplicated(names))]
}
