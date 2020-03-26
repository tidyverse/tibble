format_footer <- function(squeezed, rows_missing, rows_total, rows_min, n_extra) {
  extra_rows <- format_footer_rows(
    squeezed, rows_missing, rows_total, rows_min
  )
  extra_cols <- format_footer_cols(
    pillar::extra_cols(squeezed, n = n_extra),
    rows_total, rows_min
  )

  extra <- c(extra_rows, extra_cols)
  if (length(extra) >= 1) {
    extra[[1]] <- paste0("with ", extra[[1]])
    extra[-1] <- map_chr(extra[-1], function(ex) paste0("and ", ex))
    collapse(extra)
  } else {
    character()
  }
}

format_footer_rows <- function(squeezed, rows_missing, rows_total, rows_min) {
  if (length(squeezed) != 0) {
    if (is.na(rows_missing)) {
      "more rows"
    } else if (rows_missing > 0) {
      paste0(big_mark(rows_missing), pluralise_n(" more row(s)", rows_missing))
    }
  } else if (is.na(rows_total) && rows_min > 0) {
    paste0("at least ", big_mark(rows_min), pluralise_n(" row(s) total", rows_min))
  }
}

format_footer_cols <- function(extra_cols, rows_total, rows_min) {
  if (length(extra_cols) == 0) return(NULL)

  vars <- format_extra_vars(extra_cols)
  paste0(
    big_mark(length(extra_cols)), " ",
    if (!identical(rows_total, 0L) && rows_min > 0) "more ",
    pluralise("variable(s)", extra_cols), vars
  )
}

format_extra_vars <- function(extra_cols) {
  # Also covers empty extra_cols vector!
  if (is.na(extra_cols[1])) return("")

  if (anyNA(extra_cols)) {
    extra_cols <- c(extra_cols[!is.na(extra_cols)], symbol$ellipsis)
  }

  paste0(": ", collapse(extra_cols))
}
