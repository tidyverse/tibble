test_that("as.data.frame()", {
  df <- data.frame(a = 1:3)
  expect_identical(as.data.frame(as_tibble(df)), df)
})

test_that("names<-()", {
  new_tbl <- function(...) {
    data <- list(1, "b")
    names(data) <- c(...)
    new_tibble(data, nrow = 1)
  }

  set_tbl_names <- function(names) {
    tbl_copy <- new_tbl("a", "b")
    names(tbl_copy) <- names
    tbl_copy
  }

  expect_equal(set_tbl_names(c("c", "d")), new_tbl("c", "d"))

  scoped_lifecycle_warnings()

  if (!is_rstudio()) {
    expect_warning(set_tbl_names(NULL), class = "lifecycle_error_deprecated")
  }

  expect_warning(
    expect_identical(set_tbl_names("c"), new_tbl("c", NA_character_)),
    class = "lifecycle_error_deprecated"
  )

  expect_warning(
    expect_identical(set_tbl_names(letters[3:5]), new_tbl("c", "d")),
    class = "lifecycle_error_deprecated"
  )

  expect_warning(
    expect_identical(set_tbl_names(3:4), new_tbl(3:4)),
    class = "lifecycle_error_deprecated"
  )
})

verify_output("class-tbl_df.txt", {
  df <- tibble(a = 1, b = 2)

  names(df) <- NULL
  names(df) <- "c"
  names(df) <- c("..1", "..2")
})
