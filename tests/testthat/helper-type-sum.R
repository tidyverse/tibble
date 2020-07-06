as_override_type_sum <- function(x) {
  structure(x, class = "override_type_sum")
}

type_sum.override_type_sum <- function(x, ...) {
  "SC"
}

vctrs::s3_register("pillar::type_sum", "override_type_sum")

`[.override_type_sum` <- function(x, ...) {
  as_override_type_sum(NextMethod())
}

vctrs::s3_register("base::[", "override_type_sum")

as_override_tbl_sum <- function(x) {
  structure(x, class = c("override_tbl_sum", class(x)))
}

tbl_sum.override_tbl_sum <- function(x, ...) {
  c(NextMethod(), "Overridden" = "tbl_sum")
}

vctrs::s3_register("tibble::tbl_sum", "override_tbl_sum")
