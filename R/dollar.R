#' @export
`$` <- function(x, name) {
  env <- new_environment(list(x = x, name = as.character(substitute(name))), parent = base_env())
  call <- call2("$", x, substitute(name))
  return(eval(call, env))
  UseMethod("$")
}
