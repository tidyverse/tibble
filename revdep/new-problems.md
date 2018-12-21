# baystability

- NOTIFIED: on Nov 28 via e-mail
- FIXED here
- Requires column names `V1`, `V2`, ... in `as_tibble.matrix()`

# corrr

- NOTIFIED: on Nov 28 via e-mail
- NOTIFIED: https://github.com/drsimonj/corrr/issues/68.
- Funny stuff around `rowname` column

# diffdf

- NOTIFIED: https://github.com/gowerc/diffdf/issues/16.
- Diverging results and output in tests.

# docxtractr

- NOTIFIED: on Nov 28 via e-mail, and in private
- coercing tibble with invalid column name via `as_tibble()`

# feather

- NOTIFIED: https://github.com/wesm/feather/pull/365.
- PATCH RELEASE INCOMING.
- Infinite recursion because `as_data_frame()` is no longer generic.

# postal

- NOTIFIED: https://github.com/aedobbyn/postal/issues/35.
- Error disappeared on December 21.
- Unlikely to be related to _tibble_ update?

# recipes

Version: 0.1.4

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    
        date
    
    > 
    > examples <- data.frame(Dan = ymd("2002-03-04") + days(1:10),
    +                        Stefan = ymd("2006-01-13") + days(1:10))
    > date_rec <- recipe(~ Dan + Stefan, examples) %>%
    +    step_date(all_predictors())
    > 
    > tidy(date_rec, number = 1)
    # A tibble: 3 x 4
      terms            value ordinal id        
      <fct>            <fct> <lgl>   <chr>     
    1 all_predictors() dow   FALSE   date_qxJ4m
    2 all_predictors() month FALSE   date_qxJ4m
    3 all_predictors() year  FALSE   date_qxJ4m
    > 
    > date_rec <- prep(date_rec, training = examples)
    Error: Columns 1, 2, 3, 4, 5, … (and 1 more) must be named.
    Use .name_repair to specify repair.
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      23: abort(error_column_must_be_named(bad_name)) at /tmp/RtmpXACe3n/R.INSTALLe4d559ebfbb/tibble/R/repair-names.R:261
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 1119 SKIPPED: 4 FAILED: 8
      1. Error: default option (@test_date.R#23) 
      2. Error: nondefault options (@test_date.R#59) 
      3. Error: ordinal values (@test_date.R#79) 
      4. Error: printing (@test_date.R#99) 
      5. Error: Date class (@test_holiday.R#17) 
      6. Error: POSIXct class (@test_holiday.R#39) 
      7. Error: printing (@test_holiday.R#58) 
      8. Error: trained (@test_tidy.R#39) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# rgho

Version: 1.0.1

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘rgho-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: get_gho_data
    > ### Title: Returns GHO Data
    > ### Aliases: get_gho_data
    > 
    > ### ** Examples
    > 
    > 
    > result <- get_gho_data(
    +   dimension = "GHO",
    +   code = "MDG_0000000001"
    + )
    Error in code %in% get_gho_codes(dimension = dimension) : 
      Column 3 must be named.
    Use .name_repair to specify repair.
    Calls: get_gho_data ... tryCatch -> tryCatchList -> tryCatchOne -> <Anonymous>
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    Quitting from lines 36-38 (a-intro.Rmd) 
    Error: processing vignette 'a-intro.Rmd' failed with diagnostics:
    Column 3 must be named.
    Use .name_repair to specify repair.
    Execution halted
    ```

# rsample

- NOTIFIED: on Nov 28 via e-mail
- NOTIFIED: https://github.com/tidymodels/rsample/issues/74.
- Testing internal attributes.

# Sconify

- BIOCONDUCTOR.
- NOTIFIED: on Nov 28 via e-mail
- NOTIFIED: https://github.com/tjburns08/Sconify/issues/1.
- Colliding imports.

# segregation

- NOTIFIED: https://github.com/elbersb/segregation/issues/1.
- Relying on row names which are no longer available.

# simTool

- NOTIFIED: on Nov 28 via e-mail
- NOTIFIED: https://github.com/MarselScheer/simTool/issues/1
- Requires column names `V1`, `V2`, ... in `as_tibble.matrix()`

# taxa

- NOTIFIED: on Nov 28 via e-mail, and in private
- More permissive `as_tibble()` implementation in a corner case

# tidypredict

- NOTIFIED: on Nov 28 via e-mail
- UPDATED: on Dec 20
- `as_tibble()` loses row names.

# tidyr

Version: 0.8.2

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      5: as_tibble(m, ..., .name_repair = .name_repair) at /tmp/RtmpXACe3n/R.INSTALLe4d559ebfbb/tibble/R/as_tibble.R:222
      6: as_tibble.data.frame(m, ..., .name_repair = .name_repair) at /tmp/RtmpXACe3n/R.INSTALLe4d559ebfbb/tibble/R/as_tibble.R:79
      7: as_tibble.list(unclass(x), ..., .rows = .rows, .name_repair = .name_repair) at /tmp/RtmpXACe3n/R.INSTALLe4d559ebfbb/tibble/R/as_tibble.R:95
      8: lst_to_tibble(x, .rows, .name_repair, lengths(x)) at /tmp/RtmpXACe3n/R.INSTALLe4d559ebfbb/tibble/R/as_tibble.R:117
      9: set_repaired_names(x, .name_repair) at /tmp/RtmpXACe3n/R.INSTALLe4d559ebfbb/tibble/R/as_tibble.R:121
      10: set_names(x, repaired_names(names(x), .name_repair = .name_repair)) at /tmp/RtmpXACe3n/R.INSTALLe4d559ebfbb/tibble/R/repair-names.R:143
      11: set_names_impl(x, x, nm, ...) at /tmp/RtmpQd7eDE/R.INSTALL8ca31dfbdc57/rlang/R/attr.R:163
      12: abort("`nm` must be `NULL` or a character vector the same length as `x`") at /tmp/RtmpQd7eDE/R.INSTALL8ca31dfbdc57/rlang/R/attr.R:182
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 320 SKIPPED: 0 FAILED: 1
      1. Error: spreading empty data frame gives empty data frame (@test-spread.R#179) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

