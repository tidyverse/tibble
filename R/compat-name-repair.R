minimal_names <- function(name) {
  vec_as_names(name, repair = "minimal")
}

unique_names <- function(name, quiet = FALSE) {
  vec_as_names(name, repair = "unique", quiet = quiet)
}
