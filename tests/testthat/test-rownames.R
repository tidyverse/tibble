context("rownames")

test_that("has_rownames and remove_rownames", {
  expect_false(has_rownames(iris))
  expect_true(has_rownames(mtcars))
  expect_false(has_rownames(remove_rownames(mtcars)))
  expect_false(has_rownames(remove_rownames(iris)))
  expect_error(has_rownames(1:10))
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
