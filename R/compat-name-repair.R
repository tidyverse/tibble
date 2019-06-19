minimal_names <- function(name) {
  vec_as_names(name, repair = "minimal")
}

unique_names <- function(name, quiet = FALSE) {
  vec_as_names(name, repair = "unique", quiet = quiet)
}

universal_names <- function(name, quiet = FALSE) {
  vec_as_names(name, repair = "universal", quiet = quiet)
}

check_unique <- function(name) {
  vec_as_names(name, repair = "check_unique")
}
