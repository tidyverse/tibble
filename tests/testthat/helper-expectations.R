expect_error_cnd <- function(object, class, message = NULL, ..., .fixed = TRUE) {
  cnd <- expect_error(object, regexp = message, class = class, fixed = .fixed)
  expect_true(inherits_all(cnd, class))

  exp_fields <- list2(...)
  if (has_length(exp_fields)) {
    expect_true(is_empty(setdiff(!!names(exp_fields), names(cnd))))
    expect_equal(cnd[names(exp_fields)], exp_fields)
  }
}

expect_error_relax <- function(object, ...) {
  expect_error(object)
}
