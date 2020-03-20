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
  expect_tibble_error(
    enframe(letters, value = NULL),
    error_enframe_value_null()
  )
})

test_that("can pass vectors (#730)", {
  a <- c(x = 1)
  b <- data.frame(bb = 1, row.names = "y")
  c <- matrix(1, dimnames = list(rows = "z", cols = "cc"))

  au <- c(1)
  bu <- data.frame(bb = 1)
  cu <- matrix(1, dimnames = list(rows = NULL, cols = "cc"))

  expect_identical(enframe(a, name = NULL), tibble(value = au))
  expect_identical(enframe(b, name = NULL), tibble(value = bu))
  expect_identical(enframe(c, name = NULL), tibble(value = cu))

  expect_identical(enframe(a), tibble(name = "x", value = au))
  expect_identical(enframe(b), tibble(name = "y", value = bu))
  expect_identical(enframe(c), tibble(name = "z", value = cu))

  expect_tibble_error(
    enframe(lm(speed ~ ., cars)),
    error_enframe_must_be_vector(lm(speed ~ ., cars))
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

verify_output("enframe.txt", {
  enframe(1:3, value = NULL)

  enframe(Titanic)
})
