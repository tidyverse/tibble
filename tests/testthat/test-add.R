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
  trees_new <- add_row(trees, Volume = NA)
  expect_equal(class(trees), class(trees_new))

  trees_new <- add_row(as_tibble(trees), Volume = NA)
  expect_equal(class(as_tibble(trees)), class(trees_new))
})

test_that("add_row() keeps class of object when adding in the middle", {
  trees_new <- add_row(trees, Volume = NA, .after = 10)
  expect_equal(class(trees), class(trees_new))

  trees_new <- add_row(as_tibble(trees), Volume = NA)
  expect_equal(class(as_tibble(trees)), class(trees_new))
})

test_that("add_row() keeps class of object when adding in the beginning", {
  trees_new <- add_row(trees, Volume = NA, .after = 0)
  expect_equal(class(trees), class(trees_new))

  trees_new <- add_row(as_tibble(trees), Volume = NA)
  expect_equal(class(as_tibble(trees)), class(trees_new))
})

test_that("adds empty row if no arguments", {
  trees1 <- add_row(trees)
  expect_equal(nrow(trees1), nrow(trees) + 1)
  new_trees_row <- trees1[nrow(trees1), , drop = TRUE]
  expect_true(all(is.na(new_trees_row)))
})

test_that("error if adding row with unknown variables", {
  expect_tibble_abort(
    add_row(tibble(a = 3), xxyzy = "err"),
    abort_incompatible_new_rows("xxyzy")
  )

  expect_tibble_abort(
    add_row(tibble(a = 3), b = "err", c = "oops"),
    abort_incompatible_new_rows(c("b", "c"))
  )
})

test_that("deprecated adding rows to non-data-frames", {
  expect_error(
    expect_warning(add_row(as.matrix(mtcars), mpg = 4))
  )
})

test_that("can add multiple rows", {
  df <- tibble(a = 3L)
  df_new <- add_row(df, a = 4:5)
  expect_identical(df_new, tibble(a = 3:5))
})

test_that("can recycle when adding rows", {
  trees_new <- add_row(trees, Height = -1:-2, Volume = 2:3)
  expect_identical(nrow(trees_new), nrow(trees) + 2L)
  expect_identical(trees_new$Height, c(trees$Height, -1:-2))
  expect_identical(
    trees_new$Volume,
    c(trees$Volume, 2:3)
  )
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

test_that("can safely add to factor columns everywhere (#296)", {
  df <- tibble(a = factor(letters[1:3]))
  expect_identical(add_row(df), tibble(a = factor(c(letters[1:3], NA))))
  expect_identical(
    add_row(df, .before = 1),
    tibble(a = factor(c(NA, letters[1:3])))
  )
  expect_identical(
    add_row(df, .before = 2),
    tibble(a = factor(c("a", NA, letters[2:3])))
  )
  expect_identical(add_row(df, a = "d"), tibble(a = c(letters[1:4])))
  expect_identical(
    add_row(df, a = "d", .before = 1),
    tibble(a = c("d", letters[1:3]))
  )
  expect_identical(
    add_row(df, a = "d", .before = 2),
    tibble(a = c("a", "d", letters[2:3]))
  )
})

test_that("error if both .before and .after are given", {
  df <- tibble(a = 1:3)
  expect_tibble_abort(
    add_row(df, a = 4:5, .after = 2, .before = 3),
    abort_both_before_after()
  )
})

test_that("missing row names stay missing when adding row", {
  expect_false(has_rownames(trees))
  expect_false(has_rownames(add_row(trees, Volume = NA, .after = 0)))
  expect_false(has_rownames(add_row(trees, Volume = NA, .after = nrow(trees))))
  expect_false(has_rownames(add_row(trees, Volume = NA, .before = 10)))
})

test_that("adding to a list column adds a NULL value (#148)", {
  expect_null(add_row(tibble(a = as.list(1:3)))$a[[4]])
  expect_null(add_row(tibble(a = as.list(1:3)), .before = 1)$a[[1]])
  expect_null(add_row(tibble(a = as.list(1:3)), .after = 1)$a[[2]])
  expect_null(add_row(tibble(a = as.list(1:3), b = 1:3), b = 4:6)$a[[5]])
})

test_that("add_row() keeps the class of empty columns", {
  new_tibble <- add_row(df_empty, to_be_added = 5)
  expect_equal(sapply(df_empty, class), sapply(new_tibble, class))
})

test_that("add_row() fails nicely for grouped data frames (#179)", {
  skip_if_not_installed("dplyr")
  expect_tibble_abort(
    add_row(dplyr::group_by(trees, Volume), Height = 3),
    abort_add_rows_to_grouped_df()
  )
})

test_that("add_row() works when adding zero row input (#809)", {
  x <- tibble(x = 1, y = 2)
  y <- tibble(y = double())

  expect_identical(add_row(x, x = double()), x)
  expect_identical(add_row(x, y), x)
  expect_identical(add_row(x, NULL), x)
  expect_identical(add_row(x, ), x)
})

# add_column ------------------------------------------------------------

test_that("can add new column", {
  df_all_new <- add_column(df_all, j = 1:3, k = 3:1)
  expect_identical(nrow(df_all_new), nrow(df_all))

  # Since the switch to vctrs the `tzone` attribute is set in
  # `df_all_new`. Test with `equal` instead of `identical`. Also
  # `dplyr:::all.equal.tbl_df()` somehow fails with a type error
  # (dplyr 0.8.3), so we bypass the method.
  expect_true(all.equal.default(df_all_new[seq_along(df_all)], df_all))

  expect_identical(df_all_new$j, 1:3)
  expect_identical(df_all_new$k, 3:1)
})

test_that("add_column() works with 0-col tibbles (#786)", {
  local_options(lifecycle_verbosity = "error")

  expect_identical(
    add_column(new_tibble(list(), nrow = 1), a = 1),
    tibble(a = 1)
  )
})

test_that("add_column() keeps class of object", {
  trees_new <- add_column(trees, x = 1:31)
  expect_equal(class(trees), class(trees_new))

  trees_new <- add_column(as_tibble(trees), x = 1:31)
  expect_equal(class(as_tibble(trees)), class(trees_new))
})

test_that("add_column() keeps class of object when adding in the middle", {
  trees_new <- add_column(trees, x = 1:31, .after = 3)
  expect_equal(class(trees), class(trees_new))

  trees_new <- add_column(as_tibble(trees), x = 1:31)
  expect_equal(class(as_tibble(trees)), class(trees_new))
})

test_that("add_column() keeps class of object when adding in the beginning", {
  trees_new <- add_column(trees, x = 1:31, .after = 0)
  expect_equal(class(trees), class(trees_new))

  trees_new <- add_column(as_tibble(trees), x = 1:31)
  expect_equal(class(as_tibble(trees)), class(trees_new))
})

test_that("add_column() keeps unchanged if no arguments", {
  expect_identical(trees, add_column(trees))
})

test_that("add_column() can add to empty tibble or data frame", {
  expect_identical(add_column(tibble(.rows = 3), a = 1:3), tibble(a = 1:3))
  expect_identical(
    add_column(as.data.frame(tibble(.rows = 3)), a = 1:3),
    data.frame(a = 1:3)
  )
})

test_that("error if adding existing columns", {
  expect_tibble_abort(
    add_column(tibble(a = 3), a = 5),
    abort_column_names_must_be_unique("a", repair_hint = TRUE)
  )
})

test_that("error if adding wrong number of rows with add_column()", {
  expect_tibble_abort(
    add_column(tibble(a = 3), b = 4:5),
    abort_incompatible_new_cols(1, data.frame(b = 4:5))
  )
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

test_that("can recyle for zero-row data frame (#167)", {
  df <- tibble(a = 1:3)[0, ]
  df_new <- add_column(df, b = 4, c = character())
  expect_identical(
    df_new,
    tibble(a = integer(), b = numeric(), c = character())
  )
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
  expect_tibble_abort(
    add_column(df, b = 4:6, .after = 2, .before = 3),
    abort_both_before_after()
  )
})

test_that("error if column named by .before or .after not found", {
  df <- tibble(a = 1:3)
  expect_tibble_abort(
    add_column(df, b = 4:6, .after = "x"),
    abort_unknown_column_names("x")
  )
  expect_tibble_abort(
    add_column(df, b = 4:6, .before = "x"),
    abort_unknown_column_names("x")
  )
})

test_that("deprecated adding columns to non-data-frames", {
  expect_error(
    # Two lifecycle warnings, requires testthat > 2.3.2:
    suppressWarnings(
      expect_warning(add_column(as.matrix(mtcars), x = 1))
    )
  )
})

test_that("missing row names stay missing when adding column", {
  expect_false(has_rownames(trees))
  expect_false(has_rownames(add_column(trees, x = 1:31, .after = 0)))
  expect_false(has_rownames(add_column(trees, x = 1:31, .after = ncol(trees))))
  expect_false(has_rownames(add_column(trees, x = 1:31, .before = 2)))
})

test_that("output test", {
  expect_snapshot(error = TRUE, {
    add_row(tibble(), a = 1)
    add_row(tibble(), a = 1, b = 2)
    add_row(tibble(), !!!set_names(letters))
    add_row(dplyr::group_by(tibble(a = 1), a))
    add_row(tibble(a = 1), a = 2, .before = 1, .after = 1)

    add_column(tibble(a = 1), a = 1)
    add_column(tibble(a = 1, b = 2), a = 1, b = 2)
    add_column(tibble(!!!set_names(letters)), !!!set_names(letters))
    add_column(tibble(a = 2:3), b = 4:6)
    add_column(tibble(a = 1), b = 1, .before = 1, .after = 1)
  })
})
