test_that("has_rownames and remove_rownames", {
  expect_false(has_rownames(trees))
  expect_true(has_rownames(mtcars))
  expect_false(has_rownames(remove_rownames(mtcars)))
  expect_false(has_rownames(remove_rownames(trees)))
  expect_false(has_rownames(1:10))
})

test_that("setting row names on a tibble raises a warning", {
  mtcars2 <- as_tibble(mtcars)
  expect_false(has_rownames(mtcars2))

  expect_warning(
    rownames(mtcars2) <- rownames(mtcars),
    "deprecated",
    fixed = TRUE
  )
})

test_that("rownames_to_column keeps the tbl classes (#882)", {
  res <- rownames_to_column(mtcars)
  expect_false(has_rownames(res))
  expect_equal(class(res), class(mtcars))
  expect_equal(res$rowname, rownames(mtcars))
  expect_tibble_error(
    rownames_to_column(mtcars, "wt"),
    error_column_names_must_be_unique("wt", repair = FALSE)
  )

  mtcars2 <- as_tibble(mtcars, rownames = NA)

  res1 <- rownames_to_column(mtcars2, "Make&Model")
  expect_false(has_rownames(res1))
  expect_equal(class(res1), class(mtcars2))
  expect_equal(res1$`Make&Model`, rownames(mtcars))
  expect_tibble_error(
    rownames_to_column(mtcars2, "wt"),
    error_column_names_must_be_unique("wt", repair = FALSE)
  )
})

test_that("rowid_to_column keeps the tbl classes", {
  res <- rowid_to_column(mtcars)
  expect_false(has_rownames(res))
  expect_equal(class(res), class(mtcars))
  expect_equal(res$rowid, seq_len(nrow(mtcars)))
  expect_tibble_error(
    rowid_to_column(mtcars, "wt"),
    error_column_names_must_be_unique("wt", repair = FALSE)
  )

  mtcars2 <- as_tibble(mtcars, rownames = NA)

  res1 <- rowid_to_column(mtcars2, "row_id")
  expect_false(has_rownames(res1))
  expect_equal(class(res1), class(mtcars2))
  expect_equal(res1$row_id, seq_len(nrow(mtcars)))
  expect_tibble_error(
    rowid_to_column(mtcars2, "wt"),
    error_column_names_must_be_unique("wt", repair = FALSE)
  )
})

test_that("column_to_rownames returns tbl", {
  var <- "car"
  mtcars1 <- as_tibble(mtcars, rownames = NA)

  expect_true(has_rownames(mtcars1))
  res0 <- rownames_to_column(mtcars1, var)
  expect_warning(res <- column_to_rownames(res0, var), NA)
  expect_true(has_rownames(res))
  expect_equal(class(res), class(mtcars))
  expect_equal(rownames(res), rownames(mtcars1))
  expect_equal(res, mtcars)
  expect_false(has_name(res, var))

  mtcars1$num <- rev(seq_len(nrow(mtcars)))
  res0 <- rownames_to_column(mtcars1)
  expect_warning(res <- column_to_rownames(res0, var = "num"), NA)
  expect_true(has_rownames(res))
  expect_equal(rownames(res), as.character(mtcars1$num))
  expect_tibble_error(
    column_to_rownames(res),
    error_already_has_rownames()
  )
  expect_tibble_error(
    column_to_rownames(rownames_to_column(mtcars1, var), "num2"),
    error_unknown_column_names("num2")
  )
})

test_that("converting to data frame does not add row names", {
  expect_false(has_rownames(as.data.frame(as_tibble(trees))))
})

test_that("work around structure() bug (#852)", {
  expect_false(has_rownames(structure(trees, .drop = FALSE)))
})

test_that("output test", {
  expect_snapshot_with_error({
    rownames_to_column(mtcars, "cyl")
    rowid_to_column(trees, "Volume")

    column_to_rownames(mtcars, "cyl")
    column_to_rownames(trees, "foo")
  })
})
