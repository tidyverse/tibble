# mudata2

Version: 1.0.3

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘mudata2-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: biplot.mudata
    > ### Title: Biplot a mudata object
    > ### Aliases: biplot.mudata autobiplot.mudata
    > 
    > ### ** Examples
    > 
    > kvtemp <- kentvillegreenwood %>% select_params(contains("temp"))
    > 
    > # use base plotting for regular biplot function
    > biplot(kvtemp)
    > 
    > # use ggplot and facet_grid to biplot
    > autobiplot(kvtemp, col = "location")
    Using names_x = c("mintemp", "maxtemp"), names_y = c("meantemp", "mintemp")
    Error: Columns 1, 2 must be named.
    Use .name_repair to specify repair.
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/test-all.R’ failed.
    Last 13 lines of output:
      OGR: Unsupported geometry type
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 947 SKIPPED: 0 FAILED: 9
      1. Error: autobiplot works on both data frames and mudata objects (@test_biplot.R#15) 
      2. Error: error bars show up in autoplot (@test_biplot.R#27) 
      3. Error: long_pairs finds invalid inputs (@test_biplot.R#54) 
      4. Error: autobiplot.data.frame funcion detects invalid inputs (@test_biplot.R#94) 
      5. Error: long_pairs correctly assigns parameter combinations (@test_biplot.R#104) 
      6. Error: long_pairs name_var can be included in id_vars (@test_biplot.R#132) 
      7. Error: long_pairs handles grouped data frames (@test_biplot.R#139) 
      8. Error: long_pairs handles zero-row combinations gracefully (@test_biplot.R#151) 
      9. Error: max_names is respected in long_pairs, autobiplot, and long_biplot (@test_biplot.R#167) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

