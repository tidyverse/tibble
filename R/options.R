## user-facing docs kept in `formatting` topic; see utils-format.R
## Exception: tibble.view_max, in `tibble-package`
op.tibble <- list(
  tibble.print_max = 20L,
  tibble.print_min = 10L,
  tibble.width = NULL,
  tibble.max_extra_cols = 100L,
  tibble.view_max = 1000L
)

tibble_opt <- function(x, dplyr = TRUE) {
  x_tibble <- paste0("tibble.", x)
  res <- getOption(x_tibble)
  if (!is.null(res)) {
    return(res)
  }

  if (dplyr) {
    x_dplyr <- paste0("dplyr.", x)
    res <- getOption(x_dplyr)
    if (!is.null(res)) {
      return(res)
    }
  }

  op.tibble[[x_tibble]]
}

tibble_width <- function(width) {
  if (!is.null(width)) {
    return(width)
  }

  width <- tibble_opt("width")
  if (!is.null(width)) {
    return(width)
  }

  getOption("width")
}

tibble_glimpse_width <- function(width) {
  if (!is.null(width)) {
    return(width)
  }

  width <- tibble_opt("width")
  if (!is.null(width) && is.finite(width)) {
    return(width)
  }

  getOption("width")
}
