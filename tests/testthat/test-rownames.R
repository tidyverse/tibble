context("rownames")

test_that("has_rownames and remove_rownames", {
  expect_false(has_rownames(iris))
  expect_true(has_rownames(mtcars))
  expect_false(has_rownames(remove_rownames(mtcars)))
  expect_false(has_rownames(remove_rownames(iris)))
  expect_false(has_rownames(1:10))
})

test_that("rownames_to_column keeps the tbl classes (#882)", {
  res <- rownames_to_column( mtcars, "Make&Model" )
  expect_false(has_rownames(res))
  expect_equal( class(res), class(mtcars) )
  expect_error(rownames_to_column( mtcars, "wt"),
               paste("There is a column named wt already!")  )
  res1 <- rownames_to_column( as_data_frame(mtcars), "Make&Model" )
  expect_false(has_rownames(res1))
  expect_equal( class(res1), class(as_data_frame(mtcars)) )
  expect_error(rownames_to_column( mtcars, "wt"),
               paste("There is a column named wt already!")  )
})

test_that("column_to_rownames returns tbl", {
  var <- "car"
  mtcars <- as_data_frame(mtcars)
  res <- column_to_rownames( rownames_to_column( mtcars, var), var)
  expect_true(has_rownames(res))
  expect_equal( class(res), class(mtcars) )
  expect_equal(rownames(res), rownames(mtcars))
  expect_equal(res, mtcars)
  expect_false(var %in% names(res))

  mtcars$num <- rev(seq_len(nrow(mtcars)))
  res1 <- column_to_rownames( rownames_to_column( mtcars), var="num")
  expect_true(has_rownames(res1))
  expect_equal(rownames(res1), as.character(mtcars$num) )
  expect_error(column_to_rownames(res1), "This data frame already has row names.")
  expect_error(column_to_rownames( rownames_to_column( mtcars, var), "num2"),
               paste("This data frame has no column named num2.")  )
})

test_that("converting to data frame does not add row names", {
  expect_false(has_rownames(as.data.frame(as_data_frame(iris))))
})
