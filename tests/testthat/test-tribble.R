context("tribble()")

test_that("tribble() constructs 'tibble' as expected", {

  result <- tribble(
    ~colA, ~colB,
    "a", 1,
    "b", 2
  )

  compared <- tibble(colA = c("a", "b"), colB = c(1, 2))
  expect_equal(result, compared)

  ## wide
  wide <- tribble(
    ~colA, ~colB, ~colC, ~colD,
    1, 2, 3, 4,
    5, 6, 7, 8
  )

  wide_expectation <- tibble(
    colA = c(1, 5),
    colB = c(2, 6),
    colC = c(3, 7),
    colD = c(4, 8)
  )

  expect_equal(wide, wide_expectation)

  ## long
  long <- tribble(
    ~colA, ~colB,
    1, 6,
    2, 7,
    3, 8,
    4, 9,
    5, 10
  )

  long_expectation <- tibble(
    colA = as.numeric(1:5),
    colB = as.numeric(6:10)
  )

  expect_equal(long, long_expectation)

})

test_that("tribble() creates lists for non-atomic inputs (#7)", {
  expect_identical(
    tribble(~a, ~b, NA, "A", letters, LETTERS[-1L]),
    tibble(a = list(NA, letters), b = list("A", LETTERS[-1L]))
  )

  expect_identical(
    tribble(~a, ~b, NA, NULL, 1, 2),
    tibble(a = c(NA, 1), b = list(NULL, 2))
  )
})

test_that("tribble() errs appropriately on bad calls", {

  # invalid colname syntax
  expect_error(tribble(a~b), "single argument")

  # invalid colname syntax
  expect_error(tribble(~a + b), "symbol or string")

  # tribble() must be passed colnames
  expect_error(tribble(
    "a", "b",
    1, 2
  ))

  # tribble() must produce rectangular structure (no filling)
  expect_error(tribble(
    ~a, ~b, ~c,
    1, 2,
    3, 4, 5
  ))

})

test_that("tribble can have list columns", {
  df <- tribble(
    ~x, ~y,
    1,  list(a = 1),
    2,  list(b = 2)
  )
  expect_equal(df$x, c(1, 2))
  expect_equal(df$y, list(list(a = 1), list(b = 2)))
})

test_that("tribble creates n-col empty data frame", {
  df <- tribble(~x, ~y)
  expect_equal(df, tibble(x = logical(), y = logical()))
})

test_that("tribble recognizes quoted non-formula call", {
  df <- tribble(
    ~x, ~y,
    quote(mean(1)), 1
  )
  expect_equal(df$x, list(quote(mean(1))))
  expect_equal(df$y, 1)
})

test_that("tribble returns 0x0 tibble when there's no argument", {
  df <- tribble()
  expect_equal(df, tibble())
})

# ---- frame_matrix() ----

test_that("frame_matrix constructs a matrix as expected", {
  result <- frame_matrix(
    ~col1, ~col2,
    10,     3,
    5,     2
  )
  expected <- matrix(c(10, 5, 3, 2), ncol = 2)
  colnames(expected) <- c("col1", "col2")
  expect_equal(result, expected)
})

test_that("frame_matrix constructs empty matrix as expected", {
  result <- frame_matrix(
    ~col1, ~col2
  )
  expected <- matrix(logical(), ncol = 2)
  colnames(expected) <- c("col1", "col2")
  expect_equal(result, expected)
})

test_that("frame_matrix cannot have list columns", {
  expect_error(frame_matrix(
    ~x,  ~y,
    "a", 1:3,
    "b", 4:6
  ), "cannot have list columns")
})
