check_names_df <- function(j, ...) UseMethod("check_names_df")

check_names_df.default <- function(j, ...) {
  stopc("Unsupported index type: ", class(j)[[1L]])
}

check_names_df.character <- function(j, x) {
  check_needs_no_dim(j)

  pos <- safe_match(j, names(x))
  if(any(is.na(pos))){
    names <- j[is.na(pos)]
    stopc("Unknown columns ", format_n(names))
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
    stopc("Invalid non-integer column indexes: ", format_n(j[non_integer]))
  }
  neg_too_small <- (j < -length(x))
  if (any(neg_too_small)) {
    stopc("Invalid negative column indexes: ", format_n(j[neg_too_small]))
  }
  pos_too_large <- (j > length(x))
  if (any(pos_too_large)) {
    stopc("Invalid column indexes: ", format_n(j[pos_too_large]))
  }

  seq_along(x)[j]
}

check_names_df.logical <- function(j, x) {
  check_needs_no_dim(j)

  if (!(length(j) %in% c(1L, length(x)))) {
    stopc("Length of logical index vector must be 1 or ", length(x), ", got: ", length(j))
  }
  if (any(is.na(j))) {
    stopc("NA column indexes not supported")
  }
  seq_along(x)[j]
}

check_needs_no_dim <- function(j) {
  if (needs_dim(j)) {
    stopc("Unsupported use of matrix or array for column indexing")
  }
}
