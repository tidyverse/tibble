#' Tibble constructor and validator
#'
#' @description
#' Creates or validates a subclass of a tibble.
#' These function is mostly useful for package authors that implement subclasses
#' of a tibble, like \pkg{sf} or \pkg{tsibble}.
#'
#' `new_tibble()` creates a new object as a subclass of `tbl_df`, `tbl` and `data.frame`.
#' This function is optimized for performance, checks are reduced to a minimum.
#' See [vctrs::new_data_frame()] for details.
#'
#' @param x A tibble-like object.
#' @param ... Name-value pairs of additional attributes.
#' @param nrow The number of rows, inferred from `x` if omitted.
#' @param class Subclasses to assign to the new object, default: none.
#' @param subclass Deprecated, retained for compatibility. Please use the `class` argument.
#'
#' @seealso
#' [tibble()] and [as_tibble()] for ways to construct a tibble
#' with recycling of scalars and automatic name repair,
#' and [vctrs::df_list()] and [vctrs::new_data_frame()]
#' for lower-level implementations.
#'
#' @export
#' @examples
#' # The nrow argument can be omitted:
#' new_tibble(list(a = 1:3, b = 4:6))
#'
#' # Existing row.names attributes are ignored:
#' try(validate_tibble(new_tibble(trees, nrow = 3)))
#'
#' # The length of all columns must be compatible with the nrow argument:
#' try(validate_tibble(new_tibble(list(a = 1:3, b = 4:6), nrow = 2)))
new_tibble <- function(x, ..., nrow = NULL, class = NULL, subclass = NULL) {
  # For compatibility with tibble < 2.0.0
  if (is.null(class) && !is.null(subclass)) {
    deprecate_soft("2.0.0", "tibble::new_tibble(subclass = )", "new_tibble(class = )")
    class <- subclass
  }

  #' @section Construction:
  #'
  #' For `new_tibble()`, `x` must be a list.
  x <- unclass(x)

  if (!is.list(x)) {
    abort_new_tibble_must_be_list()
  }

  #' The `nrow` argument may be omitted as of tibble 3.1.4.
  #' If present, every element of the list `x` should have [vctrs::vec_size()]
  #' equal to this value.
  #' (But this is not checked by the constructor).
  #' This takes the place of the "row.names" attribute in a data frame.
  if (!is.null(nrow)) {
    if (!is.numeric(nrow) || length(nrow) != 1 || nrow < 0 || !is_integerish(nrow, 1) || nrow >= 2147483648) {
      abort_new_tibble_nrow_must_be_nonnegative()
    }
    nrow <- as.integer(nrow)
  }

  args <- attributes(x)

  if (is.null(args)) {
    args <- list()
  }

  new_attrs <- pairlist2(...)
  nms <- names(new_attrs)

  for (i in seq_along(nms)) {
    nm <- nms[[i]]

    if (nm == "") {
      next
    }

    args[[nm]] <- new_attrs[[i]]
  }

  #' `x` must have names (or be empty),
  #' but the names are not checked for correctness.
  if (length(x) == 0) {
    # Leaving this because creating a named list of length zero seems difficult
    args[["names"]] <- character()
  } else if (is.null(args[["names"]])) {
    abort_names_must_be_non_null()
  }

  if (is.null(class)) {
    class <- tibble_class_no_data_frame
  } else {
    class <- c(class[!class %in% tibble_class], tibble_class_no_data_frame)
  }

  slots <- c("x", "n", "class")
  args[slots] <- list(x, nrow, class)

  # `new_data_frame()` restores compact row names
  # Can't add to the assignment above, a literal NULL would be inserted otherwise
  args[["row.names"]] <- NULL

  # need exec() to avoid evaluating language attributes (e.g. rsample)
  exec(new_data_frame, !!!args)
}

#' @description
#' `validate_tibble()` checks a tibble for internal consistency.
#' Correct behavior can be guaranteed only if this function
#' runs without raising an error.
#'
#' @rdname new_tibble
#' @export
validate_tibble <- function(x) {
  #' @section Validation:
  #' `validate_tibble()` checks for "minimal" names
  check_minimal_names(x)

  #' and that all columns are vectors, data frames or matrices.
  check_valid_cols(unclass(x))

  #' It also makes sure that all columns have the same length,
  #' and that [vctrs::vec_size()] is consistent with the data.
  validate_nrow(names(x), col_lengths(x), vec_size(x))

  x
}

check_minimal_names <- function(x) {
  names <- names(x)

  if (is.null(names)) {
    abort_names_must_be_non_null()
  }

  if (anyNA(names)) {
    abort_column_names_cannot_be_empty(which(is.na(names)), repair_hint = FALSE)
  }

  invisible(x)
}

col_lengths <- function(x) {
  map_int(x, vec_size)
}

validate_nrow <- function(names, lengths, nrow) {
  # Validate column lengths, don't recycle
  bad_len <- which(lengths != nrow)
  if (has_length(bad_len)) {
    abort_incompatible_size(nrow, names, lengths, "Requested with `nrow` argument")
  }
}

tibble_class <- c("tbl_df", "tbl", "data.frame")
tibble_class_no_data_frame <- c("tbl_df", "tbl")

# Errors ------------------------------------------------------------------

abort_new_tibble_must_be_list <- function(call = caller_env()) {
  tibble_abort(call = call, "`x` must be a list.")
}

abort_new_tibble_nrow_must_be_nonnegative <- function(call = caller_env()) {
  tibble_abort(call = call, "`nrow` must be a nonnegative whole number smaller than 2^31.")
}
