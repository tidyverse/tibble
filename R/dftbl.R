set_dftbl_hooks <- function() {
  width <- 40

  set_dftbl_opts_hook(width)
  set_dftbl_knit_hook(width)
  set_dftbl_source_hook()
  set_dftbl_chunk_hook()
  set_dftbl_error_hook()
  set_dftbl_warning_hook()
}

# Defines a `dftbl` knitr option. If this chunk option is set, code is duplicated
# (running with tibbles or data frames, respectively): one line of df code
# followed by the same line of the corresponding tibble code.
# The code is also evaluated, if the results are identical (disregarding the
# class), only the tibble copy is retained.
#
set_dftbl_opts_hook <- function(width) {
  force(width)

  dftbl_opts_hook <- function(options) {
    df_code <- options$code
    tbl_code <- gsub("df", "tbl", df_code, fixed = TRUE)

    # FIXME: Evaluate, but surround in <details> element
    if (!isTRUE(options$dftbl_always) && isTRUE(options$eval)) {
      same <- map2_lgl(df_code, tbl_code, same_as_tbl_code)
      df_code[same] <- ""
    }

    new_code <- as.vector(t(matrix(c(df_code, tbl_code), ncol = 2)))
    options$code <- new_code
    options$width <- width - 4
    options
  }

  knitr::opts_hooks$set(dftbl = dftbl_opts_hook)
}

utils::globalVariables(c("new_df", "new_tbl"))

same_as_tbl_code <- function(df_code, tbl_code) {
  handler <- evaluate::new_output_handler(
    value = function(x, visible) {
      if (visible) x else NULL
    }
  )

  same_as_tbl(
    evaluate::evaluate(df_code, output_handler = handler),
    evaluate::evaluate(tbl_code, output_handler = handler)
  )
}

same_as_tbl <- function(df, tbl) {
  if (length(df) != length(tbl)) return(FALSE)
  if (length(df) < 2) return(FALSE)
  df <- df[-1]
  tbl <- tbl[-1]

  df_obj <- df[[length(df)]]
  tbl_obj <- tbl[[length(tbl)]]

  if (is.data.frame(df_obj) != is.data.frame(tbl_obj)) return(FALSE)

  if (is.data.frame(tbl_obj)) {
    df[[length(df)]] <- as_tibble_deep(df_obj)

  }

  identical(df, tbl)
}

as_tibble_deep <- function(x) {
  is_tibble <- which(map_lgl(x, is.data.frame))
  x[is_tibble] <- map(x[is_tibble], as_tibble)
  as_tibble(x)
}

# dftbl chunks have a reduced width
set_dftbl_knit_hook <- function(width) {
  force(width)

  # Need to use a closure here to keep state
  old_width <- NULL

  dftbl_knit_hook <- function(before, options, envir) {
    if (before) {
      old_width <<- options(width = width)
    } else {
      options(old_width)
      old_width <<- NULL
    }
  }

  knitr::knit_hooks$set(dftbl = dftbl_knit_hook)
}

# dftbl chunks are shown side by side, with the help of an HTML table.
# Each source chunk introduces a new table cell, even chunks also introduce
# a new table row.
# vertical-align: top keeps the table rows nicely aligned.
# This places some limitations on the chunk sources but works well so far.
set_dftbl_source_hook <- function() {
  # Need to use a closure here to daisy-chain hooks and to keep state

  old_source_hook <- knitr::knit_hooks$get("source")

  dftbl_source_even <- TRUE

  dftbl_source_hook_one <- function(x) {
    if (dftbl_source_even) {
      x <- paste0('</td></tr><tr style="vertical-align:top"><td>\n\n', x)
    } else {
      x <- paste0("</td><td>\n\n", x)
    }

    dftbl_source_even <<- !dftbl_source_even
    x
  }

  dftbl_source_hook <- function(x, options) {
    nonempty <- which(x != "")
    x[nonempty] <- vapply(x[nonempty], old_source_hook, options, FUN.VALUE = character(1))
    if (isTRUE(options$dftbl)) {
      x <- vapply(x, dftbl_source_hook_one, FUN.VALUE = character(1))
    }
    paste(x, collapse = "\n")
  }

  knitr::knit_hooks$set(source = dftbl_source_hook)
}

# The entire chunk needs to be surrounded by <table><tbody><tr><td>...</...> .
# We use the dftbl CSS class for the HTML table.
set_dftbl_chunk_hook <- function() {
  # Need to use a closure here to daisy-chain hooks

  old_chunk_hook <- knitr::knit_hooks$get("chunk")

  dftbl_chunk_hook <- function(x, options) {
    x <- old_chunk_hook(x, options)
    if (isTRUE(options$dftbl)) {
      x <- paste0('<table class="dftbl"><tbody><tr><td>\n\n', x, "\n\n</td></tr></tbody></table>")
      x <- gsub("<tr><td>\n\n</td></tr>", "", x, fixed = TRUE)
    }
    x
  }

  knitr::knit_hooks$set(chunk = dftbl_chunk_hook)
}

# I don't understand why knitr doesn't wrap error output.
set_dftbl_error_hook <- function() {
  # Need to use a closure here to daisy-chain hooks

  old_error_hook <- knitr::knit_hooks$get("error")

  dftbl_error_hook <- function(x, options) {
    if (isTRUE(options$dftbl)) {
      x <- strsplit(x, "\n", fixed = TRUE)[[1]]
      x <- unlist(map(x, fansi::strwrap_sgr, getOption("width") + 4, prefix = "#> ", initial = ""))
      x <- paste(paste0(x, "\n"), collapse = "")
    }
    x <- old_error_hook(x, options)
    paste0('<div class="error">', x, '</div>')
  }

  knitr::knit_hooks$set(error = dftbl_error_hook)
}

# I don't understand why knitr doesn't wrap warning output.
set_dftbl_warning_hook <- function() {
  # Need to use a closure here to daisy-chain hooks

  old_warning_hook <- knitr::knit_hooks$get("warning")

  dftbl_warning_hook <- function(x, options) {
    if (isTRUE(options$dftbl)) {
      x <- strsplit(x, "\n", fixed = TRUE)[[1]]
      x <- unlist(map(x, fansi::strwrap_sgr, getOption("width") + 4, prefix = "#> ", initial = ""))
      x <- paste(paste0(x, "\n"), collapse = "")
    }
    x <- old_warning_hook(x, options)
    paste0('<div class="warning">', x, '</div>')
  }

  knitr::knit_hooks$set(warning = dftbl_warning_hook)
}
