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

test_that("add_row() keeps class of object when adding in the middle", {
  iris_new <- add_row(iris, Species = "unknown", .after = 10)
  expect_equal(class(iris), class(iris_new))

  iris_new <- add_row(as_tibble(iris), Species = "unknown")
  expect_equal(class(as_tibble(iris)), class(iris_new))
})

test_that("add_row() keeps class of object when adding in the beginning", {
  iris_new <- add_row(iris, Species = "unknown", .after = 0)
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
  expect_identical(df_new, tibble(a = 3:5))
})

test_that("can recycle when adding rows", {
  iris_new <- add_row(iris, Sepal.Length = -1:-2, Species = "unknown")
  expect_identical(nrow(iris_new), nrow(iris) + 2L)
  expect_identical(iris_new$Sepal.Length, c(iris$Sepal.Length, -1:-2))
  expect_identical(as.character(iris_new$Species),
                   c(as.character(iris$Species), "unknown", "unknown"))
})

test_that("can add as first row via .before = 1", {
  df <- tibble(a = 3L)
  df_new <- add_row(df, a = 2L, .before = 1)
  expect_identical(df_new, tibble(a = 2:3))
})

test_that("can add as first row via .after = 0", {
  df <- tibble(a = 3L)
  df_new <- add_row(df, a = 2L, .after = 0)
  expect_identical(df_new, tibble(a = 2:3))
})

test_that("can add row inbetween", {
  df <- tibble(a = 1:3)
  df_new <- add_row(df, a = 4:5, .after = 2)
  expect_identical(df_new, tibble(a = c(1:2, 4:5, 3L)))
})

test_that("error if both .before and .after are given", {
  df <- tibble(a = 1:3)
  expect_error(add_row(df, a = 4:5, .after = 2, .before = 3))
})

test_that("missing row names stay missing when adding row", {
  expect_false(has_rownames(iris))
  expect_false(has_rownames(add_row(iris, Species = "unknown", .after = 0)))
  expect_false(has_rownames(add_row(iris, Species = "unknown", .after = nrow(iris))))
  expect_false(has_rownames(add_row(iris, Species = "unknown", .before = 10)))
})

test_that("adding to a list column adds a NULL value (#148)", {
  expect_null(add_row(data_frame(a = as.list(1:3)))$a[[4]])
  expect_null(add_row(data_frame(a = as.list(1:3)), .before = 1)$a[[1]])
  expect_null(add_row(data_frame(a = as.list(1:3)), .after = 1)$a[[2]])
  expect_null(add_row(data_frame(a = as.list(1:3), b = 1:3), b = 4:6)$a[[5]])
})

test_that("add_row() keeps the class of empty columns", {
  new_tibble <- add_row(df_empty, to_be_added = 5)
  expect_equal(sapply(df_empty, class), sapply(new_tibble, class))
})

test_that("add_row() fails nicely for grouped data frames (#179)", {
  expect_error(
    add_row(dplyr::group_by(iris, Species), Petal.Width = 3),
    "grouped data frame")
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

test_that("add_column() keeps class of object when adding in the middle", {
  iris_new <- add_column(iris, x = 1:150, .after = 3)
  expect_equal(class(iris), class(iris_new))

  iris_new <- add_column(as_tibble(iris), x = 1:150)
  expect_equal(class(as_tibble(iris)), class(iris_new))
})

test_that("add_column() keeps class of object when adding in the beginning", {
  iris_new <- add_column(iris, x = 1:150, .after = 0)
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
  expect_identical(df_new, tibble(a = 1:3, b = 4:6, c = 3:1))
})

test_that("can recycle when adding columns", {
  df <- tibble(a = 1:3)
  df_new <- add_column(df, b = 4, c = 3:1)
  expect_identical(df_new, tibble(a = 1:3, b = rep(4, 3), c = 3:1))
})

test_that("can recycle when adding a column of length 1", {
  df <- tibble(a = 1:3)
  df_new <- add_column(df, b = 4)
  expect_identical(df_new, tibble(a = 1:3, b = rep(4, 3)))
})

test_that("can recyle when adding multiple columns of length 1", {
  df <- tibble(a = 1:3)
  df_new <- add_column(df, b = 4, c = 5)
  expect_identical(df_new, tibble(a = 1:3, b = rep(4, 3), c = rep(5, 3)))
})

test_that("can add as first column via .before = 1", {
  df <- tibble(a = 3L)
  df_new <- add_column(df, b = 2L, .before = 1)
  expect_identical(df_new, tibble(b = 2L, a = 3L))
})

test_that("can add as first column via .after = 0", {
  df <- tibble(a = 3L)
  df_new <- add_column(df, b = 2L, .after = 0)
  expect_identical(df_new, tibble(b = 2L, a = 3L))
})

test_that("can add column inbetween", {
  df <- tibble(a = 1:3, c = 4:6)
  df_new <- add_column(df, b = -1:1, .after = 1)
  expect_identical(df_new, tibble(a = 1:3, b = -1:1, c = 4:6))
})

test_that("can add column relative to named column", {
  df <- tibble(a = 1:3, c = 4:6)
  df_new <- add_column(df, b = -1:1, .before = "c")
  expect_identical(df_new, tibble(a = 1:3, b = -1:1, c = 4:6))
})

test_that("error if both .before and .after are given", {
  df <- tibble(a = 1:3)
  expect_error(add_column(df, b = 4:6, .after = 2, .before = 3),
               "Can't specify both [.]before and [.]after")
})

test_that("error if column named by .before or .after not found", {
  df <- tibble(a = 1:3)
  expect_error(add_column(df, b = 4:6, .after = "x"), "Unknown column: 'x'")
  expect_error(add_column(df, b = 4:6, .before = "x"), "Unknown column: 'x'")
})

test_that("missing row names stay missing when adding column", {
  expect_false(has_rownames(iris))
  expect_false(has_rownames(add_column(iris, x = 1:150, .after = 0)))
  expect_false(has_rownames(add_column(iris, x = 1:150, .after = ncol(iris))))
  expect_false(has_rownames(add_column(iris, x = 1:150, .before = 2)))
})
