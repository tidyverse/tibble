context("add")

# add_row ---------------------------------------------------------------

test_that("can add new row", {
  df_all_new <- add_row(df_all, a = 4, b = 3L)
  expect_identical(colnames(df_all_new), colnames(df_all))
  expect_identical(nrow(df_all_new), nrow(df_all) + 1L)
  expect_identical(df_all_new$a, c(df_all$a, 4))
  expect_identical(df_all_new$b, c(df_all$b, 3L))
  expect_identical(df_all_new$c, c(df_all$c, NA))
})

test_that("add_row() keeps class of object", {
  iris_new <- add_row(iris, Species = "unknown")
  expect_equal(class(iris), class(iris_new))

  iris_new <- add_row(as_tibble(iris), Species = "unknown")
  expect_equal(class(as_tibble(iris)), class(iris_new))
})

test_that("adds empty row if no arguments", {
  new_iris_row <- add_row(iris)[nrow(iris) + 1, , drop = TRUE]
  expect_true(all(is.na(new_iris_row)))
})

test_that("error if adding row with unknown variables", {
  expect_error(add_row(tibble(a = 3), xxyzy = "err"),
               "would add new variables")
})

test_that("can add multiple rows", {
  df <- tibble(a = 3L)
  df_new <- add_row(df, a = 4:5)
  expect_identical(nrow(df_new), nrow(df) + 2L)
  expect_identical(df_new$a, 3:5)
})

test_that("can recycle when adding rows", {
  iris_new <- add_row(iris, Sepal.Length = -1:-2, Species = "unknown")
  expect_identical(nrow(iris_new), nrow(iris) + 2L)
  expect_identical(iris_new$Sepal.Length, c(iris$Sepal.Length, -1:-2))
  expect_identical(as.character(iris_new$Species),
                   c(as.character(iris$Species), "unknown", "unknown"))
})

# add_column ------------------------------------------------------------

test_that("can add new column", {
  df_all_new <- add_column(df_all, j = 1:3, k = 3:1)
  expect_identical(nrow(df_all_new), nrow(df_all))
  expect_identical(df_all_new[seq_along(df_all)], df_all)
  expect_identical(df_all_new$j, 1:3)
  expect_identical(df_all_new$k, 3:1)
})

test_that("add_column() keeps class of object", {
  iris_new <- add_column(iris, x = 1:150)
  expect_equal(class(iris), class(iris_new))

  iris_new <- add_column(as_tibble(iris), x = 1:150)
  expect_equal(class(as_tibble(iris)), class(iris_new))
})

test_that("add_column() keeps unchanged if no arguments", {
  expect_identical(iris, add_column(iris))
})

test_that("error if adding existing columns", {
  expect_error(add_column(tibble(a = 3), a = 5),
               "Columns already in data frame")
})

test_that("error if adding wrong number of rows with add_column()", {
  expect_error(add_column(tibble(a = 3), b = 4:5),
               "Expected 1 rows, got 2")
})

test_that("can add multiple columns", {
  df <- tibble(a = 1:3)
  df_new <- add_column(df, b = 4:6, c = 3:1)
  expect_identical(ncol(df_new), ncol(df) + 2L)
  expect_identical(df_new$b, 4:6)
  expect_identical(df_new$c, 3:1)
})

test_that("can recycle when adding columns", {
  df <- tibble(a = 1:3)
  df_new <- add_column(df, b = 4, c = 3:1)
  expect_identical(ncol(df_new), ncol(df) + 2L)
  expect_identical(df_new$b, rep(4, 3))
  expect_identical(df_new$c, 3:1)
})
