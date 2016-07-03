#' Build a data frame or list.
#'
#' \code{tibble} is a trimmed down version of \code{\link{data.frame}} that:
#' \enumerate{
#' \item Never coerces inputs (i.e. strings stay as strings!).
#' \item Never adds \code{row.names}.
#' \item Never munges column names.
#' \item Only recycles length 1 inputs.
#' \item Evaluates its arguments lazily and in order.
#' \item Adds \code{tbl_df} class to output.
#' \item Automatically adds column names.
#' }
#'
#' \code{lst} is similar to \code{\link{list}}, but like \code{tibble}, it
#' evaluates its arguments lazily and in order, and automatically adds names.
#'
#' \code{data_frame} is an alias to \code{tibble}.
#'
#' @param ... A set of name-value pairs. Arguments are evaluated sequentially,
#'   so you can refer to previously created variables.
#' @param xs  A list of unevaluated expressions created with \code{~},
#'   \code{quote()}, or \code{\link[lazyeval]{lazy}}.
#' @seealso \code{\link{as_tibble}} to turn an existing list into
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
#' # With the SE version, you give it a list of formulas/expressions
#' tibble_(list(x = ~1:10, y = quote(x * 2)))
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
data_frame <- tibble

#' @export
#' @rdname tibble
data_frame_ <- tibble_

#' @export
#' @rdname tibble
lst <- function(...) {
  lst_(lazyeval::lazy_dots(...))
}

#' @export
#' @rdname tibble
lst_ <- function(xs) {
  n <- length(xs)
  if (n == 0) return(list())

  # If named not supplied, used deparsed expression
  col_names <- names2(xs)
  missing_names <- col_names == ""
  if (any(missing_names)) {
    deparse2 <- function(x) paste(deparse(x$expr, 500L), collapse = "")
    defaults <- vapply(xs[missing_names], deparse2, character(1),
      USE.NAMES = FALSE)
    col_names[missing_names] <- defaults
  }

  # Evaluate each column in turn
  output <- vector("list", n)
  names(output) <- character(n)

  for (i in seq_len(n)) {
    res <- lazyeval::lazy_eval(xs[[i]], output)
    if (!is.null(res)) {
      output[[i]] <-  res
    }
    names(output)[i] <- col_names[[i]]
  }

  output
}


#' Coerce lists and matrices to data frames.
#'
#' \code{as.data.frame} is effectively a thin wrapper around \code{data.frame},
#' and hence is rather slow (because it calls \code{data.frame} on each element
#' before \code{cbind}ing together). \code{as_tibble} is a new S3 generic
#' with more efficient methods for matrices and data frames.
#'
#' This is an S3 generic. tibble includes methods for data frames (adds tbl_df
#' classes), tibbles (returns unchanged input), lists, matrices, and tables.
#' Other types are first coerced via \code{\link[base]{as.data.frame}} with
#' \code{stringsAsFactors = FALSE}.
#'
#' \code{as_data_frame} is an alias.
#'
#' @param x A list. Each element of the list must have the same length.
#' @param ... Other arguments passed on to individual methods.
#' @param validate When \code{TRUE}, verifies that the input is a valid data
#'   frame (i.e. all columns are named, and are 1d vectors or lists). You may
#'   want to suppress this when you know that you already have a valid data
#'   frame and you want to save some time.
#' @export
#' @examples
#' l <- list(x = 1:500, y = runif(500), z = 500:1)
#' df <- as_tibble(l)
#'
#' m <- matrix(rnorm(50), ncol = 5)
#' colnames(m) <- c("a", "b", "c", "d", "e")
#' df <- as_tibble(m)
#'
#' # as_tibble is considerably simpler than as.data.frame
#' # making it more suitable for use when you have things that are
#' # lists
#' \dontrun{
#' l2 <- replicate(26, sample(letters), simplify = FALSE)
#' names(l2) <- letters
#' microbenchmark::microbenchmark(
#'   as_tibble(l2, validate = FALSE),
#'   as_tibble(l2),
#'   as.data.frame(l2)
#' )
#'
#' m <- matrix(runif(26 * 100), ncol = 26)
#' colnames(m) <- letters
#' microbenchmark::microbenchmark(
#'   as_tibble(m),
#'   as.data.frame(m)
#' )
#' }
as_tibble <- function(x, ...) {
  UseMethod("as_tibble")
}

#' @export
#' @rdname as_tibble
as_tibble.tbl_df <- function(x, ...) {
  x
}

#' @export
#' @rdname as_tibble
as_tibble.data.frame <- function(x, validate = TRUE, ...) {
  list_to_tibble(x, validate, raw_rownames(x))
}

#' @export
#' @rdname as_tibble
as_tibble.list <- function(x, validate = TRUE, ...) {
  if (length(x) == 0) {
    list_to_tibble(repair_names(list()), validate = FALSE, .set_row_names(0L))
  } else {
    list_to_tibble(x, validate)
  }
}

list_to_tibble <- function(x, validate, rownames = NULL) {
  # this is to avoid any method dispatch that may happen when processing x
  x <- unclass(x)

  if (validate) {
    x <- check_tibble(x)
  }
  x <- recycle_columns(x)

  if (is.null(rownames)) {
    rownames <- .set_row_names(NROW(x[[1L]]))
  }

  class(x) <- c("tbl_df", "tbl", "data.frame")
  attr(x, "row.names") <- rownames

  x
}

#' @export
#' @rdname as_tibble
as_tibble.matrix <- function(x, ...) {
  x <- matrixToDataFrame(x)
  if (is.null(colnames(x))) {
    colnames(x) <- paste0("V", seq_len(ncol(x)))
  }
  x
}

#' @export
#' @param n Name for count column, default: \code{"n"}.
#' @rdname as_tibble
as_tibble.table <- function(x, n = "n", ...) {
  as_tibble(as.data.frame(x, responseName = n, stringsAsFactors = FALSE))
}

#' @export
#' @rdname as_tibble
as_tibble.NULL <- function(x, ...) {
  as_tibble(list())
}

#' @export
#' @rdname as_tibble
as_tibble.default <- function(x, ...) {
  value <- x
  as_tibble(as.data.frame(value, stringsAsFactors = FALSE, ...))
}

#' @export
#' @rdname as_tibble
as_data_frame <- function(x, ...) {
  UseMethod("as_data_frame")
}

#' @export
as_data_frame.tbl_df <- as_tibble.tbl_df

#' @export
as_data_frame.data.frame <- as_tibble.data.frame

#' @export
as_data_frame.list <- as_tibble.list

#' @export
as_data_frame.matrix <- as_tibble.matrix

#' @export
as_data_frame.table <- as_tibble.table

#' @export
as_data_frame.NULL <- as_tibble.NULL

#' @export
as_data_frame.default <- as_tibble.default

#' Test if the object is a tibble.
#'
#' @param x An object
#' @return \code{TRUE} if the object inherits from the \code{tbl_df} class.
#' @export
is.tibble <- function(x) {
  "tbl_df" %in% class(x)
}

#' @rdname is.tibble
#' @export
is_tibble <- is.tibble


#' Add a row to a data frame
#'
#' This is a convenient way to add a single row of data to an existing data
#' frame. See \code{\link{frame_data}} for an easy way to create an complete
#' data frame row-by-row.
#'
#' @param .data Data frame to append to.
#' @param ... Name-value pairs. If you don't supply the name of a variable,
#'   it'll be given the value \code{NA}.
#' @examples
#' # add_row ---------------------------------
#' df <- tibble(x = 1:3, y = 3:1)
#'
#' add_row(df, x = 4, y = 0)
#'
#' # You can supply vectors, to add multiple rows (this isn't
#' # recommended because it's a bit hard to read)
#' add_row(df, x = 4:5, y = 0:-1)
#'
#' # Absent variables get missing values
#' add_row(df, x = 4)
#'
#' # You can't create new variables
#' \dontrun{
#' add_row(df, z = 10)
#' }
#' @export
add_row <- function(.data, ...) {
  df <- tibble(...)
  attr(df, "row.names") <- .set_row_names(1L)

  extra_vars <- setdiff(names(df), names(.data))
  if (length(extra_vars) > 0) {
    stopc(
      "This row would add new variables: ", format_n(extra_vars)
    )
  }

  missing_vars <- setdiff(names(.data), names(df))
  df[missing_vars] <- NA
  df <- df[names(.data)]

  rbind(.data, df)
}

# Validity checks --------------------------------------------------------------

check_tibble <- function(x) {
  # Names
  names_x <- names2(x)
  bad_name <- is.na(names_x) | names_x == ""
  if (any(bad_name)) {
    invalid_df("Each variable must be named", x, which(bad_name))
  }

  dups <- duplicated(names_x)
  if (any(dups)) {
    invalid_df("Each variable must have a unique name", x, dups)
  }

  # Types
  is_1d <- vapply(x, is_1d, logical(1))
  if (any(!is_1d)) {
    invalid_df("Each variable must be a 1d atomic vector or list", x, !is_1d)
  }

  x[] <- lapply(x, strip_dim)

  posixlt <- vapply(x, inherits, "POSIXlt", FUN.VALUE = logical(1))
  if (any(posixlt)) {
    invalid_df("Date/times must be stored as POSIXct, not POSIXlt", x, posixlt)
  }

  x
}

recycle_columns <- function(x) {
  if (length(x) == 0) {
    return(x)
  }

  # Validate column lengths
  lengths <- vapply(x, NROW, integer(1))
  max <- max(lengths)

  bad_len <- lengths != 1L & lengths != max
  if (any(bad_len)) {
    invalid_df(paste0("Variables must be length 1 or ", max), x, bad_len)
  }

  short <- lengths == 1
  if (max != 1L && any(short)) {
    x[short] <- lapply(x[short], rep, max)
  }

  x
}

invalid_df <- function(problem, df, vars) {
  if (is.logical(vars)) {
    vars <- names(df)[vars]
  }
  stopc(
    problem, ".\n",
    "Problem variables: ", format_n(vars)
  )
}

