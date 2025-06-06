test_that("new_tibble() with new class argument", {
  tbl <- new_tibble(
    data.frame(a = 1:3),
    names = "b",
    attr1 = "value1",
    attr2 = 2,
    nrow = 3,
    class = c("nt", "data.frame")
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

test_that("new_tibble() with additional attributes", {
  df <- data.frame(a = 1:3)
  foo <- df
  attr(foo, "foo") <- "bar"

  tbl_df <- new_tibble(df, nrow = 3, foo = "baz")
  tbl_foo <- new_tibble(foo, nrow = 3, foo = "baz")
  expect_identical(tbl_df, tbl_foo)
})

test_that("new_tibble() can add attributes on zero column tibbles with no attributes", {
  expect_identical(
    attr(new_tibble(list(), nrow = 0L, foo = 10), "foo"),
    10
  )
})

test_that("new_tibble() ignores unnamed additional attributes", {
  expect_identical(
    new_tibble(list(x = 1), "foo", nrow = 1),
    new_tibble(list(x = 1), nrow = 1)
  )

  expect_identical(
    new_tibble(list(x = 1), "foo", bar = "bar", nrow = 1),
    new_tibble(list(x = 1), bar = "bar", nrow = 1)
  )
})

test_that("new_tibble() allows setting names through `...`", {
  expect_identical(
    new_tibble(list(1), names = "x", nrow = 1),
    new_tibble(list(x = 1), nrow = 1)
  )
})

test_that("new_tibble() supports missing `nrow` (#781)", {
  expect_identical(new_tibble(list()), tibble())
  expect_identical(new_tibble(list(a = 1:3)), tibble(a = 1:3))
})

test_that("new_tibble() keeps x and n attributes", {
  expect_identical(
    attr(new_tibble(list(x = 1), n = 2, nrow = 1), "n"),
    2
  )

  expect_identical(
    attr(new_tibble(structure(list(x = 1), n = 2), nrow = 1), "n"),
    2
  )

  expect_identical(
    attr(new_tibble(structure(list(x = 1), x = "value"), nrow = 1), "x"),
    "value"
  )
})

test_that("new_tibble() supports language objects", {
  expect_identical(
    new_tibble(list(), foo = quote(bar())),
    structure(new_tibble(list()), foo = quote(bar()))
  )
})

test_that("new_tibble checks", {
  scoped_lifecycle_errors()

  expect_identical(new_tibble(list(), nrow = 0), tibble())
  expect_identical(new_tibble(list(), nrow = 5), tibble(.rows = 5))
  expect_identical(
    new_tibble(list(a = 1:3, b = 4:6), nrow = 3),
    tibble(a = 1:3, b = 4:6)
  )
  expect_tibble_abort(
    new_tibble(1:3, nrow = 1),
    abort_new_tibble_must_be_list()
  )
  expect_tibble_abort(
    new_tibble(list(a = 1), nrow = -1),
    abort_new_tibble_nrow_must_be_nonnegative()
  )
  expect_tibble_abort(
    new_tibble(list(a = 1), nrow = "a"),
    abort_new_tibble_nrow_must_be_nonnegative()
  )
  expect_tibble_abort(
    new_tibble(list(a = 1), nrow = 1:2),
    abort_new_tibble_nrow_must_be_nonnegative()
  )
  expect_tibble_abort(
    new_tibble(list(a = 1), nrow = 2147483648),
    abort_new_tibble_nrow_must_be_nonnegative()
  )
  expect_tibble_abort(
    new_tibble(list(1), nrow = 1),
    abort_names_must_be_non_null()
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
  expect_tibble_abort(
    validate_tibble(new_tibble(list(a = 1, b = 2:3), nrow = 1)),
    abort_incompatible_size(
      1,
      c("a", "b"),
      1:2,
      "Requested with `nrow` argument"
    )
  )
})

test_that("output test", {
  expect_snapshot(error = TRUE, {
    new_tibble(1:3, nrow = 1)
    new_tibble(as.list(1:3))
  })
})
