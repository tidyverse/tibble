# nocov start
replace_if_pillar_has <- function(fun) {
  pillar_ns <- asNamespace("pillar")

  fun <- as_string(ensym(fun))
  value <- mget(fun, pillar_ns, mode = "function", ifnotfound = list(NULL))[[1]]
  if (!is.null(value)) {
    assign(fun, value, inherits = TRUE)
  }
}

register_if_pillar_hasnt <- function(names) {
  pillar_ns <- asNamespace("pillar")

  # Register our method implementations only if pillar doesn't provide them
  methods <- mget(names, asNamespace("tibble"), mode = "function")
  pillar_methods <- mget(names, pillar_ns, mode = "function", ifnotfound = list(NULL))

  pillar_has <- !map_lgl(pillar_methods, is.null)

  imap(methods[!pillar_has], register_method)

  # Get our implementations out of sight to avoid confusing load_all()
  #map2(names(methods)[pillar_has], pillar_methods[pillar_has], assign, inherits = TRUE)
  rm(list = names[pillar_has], inherits = TRUE)
}

register_method <- function(method, name) {
  class <- sub("^[^.]*.", "", name)
  fun <- sub("[.].*$", "", name)
  generic <- paste0("tibble::", fun)

  vctrs::s3_register(generic, class, method)
  invisible()
}
# nocov end
