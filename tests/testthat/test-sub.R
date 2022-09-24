# $ -----------------------------------------------------------------------

test_that("$ throws warning if name doesn't exist", {
  df <- tibble(x = 1)
  expect_warning(
    expect_null(df$y),
    "Unknown or uninitialised column: `y`",
    fixed = TRUE
  )
})

test_that("$ doesn't do partial matching", {
  df <- tibble(partial = 1)
  expect_warning(
    expect_null(df$p),
    "Unknown or uninitialised column: `p`",
    fixed = TRUE
  )
  expect_warning(
    expect_null(df$part),
    "Unknown or uninitialised column: `part`",
    fixed = TRUE
  )
  expect_error(df$partial, NA)
})

# [[ ----------------------------------------------------------------------

test_that("[[.tbl_df ignores exact argument", {
  foo <- tibble(x = 1:10, y = 1:10)
  expect_warning(foo[["x"]], NA)
  expect_warning(foo[["x", exact = FALSE]], "ignored")
  expect_identical(getElement(foo, "y"), 1:10)
})

test_that("[[.tbl_df supports symbols (#691)", {
  foo <- tibble(x = 1:10, y = 1:10)
  expect_identical(foo[[quote(x)]], 1:10)
})

test_that("[[.tbl_df throws error with NA index", {
  verify_errors({
    foo <- tibble(x = 1:10, y = 1:10)
    expect_error(foo[[NA]])
    expect_error(foo[[NA_integer_]])
    expect_error(foo[[NA_real_]])
    expect_error(foo[[NA_character_]])
  })
})

test_that("can use recursive indexing with [[", {
  scoped_lifecycle_silence()

  foo <- tibble(x = list(y = 1:3, z = 4:5))
  expect_equal(foo[[c(1, 1)]], 1:3)

  # [[ with a matrix seems broken, despite an implementation in [[.data.frame
})

test_that("[[ returns NULL if name doesn't exist", {
  scoped_lifecycle_silence()

  df <- tibble(x = 1)
  expect_null(df[["y"]])
  expect_null(df[[1, "y"]])
})

test_that("[[ drops inner names only with double subscript (#681)", {
  a <- c(x = 1)
  b <- data.frame(bb = 1, row.names = "y")
  c <- matrix(1, dimnames = list(rows = "z", cols = "cc"))

  df <- tibble(a, b = b, c)
  expect_identical(df[["a"]], a)
  expect_identical(df[[1, "a"]], 1)
  expect_identical(df[["b"]], b)
  expect_identical(df[[1, "b"]], data.frame(bb = 1))
  expect_identical(df[["c"]], c)
  expect_null(rownames(df[[1, "c"]]))

  df <- tibble(x = new_rcrd(list(a = 1:3)))
  expect_identical(df[[1, "x"]], new_rcrd(list(a = 1L)))
})

test_that("can use two-dimensional indexing with [[", {
  trees2 <- as_tibble(trees)
  expect_equal(trees2[[1, 2]], trees[[1, 2]])
  expect_equal(trees2[[2, 3]], trees[[2, 3]])
})

test_that("can use two-dimensional indexing with matrix and data frame columns (#440)", {
  df <- tibble::tibble(
    x = 1:3,
    y = matrix(9:1, ncol = 3),
    z = tibble::tibble(a = 1:3, b = 3:1)
  )

  expect_identical(df[[1, "y"]], df[1, ]$y)
  expect_identical(df[[1, "z"]], df[1, ]$z)
})

test_that("can use classed character indexes (#778)", {
  df <- tibble::tibble(a = 1:3, b = LETTERS[1:3])

  expect_identical(df[mychr(letters[1:2])], df)
  expect_identical(df[[mychr("a")]], df[["a"]])
  expect_null(df[[mychr("c")]])

  expect_silent(df[mychr(letters[1:2])] <- df)
  expect_silent(df[[mychr("c")]] <- 1)
  expect_silent(df[[mychr("a")]] <- df[["a"]])
})

test_that("can use classed integer indexes (#778)", {
  df <- tibble::tibble(a = 1:3, b = LETTERS[1:3])

  expect_identical(df[myint(1:3), myint(1:2)], df)
  expect_identical(df[[myint(2)]], df[[2]])

  expect_silent(df[mylgl(TRUE), ] <- df)
  expect_silent(df[[myint(2)]] <- df[[2]])
  expect_silent(df[[myint(3)]] <- 1)
})

test_that("can use classed logical indexes (#778)", {
  df <- tibble::tibble(a = 1:3, b = LETTERS[1:3])

  expect_identical(df[mylgl(TRUE), mylgl(TRUE)], df)
  expect_silent(df[mylgl(TRUE), mylgl(TRUE)] <- df)
})

# [ -----------------------------------------------------------------------

test_that("[ never drops", {
  mtcars2 <- as_tibble(mtcars)

  expect_s3_class(mtcars2[, 1], "data.frame")
  expect_s3_class(mtcars2[, 1], "tbl_df")
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
  expect_equal(mtcars2[1:5, 1:5], remove_rownames(as_tibble(mtcars[1:5, 1:5])))
  expect_identical(mtcars2[1:5], remove_rownames(as_tibble(mtcars[1:5])))
})

test_that("[ with 0 cols creates correct row names (#656)", {
  zero_row <- as_tibble(trees)[, 0]
  expect_s3_class(zero_row, "tbl_df")
  expect_equal(nrow(zero_row), 31)
  expect_equal(ncol(zero_row), 0)

  expect_identical(zero_row, as_tibble(trees)[0])
})

test_that("[ with 0 cols returns correct number of rows", {
  trees_tbl <- as_tibble(trees)
  nrow_trees <- nrow(trees_tbl)

  expect_equal(nrow(trees_tbl[0]), nrow_trees)
  expect_equal(nrow(trees_tbl[, 0]), nrow_trees)

  expect_equal(nrow(trees_tbl[, 0][1:10, ]), 10)
  expect_equal(nrow(trees_tbl[0][1:10, ]), 10)
  expect_equal(nrow(trees_tbl[1:10, ][, 0]), 10)
  expect_equal(nrow(trees_tbl[1:10, ][0]), 10)
  expect_equal(nrow(trees_tbl[1:10, 0]), 10)

  expect_equal(nrow(trees_tbl[, 0][-(1:10), ]), nrow_trees - 10)
  expect_equal(nrow(trees_tbl[0][-(1:10), ]), nrow_trees - 10)
  expect_equal(nrow(trees_tbl[-(1:10), ][, 0]), nrow_trees - 10)
  expect_equal(nrow(trees_tbl[-(1:10), ][0]), nrow_trees - 10)
  expect_equal(nrow(trees_tbl[-(1:10), 0]), nrow_trees - 10)
})

test_that("[ with explicit NULL works as expected (#696)", {
  trees_tbl <- as_tibble(trees)

  expect_identical(trees_tbl[NULL], trees_tbl[0])
  expect_identical(trees_tbl[, NULL], trees_tbl[, 0])
  expect_identical(trees_tbl[NULL, ], trees_tbl[0, ])
  expect_identical(trees_tbl[NULL, NULL], tibble())
})

test_that("[.tbl_df is careful about names (#1245)", {
  foo <- tibble(x = 1:10, y = 1:10)

  expect_error(
    foo["z"],
    class = "vctrs_error_subscript_oob"
  )
  expect_error(
    foo[c("x", "y", "z")],
    class = "vctrs_error_subscript_oob"
  )

  expect_error(
    foo[, "z"],
    class = "vctrs_error_subscript_oob"
  )
  expect_error(
    foo[, c("x", "y", "z")],
    class = "vctrs_error_subscript_oob"
  )

  verify_errors({
    foo <- tibble(x = 1:10, y = 1:10)
    expect_error(
      foo[c("x", "y", "z")],
      class = "vctrs_error_subscript_oob"
    )
    expect_error(
      foo[c("w", "x", "y", "z")],
      class = "vctrs_error_subscript_oob"
    )
  })
})

test_that("[.tbl_df is careful about column indexes (#83)", {
  verify_errors({
    foo <- tibble(x = 1:10, y = 1:10, z = 1:10)
    expect_identical(foo[1:3], foo)

    expect_error(
      foo[0.5],
      class = "vctrs_error_subscript_type"
    )
    expect_error(
      foo[1:5],
      class = "vctrs_error_subscript_oob"
    )

    expect_error(
      foo[-1:1],
      class = "vctrs_error_subscript_type"
    )
    expect_error(
      foo[c(-1, 1)],
      class = "vctrs_error_subscript_type"
    )
    expect_error(
      foo[c(-1, NA)],
      class = "vctrs_error_subscript_type"
    )

    expect_error(
      foo[-4],
      class = "vctrs_error_subscript_oob"
    )
    expect_tibble_abort(
      foo[c(1:3, NA)],
      abort_na_column_index(4)
    )

    expect_error(foo[as.matrix(1)])

    expect_error(foo[array(1, dim = c(1, 1, 1))])
  })
})

test_that("[.tbl_df is careful about column flags (#83)", {
  verify_errors({
    foo <- tibble(x = 1:10, y = 1:10, z = 1:10)
    expect_identical(foo[TRUE], foo)
    expect_identical(foo[c(TRUE, TRUE, TRUE)], foo)
    expect_identical(foo[FALSE], foo[integer()])
    expect_identical(foo[c(FALSE, TRUE, FALSE)], foo[2])

    expect_error(
      foo[c(TRUE, TRUE)],
      class = "vctrs_error_subscript_size"
    )
    expect_error(
      foo[c(TRUE, TRUE, FALSE, FALSE)],
      class = "vctrs_error_subscript_size"
    )
    expect_tibble_abort(
      foo[c(TRUE, TRUE, NA)],
      abort_na_column_index(3)
    )

    expect_tibble_abort(
      foo[as.matrix(TRUE)],
      abort_subset_matrix_must_have_same_dimensions(quote(as.matrix(TRUE)))
    )
    expect_error(
      foo[array(TRUE, dim = c(1, 1, 1))],
      class = "vctrs_error_subscript_type"
    )
  })
})

test_that("[.tbl_df rejects unknown column indexes (#83)", {
  verify_errors({
    foo <- tibble(x = 1:10, y = 1:10, z = 1:10)
    expect_error(
      foo[list(1:3)],
      class = "vctrs_error_subscript_type"
    )
    expect_error(
      foo[as.list(1:3)],
      class = "vctrs_error_subscript_type"
    )
    expect_error(
      foo[factor(1:3)],
      class = "vctrs_error_subscript_oob"
    )
    expect_error(
      foo[Sys.Date()],
      class = "vctrs_error_subscript_type"
    )
    expect_error(
      foo[Sys.time()],
      class = "vctrs_error_subscript_type"
    )
  })
})

test_that("[.tbl_df supports character subsetting (#312)", {
  foo <- tibble(x = 1:10, y = 1:10, z = 1:10)
  expect_identical(foo[as.character(2:4), ], foo[2:4, ])

  scoped_lifecycle_silence()

  expect_identical(foo[as.character(9:12), ], foo[c(9:10, NA, NA), ])
  expect_identical(foo[letters, ], foo[rlang::rep_along(letters, NA_integer_), ])
  expect_identical(foo["9a", ], foo[NA_integer_, ])
})

test_that("[.tbl_df emits lifecycle warnings with invalid character subsetting", {
  scoped_lifecycle_errors()

  foo <- tibble(x = 1:10, y = 1:10, z = 1:10)
  expect_error(foo[as.character(9:12), ])
  expect_error(foo[letters, ])
  expect_error(foo["9a", ])
})

test_that("[.tbl_df supports integer subsetting (#312)", {
  foo <- tibble(x = 1:10, y = 1:10, z = 1:10)
  expect_identical(foo[2:4, ], as_tibble(as.data.frame(foo)[2:4, ]))
  expect_identical(foo[-3:-5, ], foo[c(1:2, 6:10), ])

  scoped_lifecycle_silence()

  expect_identical(foo[9:12, ], foo[c(9:10, NA, NA), ])
  expect_identical(foo[-(9:12), ], foo[1:8, ])
})

test_that("[.tbl_df emits lifecycle warnings with invalid integer subsetting", {
  scoped_lifecycle_errors()

  foo <- tibble(x = 1:10, y = 1:10, z = 1:10)
  expect_error(foo[9:12, ])
  expect_error(foo[-(9:12), ])
})

test_that("[.tbl_df supports character subsetting if row names are present (#312)", {
  foo <- as_tibble(mtcars, rownames = NA)
  idx <- function(x) rownames(mtcars)[x]

  expect_identical(foo[idx(2:4), ], foo[2:4, ])
  expect_identical(foo[idx(-3:-5), ], foo[-3:-5, ])
  expect_identical(foo[idx(29:34), ], foo[c(29:32, NA, NA), ])

  scoped_lifecycle_silence()

  expect_identical(foo[letters, ], foo[rlang::rep_along(letters, NA_integer_), ])
  expect_identical(foo["9a", ], foo[NA_integer_, ])
})

test_that("[.tbl_df emits lifecycle warnings with invalid character subsetting", {
  scoped_lifecycle_errors()

  foo <- as_tibble(mtcars, rownames = NA)
  idx <- function(x) rownames(mtcars)[x]

  expect_error(foo[letters, ])
  expect_error(foo["9a", ])
})

test_that("[.tbl_df supports logical subsetting (#318)", {
  foo <- tibble(x = 1:10, y = 1:10, z = 1:10)
  expect_identical(foo[c(FALSE, rep(TRUE, 3), rep(F, 6)), ], foo[2:4, ])
  expect_identical(foo[TRUE, ], foo)
  expect_identical(foo[FALSE, ], foo[0L, ])

  expect_error(foo[c(TRUE, FALSE), ], class = "vctrs_error_subscript_size")
})

test_that("[.tbl_df is no-op if args missing", {
  expect_identical(df_all[], df_all)
})

test_that("[.tbl_df supports drop argument (#311)", {
  expect_identical(df_all[, 2, drop = TRUE], df_all[[2]])
  expect_identical(df_all[1, 2, drop = TRUE], df_all[[2]][[1]])
  expect_identical(df_all[1, , drop = TRUE], df_all[1, , ])
})

test_that("[.tbl_df ignores drop argument (with warning) without j argument (#307)", {
  expect_warning(expect_identical(df_all[1, drop = TRUE], df_all[1]))
})

test_that("[.tbl_df emits errors with matrix row subsetting (#760)", {
  scoped_lifecycle_errors()

  foo <- tibble(x = 1:10, y = 1:10, z = 1:10)
  expect_error(foo[matrix(1:2, ncol = 2), ])
  expect_error(foo[matrix(rep(TRUE, 10), ncol = 2), ])
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
