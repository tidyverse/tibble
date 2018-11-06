# xpose

Version: 0.4.3

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      Can't join on 'data' x 'data' because of incompatible types (list / list)
      1: expect_identical(xpdb_vpc_test$special, ctrl_special$special) at testthat/test-vpc.R:43
      2: compare(act$val, exp$val) at /tmp/RtmprUj4Zw/R.INSTALL86c769d3e964/testthat/R/expect-equality.R:138
      3: compare.default(act$val, exp$val) at /tmp/RtmprUj4Zw/R.INSTALL86c769d3e964/testthat/R/compare.R:13
      4: all.equal(x, y, ...) at /tmp/RtmprUj4Zw/R.INSTALL86c769d3e964/testthat/R/compare.R:48
      5: all.equal.tbl_df(x, y, ...)
      6: equal_data_frame(target, current, ignore_col_order = ignore_col_order, ignore_row_order = ignore_row_order, 
             convert = convert) at /tmp/RtmpPSeHMW/R.INSTALLe5f7f454083/dplyr/R/all-equal.r:35
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 523 SKIPPED: 6 FAILED: 1
      1. Error: vpc_data works properly with xpdb tables (@test-vpc.R#43) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

