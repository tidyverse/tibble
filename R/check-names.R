check_names_df <- function(j, ...) UseMethod("check_names_df")

#' @export
check_names_df.default <- function(j, ...) {
  stopc("Unsupported index type: ", class(j)[[1L]])
}

#' @export
check_names_df.character <- function(j, x) {
  check_names_before_after.character(j, names(x))
}

#' @export
check_names_df.numeric <- function(j, x) {
  check_needs_no_dim(j)

  if (anyNA(j)) {
    stopc("NA column indexes not supported")
  }

  non_integer <- (j != trunc(j))
  if (any(non_integer)) {
    stopc(pluralise_msg("Column index(es) must be integer, not ", j[non_integer]))
  }
  neg_too_small <- (j < -length(x))
  if (any(neg_too_small)) {
    stopc(pluralise_msg(
      paste0("Column index(es) must be at least ", -length(x), " if negative, not "),
      j[neg_too_small]
    ))
  }
  pos_too_large <- (j > length(x))
  if (any(pos_too_large)) {
    stopc(pluralise_msg(
      paste0("Column index(es) must be at most ", length(x), " if positive, not "),
      j[pos_too_large]
    ))
  }

  seq_along(x)[j]
}

#' @export
check_names_df.logical <- function(j, x) {
  check_needs_no_dim(j)

  if (!(length(j) %in% c(1L, length(x)))) {
    stopc(
      "Length of logical index vector must be 1 or ", length(x),
      " (the number of rows), not ", length(j)
    )
  }
  if (anyNA(j)) {
    stopc("NA column indexes not supported")
  }
  seq_along(x)[j]
}

check_needs_no_dim <- function(j) {
  if (needs_dim(j)) {
    stopc("Can't use matrix or array for column indexing")
  }
}

# check_names_before_after ------------------------------------------------

check_names_before_after <- function(j, ...) UseMethod("check_names_before_after")

#' @export
check_names_before_after.default <- function(j, ...) {
  j
}

#' @export
check_names_before_after.character <- function(j, names) {
  check_needs_no_dim(j)

  pos <- safe_match(j, names)
  if (anyNA(pos)) {
    unknown_names <- j[is.na(pos)]
    stopc(pluralise_msg("Column(s) ", unknown_names), " not found")
  }
  pos
}
