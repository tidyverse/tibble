pluralise_msg <- function(message, objects) {
  paste0(
    pluralise(message, objects),
    format_n(objects)
  )
}

pluralise_commas <- function(message, objects, ...) {
  paste0(
    pluralise_n(message, length(objects)),
    commas(objects),
    pluralise_n(paste0(...), length(objects))
  )
}

pluralise_count <- function(message, count, ...) {
  paste0(
    pluralise_n(message, count),
    count,
    pluralise_n(paste0(...), count)
  )
}

pluralise <- function(message, objects) {
  pluralise_n(message, length(objects))
}

pluralise_n <- function(message, n) {
  stopifnot(n >= 0)


  # Don't strip parens if they have a space in between
  # (but not if the space comes before the closing paren)

  if (n == 1) {
    # strip [
    message <- gsub("\\[([^\\] ]* *)\\]", "\\1", message, perl = TRUE)
    # remove ( and its content
    message <- gsub("\\([^\\) ]* *\\)", "", message, perl = TRUE)
  } else {
    # strip (
    message <- gsub("\\(([^\\) ]* *)\\)", "\\1", message, perl = TRUE)
    # remove [ and its content
    message <- gsub("\\[[^\\] ]* *\\]", "", message, perl = TRUE)
  }

  message
}

bullets <- function(header, ...) {
  bullets <- vec_c(..., .name_spec = "{outer}")
  bullets <- set_default_name(bullets, "x")

  paste0(
    ensure_full_stop(header), "\n",
    format_error_bullets(ensure_full_stop(bullets))
  )
}

problems <- function(header, ..., .problem = " problem(s)") {
  problems <- vec_c(..., .name_spec = "{outer}")
  MAX_BULLETS <- 6L
  if (length(problems) >= MAX_BULLETS) {
    n_more <- length(problems) - MAX_BULLETS + 1L
    problems[[MAX_BULLETS]] <-
      pluralise_n(paste0(pre_dots("and "), n_more, " more", .problem), n_more)
    length(problems) <- MAX_BULLETS
  }

  bullets(header, problems)
}

commas <- function(problems) {
  MAX_BULLETS <- 6L

  n <- length(problems)
  if (n <= 1) {
    return(problems)
  } else if (n == 2) {
    return(paste(problems, collapse = " and "))
  }

  if (n >= MAX_BULLETS) {
    n_more <- length(problems) - MAX_BULLETS + 1L
    problems[[MAX_BULLETS]] <- paste0(n_more, " more")
    length(problems) <- MAX_BULLETS
    n <- MAX_BULLETS
  }

  problems[[n]] <- paste0("and ", problems[[n]])

  paste(problems, collapse = ", ")
}

ensure_full_stop <- function(x) {
  gsub("(?::|([^.?]))$", "\\1.", x)
}

set_default_name <- function(x, name) {
  if (is.null(names(x))) {
    names(x) <- rep_along(x, name)
  }

  x
}
