context("matrix")

test_that("correct rows and cols", {
  x <- matrix(1:6, nrow = 2)
  out <- as_tibble(x, .name_repair = "minimal")

  expect_equal(dim(out), c(2, 3))
})

test_that("correct rows and cols for 0 cols", {
  x <- matrix(integer(), nrow = 2)
  out <- as_tibble(x, .name_repair = "minimal")

  expect_equal(dim(out), c(2, 0))
})

test_that("correct rows and cols for 0 cols and legacy naming", {
  scoped_lifecycle_silence()

  x <- matrix(integer(), nrow = 2)
  out <- as_tibble(x)

  expect_equal(dim(out), c(2, 0))
})

test_that("correct rows and cols for 0 rows", {
  x <- matrix(integer(), ncol = 3)
  out <- as_tibble(x, .name_repair = "minimal")

  expect_equal(dim(out), c(0, 3))
})

test_that("preserves col names", {
  x <- matrix(1:4, nrow = 2)
  colnames(x) <- c("a", "b")

  out <- as_tibble(x)
  expect_equal(names(out), c("a", "b"))
})

test_that("supports compat col names", {
  scoped_lifecycle_silence()

  x <- matrix(1:4, nrow = 2)

  out <- as_tibble(x)
  expect_equal(names(out), c("V1", "V2"))
})

test_that("creates col names with name repair", {
  x <- matrix(1:4, nrow = 2)

  out <- as_tibble(x, .name_repair = "unique")
  expect_equal(names(out), c("...1", "...2"))

  out <- as_tibble(x, .name_repair = "universal")
  expect_equal(names(out), c("...1", "...2"))
})

test_that("preserves attributes except dim and names", {
  date <- Sys.Date() + 0:3
  dim(date) <- c(2, 2)
  colnames(date) <- c("a", "b")
  attr(date, "special") <- 42

  out <- as_tibble.matrix(date)
  expect_null(attributes(out[[1]])$names)
  expect_equal(attributes(out[[1]])$class, "Date")
  expect_equal(attributes(out[[2]])$special, 42)
})

test_that("properly handles poly class (#110)", {
  p <- poly(1:6, 3)
  p_df <- as_tibble(p)

  expect_equal(names(p_df), colnames(p))
  expect_equal(class(p_df[[1L]]), class(p[, 1]))
})

test_that("handles atomic vectors", {
  x <- matrix(TRUE, nrow = 2)
  out <- as_tibble(x, .name_repair = "minimal")
  expect_equal(out[[1]], c(TRUE, TRUE))

  x <- matrix(1L, nrow = 2)
  out <- as_tibble(x, .name_repair = "minimal")
  expect_equal(out[[1]], c(1L, 1L))

  x <- matrix(1.5, nrow = 2)
  out <- as_tibble(x, .name_repair = "minimal")
  expect_equal(out[[1]], c(1.5, 1.5))

  x <- matrix("a", nrow = 2)
  out <- as_tibble(x, .name_repair = "minimal")
  expect_equal(out[[1]], c("a", "a"))

  x <- matrix(complex(real = 1, imag = 2), nrow = 2)
  out <- as_tibble(x, .name_repair = "minimal")
  expect_equal(out[[1]], as.vector(x))
})

test_that("forwarding to as.data.frame() for ts objects (#184)", {
  mts <- cbind(
    A = ts(c(1, 1, 2, 2),     start = 2016, freq = 4),
    B = ts(c(11, 11, 12, 13), start = 2016, freq = 4)
  )
  expect_identical(as_tibble(mts), as_tibble(as.data.frame(mts)))
})


test_that("converting from matrix removes row names by default", {
  x <- matrix(1:30, 6, 5, dimnames = list(letters[1:6], LETTERS[1:5]))
  df <- data.frame(A = 1:6, B = 7:12, C = 13:18, D = 19:24, E = 25:30)
  out <- as_tibble(x)
  expect_false(has_rownames(out))
  expect_identical(out, as_tibble(df))
})

test_that("converting from matrix keeps row names if argument has them, with rownames = NA", {
  x <- matrix(1:30, 6, 5, dimnames = list(letters[1:6], LETTERS[1:5]))
  df <- data.frame(
    A = 1:6, B = 7:12, C = 13:18, D = 19:24, E = 25:30,
    row.names = letters[1:6]
  )

  out <- as_tibble(x, rownames = NA)
  expect_identical(rownames(out), rownames(x))
  expect_identical(remove_rownames(out), as_tibble(df))
})

test_that("converting from matrix supports storing row names in a column", {
  x <- matrix(1:30, 6, 5, dimnames = list(letters[1:6], LETTERS[1:5]))
  df <- tibble(id = letters[1:6], A = 1:6, B = 7:12, C = 13:18, D = 19:24, E = 25:30)
  out <- as_tibble(x, rownames = "id")
  expect_identical(out, df)
})

test_that("converting from matrix throws an error if user turns missing row names into column", {
  x <- matrix(1:30, 6, 5)
  expect_error(
    as_tibble(x, rownames = "id", .name_repair = "minimal"),
    error_as_tibble_needs_rownames(),
    fixed = TRUE
  )
})
