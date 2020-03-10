# nocov start - compat-lifecycle (last updated: rlang 0.3.0.9000)

scoped_lifecycle_silence <- function(frame = rlang::caller_env()) {
  rlang::scoped_options(.frame = frame,
    lifecycle_verbosity = "quiet"
  )
}
with_lifecycle_silence <- function(expr) {
  scoped_lifecycle_silence()
  expr
}

scoped_lifecycle_warnings <- function(frame = rlang::caller_env()) {
  rlang::scoped_options(.frame = frame,
    lifecycle_verbosity = "warning"
  )
}
with_lifecycle_warnings <- function(expr) {
  scoped_lifecycle_warnings()
  expr
}

scoped_lifecycle_errors <- function(frame = rlang::caller_env()) {
  scoped_lifecycle_warnings(frame = frame)
  rlang::scoped_options(.frame = frame,
    lifecycle_verbosity = "error"
  )
}
with_lifecycle_errors <- function(expr) {
  scoped_lifecycle_errors()
  expr
}

# Enable once signal_superseded() reaches stable state
signal_superseded <- function(...) {}

# nocov end
