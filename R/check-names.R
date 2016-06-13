check_names_df <- function(j, ...) UseMethod("check_names_df")

check_names_df.default <- function(j, ...) {
  stop("unsupported index type: ", class(j)[[1L]])
}

check_names_df.character <- function(j, x) {
  check_needs_no_dim(j)

  pos <- safe_match(j, names(x))
  if(any(is.na(pos))){
    names <- j[is.na(pos)]
    stop("undefined columns: ", paste(names, collapse = ", "), call. = FALSE)
  }
  pos
}

check_names_df.numeric <- function(j, x) {
  check_needs_no_dim(j)

  if (any(is.na(j))) {
    stop("NA column indexes not supported", call. = FALSE)
  }

  non_integer <- (j != trunc(j))
  if (any(non_integer)) {
    stop("invalid non-integer column indexes: ", paste(j[non_integer], collapse = ", "), call. = FALSE)
  }
  neg_too_small <- (j < -length(x))
  if (any(neg_too_small)) {
    stop("invalid negative column indexes: ", paste(j[neg_too_small], collapse = ", "), call. = FALSE)
  }
  pos_too_large <- (j > length(x))
  if (any(pos_too_large)) {
    stop("invalid column indexes: ", paste(j[pos_too_large], collapse = ", "), call. = FALSE)
  }

  seq_along(x)[j]
}

check_names_df.logical <- function(j, x) {
  check_needs_no_dim(j)

  if (!(length(j) %in% c(1L, length(x)))) {
    stop("length of logical index vector must be 1 or ", length(x), ", got: ", length(j), call. = FALSE)
  }
  if (any(is.na(j))) {
    stop("NA column indexes not supported", call. = FALSE)
  }
  seq_along(x)[j]
}

check_needs_no_dim <- function(j) {
  if (needs_dim(j)) {
    stop("unsupported use of matrix or array for column indexing", call. = FALSE)
  }
}
