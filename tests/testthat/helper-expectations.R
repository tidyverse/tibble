expect_tibble_error <- function(object, cnd, fixed = NULL) {
  cnd_actual <- expect_error(object, class = class(cnd)[[1]])
  expect_cnd_equivalent(cnd_actual, cnd)
  expect_s3_class(cnd_actual, class(cnd), exact = TRUE)
}

expect_cnd_equivalent <- function(actual, expected) {
  actual$trace <- NULL
  actual$parent <- NULL
  actual$body <- NULL
  expected$trace <- NULL
  expected$parent <- NULL
  expected$body <- NULL
  expect_equal(actual, expected)
}

rlang_variant <- function() {
  NULL
}

rlang_pillar_variant <- function() {
  NULL
}
