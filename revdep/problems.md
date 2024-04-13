# covidcast

<details>

* Version: 0.5.2
* GitHub: https://github.com/cmu-delphi/covidcast
* Source code: https://github.com/cran/covidcast
* Date/Publication: 2023-07-12 23:40:06 UTC
* Number of recursive dependencies: 93

Run `revdepcheck::cloud_details(, "covidcast")` for more info

</details>

## Newly broken

*   checking running R code from vignettes ... ERROR
    ```
    Errors in running code in vignettes:
    when running code in ‘multi-signals.Rmd’
      ...
    
    > signals <- covidcast_signals(data_source = "jhu-csse", 
    +     signal = c("confirmed_7dav_incidence_prop", "deaths_7dav_incidence_prop"), 
    +     star .... [TRUNCATED] 
    
      When sourcing ‘multi-signals.R’:
    Error: Rate limit exceeded when fetching data from API anonymously. See the "API keys" section of the `covidcast_signal()` documentation for information on registering for an API key.
    ℹ Message from server:
    ℹ Rate limit exceeded for anonymous queries. To remove this limit, register a free API key at https://api.delphi.cmu.edu/epidata/admin/registration_form
    Execution halted
    when running code in ‘plotting-signals.Rmd’
      ...
    server maintenance, and new features.
    
    > dv <- covidcast_signal(data_source = "doctor-visits", 
    +     signal = "smoothed_adj_cli", start_day = "2020-07-01", end_day = "2020-07-14")
    
      When sourcing ‘plotting-signals.R’:
    Error: Rate limit exceeded when fetching data from API anonymously. See the "API keys" section of the `covidcast_signal()` documentation for information on registering for an API key.
    ℹ Message from server:
    ℹ Rate limit exceeded for anonymous queries. To remove this limit, register a free API key at https://api.delphi.cmu.edu/epidata/admin/registration_form
    Execution halted
    
      ‘correlation-utils.Rmd’ using ‘UTF-8’... OK
      ‘covidcast.Rmd’ using ‘UTF-8’... OK
      ‘external-data.Rmd’ using ‘UTF-8’... OK
      ‘multi-signals.Rmd’ using ‘UTF-8’... failed
      ‘plotting-signals.Rmd’ using ‘UTF-8’... failed
    ```

*   checking re-building of vignette outputs ... NOTE
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘correlation-utils.Rmd’ using rmarkdown
    --- finished re-building ‘correlation-utils.Rmd’
    
    --- re-building ‘covidcast.Rmd’ using rmarkdown
    
    Quitting from lines  at lines 38-45 [unnamed-chunk-1] (covidcast.Rmd)
    Error: processing vignette 'covidcast.Rmd' failed with diagnostics:
    Rate limit exceeded when fetching data from API anonymously. See the "API keys" section of the `covidcast_signal()` documentation for information on registering for an API key.
    ℹ Message from server:
    ℹ Rate limit exceeded for anonymous queries. To remove this limit, register a free API key at https://api.delphi.cmu.edu/epidata/admin/registration_form
    --- failed re-building ‘covidcast.Rmd’
    
    --- re-building ‘external-data.Rmd’ using rmarkdown
    ```

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 20 marked UTF-8 strings
    ```

# LexisNexisTools

<details>

* Version: 0.3.7
* GitHub: https://github.com/JBGruber/LexisNexisTools
* Source code: https://github.com/cran/LexisNexisTools
* Date/Publication: 2023-07-05 13:33:03 UTC
* Number of recursive dependencies: 119

Run `revdepcheck::cloud_details(, "LexisNexisTools")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘spelling.R’
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library("testthat")
      > library("LexisNexisTools")
      LexisNexisTools Version 0.3.7
      Warning messages:
      1: In .recacheSubclasses(def@className, def, env) :
        undefined subclass "ndiMatrix" of class "replValueSp"; definition not updated
      2: In .recacheSubclasses(def@className, def, env) :
        undefined subclass "pcorMatrix" of class "replValueSp"; definition not updated
      3: In .recacheSubclasses(def@className, def, env) :
        undefined subclass "ndiMatrix" of class "replValueSp"; definition not updated
      4: In .recacheSubclasses(def@className, def, env) :
        undefined subclass "pcorMatrix" of class "replValueSp"; definition not updated
      > 
      > test_check("LexisNexisTools")
      
        |                                                  | 0 % ~calculating  
        |+++++                                             | 10% ~00s          
        |++++++++++                                        | 20% ~00s          
        |+++++++++++++++                                   | 30% ~00s          
        |++++++++++++++++++++                              | 40% ~00s          
        |+++++++++++++++++++++++++                         | 50% ~00s          
        |++++++++++++++++++++++++++++++                    | 60% ~00s          
        |+++++++++++++++++++++++++++++++++++               | 70% ~00s          
        |++++++++++++++++++++++++++++++++++++++++          | 80% ~00s          
        |+++++++++++++++++++++++++++++++++++++++++++++     | 90% ~00s          
        |++++++++++++++++++++++++++++++++++++++++++++++++++| 100% elapsed=00s  
      [ FAIL 2 | WARN 0 | SKIP 3 | PASS 96 ]
      
      ══ Skipped tests (3) ═══════════════════════════════════════════════════════════
      • !dir.exists("/home/johannes/Dropbox/LexisNexis_sample_files/") is TRUE (1):
        'test-lnt_read_uni.R:23:3'
      • On CRAN (2): 'test-lnt_convert.R:149:3', 'test-lnt_read_uni.R:33:3'
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Failure ('test-lnt_read.R:7:3'): Read in sample file ────────────────────────
      {
          ...
      } not equal to readRDS("../files/LNToutput.RDS").
      Attributes: < Component "paragraphs": Attributes: < Names: 2 string mismatches > >
      Attributes: < Component "paragraphs": Attributes: < Length mismatch: comparison on first 2 components > >
      Attributes: < Component "paragraphs": Attributes: < Component 1: Modes: character, externalptr > >
      Attributes: < Component "paragraphs": Attributes: < Component 1: Lengths: 3, 1 > >
      Attributes: < Component "paragraphs": Attributes: < Component 1: target is character, current is externalptr > >
      Attributes: < Component "paragraphs": Attributes: < Component 2: Modes: numeric, character > >
      Attributes: < Component "paragraphs": Attributes: < Component 2: Lengths: 122, 3 > >
      Attributes: < Component "paragraphs": Attributes: < Component 2: target is numeric, current is character > >
      ── Failure ('test-lnt_read.R:14:3'): Read in sample file ───────────────────────
      {
          ...
      } not equal to readRDS("../files/LNToutput.RDS").
      Attributes: < Component "paragraphs": Attributes: < Names: 2 string mismatches > >
      Attributes: < Component "paragraphs": Attributes: < Length mismatch: comparison on first 2 components > >
      Attributes: < Component "paragraphs": Attributes: < Component 1: Modes: character, externalptr > >
      Attributes: < Component "paragraphs": Attributes: < Component 1: Lengths: 3, 1 > >
      Attributes: < Component "paragraphs": Attributes: < Component 1: target is character, current is externalptr > >
      Attributes: < Component "paragraphs": Attributes: < Component 2: Modes: numeric, character > >
      Attributes: < Component "paragraphs": Attributes: < Component 2: Lengths: 122, 3 > >
      Attributes: < Component "paragraphs": Attributes: < Component 2: target is numeric, current is character > >
      
      [ FAIL 2 | WARN 0 | SKIP 3 | PASS 96 ]
      Error: Test failures
      Execution halted
    ```

# NMdata

<details>

* Version: 0.1.5
* GitHub: https://github.com/philipdelff/NMdata
* Source code: https://github.com/cran/NMdata
* Date/Publication: 2024-02-21 08:10:02 UTC
* Number of recursive dependencies: 80

Run `revdepcheck::cloud_details(, "NMdata")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘spelling.R’
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(NMdata)
      NMdata 0.1.5. Browse NMdata documentation at
      https://philipdelff.github.io/NMdata/
      > 
      > test_check("NMdata")
      
      Overview of model scanning results:
                                  lst nrows ncols success warning
                               <char> <int> <int>  <lgcl>  <lgcl>
      1: testData/nonmem//xgxr001.lst   905    40    TRUE   FALSE
      2: testData/nonmem//xgxr002.lst   905    34    TRUE   FALSE
      3: testData/nonmem//xgxr003.lst   905    34    TRUE   FALSE
      4: testData/nonmem//xgxr004.lst   731    35    TRUE   FALSE
      5: testData/nonmem//xgxr005.lst   447    35    TRUE   FALSE
      6: testData/nonmem//xgxr006.lst   893    35    TRUE   FALSE
      7: testData/nonmem//xgxr007.lst   893    35    TRUE   FALSE
      8: testData/nonmem//xgxr008.lst   893    35    TRUE   FALSE
      9: testData/nonmem//xgxr009.lst   131    35    TRUE   FALSE
      Error in (function (data, drop, col.flagn = "FLAG", rename, copy, file,  : 
        drop cannot contain empty strings and NA's.
      Table written to testOutput/flagsCount_5.csv
         variable Nmissing
           <fctr>    <int>
      1:       DV      150
      [ FAIL 1 | WARN 3 | SKIP 1 | PASS 271 ]
      
      ══ Skipped tests (1) ═══════════════════════════════════════════════════════════
      • empty test (1): 'test_flagsCount.R:6:1'
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Failure ('test_NMscanData.R:449:5'): use as.fun to get a tibble ─────────────
      `res1` has changed from known value recorded in 'testReference/NMscanData_18.rds'.
      Attributes: < Names: 3 string mismatches >
      Attributes: < Length mismatch: comparison on first 3 components >
      Attributes: < Component 1: Modes: list, externalptr >
      Attributes: < Component 1: Lengths: 6, 1 >
      Attributes: < Component 1: names for target but not for current >
      Attributes: < Component 1: current is not list-like >
      Attributes: < Component 2: Modes: character, list >
      Attributes: < Component 2: Lengths: 4, 6 >
      Attributes: < Component 2: names for current but not for target >
      ...
      Backtrace:
          ▆
       1. └─testthat::expect_equal_to_reference(res1, fileRef, version = 2) at test_NMscanData.R:449:5
       2.   └─testthat::expect_known_value(..., update = update)
      
      [ FAIL 1 | WARN 3 | SKIP 1 | PASS 271 ]
      Error: Test failures
      Execution halted
    ```

