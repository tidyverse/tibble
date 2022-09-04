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

expect_snapshot_with_error <- function(code) {
  code <- rlang::enexpr(code)

  if (packageVersion("testthat") >= "3.1.1") {
    rlang::eval_tidy(rlang::quo(expect_snapshot(variant = rlang_variant(), !!code, error = TRUE)))
  } else if (packageVersion("testthat") > "3.0.0") {
    rlang::eval_tidy(rlang::quo(expect_snapshot(!!code, error = TRUE)))
  } else {
    rlang::eval_tidy(rlang::quo(expect_snapshot(!!code)))
  }
}

rlang_variant <- function() {
  NULL
}

rlang_pillar_variant <- function() {
  NULL
}
