context("lst")

test_that("lst handles named and unnamed NULL arguments", {
  expect_equivalent(lst(NULL), list("NULL" = NULL))
  expect_identical(lst(a = NULL), list(a = NULL))
  expect_identical(
    lst(NULL, b = NULL, 1:3),
    list("NULL" = NULL, b = NULL, "1:3" = 1:3)
  )
})

test_that("lst handles internal references", {
  expect_identical(lst(a = 1, b = a), list(a = 1, b = 1))
  expect_identical(lst(a = NULL, b = a), list(a = NULL, b = NULL))
})

test_that("lst supports duplicate names (#291)", {
  expect_identical(lst(a = 1, a = a + 1, b = a), list(a = 1, a = 2, b = 2))
  expect_identical(lst(b = 1, a = b, a = b + 1, b = a), list(b = 1, a = 1, a = 2, b = 2))
})
