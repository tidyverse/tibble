#' Package options
#'
#' Options that affect interactive display.
#' See [pillar::pillar_options] for options that affect display on the console,
#' and [cli::num_ansi_colors()] for enabling and disabling colored output
#' via ANSI sequences like `[3m[38;5;246m[39m[23m`.
#'
#' These options can be set via [options()] and queried via [getOption()].
#' For this, add a `tibble.` prefix (the package name and a dot) to the option name.
#' Example: for an option `foo`, use `options(tibble.foo = value)` to set it
#' and `getOption("tibble.foo")` to retrieve the current value.
#' An option value of `NULL` means that the default is used.
#'
#' @format NULL
#'
#' @examples
#' # Default setting:
#' getOption("tibble.view_max")
#'
#' # Change for the duration of the session:
#' old <- options(tibble.view_max = 100)
#'
#' # view() would show only 100 rows e.g. for a lazy data frame
#'
#' # Change back to the original value:
#' options(old)
#'
#' # Local scope:
#' local({
#'   rlang::local_options(tibble.view_max = 100)
#'   # view() would show only 100 rows e.g. for a lazy data frame
#' })
#' # view() would show the default 1000 rows e.g. for a lazy data frame
#' @section Options for the tibble package:
tibble_options <- list2(
  #' - `view_max`: Maximum number of rows shown by [view()]
  #'   if the input is not a data frame, passed on to [head()]. Default: `1000`.
  view_max = make_option_impl(
    getOption("tibble.view_max", default = tibble_opt("view_max", 1000L))
  ),
)
