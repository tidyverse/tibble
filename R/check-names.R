check_names_df <- function(j, ...) UseMethod("check_names_df")

check_names_df.default <- function(j, ...) {
  stopc("unsupported index type: ", class(j)[[1L]])
}

check_names_df.character <- function(j, x) {
  check_needs_no_dim(j)

  pos <- safe_match(j, names(x))
  if(any(is.na(pos))){
    names <- j[is.na(pos)]
    stopc("undefined columns: ", paste(names, collapse = ", "))
  }
  pos
}

check_names_df.numeric <- function(j, x) {
  check_needs_no_dim(j)

  if (any(is.na(j))) {
    stopc("NA column indexes not supported")
  }

  non_integer <- (j != trunc(j))
  if (any(non_integer)) {
    stopc("invalid non-integer column indexes: ", paste(j[non_integer], collapse = ", "))
  }
  neg_too_small <- (j < -length(x))
  if (any(neg_too_small)) {
    stopc("invalid negative column indexes: ", paste(j[neg_too_small], collapse = ", "))
  }
  pos_too_large <- (j > length(x))
  if (any(pos_too_large)) {
    stopc("invalid column indexes: ", paste(j[pos_too_large], collapse = ", "))
  }

  seq_along(x)[j]
}

check_names_df.logical <- function(j, x) {
  check_needs_no_dim(j)

  if (!(length(j) %in% c(1L, length(x)))) {
    stopc("length of logical index vector must be 1 or ", length(x), ", got: ", length(j))
  }
  if (any(is.na(j))) {
    stopc("NA column indexes not supported")
  }
  seq_along(x)[j]
}

check_needs_no_dim <- function(j) {
  if (needs_dim(j)) {
    stopc("unsupported use of matrix or array for column indexing")
  }
}
