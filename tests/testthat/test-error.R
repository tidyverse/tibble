test_that("tibble_error()", {
  # Must be called from a function whose name starts with `error_`
  error_foo <- function() {
    tibble_error("message", foo = 42, bar = 7)
  }
  expect_identical(
    error_foo(),
    error_cnd(
      class = c("tibble_error_foo", "tibble_error"),
      message = "message",
      foo = 42,
      bar = 7
    )
  )
})

test_that("output test", {
  expect_snapshot({
    invalid_df("must be integer", "col", "\nFix this.")
    invalid_df("must be numeric", c("col1", "col2"))

    use_repair(TRUE)
    use_repair(FALSE)
  })
})
