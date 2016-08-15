context("tibble")

test_that("tibble returns correct number of rows with all combinatinos", {

  expect_equal(nrow(tibble(value = 1:10)), 10L)

  expect_equal(nrow(tibble(value = 1:10, name = "recycle_me")), 10L)

  expect_equal(nrow(tibble(name = "recycle_me", value = 1:10)), 10L)

  expect_equal(nrow(tibble(name = "recycle_me", value = 1:10, value2 = 11:20)), 10L)

  expect_equal(nrow(tibble(value = 1:10, name = "recycle_me", value2 = 11:20)), 10L)

})

test_that("can't make tibble containing data.frame or array", {
  expect_error(tibble(mtcars), "must be a 1d atomic vector or list")
  expect_error(tibble(diag(5)), "must be a 1d atomic vector or list")
})

test_that("dim attribute is stripped of 1D array (#84)", {
  expect_null(dim(tibble(x = array(1:3))$x))
})

test_that("bogus columns raise an error", {
  expect_error(as_tibble(list(1)), "named")
  expect_error(tibble(a = NULL), "1d atomic vector or list")
  expect_error(tibble(a = ~a), "1d atomic vector or list")
  expect_error(tibble(a = new.env()), "1d atomic vector or list")
  expect_error(tibble(a = quote(a)), "1d atomic vector or list")
})

test_that("length 1 vectors are recycled", {
  expect_equal(nrow(tibble(x = 1:10)), 10)
  expect_equal(nrow(tibble(x = 1:10, y = 1)), 10)
  expect_error(
    nrow(tibble(x = 1:10, y = 1:2)),
    "Variables must be length 1 or 10"
  )
})

test_that("missing names are imputed from call", {
  x <- 1:10
  df <- tibble(x, y = x)
  expect_equal(names(df), c("x", "y"))
})

test_that("empty input makes 0 x 0 tbl_df", {
  zero <- tibble()
  expect_is(zero, "tbl_df")
  expect_equal(dim(zero), c(0L, 0L))
  expect_identical(attr(zero, "names"), character(0L))
})

test_that("SE version", {
  expect_identical(tibble_(list(a = ~1:10)), tibble(a = 1:10))
})

test_that("names are stripped from vectors", {
  foo <- tibble(x = c(y = 1, z = 2))
  expect_equal(names(foo), "x")
  expect_null(names(foo$x))
})

test_that("names in list columns are preserved", {
  foo <- tibble(x = list(y = 1:3, z = 4:5))
  expect_equal(names(foo), "x")
  expect_equal(names(foo$x), c("y", "z"))
})

test_that("attributes are preserved", {
  df <- structure(
    data.frame( x = 1:10, g1 = rep(1:2, each = 5), g2 = rep(1:5, 2) ),
    meta = "this is important"
  )
  res <- as_tibble(df)

  expect_identical(attr(res, "meta"), attr(df, "meta"))
})

test_that("tibble aliases", {
  expect_identical(data_frame, tibble)
  expect_identical(data_frame_, tibble_)
})


# as_tibble -----------------------------------------------------------

test_that("columns must be same length", {
  l <- list(x = 1:2, y = 1:3)
  expect_error(as_tibble(l), "must be length 1 or")
})

test_that("columns must be named", {
  l1 <- list(1:10)
  l2 <- list(x = 1, 2)

  expect_error(as_tibble(l1), "must be named")
  expect_error(as_tibble(l2), "must be named")
})

test_that("can't coerce list data.frame or array", {
  expect_error(as_tibble(list(x = mtcars)), "must be a 1d atomic vector or list")
  expect_error(as_tibble(list(x = diag(5))), "must be a 1d atomic vector or list")
})

test_that("empty list() makes 0 x 0 tbl_df", {
  zero <- as_tibble(list())
  expect_is(zero, "tbl_df")
  expect_equal(dim(zero), c(0L, 0L))
})


test_that("NULL makes 0 x 0 tbl_df", {
  nnnull <- as_tibble(NULL)
  expect_is(nnnull, "tbl_df")
  expect_equal(dim(nnnull), c(0L, 0L))
})


test_that("as_tibble.tbl_df() leaves classes unchanged (#60)", {
  df <- tibble()
  expect_equal(class(df),
               c("tbl_df", "tbl", "data.frame"))
  expect_equal(class(structure(df, class = c("my_df", class(df)))),
               c("my_df", "tbl_df", "tbl", "data.frame"))
})


test_that("Can convert tables to data frame", {
  mtcars_table <- xtabs(mtcars, formula = ~vs+am+cyl)

  mtcars_tbl <- as_tibble(mtcars_table)
  expect_equal(names(mtcars_tbl), c(names(dimnames(mtcars_table)), "n"))

  mtcars_tbl <- as_tibble(mtcars_table, "Freq")
  expect_equal(names(mtcars_tbl), c(names(dimnames(mtcars_table)), "Freq"))
})


test_that("Can convert atomic vectors to data frame", {
  expect_equal(as_tibble(1:3), tibble(value = 1:3))
  expect_equal(as_tibble(c(TRUE, FALSE, NA)), tibble(value = c(TRUE, FALSE, NA)))
  expect_equal(as_tibble(1.5:3.5), tibble(value = 1.5:3.5))
  expect_equal(as_tibble(letters), tibble(value = letters))
})


test_that("Can convert named atomic vectors to data frame", {
  expect_equal(as_tibble(setNames(nm = 1:3)), tibble(value = 1:3))
  expect_equal(as_tibble(setNames(nm = c(TRUE, FALSE, NA))), tibble(value = c(TRUE, FALSE, NA)))
  expect_equal(as_tibble(setNames(nm = 1.5:3.5)), tibble(value = 1.5:3.5))
  expect_equal(as_tibble(setNames(nm = letters)), tibble(value = letters))
})


test_that("as_tibble alias", {
  expect_identical(as_data_frame(NULL), as_tibble(NULL))
})


# Validation --------------------------------------------------------------

test_that("2d object isn't a valid column", {
  expect_error(
    check_tibble(list(x = mtcars)),
    "Each variable must be a 1d atomic vector"
  )
})

test_that("POSIXlt isn't a valid column", {
  expect_error(
    check_tibble(list(x = as.POSIXlt(Sys.time()))),
    "Date/times must be stored as POSIXct"
  )
})

test_that("NULL isn't a valid column", {
  expect_error(
    check_tibble(list(a = NULL)),
    "Each variable must be a 1d atomic vector"
  )
})

test_that("columns must be named (#1101)", {
  l <- list(1:10, 1:10)

  expect_error(
    check_tibble(l),
    "Each variable must be named"
  )

  expect_error(
    check_tibble(setNames(l, c("x", ""))),
    "Each variable must be named"
  )

  expect_error(
    check_tibble(setNames(l, c("x", NA))),
    "Each variable must be named"
  )
})

test_that("names must be unique (#820)", {
  expect_error(
    check_tibble(list(x = 1, x = 2)),
    "Each variable must have a unique name"
  )
})

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
