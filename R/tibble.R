#' Build a data frame or list.
#'
#' @description
#' `tibble()` is a trimmed down version of [data.frame()] that:
#'
#' * Never coerces inputs (i.e. strings stay as strings!).
#' * Never adds `row.names`.
#' * Never munges column names.
#' * Only recycles length 1 inputs.
#' * Evaluates its arguments lazily and in order.
#' * Adds `tbl_df` class to output.
#' * Automatically adds column names.
#'
#'
#' @param ... A set of name-value pairs. Arguments are evaluated sequentially,
#'   so you can refer to previously created variables.
#' @param xs  A list of unevaluated expressions created with `~`,
#'   [quote()], or (deprecated) [lazyeval::lazy()].
#' @seealso [as_tibble()] to turn an existing list into
#'   a data frame.
#' @export
#' @examples
#' a <- 1:5
#' tibble(a, b = a * 2)
#' tibble(a, b = a * 2, c = 1)
#' tibble(x = runif(10), y = x * 2)
#'
#' lst(n = 5, x = runif(n))
#'
#' # tibble never coerces its inputs
#' str(tibble(letters))
#' str(tibble(x = list(diag(1), diag(2))))
#'
#' # or munges column names
#' tibble(`a + b` = 1:5)
#'
#' # You can splice-unquote a list of quotes and formulas
#' tibble(!!! list(x = rlang::quo(1:10), y = quote(x * 2)))
#'
#' # data frames can only contain 1d atomic vectors and lists
#' # and can not contain POSIXlt
#' \dontrun{
#' tibble(x = tibble(1, 2, 3))
#' tibble(y = strptime("2000/01/01", "%x"))
#' }
tibble <- function(...) {
  as_tibble(lst(...))
}

#' @export
#' @rdname tibble
tibble_ <- function(xs) {
  as_tibble(lst_(xs))
}

#' @export
#' @rdname tibble
#' @usage NULL
data_frame <- tibble

#' @export
#' @rdname tibble
#' @usage NULL
data_frame_ <- tibble_


#' Test if the object is a tibble.
#'
#' @param x An object
#' @return `TRUE` if the object inherits from the `tbl_df` class.
#' @export
is.tibble <- function(x) {
  "tbl_df" %in% class(x)
}

#' @rdname is.tibble
#' @export
is_tibble <- is.tibble


# Validity checks --------------------------------------------------------------

check_tibble <- function(x) {
  # Names
  names_x <- names2(x)
  bad_name <- is.na(names_x) | names_x == ""
  if (any(bad_name)) {
    invalid_df("must be named", x, which(bad_name))
  }

  dups <- duplicated(names_x)
  if (any(dups)) {
    invalid_df("must have [a] unique name(s)", x, dups)
  }

  # Types
  is_1d <- map_lgl(x, is_1d)
  if (any(!is_1d)) {
    invalid_df("must be [a] 1d atomic vector(s) or [a] list(s)", x, !is_1d)
  }

  x[] <- map(x, strip_dim)

  posixlt <- map_lgl(x, inherits, "POSIXlt")
  if (any(posixlt)) {
    invalid_df("[is](are) [a] date(s)/time(s) and must be stored as POSIXct, not POSIXlt", x, posixlt)
  }

  x
}

recycle_columns <- function(x) {
  if (length(x) == 0) {
    return(x)
  }

  # Validate column lengths
  lengths <- map_int(x, NROW)
  max <- max(lengths)

  bad_len <- lengths != 1L & lengths != max
  if (any(bad_len)) {
    invalid_df_msg(
      paste0("must be length 1 or ", max, ", not "), x, bad_len, lengths[bad_len]
    )
  }

  short <- lengths == 1
  if (max != 1L && any(short)) {
    x[short] <- map(x[short], rep, max)
  }

  x
}

invalid_df <- function(problem, df, vars) {
  if (is.logical(vars)) {
    vars <- names(df)[vars]
  }
  stopc(
    pluralise_msg("Column(s) ", vars), " ",
    pluralise(problem, vars)
  )
}

invalid_df_msg <- function(problem, df, vars, extra) {
  if (is.logical(vars)) {
    vars <- names(df)[vars]
  }
  stopc(
    pluralise_msg("Column(s) ", vars), " ",
    pluralise_msg(problem, extra)
  )
}

