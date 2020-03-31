replace_if_pillar_has <- function(fun) {
  pillar_ns <- asNamespace("pillar")

  fun <- as_string(ensym(fun))
  value <- mget(fun, pillar_ns, mode = "function", ifnotfound = list(NULL))[[1]]
  if (!is.null(value)) {
    assign(fun, value, inherits = TRUE)
  }
}

register_if_pillar_hasnt <- function(...) {
  pillar_ns <- asNamespace("pillar")

  # Register our method implementations only if pillar doesn't provide them
  methods <- enquos(..., .named = TRUE)
  pillar_methods <- mget(names(methods), pillar_ns, mode = "function", ifnotfound = list(NULL))
  methods <- methods[map_lgl(pillar_methods, is.null)]

  if (is_empty(methods)) return()

  methods <- map(methods, eval_tidy)
  classes <- sub("^[^.]*.", "", names(methods))
  fun <- sub("[.].*$", "", names(methods)[[1]])

  map2(classes, methods, vctrs::s3_register, generic = paste0("tibble::", fun))
  invisible()
}
