context("tbl_df")


# [ -----------------------------------------------------------------------

test_that("[ never drops", {
  mtcars2 <- as_tibble(mtcars)

  expect_is(mtcars2[, 1], "data.frame")
  expect_is(mtcars2[, 1], "tbl_df")
  expect_equal(mtcars2[, 1], mtcars2[1])
})

test_that("[ retains class", {
  mtcars2 <- as_tibble(mtcars)

  expect_identical(class(mtcars2), class(mtcars2[1:5, ]))
  expect_identical(class(mtcars2), class(mtcars2[, 1:5]))
  expect_identical(class(mtcars2), class(mtcars2[1:5, 1:5]))
})

test_that("[ and as_tibble commute", {
  mtcars2 <- as_tibble(mtcars)
  expect_identical(mtcars2, as_tibble(mtcars))
  expect_identical(mtcars2[], remove_rownames(as_tibble(mtcars[])))
  expect_identical(mtcars2[1:5, ], remove_rownames(as_tibble(mtcars[1:5, ])))
  expect_identical(mtcars2[, 1:5], remove_rownames(as_tibble(mtcars[, 1:5])))
  expect_identical(mtcars2[1:5, 1:5], remove_rownames(as_tibble(mtcars[1:5, 1:5])))
  expect_identical(mtcars2[1:5], remove_rownames(as_tibble(mtcars[1:5])))
})

test_that("[ with 0 cols creates correct row names (#656)", {
  zero_row <- as_tibble(iris)[, 0]
  expect_is(zero_row, "tbl_df")
  expect_equal(nrow(zero_row), 150)
  expect_equal(ncol(zero_row), 0)

  expect_identical(zero_row, as_tibble(iris)[0])
})

test_that("[ with 0 cols returns correct number of rows", {
  iris_tbl <- as_tibble(iris)
  nrow_iris <- nrow(iris_tbl)

  expect_equal(nrow(iris_tbl[0]), nrow_iris)
  expect_equal(nrow(iris_tbl[, 0]), nrow_iris)

  expect_equal(nrow(iris_tbl[, 0][1:10, ]), 10)
  expect_equal(nrow(iris_tbl[0][1:10, ]), 10)
  expect_equal(nrow(iris_tbl[1:10, ][, 0]), 10)
  expect_equal(nrow(iris_tbl[1:10, ][0]), 10)
  expect_equal(nrow(iris_tbl[1:10, 0]), 10)

  expect_equal(nrow(iris_tbl[, 0][-(1:10), ]), nrow_iris - 10)
  expect_equal(nrow(iris_tbl[0][-(1:10), ]), nrow_iris - 10)
  expect_equal(nrow(iris_tbl[-(1:10), ][, 0]), nrow_iris - 10)
  expect_equal(nrow(iris_tbl[-(1:10), ][0]), nrow_iris - 10)
  expect_equal(nrow(iris_tbl[-(1:10), 0]), nrow_iris - 10)
})

test_that("[.tbl_df is careful about names (#1245)", {
  foo <- tibble(x = 1:10, y = 1:10)
  expect_error(
    foo["z"],
    error_unknown_names("z"),
    fixed = TRUE
  )
  expect_error(
    foo[c("x", "y", "z")],
    error_unknown_names("z"),
    fixed = TRUE
  )

  expect_error(
    foo[, "z"],
    error_unknown_names("z"),
    fixed = TRUE
  )
  expect_error(
    foo[, c("x", "y", "z")],
    error_unknown_names("z"),
    fixed = TRUE
  )

  expect_error(
    foo[as.matrix("x")],
    error_dim_column_index(as.matrix("x")),
    fixed = TRUE
  )
  expect_error(
    foo[array("x", dim = c(1, 1, 1))],
    error_dim_column_index(array("x", dim = c(1, 1, 1))),
    fixed = TRUE
  )
})

test_that("[.tbl_df is careful about column indexes (#83)", {
  foo <- tibble(x = 1:10, y = 1:10, z = 1:10)
  expect_identical(foo[1:3], foo)

  expect_error(
    foo[0.5],
    error_nonint_column_index(1, 0.5),
    fixed = TRUE
  )
  expect_error(
    foo[1:5],
    error_large_column_index(3, 4:5, 4:5),
    fixed = TRUE
  )

  # Message from base R
  expect_error(foo[-1:1])
  expect_error(foo[c(-1, 1)])

  expect_error(
    foo[-4],
    error_small_column_index(3, 1, -4),
    fixed = TRUE
  )
  expect_error(
    foo[c(1:3, NA)],
    error_na_column_index(),
    fixed = TRUE
  )

  expect_error(
    foo[as.matrix(1)],
    error_dim_column_index(as.matrix("x")),
    fixed = TRUE
  )
  expect_error(
    foo[array(1, dim = c(1, 1, 1))],
    error_dim_column_index(array("x", dim = c(1, 1, 1))),
    fixed = TRUE
  )
})

test_that("[.tbl_df is careful about column flags (#83)", {
  foo <- tibble(x = 1:10, y = 1:10, z = 1:10)
  expect_identical(foo[TRUE], foo)
  expect_identical(foo[c(TRUE, TRUE, TRUE)], foo)
  expect_identical(foo[FALSE], foo[integer()])
  expect_identical(foo[c(FALSE, TRUE, FALSE)], foo[2])

  expect_error(
    foo[c(TRUE, TRUE)],
    error_mismatch_column_flag(3, 2),
    fixed = TRUE
  )
  expect_error(
    foo[c(TRUE, TRUE, FALSE, FALSE)],
    error_mismatch_column_flag(3, 4),
    fixed = TRUE
  )
  expect_error(
    foo[c(TRUE, TRUE, NA)],
    error_na_column_flag(),
    fixed = TRUE
  )

  expect_error(
    foo[as.matrix(TRUE)],
    error_dim_column_index(as.matrix("x")),
    fixed = TRUE
  )
  expect_error(
    foo[array(TRUE, dim = c(1, 1, 1))],
    error_dim_column_index(array("x", dim = c(1, 1, 1))),
    fixed = TRUE
  )
})

test_that("[.tbl_df rejects unknown column indexes (#83)", {
  foo <- tibble(x = 1:10, y = 1:10, z = 1:10)
  expect_error(
    foo[list(1:3)],
    error_unsupported_index(list(1:3)),
    fixed = TRUE
  )
  expect_error(
    foo[as.list(1:3)],
    error_unsupported_index(as.list(1:3)),
    fixed = TRUE
  )
  expect_error(
    foo[factor(1:3)],
    error_unsupported_index(factor(1:3)),
    fixed = TRUE
  )
  expect_error(
    foo[Sys.Date()],
    error_unsupported_index(Sys.Date()),
    fixed = TRUE
  )
  expect_error(
    foo[Sys.time()],
    error_unsupported_index(Sys.time()),
    fixed = TRUE
  )
})

test_that("[.tbl_df supports character subsetting (#312)", {
  foo <- tibble(x = 1:10, y = 1:10, z = 1:10)
  expect_identical(foo[as.character(2:4), ], foo[2:4, ])
  expect_identical(foo[as.character(-3:-5), ], foo[-3:-5, ])
  expect_identical(foo[as.character(9:12), ], foo[9:12, ])
  expect_identical(foo[letters, ], foo[rlang::rep_along(letters, NA_integer_), ])
  expect_identical(foo["9a", ], foo[NA_integer_, ])
})

test_that("[.tbl_df supports character subsetting if row names are present (#312)", {
  foo <- as_tibble(mtcars, rownames = NA)
  idx <- function(x) rownames(mtcars)[x]
  expect_identical(foo[idx(2:4), ], foo[2:4, ])
  expect_identical(foo[idx(-3:-5), ], foo[-3:-5, ])
  expect_identical(foo[idx(29:34), ], foo[29:34, ])
  expect_identical(foo[letters, ], foo[rlang::rep_along(letters, NA_integer_), ])
  expect_identical(foo["9a", ], foo[NA_integer_, ])
})

test_that("[.tbl_df supports logical subsetting (#318)", {
  foo <- tibble(x = 1:10, y = 1:10, z = 1:10)
  expect_identical(foo[c(FALSE, rep(TRUE, 3), rep(F, 6)), ], foo[2:4, ])
  expect_identical(foo[TRUE, ], foo)
  expect_identical(foo[FALSE, ], foo[0L, ])
  expect_warning(
    foo[c(TRUE, FALSE), ],
    "Length of logical index must be 1 or 10, not 2",
    fixed = TRUE
  )
})

test_that("[.tbl_df is no-op if args missing", {
  expect_identical(df_all[], df_all)
})

test_that("[.tbl_df supports drop argument (#311)", {
  expect_identical(df_all[1, 2, drop = TRUE], df_all[[2]][1])
  expect_identical(df_all[1, , drop = TRUE], df_all[1, , ])
})

test_that("[.tbl_df ignores drop argument (with warning) without j argument (#307)", {
  expect_warning(expect_identical(df_all[1, drop = TRUE], df_all[1]))
})


test_that("[.tbl_df is careful about attributes (#155)", {
  df <- tibble(x = 1:2, y = x)
  attr(df, "along for the ride") <- "still here"

  expect_identical(attr(df[names(df)], "along for the ride"), "still here")
  expect_identical(attr(df["x"], "along for the ride"), "still here")
  expect_identical(attr(df[1:2], "along for the ride"), "still here")
  expect_identical(attr(df[2], "along for the ride"), "still here")
  expect_identical(attr(df[c(TRUE, FALSE)], "along for the ride"), "still here")
  expect_identical(attr(df[, names(df)], "along for the ride"), "still here")
  expect_identical(attr(df[, "x"], "along for the ride"), "still here")
  expect_identical(attr(df[, 1:2], "along for the ride"), "still here")
  expect_identical(attr(df[, 2], "along for the ride"), "still here")
  expect_identical(attr(df[, c(TRUE, FALSE)], "along for the ride"), "still here")
  expect_identical(attr(df[1, names(df)], "along for the ride"), "still here")
  expect_identical(attr(df[1, "x"], "along for the ride"), "still here")
  expect_identical(attr(df[1, 1:2], "along for the ride"), "still here")
  expect_identical(attr(df[1, 2], "along for the ride"), "still here")
  expect_identical(attr(df[1, c(TRUE, FALSE)], "along for the ride"), "still here")

  expect_identical(attr(df[1:2, ], "along for the ride"), "still here")
  expect_identical(attr(df[-1, ], "along for the ride"), "still here")

  expect_identical(attr(df[, ], "along for the ride"), "still here")
  expect_identical(attr(df[], "along for the ride"), "still here")
})

# [[ ----------------------------------------------------------------------

test_that("[[.tbl_df ignores exact argument", {
  foo <- tibble(x = 1:10, y = 1:10)
  expect_warning(foo[["x"]], NA)
  expect_warning(foo[["x", exact = FALSE]], "ignored")
  expect_identical(getElement(foo, "y"), 1:10)
})

test_that("can use recursive indexing with [[", {
  foo <- tibble(x = list(y = 1:3, z = 4:5))
  expect_equal(foo[[c(1, 1)]], 1:3)
  expect_equal(foo[[c("x", "y")]], 1:3)
})

test_that("[[ returns NULL if name doesn't exist", {
  df <- tibble(x = 1)
  expect_null(df[["y"]])
  expect_null(df[[1, "y"]])
})

test_that("can use two-dimensional indexing with [[", {
  iris2 <- as_tibble(iris)
  expect_equal(iris2[[1, 2]], iris[[1, 2]])
  expect_equal(iris2[[2, 3]], iris[[2, 3]])
})

# $ -----------------------------------------------------------------------

test_that("$ throws warning if name doesn't exist", {
  df <- tibble(x = 1)
  expect_warning(
    expect_null(df$y),
    "Unknown or uninitialised column: 'y'"
  )
})

test_that("$ throws different warning if attempting a partial initialization (#199)", {
  df <- tibble(x = 1)
  expect_warning(df$y[1] <- 2, "Unknown or uninitialised column: 'y'")
})

test_that("$ doesn't do partial matching", {
  df <- tibble(partial = 1)
  expect_warning(
    expect_null(df$p),
    "Unknown or uninitialised column: 'p'"
  )
  expect_warning(
    expect_null(df$part),
    "Unknown or uninitialised column: 'part'"
  )
  expect_error(df$partial, NA)
})

# is_tibble ---------------------------------------------------------------

test_that("is_tibble", {
  expect_false(is_tibble(iris))
  expect_true(is_tibble(as_tibble(iris)))
  expect_false(is_tibble(NULL))
  expect_false(is_tibble(0))
})

test_that("is_tibble", {
  scoped_lifecycle_silence()
  expect_identical(is.tibble(iris), is_tibble(iris))
})

# new_tibble --------------------------------------------------------------

test_that("new_tibble() with deprecated subclass argument", {
  tbl <- new_tibble(
    data.frame(a = 1:3),
    names = "b",
    attr1 = "value1",
    attr2 = 2,
    nrow = 3,
    subclass = "nt"
  )

  # Can't compare directly due to dplyr:::all.equal.tbl_df()
  expect_identical(class(tbl), c("nt", "tbl_df", "tbl", "data.frame"))
  expect_equal(
    unclass(tbl),
    structure(
      list(b = 1:3),
      attr1 = "value1",
      attr2 = 2,
      .Names = "b",
      row.names = .set_row_names(3L)
    )
  )
})

test_that("new_tibble() with new class argument", {
  tbl <- new_tibble(
    data.frame(a = 1:3),
    names = "b",
    attr1 = "value1",
    attr2 = 2,
    nrow = 3,
    class = "nt"
  )

  # Can't compare directly due to dplyr:::all.equal.tbl_df()
  expect_identical(class(tbl), c("nt", "tbl_df", "tbl", "data.frame"))
  expect_equal(
    unclass(tbl),
    structure(
      list(b = 1:3),
      attr1 = "value1",
      attr2 = 2,
      .Names = "b",
      row.names = .set_row_names(3L)
    )
  )
})

test_that("new_tibble checks", {
  scoped_lifecycle_errors()

  expect_identical(new_tibble(list(), nrow = 0), tibble())
  expect_identical(new_tibble(list(), nrow = 5), tibble(.rows = 5))
  expect_identical(new_tibble(list(a = 1:3, b = 4:6), nrow = 3), tibble(a = 1:3, b = 4:6))
  expect_error(
    new_tibble(1:3, nrow = 1),
    error_new_tibble_must_be_list(),
    fixed = TRUE
  )
  expect_error(
    new_tibble(list(a = 1)),
    class = get_defunct_error_class(),
    error_new_tibble_needs_nrow(),
    fixed = TRUE
  )
  expect_error(
    new_tibble(list(1), nrow = NULL),
    error_new_tibble_needs_nrow(),
    fixed = TRUE
  )
  expect_error(
    new_tibble(list(1), nrow = 1),
    error_names_must_be_non_null(repair = FALSE),
    fixed = TRUE
  )
  expect_error(
    new_tibble(set_names(list(1), NA_character_), nrow = 1),
    NA
  )
  expect_error(
    new_tibble(set_names(list(1), ""), nrow = 1),
    NA
  )
  expect_error(
    new_tibble(list(a = 1, b = 2:3), nrow = 1),
    NA
  )
  expect_error(
    new_tibble(
      structure(list(a = 1, b = 2), row.names = .set_row_names(2)),
      nrow = 1
    ),
    NA
  )
})


test_that("validate_tibble() checks", {
  expect_error(
    validate_tibble(new_tibble(list(a = 1, b = 2:3), nrow = 1)),
    error_inconsistent_cols(1, c("a", "b"), 1:2, "`nrow` argument"),
    fixed = TRUE
  )

  expect_error(
    validate_tibble(new_tibble(list(a = array(1:3)), nrow = 3)),
    error_1d_array_column(),
    fixed = TRUE
  )
})
