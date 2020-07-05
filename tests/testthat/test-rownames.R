context("rownames")

test_that("has_rownames and remove_rownames", {
  expect_false(has_rownames(iris))
  expect_true(has_rownames(mtcars))
  expect_false(has_rownames(remove_rownames(mtcars)))
  expect_false(has_rownames(remove_rownames(iris)))
  expect_false(has_rownames(1:10))
})

test_that("setting row names on a tibble raises a warning", {
  mtcars_tbl <- as_tibble(mtcars)
  expect_warning(rownames(mtcars_tbl) <- rownames(mtcars), "deprecated")
})

test_that("rownames_to_column keeps the tbl classes (#882)", {
  res <- rownames_to_column( mtcars, "Make&Model" )
  expect_false(has_rownames(res))
  expect_equal( class(res), class(mtcars) )
  expect_error(rownames_to_column( mtcars, "wt"),
               paste("There is a column named wt already!")  )
  res1 <- rownames_to_column( as_tibble(mtcars), "Make&Model" )
  expect_false(has_rownames(res1))
  expect_equal( class(res1), class(as_tibble(mtcars)) )
  expect_error(rownames_to_column( mtcars, "wt"),
               paste("There is a column named wt already!")  )
})

test_that("column_to_rownames returns tbl", {
  var <- "car"
  mtcars1 <- as_tibble(mtcars)
  expect_true(has_rownames(mtcars1))
  res0 <- rownames_to_column(mtcars1, var)
  expect_warning(res <- column_to_rownames(res0, var))
  expect_true(has_rownames(res))
  expect_equal(class(res), class(mtcars1))
  expect_equal(rownames(res), rownames(mtcars1))
  expect_equal(res, mtcars1)
  expect_false(has_name(res, var))

  mtcars1$num <- rev(seq_len(nrow(mtcars)))
  res0 <- rownames_to_column(mtcars1)
  expect_warning(res <- column_to_rownames(res0, var = "num"))
  expect_true(has_rownames(res))
  expect_equal(rownames(res), as.character(mtcars1$num))
  expect_error(column_to_rownames(res), "This data frame already has row names.")
  expect_error(column_to_rownames(rownames_to_column(mtcars1, var), "num2"),
               paste("This data frame has no column named num2."))
})

test_that("converting to data frame does not add row names", {
  expect_false(has_rownames(as.data.frame(as_tibble(iris))))
})
