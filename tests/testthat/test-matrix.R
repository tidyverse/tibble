context("matrix")

test_that("correct rows and cols", {
  x <- matrix(1:6, nrow = 2)
  out <- as_tibble(x)

  expect_equal(dim(out), c(2, 3))
})

test_that("preserves col names", {
  x <- matrix(1:4, nrow = 2)
  colnames(x) <- c("a", "b")

  out <- as_tibble(x)
  expect_equal(names(out), c("a", "b"))
})

test_that("creates col names", {
  x <- matrix(1:4, nrow = 2)

  out <- as_tibble(x)
  expect_equal(names(out), c("V1", "V2"))
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
  expect_equal(class(p_df[[1L]]), class(p[,1]))
})

test_that("handles atomic vectors", {
  x <- matrix(TRUE, nrow = 2)
  out <- as_tibble(x)
  expect_equal(out[[1]], c(TRUE, TRUE))

  x <- matrix(1L, nrow = 2)
  out <- as_tibble(x)
  expect_equal(out[[1]], c(1L, 1L))

  x <- matrix(1.5, nrow = 2)
  out <- as_tibble(x)
  expect_equal(out[[1]], c(1.5, 1.5))

  x <- matrix("a", nrow = 2)
  out <- as_tibble(x)
  expect_equal(out[[1]], c("a", "a"))

  x <- matrix(complex(real = 1, imag = 2), nrow = 2)
  out <- as_tibble(x)
  expect_equal(out[[1]], as.vector(x))
})

test_that("auto-assigning names", {
  expect_identical(as_tibble(diag(3L)),
                   as_tibble(as.data.frame(diag(3L))))
})

test_that("forwarding to as.data.frame() for ts objects (#184)", {
  mts <- cbind(
    A = ts(c(1, 1, 2, 2),     start = 2016, freq = 4),
    B = ts(c(11, 11, 12, 13), start = 2016, freq = 4))
  expect_identical(as_tibble(mts), as_tibble(as.data.frame(mts)))
})
