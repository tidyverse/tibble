test_that("tibble_abort()", {
  # Must be called from a function whose name starts with `abort_`
  abort_foo <- function() {
    tibble_abort("message", foo = 42, bar = 7)
  }
  expect_cnd_equivalent(
    tryCatch(abort_foo(), error = identity),
    error_cnd(
      class = c("tibble_error_foo", "tibble_error"),
      message = "message",
      foo = 42,
      bar = 7,
      use_cli_format = TRUE
    )
  )
})

test_that("output test", {
  expect_snapshot({
    invalid_df("must be integer", "col", "Fix this.")
    invalid_df("must be numeric", c("col1", "col2"))

    use_repair(TRUE)
    use_repair(FALSE)
  })
})
