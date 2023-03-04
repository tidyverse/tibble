# nocov start - compat-lifecycle (last updated: rlang 0.3.0.9000)

scoped_lifecycle_silence <- function(frame = rlang::caller_env()) {
  rlang::local_options(
    .frame = frame,
    lifecycle_verbosity = "quiet"
  )
}
with_lifecycle_silence <- function(expr) {
  scoped_lifecycle_silence()
  expr
}

scoped_lifecycle_warnings <- function(frame = rlang::caller_env()) {
  rlang::local_options(
    .frame = frame,
    lifecycle_verbosity = "warning"
  )
}
with_lifecycle_warnings <- function(expr) {
  scoped_lifecycle_warnings()
  expr
}

scoped_lifecycle_errors <- function(frame = rlang::caller_env()) {
  rlang::local_options(
    .frame = frame,
    lifecycle_verbosity = "error"
  )
}
with_lifecycle_errors <- function(expr) {
  scoped_lifecycle_errors()
  expr
}

# Enable once signal_superseded() reaches stable state
signal_superseded <- function(...) {}

foreign_caller_env <- function(my_env = ns_env()) {
  for (n in 2:10) {
    caller <- caller_env(n)
    if (!is_reference(env_parent(caller), my_env)) {
      return(caller)
    }
  }

  # Safety net
  caller
}

# nocov end
