context("tibble")

test_that("tibble returns correct number of rows with all combinatinos", {
  expect_equal(nrow(tibble(value = 1:10)), 10L)
  expect_equal(nrow(tibble(value = 1:10, name = "recycle_me")), 10L)
  expect_equal(nrow(tibble(name = "recycle_me", value = 1:10)), 10L)
  expect_equal(nrow(tibble(name = "recycle_me", value = 1:10, value2 = 11:20)), 10L)
  expect_equal(nrow(tibble(value = 1:10, name = "recycle_me", value2 = 11:20)), 10L)
})

test_that("dim attribute is stripped of 1D array (#84)", {
  expect_null(dim(tibble(x = array(1:3))$x))
})

test_that("bogus columns raise an error", {
  expect_error(
    as_tibble(list(1)),
    error_column_must_be_named(1),
    fixed = TRUE
  )
  expect_error(
    tibble(a = NULL),
    error_column_must_be_vector("a", "NULL"),
    fixed = TRUE
  )
  expect_error(
    tibble(a = new.env()),
    error_column_must_be_vector("a", "environment"),
    fixed = TRUE
  )
  expect_error(
    tibble(a = quote(a)),
    error_column_must_be_vector("a", "name"),
    fixed = TRUE
  )
})

test_that("length 1 vectors are recycled", {
  expect_equal(nrow(tibble(x = 1:10)), 10)
  expect_equal(nrow(tibble(x = 1:10, y = 1)), 10)
  expect_error(
    tibble(x = 1:10, y = 1:2),
    error_inconsistent_cols(10, "the longest column `x`", "y", 2),
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
    data.frame(x = 1:10, g1 = rep(1:2, each = 5), g2 = rep(1:5, 2)),
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
    error_inconsistent_cols(3, "the longest column `y`", "x", 2),
    fixed = TRUE
  )
  expect_error(
    as_tibble(list(x = 1:2, y = 1:3, z = 1:4)),
    error_inconsistent_cols(
      4,
      "the longest column `z`",
      c("x", "y"),
      2:3
    ),
    fixed = TRUE
  )
  expect_error(
    as_tibble(list(x = 1:4, y = 1:2, z = 1:2)),
    error_inconsistent_cols(
      4,
      "the longest column `x`",
      c("y", "z"),
      c(2, 2)
    ),
    fixed = TRUE
  )
})

test_that("columns must be named", {
  l1 <- list(1:10)
  l2 <- list(x = 1, 2)

  expect_error(
    as_tibble(l1),
    error_column_must_be_named(1),
    fixed = TRUE
  )
  expect_error(
    as_tibble(l2),
    error_column_must_be_named(2),
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
  expect_equal(
    class(df),
    c("tbl_df", "tbl", "data.frame")
  )
  expect_equal(
    class(structure(df, class = c("my_df", class(df)))),
    c("my_df", "tbl_df", "tbl", "data.frame")
  )
})


test_that("Can convert tables to data frame", {
  mtcars_table <- xtabs(mtcars, formula = ~vs + am + cyl)

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


test_that("as_tibble() can validate (#278)", {
  df <- tibble(a = 1, b = 2)
  names(df) <- c("", NA)
  expect_error(as_tibble(df), NA)
  expect_error(
    as_tibble(df, validate = TRUE),
    error_column_must_be_named(1:2),
    fixed = TRUE
  )
})


test_that("as_tibble() adds empty names if not validating", {
  invalid_df <- as_tibble(list(3, 4, 5), validate = FALSE)
  expect_equal(length(invalid_df), 3)
  expect_equal(nrow(invalid_df), 1)
  expect_equal(names(invalid_df), rep("", 3))
})


test_that("as_tibble() can convert row names", {
  df <- data.frame(a = 1:3, b = 2:4, row.names = letters[5:7])
  expect_identical(
    as_tibble(df, rownames = NULL),
    tibble(a = 1:3, b = 2:4)
  )
  expect_identical(
    as_tibble(df, rownames = "id"),
    tibble(id = letters[5:7], a = 1:3, b = 2:4)
  )
  expect_identical(rownames(as_tibble(df)), rownames(df))
  expect_identical(unclass(as_tibble(df)), unclass(df))
})

test_that("as_tibble() throws an error when user turns missing row names into column", {
  df <- data.frame(a = 1:3, b = 2:4)
  expect_error(
    as_tibble(df, rownames = "id"),
    error_as_tibble_needs_rownames(),
    fixed = TRUE
  )
})

test_that("as_data_frame is an alias of as_tibble", {
  expect_identical(as_data_frame(NULL), as_tibble(NULL))
})

test_that("as.tibble is an alias of as_tibble", {
  expect_identical(as.tibble(NULL), as_tibble(NULL))
})

# new_tibble -------------------------------------------------------------

test_that("new_tibble can specify nrow,", {
  expect_error(
    new_tibble(list(x = 1:2, y = 1:3), nrow = 4),
    error_inconsistent_cols(4, "`nrow`", c("x", "y"), c(2, 3)),
    fixed = TRUE
  )
})


# Validation --------------------------------------------------------------

test_that("POSIXlt isn't a valid column", {
  expect_error(
    check_tibble(list(x = as.POSIXlt(Sys.time()))),
    error_time_column_must_be_posixct("x"),
    fixed = TRUE
  )
})

test_that("NULL isn't a valid column", {
  expect_error(
    check_tibble(list(a = NULL)),
    error_column_must_be_vector("a", "NULL"),
    fixed = TRUE
  )
})

test_that("columns must be named (#1101)", {
  l <- list(1:10, 1:10)

  expect_error(
    check_tibble(l),
    error_column_must_be_named(1:2),
    fixed = TRUE
  )

  expect_error(
    check_tibble(setNames(l, c("x", ""))),
    error_column_must_be_named(2),
    fixed = TRUE
  )

  expect_error(
    check_tibble(setNames(l, c("x", NA))),
    error_column_must_be_named(2),
    fixed = TRUE
  )
})

test_that("names must be unique (#820)", {
  expect_error(
    check_tibble(list(x = 1, x = 2, y = 3)),
    error_column_must_have_unique_name("x"),
    fixed = TRUE
  )
  expect_error(
    check_tibble(list(x = 1, x = 2, y = 3, y = 4)),
    error_column_must_have_unique_name(c("x", "y")),
    fixed = TRUE
  )
})

test_that("mutate() semantics for tibble() (#213)", {
  expect_equal(
    tibble(a = 1:2, b = 1, c = b / sum(b)),
    tibble(a = 1:2, b = c(1, 1), c = c(0.5, 0.5))
  )

  expect_equal(
    tibble(b = 1, a = 1:2, c = b / sum(b)),
    tibble(b = c(1, 1), a = 1:2, c = c(0.5, 0.5))
  )

  expect_equal(
    tibble(b = 1, c = b / sum(b), a = 1:2),
    tibble(b = c(1, 1), c = c(1, 1), a = 1:2)
  )
})

test_that("types preserved when recycling in tibble() (#284)", {
  expect_equal(
    tibble(a = 1:2, b = as.difftime(1, units = "hours")),
    tibble(a = 1:2, b = as.difftime(c(1, 1), units = "hours"))
  )

  expect_equal(
    tibble(b = as.difftime(1, units = "hours"), a = 1:2),
    tibble(b = as.difftime(c(1, 1), units = "hours"), a = 1:2)
  )
})


# Data frame and matrix columns -------------------------------------------

test_that("can make tibble containing data.frame or array (#416)", {
  expect_identical(
    tibble(mtcars),
    new_tibble(list(mtcars = remove_rownames(mtcars)))
  )
  expect_identical(
    tibble(diag(5)),
    new_tibble(list(`diag(5)` = diag(5)))
  )
})

test_that("can coerce list data.frame or array (#416)", {
  expect_identical(
    as_tibble(list(x = mtcars)),
    new_tibble(list(x = remove_rownames(mtcars)))
  )
  expect_identical(
    as_tibble(list(x = diag(5))),
    new_tibble(list(x = diag(5)))
  )
})

test_that("susbsetting returns the correct number of rows", {
  expect_identical(
    tibble(x = mtcars)[1:3, ],
    tibble(x = mtcars[1:3, ])
  )
  expect_identical(
    tibble(y = diag(5))[1:3, ],
    tibble(y = diag(5)[1:3, ])
  )
})

test_that("subsetting one row retains columns", {
  expect_identical(
    tibble(y = diag(5))[1, ],
    tibble(y = diag(5)[1, , drop = FALSE])
  )
})
