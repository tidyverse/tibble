# nocov start - https://github.com/tidyverse/tibble/blob/main/R/ansi.R
set_ansi_hooks <- function() {
  knitr::opts_chunk$set(collapse = TRUE)

  if (Sys.getenv("IN_GALLEY") != "") {
    knitr::opts_chunk$set(comment = "#>")
    return()
  }

  knitr::opts_chunk$set(comment = pillar::style_subtle("#>"))

  options(cli.num_colors = 256)
  options(pillar.bold = TRUE)

  knitr::knit_hooks$set(
    output = colourise_chunk("output"),
    message = colourise_chunk("message"),
    warning = colourise_chunk("warning"),
    error = colourise_chunk("error")
  )

  invisible()
}

colourise_chunk <- function(type) {
  function(x, options) {
    # lines <- strsplit(x, "\\n")[[1]]
    lines <- x
    if (type != "output") {
      lines <- cli::col_red(lines)
    }
    paste0(
      '<div class="sourceCode"><pre class="sourceCode"><code class="sourceCode">',
      paste0(
        cli::ansi_html(htmltools::htmlEscape(lines)),
        collapse = "\n"
      ),
      "</code></pre></div>"
    )
  }
}
# nocov end
