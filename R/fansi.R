# Original source: https://github.com/tidyverse/tibble/blob/master/R/fansi.R

set_fansi_hooks <- function() {
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
  # Fallback if fansi is missing
  if (is_installed("fansi")) {
    sgr_to_html <- fansi::sgr_to_html
  } else {
    sgr_to_html <- identity
  }

  function(x, options) {
    # lines <- strsplit(x, "\\n")[[1]]
    lines <- x
    if (type != "output") {
      lines <- crayon::red(lines)
    }
    paste0(
      '<div class="sourceCode"><pre class="sourceCode"><code class="sourceCode">',
      paste0(
        sgr_to_html(htmltools::htmlEscape(lines)),
        collapse = "\n"
      ),
      "</code></pre></div>"
    )
  }
}
