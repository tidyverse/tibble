make_option_impl <- function(getter, option_name = NULL, env = caller_env()) {
  getter_body <- enexpr(getter)

  if (is.null(option_name)) {
    # Assuming that the call is getOption()
    option_name <- getter_body[[2]]
    stopifnot(is.character(option_name))
  }
  name <- sub(paste0(utils::packageName(env), "."), "", option_name, fixed = TRUE)
  getter_name <- paste0("get_", utils::packageName(env), "_option_", name)
  local_setter_name <- paste0("local_", utils::packageName(env), "_option_", name)
  setter_name <- paste0("set_", utils::packageName(env), "_option_", name)

  local_setter_body <- expr({
    out <- !!call2("local_options", !!option_name := sym("value"), .frame = sym("env"))
    !!call2(getter_name)
    invisible(out[[1]])
  })

  setter_body <- expr({
    out <- !!call2("options", !!option_name := sym("value"))
    !!call2(getter_name)
    invisible(out[[1]])
  })

  body <- expr({
    if (missing(!!sym("value"))) {
      if (!missing(local)) {
        abort("Can't pass `local` argument if `value` is missing.")
      }
      !!getter_body
    } else if (local) !!local_setter_body
    else !!setter_body
  })

  args <- pairlist2(value = , local = FALSE, env = quote(caller_env()))

  assign(getter_name, new_function(list(), getter_body, env = env), env)
  assign(local_setter_name, new_function(args[c(1, 3)], local_setter_body, env = env), env)
  assign(setter_name, new_function(args[1], setter_body, env = env), env)

  new_function(args, body, env = env)
}
