test_that("has_tibble_arg()", {
  # Need to evaluate has_tibble_arg() in the context of an exported function
  # Need to increase the number of frames because running in testthat
  expect_true(tibble(has = has_tibble_arg(".name_repair", n_frames = 60))$has)
  expect_false(tibble(has = has_tibble_arg("dont_have_that_argument", n_frames = 60))$has)
})

test_that("tibble_error()", {
  # Must be called from a function whose name starts with `error_`
  error_foo <- function() {
    tibble_error("message", foo = 42, bar = 7)
  }
  expect_identical(
    error_foo(),
    error_cnd(
      .subclass = c("tibble_error_foo", "tibble_error"),
      message = "message",
      foo = 42,
      bar = 7
    )
  )
})

verify_output("error.txt", {
  invalid_df("must be integer", "col", "\nFix this.")
  invalid_df("must be numeric", c("col1", "col2"))

  use_repair(TRUE)
  use_repair(FALSE)
})
