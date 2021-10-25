test_that("set_repaired_names()", {
  x <- set_names(1:3, letters[1:3])
  expect_equal(set_repaired_names(x), x)
  expect_tibble_error(set_repaired_names(1, repair_hint = FALSE), error_column_names_cannot_be_empty(1, repair_hint = FALSE))
})

test_that("repaired_names()", {
  expect_equal(repaired_names(letters[1:3], repair_hint = FALSE), letters[1:3])
  expect_tibble_error(repaired_names(c(""), repair_hint = FALSE), error_column_names_cannot_be_empty(1, repair_hint = FALSE))
  expect_tibble_error(repaired_names(c("..1"), repair_hint = FALSE), error_column_names_cannot_be_dot_dot(1, repair_hint = FALSE))
  expect_tibble_error(repaired_names(c("a", "a"), repair_hint = FALSE), error_column_names_must_be_unique("a", repair_hint = FALSE))
  expect_equal(repaired_names(c("a", "a"), .name_repair = "minimal"), c("a", "a"))
})

test_that("output test", {
  skip_if_not_installed("vctrs", "0.3.8.9001")

  expect_snapshot_with_error({
    repaired_names(letters[1:3], repair_hint = FALSE)
    repaired_names("", repair_hint = FALSE)
    repaired_names("", repair_hint = TRUE)
    repaired_names(c("a", "a"), repair_hint = FALSE)
    repaired_names("..1", repair_hint = FALSE)
    repaired_names(c("a", "a"), repair_hint = FALSE, .name_repair = "universal")
    repaired_names(c("a", "a"), repair_hint = FALSE, .name_repair = "universal", quiet = TRUE)
    repaired_names(c("if"), repair_hint = FALSE, .name_repair = "universal")
  })
})
