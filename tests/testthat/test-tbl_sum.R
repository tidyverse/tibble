test_that("output test", {
  expect_snapshot({
    str(tbl_sum(1:3))
    str(tbl_sum(vctrs::new_data_frame(a = 1:3, class = "tbl")))
    str(tbl_sum(tibble(a = 1:3, b = letters[2:4])))

    dim_desc(trees)
    dim_desc(Titanic)
    dim_desc(1:3)
  })
})
