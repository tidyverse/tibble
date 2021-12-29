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
    expect_tibble_error(
      foo[c(1:3, NA)],
      error_na_column_index(4)
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
    expect_tibble_error(
      foo[c(TRUE, TRUE, NA)],
      error_na_column_index(3)
    )

    expect_tibble_error(
      foo[as.matrix(TRUE)],
      error_subset_matrix_must_have_same_dimensions(quote(as.matrix(TRUE)))
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

# [[<- --------------------------------------------------------------------

test_that("[[<-.tbl_df with two indexes assigns", {
  df <- tibble(x = 1:2, y = x)
  df[[1, "x"]] <- 3
  expect_identical(df, tibble(x = 3:2, y = 1:2))
  df[[2, 2]] <- 0
  expect_identical(df, tibble(x = 3:2, y = 1:0))
})

test_that("[[<-.tbl_df can update and add columns (#748)", {
  df <- tibble(x = 1:2, y = x)
  df[["x"]] <- 3:4
  expect_identical(df, tibble(x = 3:4, y = 1:2))
  df[["w"]] <- 5:6
  expect_identical(df, tibble(x = 3:4, y = 1:2, w = 5:6))
})

test_that("[[<-.tbl_df can remove columns (#666)", {
  df <- tibble(x = 1:2, y = x)
  df[["x"]] <- NULL
  expect_identical(df, tibble(y = 1:2))
  df[["z"]] <- NULL
  expect_identical(df, tibble(y = 1:2))
})

test_that("[[<-.tbl_df requires scalar, positive if numeric", {
  df <- tibble(x = 1:2, y = x)
  expect_error(df[[c("x", "y")]] <- 1, class = "vctrs_error_subscript_type")
  expect_error(df[[1:2]] <- 1, class = "vctrs_error_subscript_type")
  expect_error(df[[-1]] <- 1, class = "vctrs_error_subscript_type")
})

test_that("[[<-.tbl_df supports symbols (#691)", {
  foo <- tibble(x = 1:10, y = 1:10)
  foo[[quote(x)]] <- 10:1
  expect_identical(foo$x, 10:1)
})

# [<- ---------------------------------------------------------------------

test_that("[<-.tbl_df can remove columns", {
  df <- tibble(x = 1:2, y = x)
  df["x"] <- NULL
  expect_identical(df, tibble(y = 1:2))

  df <- tibble(x = 1:2, y = x)
  df[, "x"] <- NULL
  expect_identical(df, tibble(y = 1:2))

  df <- tibble(x = 1:2, y = x, z = y)
  df[, c("x", "z")] <- NULL
  expect_identical(df, tibble(y = 1:2))

  df["z"] <- NULL
  expect_identical(df, tibble(y = 1:2))
})

test_that("[<-.tbl_df throws an error with duplicate indexes (#658)", {
  verify_errors({
    df <- tibble(x = 1:2, y = x)
    expect_tibble_error(
      df[c(1, 1)] <- 3,
      error_duplicate_column_subscript_for_assignment(c(1, 1))
    )
    expect_tibble_error(
      df[, c(1, 1)] <- 3,
      error_duplicate_column_subscript_for_assignment(c(1, 1))
    )
    expect_tibble_error(
      df[c(1, 1), ] <- 3,
      error_duplicate_row_subscript_for_assignment(c(1, 1))
    )
  })
})

test_that("[<-.tbl_df supports adding new rows with [i, j] (#651)", {
  df <- tibble(x = 1:2, y = x)
  df[3, "x"] <- 3
  expect_identical(df, tibble(x = 1:3, y = c(1:2, NA)))
  expect_false(has_rownames(df))
})

test_that("[<-.tbl_df supports adding new columns with [i, j] (#651)", {
  df <- tibble(x = 1:2, y = x)
  df[2, "z"] <- 3
  expect_identical(df, tibble(x = 1:2, y = x, z = c(NA, 3)))
  expect_false(has_rownames(df))
})

test_that("[<-.tbl_df supports adding new rows and columns with [i, j] (#651)", {
  df <- tibble(x = 1:2, y = x)
  df[3, "z"] <- 3
  expect_identical(df, tibble(x = c(1:2, NA), y = x, z = c(NA, NA, 3)))
  expect_false(has_rownames(df))
})

test_that("[<-.tbl_df supports negative subsetting", {
  df <- tibble(x = 1:3, y = x, z = y)
  df[2:3, 2:3] <- 0:-1
  expect_equal(df, tibble(x = 1:3, y = 1:-1, z = 1:-1))

  df <- tibble(x = 1:3, y = x, z = y)
  df[-1, 2:3] <- 0:-1
  expect_equal(df, tibble(x = 1:3, y = 1:-1, z = 1:-1))

  df <- tibble(x = 1:3, y = x, z = y)
  df[2:3, -1] <- 0:-1
  expect_equal(df, tibble(x = 1:3, y = 1:-1, z = 1:-1))

  df <- tibble(x = 1:3, y = x, z = y)
  df[2:3, -1] <- list(0:-1, 0:-1)
  expect_equal(df, tibble(x = 1:3, y = 1:-1, z = 1:-1))

  df <- tibble(x = 1:3, y = x, z = y)
  df[-1, -1] <- 0:-1
  expect_equal(df, tibble(x = 1:3, y = 1:-1, z = 1:-1))

  df <- tibble(x = 1:3, y = x, z = y)
  df[-1, -1] <- list(0:-1, 0:-1)
  expect_equal(df, tibble(x = 1:3, y = 1:-1, z = 1:-1))
})

test_that("[<-.tbl_df supports adding duplicate columns", {
  df <- tibble(x = 1:2)
  df[2] <- tibble(x = 3:4)
  expect_identical(df, tibble(x = 1:2, x = 3:4, .name_repair = "minimal"))
})


test_that("[<-.tbl_df supports matrix on the RHS (#762)", {
  df <- tibble(x = 1:4, y = letters[1:4])
  df[1:2] <- matrix(8:1, ncol = 2)
  expect_identical(df, tibble(x = 8:5, y = 4:1))

  df <- tibble(x = 1:4, y = letters[1:4])
  df[1:2] <- array(4:1, dim = c(4, 1, 1))
  expect_identical(df, tibble(x = 4:1, y = 4:1))

  df <- tibble(x = 1:4, y = letters[1:4])
  df[1:2] <- array(8:1, dim = c(4, 2, 1))
  expect_identical(df, tibble(x = 8:5, y = 4:1))

  df <- tibble(x = 1:4, y = letters[1:4])
  expect_tibble_error(
    df[1:3, 1:2] <- matrix(6:1, ncol = 2),
    error_assign_incompatible_type(
      df, as.data.frame(matrix(6:1, ncol = 2)), 2, quote(matrix(6:1, ncol = 2)),
      cnd_message(tryCatch(vctrs::vec_assign(letters, 1:3, 3:1), error = identity))
    )
  )
  expect_tibble_error(
    df[1:2] <- array(8:1, dim = c(2, 1, 4)),
    error_need_rhs_vector_or_null(quote(array(8:1, dim = c(2, 1, 4))))
  )
  expect_tibble_error(
    df[1:2] <- array(8:1, dim = c(4, 1, 2)),
    error_need_rhs_vector_or_null(quote(array(8:1, dim = c(4, 1, 2))))
  )
})

test_that("[<- with explicit NULL doesn't change anything (#696)", {
  trees_tbl_orig <- as_tibble(trees)

  trees_tbl <- trees_tbl_orig
  trees_tbl[NULL] <- NA
  expect_identical(trees_tbl, trees_tbl_orig)

  trees_tbl <- trees_tbl_orig
  trees_tbl[, NULL] <- NA
  expect_identical(trees_tbl, trees_tbl_orig)

  trees_tbl <- trees_tbl_orig
  trees_tbl[NULL, ] <- NA
  expect_identical(trees_tbl, trees_tbl_orig)

  trees_tbl <- trees_tbl_orig
  trees_tbl[NULL, NULL] <- NA
  expect_identical(trees_tbl, trees_tbl_orig)
})

test_that("[<- with FALSE still adds column (#846)", {
  tbl <- tibble(a = 1:3)
  tbl[FALSE, "b"] <- 2
  expect_identical(tbl, tibble(a = 1:3, b = NA_real_))
})

test_that("[<-.tbl_df is careful about attributes (#155)", {
  df <- tibble(x = 1:2, y = x)
  attr(df, "along for the ride") <- "still here"

  df[names(df)] <- df
  expect_identical(attr(df, "along for the ride"), "still here")
  expect_false(has_rownames(df))
  df["x"] <- 3:4
  expect_identical(attr(df, "along for the ride"), "still here")
  expect_false(has_rownames(df))
  df[1:2] <- 5:6
  expect_identical(attr(df, "along for the ride"), "still here")
  expect_false(has_rownames(df))
  df[2] <- 7:8
  expect_identical(attr(df, "along for the ride"), "still here")
  expect_false(has_rownames(df))
  df[c(TRUE, FALSE)] <- 9:10
  expect_identical(attr(df, "along for the ride"), "still here")
  expect_false(has_rownames(df))

  df[, names(df)] <- df
  expect_identical(attr(df, "along for the ride"), "still here")
  expect_false(has_rownames(df))
  df[, "x"] <- 3:4
  expect_identical(attr(df, "along for the ride"), "still here")
  expect_false(has_rownames(df))
  df[, 1:2] <- 5:6
  expect_identical(attr(df, "along for the ride"), "still here")
  expect_false(has_rownames(df))
  df[, 2] <- 7:8
  expect_identical(attr(df, "along for the ride"), "still here")
  expect_false(has_rownames(df))
  df[, c(TRUE, FALSE)] <- 9:10
  expect_identical(attr(df, "along for the ride"), "still here")
  expect_false(has_rownames(df))

  df[1, names(df)] <- df[1, ]
  expect_identical(attr(df, "along for the ride"), "still here")
  expect_false(has_rownames(df))
  df[1, "x"] <- 3
  expect_identical(attr(df, "along for the ride"), "still here")
  expect_false(has_rownames(df))
  df[1, 1:2] <- 5
  expect_identical(attr(df, "along for the ride"), "still here")
  expect_false(has_rownames(df))
  df[1, 2] <- 7
  expect_identical(attr(df, "along for the ride"), "still here")
  expect_false(has_rownames(df))
  df[1, c(TRUE, FALSE)] <- 9
  expect_identical(attr(df, "along for the ride"), "still here")
  expect_false(has_rownames(df))

  df[1:2, ] <- df
  expect_identical(attr(df, "along for the ride"), "still here")
  expect_false(has_rownames(df))
  df[1:2, ] <- df[1, ]
  expect_identical(attr(df, "along for the ride"), "still here")
  expect_false(has_rownames(df))

  df[, ] <- df
  expect_identical(attr(df, "along for the ride"), "still here")
  expect_false(has_rownames(df))
  df[] <- df
  expect_identical(attr(df, "along for the ride"), "still here")
  expect_false(has_rownames(df))
})

# $<- ---------------------------------------------------------------------

test_that("$<- doesn't throw warning if name doesn't exist", {
  df <- tibble(x = 1)
  expect_warning(
    df$y <- 2,
    NA
  )
  expect_identical(df, tibble(x = 1, y = 2))
  expect_false(has_rownames(df))
})

test_that("$<- throws different warning if attempting a partial initialization (#199)", {
  df <- tibble(x = 1:3)
  expect_warning(
    df$y[1] <- 2,
    "Unknown or uninitialised column: `y`",
    fixed = TRUE
  )

  expect_tibble_error(
    expect_warning(
      df$z[1:2] <- 2,
      "Unknown or uninitialised column: `z`",
      fixed = TRUE
    ),
    error_assign_incompatible_size(3, list(1:2), 1, NULL, quote(`<dbl>`))
  )
})

test_that("$<- recycles only values of length one", {
  df <- tibble(x = 1:3)

  df$y <- 4
  expect_identical(df, tibble(x = 1:3, y = 4))
  expect_false(has_rownames(df))

  df$z <- 5:7
  expect_identical(df, tibble(x = 1:3, y = 4, z = 5:7))
  expect_false(has_rownames(df))

  verify_errors({
    df <- tibble(x = 1:3)

    expect_tibble_error(
      df$w <- 8:9,
      error_assign_incompatible_size(3, list(8:9), 1, NULL, quote(8:9))
    )

    expect_tibble_error(
      df$a <- character(),
      error_assign_incompatible_size(3, list(character()), 1, NULL, quote(character()))
    )
  })
})

test_that("output test", {
  expect_snapshot_with_error({
    "# [.tbl_df is careful about names (#1245)"
    foo <- tibble(x = 1:10, y = 1:10)
    foo[c("x", "y", "z")]
    foo[c("w", "x", "y", "z")]
    foo[as.matrix("x")]
    foo[array("x", dim = c(1, 1, 1))]

    "# [.tbl_df is careful about column indexes (#83)"
    foo <- tibble(x = 1:10, y = 1:10, z = 1:10)
    foo[0.5]
    foo[1:5]
    foo[-1:1]
    foo[c(-1, 1)]
    foo[c(-1, NA)]
    foo[-4]
    foo[c(1:3, NA)]
    foo[as.matrix(1)]
    foo[array(1, dim = c(1, 1, 1))]
    foo[mean]
    foo[foo]

    "# [.tbl_df is careful about row indexes"
    foo <- tibble(x = 1:3, y = 1:3, z = 1:3)
    foo[0.5, ]
    invisible(foo[1:5, ])
    foo[-1:1, ]
    foo[c(-1, 1), ]
    foo[c(-1, NA), ]
    invisible(foo[-4, ])
    foo[array(1, dim = c(1, 1, 1)), ]
    foo[mean, ]
    foo[foo, ]

    "# [.tbl_df is careful about column flags (#83)"
    foo <- tibble(x = 1:10, y = 1:10, z = 1:10)
    foo[c(TRUE, TRUE)]
    foo[c(TRUE, TRUE, FALSE, FALSE)]
    foo[c(TRUE, TRUE, NA)]
    foo[as.matrix(TRUE)]
    foo[array(TRUE, dim = c(1, 1, 1))]

    "# [.tbl_df is careful about row flags"
    foo <- tibble(x = 1:3, y = 1:3, z = 1:3)
    foo[c(TRUE, TRUE), ]
    foo[c(TRUE, TRUE, FALSE, FALSE), ]
    foo[array(TRUE, dim = c(1, 1, 1)), ]

    "# [.tbl_df rejects unknown column indexes (#83)"
    foo <- tibble(x = 1:10, y = 1:10, z = 1:10)
    foo[list(1:3)]
    foo[as.list(1:3)]
    foo[factor(1:3)]
    foo[Sys.Date()]

    "# [.tbl_df rejects unknown row indexes"
    foo <- tibble(x = 1:10, y = 1:10, z = 1:10)
    foo[list(1:3), ]
    foo[as.list(1:3), ]
    foo[factor(1:3), ]
    foo[Sys.Date(), ]

    "# [.tbl_df and matrix subsetting"
    foo <- tibble(a = 1:3, b = letters[1:3])
    foo[is.na(foo)]
    foo[!is.na(foo)]
    foo[as.matrix("x")]
    foo[array("x", dim = c(1, 1, 1))]

    "# [.tbl_df and OOB indexing"
    foo <- tibble(a = 1:3, b = letters[1:3])
    invisible(foo[3:5, ])
    invisible(foo[-(3:5), ])
    invisible(foo["x", ])

    "# [.tbl_df and logical recycling"
    foo <- tibble(a = 1:4, b = a)
    foo[c(TRUE, FALSE), ]

    "# [[.tbl_df rejects invalid column indexes"
    foo <- tibble(x = 1:10, y = 1:10)
    foo[[]]
    foo[[, 1]]
    foo[[1, ]]
    foo[[, ]]
    foo[[1:3]]
    foo[[letters[1:3]]]
    foo[[TRUE]]
    foo[[-1]]
    foo[[1.5]]
    foo[[3]]
    foo[[Inf]]
    foo[[mean]]
    foo[[foo]]

    "# [[.tbl_df throws error with NA index"
    foo <- tibble(x = 1:10, y = 1:10)
    foo[[NA]]

    "# $.tbl_df and partial matching/invalid columns"
    foo <- tibble(data = 1:10)
    foo$d
    foo$e

    "# [<-.tbl_df rejects unknown column indexes (#83)"
    foo <- tibble(x = 1:10, y = 1:10, z = 1:10)
    foo[list(1:3)] <- 1
    foo[as.list(1:3)] <- 1
    foo[factor(1:3)] <- 1
    foo[Sys.Date()] <- 1

    "# [.tbl_df emits lifecycle warnings with one-column matrix indexes (#760)"
    foo <- tibble(x = 1:10, y = 1:10, z = 1:10)
    invisible(foo[matrix(1:2, ncol = 1), ])
    invisible(foo[matrix(rep(TRUE, 10), ncol = 1), ])

    "# [<-.tbl_df rejects unknown row indexes"
    foo <- tibble(x = 1:10, y = 1:10, z = 1:10)
    foo[list(1:3), ] <- 1
    foo[as.list(1:3), ] <- 1
    foo[factor(1:3), ] <- 1
    foo[Sys.Date(), ] <- 1

    "# [<-.tbl_df throws an error with duplicate indexes (#658)"
    df <- tibble(x = 1:2, y = x)
    df[c(1, 1)] <- 3
    df[, c(1, 1)] <- 3
    df[c(1, 1), ] <- 3

    "# [<-.tbl_df throws an error with NA indexes"
    df <- tibble(x = 1:2, y = x)
    df[NA] <- 3
    df[NA, ] <- 3

    "# [<-.tbl_df and logical indexes"
    df <- tibble(x = 1:2, y = x)
    df[FALSE] <- 1
    df
    df[, TRUE] <- 2
    df

    "# [<-.tbl_df throws an error with bad RHS"
    df <- tibble(x = 1:2, y = x)
    df[] <- mean
    df[] <- lm(y ~ x, df)

    "# [<-.tbl_df throws an error with OOB assignment"
    df <- tibble(x = 1:2, y = x)
    df[4:5] <- 3
    df[4:5, ] <- 3
    df[-4, ] <- 3
    df[-(4:5), ] <- 3

    "# [<-.tbl_df and recycling"
    df <- tibble(x = 1:3, y = x, z = y)
    df[1:2] <- list(0, 0, 0)
    df[] <- list(0, 0)
    df[1, ] <- 1:3
    df[1:2, ] <- 1:3
    df[, ] <- 1:2
    df[1, ] <- list(a = 1:3, b = 1)
    df[1, ] <- list(a = 1, b = 1:3)
    df[1:2, ] <- list(a = 1:3, b = 1)
    df[1:2, ] <- list(a = 1, b = 1:3)
    df[1, 1:2] <- list(a = 1:3, b = 1)
    df[1, 1:2] <- list(a = 1, b = 1:3)
    df[1:2, 1:2] <- list(a = 1:3, b = 1)
    df[1:2, 1:2] <- list(a = 1, b = 1:3)
    df[1, ] <- list(a = 1:3, b = 1, c = 1:3)
    df[1, ] <- list(a = 1, b = 1:3, c = 1:3)
    df[1:2, ] <- list(a = 1:3, b = 1, c = 1:3)
    df[1:2, ] <- list(a = 1, b = 1:3, c = 1:3)

    "# [<-.tbl_df and coercion"
    df <- tibble(x = 1:3, y = letters[1:3], z = as.list(1:3))
    df[1:3, 1:2] <- df[2:3]
    df[1:3, 1:2] <- df[1]
    df[1:3, 1:2] <- df[[1]]
    df[1:3, 1:3] <- df[3:1]
    df[1:3, 1:3] <- NULL

    "# [<-.tbl_df and overwriting NA"
    df <- tibble(x = rep(NA, 3), z = matrix(NA, ncol = 2, dimnames = list(NULL, c("a", "b"))))
    df[1, "x"] <- 5
    df[1, "z"] <- 5
    df

    "# [<-.tbl_df and overwriting with NA"
    df <- tibble(
      a = TRUE,
      b = 1L,
      c = sqrt(2),
      d = 3i + 1,
      e = "e",
      f = raw(1),
      g = tibble(x = 1, y = 1),
      h = matrix(1:3, nrow = 1)
    )
    df[FALSE, "a"] <- NA
    df[FALSE, "b"] <- NA
    df[FALSE, "c"] <- NA
    df[FALSE, "d"] <- NA
    df[FALSE, "e"] <- NA
    df[FALSE, "f"] <- NA
    df[FALSE, "g"] <- NA
    df[FALSE, "h"] <- NA
    df
    df[integer(), "a"] <- NA
    df[integer(), "b"] <- NA
    df[integer(), "c"] <- NA
    df[integer(), "d"] <- NA
    df[integer(), "e"] <- NA
    df[integer(), "f"] <- NA
    df[integer(), "g"] <- NA
    df[integer(), "h"] <- NA
    df
    df[1, "a"] <- NA
    df[1, "b"] <- NA
    df[1, "c"] <- NA
    df[1, "d"] <- NA
    df[1, "e"] <- NA
    df[1, "f"] <- NA
    df[1, "g"] <- NA
    df[1, "h"] <- NA
    df

    "# [<-.tbl_df and matrix subsetting"
    foo <- tibble(a = 1:3, b = letters[1:3])
    foo[!is.na(foo)] <- "bogus"
    foo[as.matrix("x")] <- NA
    foo[array("x", dim = c(1, 1, 1))] <- NA
    foo[is.na(foo)] <- 1:3
    foo[is.na(foo)] <- lm(a ~ b, foo)

    "# [[<-.tbl_df rejects invalid column indexes"
    foo <- tibble(x = 1:10, y = 1:10)
    foo[[]] <- 1
    foo[[, 1]] <- 1
    foo[[1, ]] <- 1
    foo[[, ]] <- 1
    foo[[1:3]] <- 1
    foo[[letters[1:3]]] <- 1
    foo[[TRUE]] <- 1
    foo[[NA_integer_]] <- 1
    foo[[mean]] <- 1
    foo[[foo]] <- 1
    foo[[1:3, 1]] <- 1
    foo[[TRUE, 1]] <- 1
    foo[[mean, 1]] <- 1
    foo[[foo, 1]] <- 1

    "# [[<-.tbl_df throws an error with OOB assignment"
    df <- tibble(x = 1:2, y = x)
    df[[4]] <- 3

    "# [[<-.tbl_df throws an error with bad RHS"
    df <- tibble(x = 1:2, y = x)
    df[[1]] <- mean
    df[[1]] <- lm(y ~ x, df)

    "# [[<-.tbl_df recycles only values of length one"
    df <- tibble(x = 1:3)
    df[["x"]] <- 8:9
    df[["w"]] <- 8:9
    df[["a"]] <- character()

    "# [<-.tbl_df throws an error with invalid values"
    df <- tibble(x = 1:2, y = x)
    df[1] <- lm(y ~ x, df)
    df[1:2, 1] <- NULL

    "# $<- recycles only values of length one"
    df <- tibble(x = 1:3)
    df$x <- 8:9
    df$w <- 8:9
    df$a <- character()
  })
})

test_that("[[<- restores class", {
  skip_if_not_installed("dplyr")

  df <- dplyr::group_by(mtcars, cyl)
  df[[1]] <- mtcars$cyl
  expect_s3_class(df, "grouped_df")

  df <- dplyr::group_by(mtcars, cyl)
  df[[2]] <- mtcars$vs
  expect_s3_class(df, "grouped_df")
  expect_identical(dplyr::group_data(df)$cyl, c(0, 1))
})
