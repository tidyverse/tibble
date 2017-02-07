context("enframe")


# enframe -----------------------------------------------------------------

test_that("can convert unnamed vector", {
  expect_identical(enframe(3:1),
                   tibble(name = 1:3, value = 3:1))
})

test_that("can convert named vector", {
  expect_identical(enframe(c(a = 2, b = 1)),
                   tibble(name = letters[1:2], value = as.numeric(2:1)))
})

test_that("can convert zero-length vector", {
  expect_identical(enframe(logical()),
                   tibble(name = integer(), value = logical()))
})

test_that("can use custom names", {
  expect_identical(enframe(letters, name = "index", value = "letter"),
                   tibble(index = seq_along(letters),
                          letter = letters))
})


# deframe -----------------------------------------------------------------

test_that("can deframe two-column data frame", {
  expect_identical(deframe(tibble(name = letters[1:3], value = 3:1)),
                   c(a = 3L, b = 2L, c = 1L))
})
