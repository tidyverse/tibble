# output test

    Code
      invalid_df("must be integer", "col", "\nFix this.")
    Output
      [1] "Column `col` must be integer.\nFix this."
    Code
      invalid_df("must be numeric", c("col1", "col2"))
    Output
      [1] "Columns `col1` and `col2` must be numeric."
    Code
      use_repair(TRUE)
    Output
      [1] "\nUse .name_repair to specify repair."
    Code
      use_repair(FALSE)

