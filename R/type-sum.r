#' Provide a succinct summary of an object
#'
#' \code{type_sum} gives a brief summary of object type. Objects that commonly
#' occur in a data frame should return a string with four or less characters.
#' \code{obj_sum} also includes the size of the object.
#'
#' @param x an object to summarise. Generally only methods of atomic vectors
#'   and variants have been implemented.
#' @keywords internal
#' @examples
#' obj_sum(1:10)
#' obj_sum(matrix(1:10))
#' obj_sum(Sys.Date())
#' obj_sum(Sys.time())
#' obj_sum(mean)
#' @export
obj_sum <- function(x) UseMethod("obj_sum")
#' @export
obj_sum.default <- function(x) {
  if (!is.object(x)) {
    obj_sum_atomic(x)
  } else if (!isS4(x)) {
    paste0("<S3: ", paste0(class(x), collapse = "/"), ">")
  } else {
    paste0("<S4: ", methods::is(x)[[1]], ">")
  }
}

#' @export
obj_sum.NULL <- function(x) "<NULL>"

obj_sum_atomic <- function(x) {
  paste0("<", type_sum(x), size_sum(x), ">")
}
#' @export
obj_sum.factor <- obj_sum_atomic
#' @export
obj_sum.Date <- obj_sum_atomic
#' @export
obj_sum.POSIXct <- obj_sum_atomic

#' @export
obj_sum.data.frame <- function(x) {
  paste0("<", class(x)[1], size_sum(x), ">")
}

#' @export
#' @rdname obj_sum
type_sum <- function(x) UseMethod("type_sum")

#' @export
type_sum.numeric <- function(x) "dbl"
#' @export
type_sum.integer <- function(x) "int"
#' @export
type_sum.logical <- function(x) "lgl"
#' @export
type_sum.character <- function(x) "chr"

#' @export
type_sum.factor <- function(x) "fctr"
#' @export
type_sum.POSIXt <- function(x) "time"
#' @export
type_sum.Date <- function(x) "date"

#' @export
type_sum.default <- function(x) {
  if (!is.object(x)) {
    typeof(x)
  } else if (!isS4(x)) {
    paste0("S3: ", paste0(class(x), collapse = "/"))
  } else {
    paste0("S4: ", methods::is(x)[[1]])
  }
}

size_sum <- function(x) {
  if (!is_vector(x)) return("")

  dim <- dim(x) %||% length(x)
  paste0(" [", paste0(dim, collapse = ","), "]" )
}
