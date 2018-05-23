pluralise_msg <- function(message, objects) {
  paste0(
    pluralise(message, objects),
    format_n(objects)
  )
}

pluralise <- function(message, objects) {
  pluralise_n(message, length(objects))
}

pluralise_n <- function(message, n) {
  stopifnot(n >= 0)
  if (n == 1) {
    # strip [, unless there is space in between
    message <- gsub("\\[([^\\] ]+)\\]", "\\1", message, perl = TRUE)
    # remove ( and its content, unless there is space in between
    message <- gsub("\\([^\\) ]+\\)", "", message, perl = TRUE)
  } else {
    # strip (, unless there is space in between
    message <- gsub("\\(([^\\) ]+)\\)", "\\1", message, perl = TRUE)
    # remove [ and its content, unless there is space in between
    message <- gsub("\\[[^\\] ]+\\]\\s*", "", message, perl = TRUE)
  }

  message
}

bullets <- function(header, ...) {
  problems <- c(...)
  MAX_BULLETS <- 6L
  if (length(problems) >= MAX_BULLETS) {
    n_more <- length(problems) - MAX_BULLETS + 1L
    problems[[MAX_BULLETS]] <-
      pluralise_n(paste0("... and ", n_more, " more problem(s)"), n_more)
    length(problems) <- MAX_BULLETS
  }

  paste0(
    header, "\n",
    paste0("* ", problems, collapse = "\n")
  )
}
