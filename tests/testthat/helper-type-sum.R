as_override_type_sum <- function(x) {
  structure(x, class = "override_type_sum")
}

type_sum.override_type_sum <- function(x, ...) {
  "SC"
}

registerS3method("type_sum", "override_type_sum", type_sum.override_type_sum)
