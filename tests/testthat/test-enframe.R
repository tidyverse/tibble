context("enframe")


# enframe -----------------------------------------------------------------

test_that("can convert unnamed vector", {
  expect_identical(
    enframe(3:1),
    tibble(name = 1:3, value = 3:1)
  )
})

test_that("can convert unnamed list", {
  expect_identical(
    enframe(as.list(3:1)),
    tibble(name = 1:3, value = as.list(3:1))
  )
})

test_that("can convert named vector", {
  expect_identical(
    enframe(c(a = 2, b = 1)),
    tibble(name = letters[1:2], value = as.numeric(2:1))
  )
})

test_that("can convert zero-length vector", {
  expect_identical(
    enframe(logical()),
    tibble(name = integer(), value = logical())
  )
})

test_that("can convert NULL (#352)", {
  expect_identical(
    enframe(NULL),
    tibble(name = integer(), value = logical())
  )
})

test_that("can use custom names", {
  expect_identical(
    enframe(letters, name = "index", value = "letter"),
    tibble(
      index = seq_along(letters),
      letter = letters
    )
  )
})

test_that("can enframe without names", {
  expect_identical(
    enframe(letters, name = NULL, value = "letter"),
    tibble(letter = letters)
  )
})

test_that("can't use value = NULL", {
  expect_error(
    enframe(letters, value = NULL),
    error_enframe_value_null(),
    fixed = TRUE
  )
})

test_that("can't pass objects with dimensions", {
  expect_error(
    enframe(iris),
    error_enframe_has_dim(iris),
    fixed = TRUE
  )
})


# deframe -----------------------------------------------------------------

test_that("can deframe two-column data frame", {
  expect_identical(
    deframe(tibble(name = letters[1:3], value = 3:1)),
    c(a = 3L, b = 2L, c = 1L)
  )
})

test_that("can deframe one-column data frame", {
  expect_identical(
    deframe(tibble(value = 3:1)),
    3:1
  )
})

test_that("can deframe tibble with list column", {
  expect_identical(
    deframe(tibble(name = letters[1:3], value = as.list(3:1))),
    setNames(as.list(3:1), nm = letters[1:3])
  )
})

test_that("can deframe three-column data frame with warning", {
  expect_warning(
    expect_identical(
      deframe(tibble(name = letters[1:3], value = 3:1, oops = 1:3)),
      c(a = 3L, b = 2L, c = 1L)
    ),
    "one- or two-column",
    fixed = TRUE
  )
})
