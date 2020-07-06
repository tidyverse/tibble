test_that("output", {
  verify_output("tbl_sum.txt", {
    str(tbl_sum(1:3))
    str(tbl_sum(tibble(a = 1:3, b = letters[2:4])))

    dim_desc(iris)
    dim_desc(Titanic)
    dim_desc(1:3)

    size_sum(trees)
    size_sum(Titanic)
    size_sum(1:3)
  })
})
