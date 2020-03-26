test_that("interface of print() identical to trunc_mat()", {
  print_arg_names <- names(formals(print.tbl))
  print_arg_names_without_ellipsis <- setdiff(print_arg_names, "...")

  trunc_mat_arg_names <- names(formals(trunc_mat))

  expect_equal(print_arg_names_without_ellipsis, trunc_mat_arg_names)
})

test_that("trunc_mat() header output", {
  skip_on_non_utf8_locale()
  skip_if_not_installed("mockr")
  testthat::skip_if(getRversion() < "3.2")

  verify_output("trunc_mat.txt", unicode = TRUE, {
    print_without_body(trunc_mat(df_all, n = 1L, n_extra = 2L, width = 30L))

    print_without_body(trunc_mat(df_all, n = 1L, n_extra = 0L, width = 30L))

    df <- tibble(!!!set_names(c(5, 3), c("mean(x)", "var(x)")))
    print_without_body(trunc_mat(df, width = 28))
  })
})
