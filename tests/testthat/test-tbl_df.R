test_that("as.data.frame()", {
  df <- data.frame(a = 1:3)
  expect_identical(as.data.frame(as_tibble(df)), df)
})

test_that("as.data.frame() strips inner names (#837)", {
  tbl <- tibble(a = c(b = 1:3))
  expect_identical(as.data.frame(tbl)$a, 1:3)
})

test_that("as.data.frame() keeps inner names for lists (#837)", {
  tbl <- tibble(a = list(b = 1:3))
  expect_identical(as.data.frame(tbl)$a, list(b = 1:3))
})

test_that("as.data.frame() keeps inner names for records", {
  tbl <- tibble(x = new_rcrd(list(a = 1:3)))
  expect_identical(as.data.frame(tbl)$x, new_rcrd(list(a = 1:3)))
})

test_that("as.data.frame() keeps zero-column data frames and matrices (#970)", {
  tbl <- tibble(x = 1:2, y = new_tibble(list(), nrow = 2))
  expect_identical(as.data.frame(tbl)$y, tbl$y)

  mat <- tibble(x = 1:2, y = matrix(integer(), nrow = 2))
  expect_identical(as.data.frame(mat)$y, mat$y)
})

test_that("names<-()", {
  new_tbl <- function(...) {
    data <- list(1, "b")
    names(data) <- c(...)
    new_tibble(data, nrow = 1)
  }

  set_tbl_names <- function(names) {
    tbl_copy <- new_tbl("a", "b")
    names(tbl_copy) <- names
    tbl_copy
  }

  expect_equal(set_tbl_names(c("c", "d")), new_tbl("c", "d"))
})
