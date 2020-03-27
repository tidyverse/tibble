test_that("set_repaired_names()", {
  x <- set_names(1:3, letters[1:3])
  expect_equal(set_repaired_names(x), x)
  expect_tibble_error(set_repaired_names(1), error_column_names_cannot_be_empty(1))
})

test_that("repaired_names()", {
  expect_equal(repaired_names(letters[1:3]), letters[1:3])
  expect_tibble_error(repaired_names(c("")), error_column_names_cannot_be_empty(1))
  expect_tibble_error(repaired_names(c("..1")), error_column_names_cannot_be_dot_dot(1))
  expect_tibble_error(repaired_names(c("a", "a")), error_column_names_must_be_unique("a"))
  expect_equal(repaired_names(c("a", "a"), .name_repair = "minimal"), c("a", "a"))
})

verify_output("names.txt", {
  repaired_names(letters[1:3])
  repaired_names("")
  repaired_names(c("a", "a"))
  repaired_names("..1")
  repaired_names(c("a", "a"), .name_repair = "universal")
  repaired_names(c("a", "a"), .name_repair = "universal", quiet = TRUE)
  repaired_names(c("if"), .name_repair = "universal")
})
