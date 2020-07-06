as_override_type_sum <- function(x) {
  structure(x, class = "override_type_sum")
}

type_sum.override_type_sum <- function(x, ...) {
  "SC"
}

registerS3method("type_sum", "override_type_sum", type_sum.override_type_sum, envir = asNamespace("pillar"))

`[.override_type_sum` <- function(x, ...) {
  as_override_type_sum(NextMethod())
}

registerS3method("[", "override_type_sum", `[.override_type_sum`, envir = asNamespace("tibble"))

as_override_tbl_sum <- function(x) {
  structure(x, class = c("override_tbl_sum", class(x)))
}

tbl_sum.override_tbl_sum <- function(x, ...) {
  c(NextMethod(), "Overridden" = "tbl_sum")
}

registerS3method("tbl_sum", "override_tbl_sum", tbl_sum.override_tbl_sum, envir = asNamespace("tibble"))
