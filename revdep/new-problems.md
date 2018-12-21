# baystability

- NOTIFIED: on Nov 28 via e-mail
- FIXED here
- Requires column names `V1`, `V2`, ... in `as_tibble.matrix()`

# corrr

Version: 0.3.0

- NOTIFIED: on Nov 28 via e-mail
- NOTIFIED: https://github.com/drsimonj/corrr/issues/68.
- Funny stuff around `rowname` column

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      22: vars_select_eval(.vars, quos) at /tmp/RtmpE9k1HZ/R.INSTALLdd085933591b/tidyselect/R/vars-select.R:123
      23: map_if(quos, !is_helper, eval_tidy, mask) at /tmp/RtmpE9k1HZ/R.INSTALLdd085933591b/tidyselect/R/vars-select.R:239
      24: map(.x[sel], .f, ...) at /tmp/Rtmp7QYXYD/R.INSTALL593cec9d40f/purrr/R/map.R:112
      25: .f(.x[[i]], ...) at /tmp/Rtmp7QYXYD/R.INSTALL593cec9d40f/purrr/R/map.R:104
      26: -rowname at /tmp/RtmpQd7eDE/R.INSTALL8ca31dfbdc57/rlang/R/eval-tidy.R:87
      27: is_character(x) at /tmp/RtmpE9k1HZ/R.INSTALLdd085933591b/tidyselect/R/vars-select.R:266
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 71 SKIPPED: 0 FAILED: 3
      1. Error: Diagonal sets correctly (@test-as_cordf.R#18) 
      2. Error: Converts values accurately (@test-as_matrix.R#11) 
      3. Error: Diagonal sets correctly (@test-correlate.R#18) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# diffdf

Version: 1.0.1

- NOTIFIED: https://github.com/gowerc/diffdf/issues/16.
- RESPONDED
- Diverging results and output in tests.

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 551 SKIPPED: 0 FAILED: 17
      1. Failure: Unequal object, checking numbers correct (@test-core.R#186) 
      2. Failure: Unequal object, checking numbers correct (@test-core.R#187) 
      3. Failure: Unequal object, checking numbers correct (@test-core.R#188) 
      4. Failure: Unequal object, checking numbers correct (@test-core.R#189) 
      5. Failure: Unequal object, checking numbers correct (@test-core.R#190) 
      6. Failure: Unequal object, checking numbers correct (@test-core.R#191) 
      7. Failure: Unequal object, checking numbers correct (@test-core.R#192) 
      8. Failure: Unequal object, checking numbers correct (@test-core.R#193) 
      9. Failure: (unknown) (@test-print_output.R#51) 
      1. ...
      
      Error: testthat unit tests failed
      Execution halted
    ```

# docxtractr

Version: 0.5.0

- NOTIFIED: on Nov 28 via e-mail, and in private
- coercing tibble with invalid column name via `as_tibble()`

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > ### Aliases: docx_extract_tbl
    > 
    > ### ** Examples
    > 
    > doc3 <- read_docx(system.file("examples/data3.docx", package="docxtractr"))
    > docx_extract_tbl(doc3, 3)
    # A tibble: 6 x 2
      Foo   Bar  
      <chr> <chr>
    1 Aa    Bb   
    2 Dd    Ee   
    3 Gg    Hh   
    4 1     2    
    5 Zz    Jj   
    6 Tt    ii   
    > 
    > intracell_whitespace <- read_docx(system.file("examples/preserve.docx", package="docxtractr"))
    > docx_extract_tbl(intracell_whitespace, 2, preserve=FALSE)
    Error: Column 1 must be named.
    Use .name_repair to specify repair.
    Execution halted
    ```

# feather

Version: 0.3.1

- NOTIFIED: https://github.com/wesm/feather/pull/365.
- PATCH RELEASE INCOMING.
- Infinite recursion because `as_data_frame()` is no longer generic.

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘feather-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: read_feather
    > ### Title: Read and write feather files.
    > ### Aliases: read_feather write_feather
    > 
    > ### ** Examples
    > 
    > mtcars2 <- read_feather(feather_example("mtcars.feather"))
    Error: C stack usage  7970852 is too close to the limit
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(feather)
      > 
      > test_check("feather")
      Error: C stack usage  7970868 is too close to the limit
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 15 SKIPPED: 0 FAILED: 0
      Execution halted
    ```

# rcongresso

Version: 0.4.6

- FIXED here

# rgho

Version: 1.0.1

- FIXED here

# rsample

Version: 0.0.3

- NOTIFIED: on Nov 28 via e-mail
- NOTIFIED: https://github.com/tidymodels/rsample/issues/74.
- RESPONDED
- Testing internal attributes.

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      
          fill
      
      > 
      > test_check(package = "rsample")
      ── 1. Failure: simple rset (@test_rset.R#44)  ──────────────────────────────────
      sort(names(attributes(res2))) not equal to c("class", "names", "row.names").
      Lengths differ: 6 is not 3
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 492 SKIPPED: 0 FAILED: 1
      1. Failure: simple rset (@test_rset.R#44) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# Sconify

Version: 1.0.4

- BIOCONDUCTOR.
- NOTIFIED: on Nov 28 via e-mail
- NOTIFIED: https://github.com/tjburns08/Sconify/issues/1.
- Colliding imports.

## Newly broken

*   checking whether package ‘Sconify’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: replacing previous import ‘flowCore::view’ by ‘tibble::view’ when loading ‘Sconify’
    See ‘/tmp/Rtmp7dWsme/file66cd81498cd/Sconify.Rcheck/00install.out’ for details.
    ```

# segregation

Version: 0.1.0

- NOTIFIED: https://github.com/elbersb/segregation/issues/1.
- RESPONDED
- Relying on row names which are no longer available.

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      5: `[[.tbl_df`(total, "M", "est") at /tmp/RtmpQd7eDE/R.INSTALL8ca31dfbdc57/rlang/R/eval.R:99
      6: NextMethod() at /tmp/Rtmpb5LbVY/R.INSTALL679ed90d563/tibble/R/subsetting.R:77
      7: `[[.data.frame`(total, "M", "est")
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 157 SKIPPED: 0 FAILED: 6
      1. Error: between + within = total (@test_mutual_total.R#53) 
      2. Error: within estimations are correct (@test_mutual_total.R#68) 
      3. Error: H is correct (@test_mutual_total.R#78) 
      4. Error: zero weights no problem (@test_mutual_total.R#101) 
      5. Error: between + within = total (@test_mutual_within.R#24) 
      6. Error: option wide works (@test_mutual_within.R#63) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# simTool

Version: 1.1.0

- NOTIFIED: on Nov 28 via e-mail
- NOTIFIED: https://github.com/MarselScheer/simTool/issues/1
- Requires column names `V1`, `V2`, ... in `as_tibble.matrix()`
- Other problems

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 46 SKIPPED: 0 FAILED: 11
      1. Error: Tibbles for data generating functions can be used. Results were created and stored in simulation (@test_eval_tibbles.R#55) 
      2. Error: Tibbles for data generating and data analyzing functions can be used. Results were created and stored in simulation (@test_eval_tibbles.R#138) 
      3. Error: One analyzing function. Results were created and stored in simulation (@test_eval_tibbles.R#189) 
      4. Failure: Simplify the simulation results (@test_eval_tibbles.R#219) 
      5. Failure: Post analyze function works (@test_eval_tibbles.R#239) 
      6. Error: Three analyzing functions. Results were created and stored in simulation (@test_eval_tibbles.R#284) 
      7. Error: Three analyzing functions and one summary function. Results were created and stored in simulation (@test_eval_tibbles.R#360) 
      8. Error: Three analyzing functions and three summary function. Results were created and stored in simulation (@test_eval_tibbles.R#504) 
      9. Error: Three analyzing functions and one summary function over 2 cpus. Results were created and stored in simulation (@test_eval_tibbles.R#570) 
      1. ...
      
      Error: testthat unit tests failed
      Execution halted
    ```

# suropt

- NOTIFIED: on Dec 21 via e-mail
- RESPONDED
- FIXED here

Version: 0.1.0

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      test_obj$data$my_data$taxon_id not equal to c("j", "i").
      2/2 mismatches
      x[1]: NA
      y[1]: "j"
      
      x[2]: NA
      y[2]: "i"
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 598 SKIPPED: 2 FAILED: 2
      1. Failure: New tables and vectors can be made (@test--taxmap.R#684) 
      2. Failure: Taxmap can be intialized from complex data (@test--taxmap_parsers.R#56) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# tidypredict

- NOTIFIED: on Nov 28 via e-mail
- UPDATED: on Dec 20
- `as_tibble()` loses row names.
