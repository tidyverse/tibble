context("tibble")

test_that("tibble returns correct number of rows with all combinatinos", {
  expect_equal(nrow(tibble(value = 1:10)), 10L)
  expect_equal(nrow(tibble(value = 1:10, name = "recycle_me")), 10L)
  expect_equal(nrow(tibble(name = "recycle_me", value = 1:10)), 10L)
  expect_equal(nrow(tibble(name = "recycle_me", value = 1:10, value2 = 11:20)), 10L)
  expect_equal(nrow(tibble(value = 1:10, name = "recycle_me", value2 = 11:20)), 10L)
})

test_that("can't make tibble containing data.frame or array", {
  expect_error(
    tibble(mtcars),
    "Each variable must be a 1d atomic vector or list.\nProblem variable: `mtcars`",
    fixed = TRUE
  )
  expect_error(
    tibble(diag(5)),
    "Each variable must be a 1d atomic vector or list.\nProblem variable: `diag(5)`",
    fixed = TRUE
  )
  expect_error(
    tibble(mtcars, diag(5)),
    "Each variable must be a 1d atomic vector or list.\nProblem variables: `mtcars`, `diag(5)`",
    fixed = TRUE
  )
})

test_that("dim attribute is stripped of 1D array (#84)", {
  expect_null(dim(tibble(x = array(1:3))$x))
})

test_that("bogus columns raise an error", {
  expect_error(
    as_tibble(list(1)),
    "Each variable must be named.\nProblem variable: 1",
    fixed = TRUE
  )
  expect_error(
    tibble(a = NULL),
    "Each variable must be a 1d atomic vector or list.\nProblem variable: `a`",
    fixed = TRUE
  )
  expect_error(
    tibble(a = new.env()),
    "Each variable must be a 1d atomic vector or list.\nProblem variable: `a`",
    fixed = TRUE
  )
  expect_error(
    tibble(a = quote(a)),
    "Each variable must be a 1d atomic vector or list.\nProblem variable: `a`",
    fixed = TRUE
  )
})

test_that("length 1 vectors are recycled", {
  expect_equal(nrow(tibble(x = 1:10)), 10)
  expect_equal(nrow(tibble(x = 1:10, y = 1)), 10)
  expect_error(
    tibble(x = 1:10, y = 1:2),
    "Variables must be length 1 or 10, not 2.\nProblem variable: `y`",
    fixed = TRUE

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
  expect_error(
    as_tibble(list(x = 1:2, y = 1:3)),
    "Variables must be length 1 or 3, not 2.\nProblem variable: `x`",
    fixed = TRUE
  )
  expect_error(
    as_tibble(list(x = 1:2, y = 1:3, z = 1:4)),
    "Variables must be length 1 or 4, not 2, 3.\nProblem variables: `x`, `y`",
    fixed = TRUE
  )
  expect_error(
    as_tibble(list(x = 1:4, y = 1:2, z = 1:2)),
    "Variables must be length 1 or 4, not 2.\nProblem variables: `y`, `z`",
    fixed = TRUE
  )
})

test_that("columns must be named", {
  l1 <- list(1:10)
  l2 <- list(x = 1, 2)

  expect_error(
    as_tibble(l1),
    "Each variable must be named.\nProblem variable: 1",
    fixed = TRUE
  )
  expect_error(
    as_tibble(l2),
    "Each variable must be named.\nProblem variable: 2",
    fixed = TRUE
  )
})

test_that("can't coerce list data.frame or array", {
  expect_error(
    as_tibble(list(x = mtcars)),
    "Each variable must be a 1d atomic vector or list.\nProblem variable: `x`",
    fixed = TRUE
  )
  expect_error(
    as_tibble(list(x = diag(5))),
    "Each variable must be a 1d atomic vector or list.\nProblem variable: `x`",
    fixed = TRUE
  )
  expect_error(
    as_tibble(list(x = mtcars, y = diag(5))),
    "Each variable must be a 1d atomic vector or list.\nProblem variables: `x`, `y`",
    fixed = TRUE
  )
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


test_that("as_data_frame is an alias of as_tibble", {
  expect_identical(as_data_frame(NULL), as_tibble(NULL))
})

test_that("as.tibble is an alias of as_tibble", {
  expect_identical(as.tibble(NULL), as_tibble(NULL))
})


# Validation --------------------------------------------------------------

test_that("2d object isn't a valid column", {
  expect_error(
    check_tibble(list(x = mtcars)),
    "Each variable must be a 1d atomic vector or list.\nProblem variable: `x`",
    fixed = TRUE
  )
  expect_error(
    check_tibble(list(x = mtcars, y = mtcars)),
    "Each variable must be a 1d atomic vector or list.\nProblem variables: `x`, `y`",
    fixed = TRUE
  )
})

test_that("POSIXlt isn't a valid column", {
  expect_error(
    check_tibble(list(x = as.POSIXlt(Sys.time()))),
    "Date/times must be stored as POSIXct, not POSIXlt.\nProblem variable: `x`",
    fixed = TRUE
  )
  expect_error(
    check_tibble(list(x = as.POSIXlt(Sys.time()), y = as.POSIXlt(Sys.time()))),
    "Date/times must be stored as POSIXct, not POSIXlt.\nProblem variables: `x`, `y`",
    fixed = TRUE
  )
})

test_that("NULL isn't a valid column", {
  expect_error(
    check_tibble(list(a = NULL)),
    "Each variable must be a 1d atomic vector or list.\nProblem variable: `a`",
    fixed = TRUE
  )
  expect_error(
    check_tibble(list(a = NULL, b = NULL)),
    "Each variable must be a 1d atomic vector or list.\nProblem variables: `a`, `b`",
    fixed = TRUE
  )
})

test_that("columns must be named (#1101)", {
  l <- list(1:10, 1:10)

  expect_error(
    check_tibble(l),
    "Each variable must be named.\nProblem variables: 1, 2",
    fixed = TRUE
  )

  expect_error(
    check_tibble(setNames(l, c("x", ""))),
    "Each variable must be named.\nProblem variable: 2",
    fixed = TRUE
  )

  expect_error(
    check_tibble(setNames(l, c("x", NA))),
    "Each variable must be named.\nProblem variable: 2",
    fixed = TRUE
  )
})

test_that("names must be unique (#820)", {
  expect_error(
    check_tibble(list(x = 1, x = 2)),
    "Each variable must have a unique name.\nProblem variable: `x`",
    fixed = TRUE
  )
  expect_error(
    check_tibble(list(x = 1, x = 2, y = 3, y = 4)),
    "Each variable must have a unique name.\nProblem variables: `x`, `y`",
    fixed = TRUE
  )
})
