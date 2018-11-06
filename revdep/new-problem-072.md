# frequencies

Version: 0.1.1

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    Running examples in ‘frequencies-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: freq_two_vects
    > ### Title: freq_two_vects
    > ### Aliases: freq_two_vects
    > 
    > ### ** Examples
    > 
    > # Sample data frame to demo the freq_two_vects function.
    > df <- data.frame(gender = sample(c('m','f'), 200, replace = TRUE),
    +                  ethnicity = sample(c('african american', 'asian', 'caucasian',
    +                                    'hispanic', 'other'),
    +                                    200, replace = TRUE),
    +                  stringsAsFactors = FALSE)
    > 
    > freq_two_vects(df, gender, ethnicity, FALSE)
    Error in grouped_df_impl(data, unname(vars), drop) : 
      Column `get.col1.` is unknown
    Calls: freq_two_vects ... group_by.data.frame -> grouped_df -> grouped_df_impl
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      9: `_fseq`(`_lhs`)
      10: freduce(value, `_function_list`) at /tmp/RtmpgVFdE2/R.INSTALL778e5edf4faf/magrittr/R/pipe.R:28
      11: function_list[[i]](value) at /tmp/RtmpgVFdE2/R.INSTALL778e5edf4faf/magrittr/R/freduce.R:17
      12: dplyr::group_by(., get.col1.)
      13: group_by.data.frame(., get.col1.) at /tmp/RtmpPSeHMW/R.INSTALLe5f7f454083/dplyr/R/group-by.r:76
      14: grouped_df(groups$data, groups$group_names) at /tmp/RtmpPSeHMW/R.INSTALLe5f7f454083/dplyr/R/dataframe.R:34
      15: grouped_df_impl(data, unname(vars), drop) at /tmp/RtmpPSeHMW/R.INSTALLe5f7f454083/dplyr/R/grouped-df.r:25
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 24 SKIPPED: 0 FAILED: 2
      1. Error: numbers and letters aggregations are correct (@test_freq_two_vects.R#44) 
      2. Error: dates and logicals aggregations are correct (@test_freq_two_vects.R#77) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

