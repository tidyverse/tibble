test_that("tibble_abort()", {
  # Must be called from a function whose name starts with `abort_`
  abort_foo <- function(call = caller_env()) {
    tibble_abort("message", call = call, foo = 42, bar = 7)
  }
  cnd <- tryCatch(abort_foo(), error = identity)

  expect_s3_class(
    cnd,
    c("tibble_error_foo", "tibble_error", "rlang_error", "error", "condition"),
    exact = TRUE
  )
  expect_equal(cnd$message, "message")
  expect_equal(cnd$foo, 42)
  expect_equal(cnd$bar, 7)
  expect_true(cnd$use_cli_format)
})

test_that("output test", {
  expect_snapshot({
    invalid_df("must be integer", "col", "Fix this.")
    invalid_df("must be numeric", c("col1", "col2"))

    use_repair(TRUE)
    use_repair(FALSE)
  })
})
