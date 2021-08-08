# output test

    Code
      str(tbl_sum(1:3))
    Output
       Named chr "int [3]"
       - attr(*, "names")= chr "Description"
    Code
      str(tbl_sum(vctrs::new_data_frame(a = 1:3, class = "tbl")))
    Output
       Named chr "0 x 0"
       - attr(*, "names")= chr "A data frame"
    Code
      str(tbl_sum(tibble(a = 1:3, b = letters[2:4])))
    Output
       Named chr "3 x 2"
       - attr(*, "names")= chr "A tibble"
    Code
      dim_desc(trees)
    Output
      [1] "31 x 3"
    Code
      dim_desc(Titanic)
    Output
      [1] "4 x 2 x 2 x 2"
    Code
      dim_desc(1:3)
    Output
      [1] "3"

