#' Get codebook information of the variable
#'
codebook <- function(x, width = NULL, ...) {
  UseMethod("codebook")
}

codebook.numeric <- function(x, width = NULL) {
  width <- tibble_width(width)

  padleft <- function(s) format(s, w = width / 3, justify = "right")
  # align <- function(s) format(c(s, "unique values: "), justify = "right")[1]

  type <- paste0(padleft("type: "), type_sum(x))
  range <- paste0(padleft("range: "), "[",
                  format(min(x, na.rm = TRUE), digits = 3), ", ",
                  format(max(x, na.rm = TRUE), digits = 3), "]")

  unique_values <- paste0(padleft("unique values: "), length(unique(x)))
  missing <- paste0("missing: ", paste0(sum(is.na(x)), "/", length(x)))

  mean <- paste0(padleft("mean: "), format(mean(x, na.rm = TRUE), digits = 3))
  stddev <- paste0(padleft("std. dev.: "), format(sd(x, na.rm = TRUE), digits = 3))

  percentile <- format(c("10%", "25%", "50%", "75%", "90%",
                       format(quantile(x, c(0.1, 0.25, 0.5, 0.75, 0.9)), digits = 3)))

  cat(codebook_header(x, width = width))
  cat(type, "\n", "\n", range, "\n", sep = "")
  cat(paste0(unique_values,
             format(missing, w = width / 3, justify = "right")), "\n", "\n", sep = "")
  cat(mean, "\n", stddev, "\n", "\n", sep = "")
  cat(padleft("percentiles: "), paste(percentile[1:5], collapse = " "), "\n",
      padleft(" "), paste(percentile[6:10], collapse = " "), sep = "")
}

codebook_header <- function(x, width) {
  cat(rep('-', width), "\n", sep = "")

  var_name <- deparse(substitute(x, env = parent.frame()))
  var_label <- format(attr(x, "label"), w = width - nchar(var_name), justify = "right")
  cat(var_name, var_label, "\n", sep = "")

  cat(rep('-', width), "\n", sep = "")
}
