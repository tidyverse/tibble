#' @export
`[[.tbl_df` <- function(x, i, j, ..., exact = TRUE) {
  if (!exact) {
    warningc("exact ignored")
  }
  if (missing(j)) {
    return(.subset2(x, i))
  }

  NextMethod()
}

#' @export
`$.tbl_df` <- function(x, i) {
  if (is.character(i)) {
    ret <- .subset2(x, i)
    if (is.null(ret)) warningc("Unknown or uninitialised column: '", i, "'.")
    return(ret)
  }
  .subset2(x, i)
}

#' @export
`[.tbl_df` <- function(x, i, j, drop = FALSE) {
  nr <- nrow(x)

  # Ignore drop as an argument
  n_real_args <- nargs() - !missing(drop)

  # Escape early if nargs() == 2L; ie, column subsetting
  if (n_real_args <= 2L) {
    if (!missing(drop)) warningc("drop ignored")

    if (!missing(i)) {
      i <- check_names_df(i, x)
      result <- .subset(x, i)
    } else {
      result <- x
    }

    return(vec_restore_tbl_df(set_tibble_class(result, nr), x))
  }

  # First, subset columns
  if (!missing(j)) {
    j <- check_names_df(j, x)
    result <- .subset(x, j)
  } else {
    result <- x
  }

  # Next, subset rows
  if (!missing(i)) {
    if (is.logical(i) && !(length(i) %in% c(1, nrow(x)))) {
      warningc(
        "Length of logical index must be 1",
        if (nrow(x) != 1) paste0(" or ", nrow(x)),
        ", not ", length(i)
      )
    }

    if (length(result) == 0) {
      nr <- length(attr(x, "row.names")[i])
    } else {
      if (is.character(i)) {
        if (has_rownames(x)) {
          i <- match(i, rownames(x))
        } else {
          i <- string_to_indices(i)
        }
      }
      result <- map(result, subset_rows, i)
      nr <- NROW(result[[1]])
    }
  }

  if (drop) {
    if (length(result) == 1L) {
      return(result[[1L]])
    }
  }

  vec_restore_tbl_df(set_tibble_class(result, nr), x)
}

subset_rows <- function(x, i) {
  if (is.data.frame(x) || is.matrix(x)) {
    x[i, , drop = FALSE]
  } else {
    x[i]
  }
}

# TODO: Change to vec_restore.tbl_df() when vctrs is available
vec_restore_tbl_df <- function(x, to) {
  # Copy attribute, preserving existing names & recreating rownames
  attr_to <- attributes(to)
  attr_to[["names"]] <- names(x)
  attr_to[["row.names"]] <- .set_row_names(NROW(x))
  attributes(x) <- attr_to

  x
}
