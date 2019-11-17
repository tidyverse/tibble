# is_tibble ---------------------------------------------------------------

test_that("is_tibble", {
  expect_false(is_tibble(iris))
  expect_true(is_tibble(as_tibble(iris)))
  expect_false(is_tibble(NULL))
  expect_false(is_tibble(0))
})

test_that("is_tibble", {
  scoped_lifecycle_silence()
  expect_identical(is.tibble(iris), is_tibble(iris))
})
