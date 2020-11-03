# babynames

<details>

* Version: 1.0.0
* GitHub: https://github.com/hadley/babynames
* Source code: https://github.com/cran/babynames
* Date/Publication: 2019-01-12 23:12:16 UTC
* Number of recursive dependencies: 35

Run `cloud_details(, "babynames")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      + "15  1990 M     Zerick        5 0.00000232"
      + "16  1990 M     Zeus          5 0.00000232"
      and 4 more ...
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      FAILURE (test-data.R:21:3): applicants head and tail
      FAILURE (test-data.R:29:3): births head and tail
      FAILURE (test-data.R:37:3): lifetables head and tail
      FAILURE (test-data.R:45:3): lifetables head and tail of 1990s; should not typically change
      FAILURE (test-data.R:53:3): babynames head and tail
      FAILURE (test-data.R:61:3): babynames head and tail of 1990; should not typically change
      
      [ FAIL 6 | WARN 0 | SKIP 0 | PASS 0 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  9.5Mb
      sub-directories of 1Mb or more:
        data   9.4Mb
    ```

# bench

<details>

* Version: 1.1.1
* GitHub: https://github.com/r-lib/bench
* Source code: https://github.com/cran/bench
* Date/Publication: 2020-01-13 23:10:06 UTC
* Number of recursive dependencies: 75

Run `cloud_details(, "bench")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    +     rep_len(c("x", letters), cols)))
    + }
    > 
    > # Run 4 data sizes across 3 samples with 2 replicates (24 total benchmarks)
    > press(
    +   rows = c(1000, 10000),
    +   cols = c(10, 100),
    +   rep = 1:2,
    +   {
    +     dat <- create_df(rows, cols)
    +     bench::mark(
    +       min_time = .05,
    +       bracket = dat[dat$x > 500, ],
    +       which = dat[which(dat$x > 500), ],
    +       subset = subset(dat, x > 500)
    +     )
    +   }
    + )
    Error in status[[2]] : subscript out of bounds
    Calls: press ... glue_data -> <Anonymous> -> .transformer -> eval -> eval
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
       1. └─bench::press(...) test-press.R:71:4
      
      ── Skipped tests  ──────────────────────────────────────────────────────────────
      ● On CRAN (3)
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      ERROR (test-press.R:6:5): press: Adds parameters to output
      ERROR (test-press.R:22:5): press: Outputs status message before evaluating each parameter
      ERROR (test-press.R:45:5): press: expands the grid if has named parameters
      ERROR (test-press.R:59:5): press: takes values as-is if given in .grid
      ERROR (test-press.R:71:5): press: runs `setup` with the parameters evaluated
      
      [ FAIL 5 | WARN 0 | SKIP 3 | PASS 178 ]
      Error: Test failures
      Execution halted
    ```

# bioseq

<details>

* Version: 0.1.1
* GitHub: https://github.com/fkeck/bioseq
* Source code: https://github.com/cran/bioseq
* Date/Publication: 2020-07-26 23:00:09 UTC
* Number of recursive dependencies: 68

Run `cloud_details(, "bioseq")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      `print\(test\)` does not match "<RNA>".
      Actual value: "<print\(tibble::tibble\(\)\)>"
      
      ── FAILURE (test-print-methods.R:36:3): tibble with AA prints correctly ────────
      `print\(test\)` does not match "<AA>".
      Actual value: "<print\(tibble::tibble\(\)\)>"
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      FAILURE (test-print-methods.R:26:3): tibble with DNA prints correctly
      FAILURE (test-print-methods.R:31:3): tibble with RNA prints correctly
      FAILURE (test-print-methods.R:36:3): tibble with AA prints correctly
      
      [ FAIL 3 | WARN 0 | SKIP 0 | PASS 203 ]
      Error: Test failures
      Execution halted
    ```

# comperes

<details>

* Version: 0.2.4
* GitHub: https://github.com/echasnovski/comperes
* Source code: https://github.com/cran/comperes
* Date/Publication: 2020-05-09 08:40:02 UTC
* Number of recursive dependencies: 61

Run `cloud_details(, "comperes")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      `print\(input_widecr\)` does not match "# A widecr object:\n.*<print(tibble::tibble())>".
      Actual value: "# A widecr object:\\n<print\(tibble::tibble\(\)\)>"
      
      ── FAILURE (test-outer-methods.R:476:3): print.h2h_long works ──────────────────
      `print\(input_h2h_long\)` does not match "# A long format of Head-to-Head values:\n.*<print(tibble::tibble())>".
      Actual value: "# A long format of Head-to-Head values:\\n<print\(tibble::tibble\(\)\)>"
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      FAILURE (test-outer-methods.R:184:3): print.longcr works
      FAILURE (test-outer-methods.R:330:3): print.widecr works
      FAILURE (test-outer-methods.R:476:3): print.h2h_long works
      
      [ FAIL 3 | WARN 0 | SKIP 0 | PASS 259 ]
      Error: Test failures
      Execution halted
    ```

# dialr

<details>

* Version: 0.3.2
* GitHub: https://github.com/socialresearchcentre/dialr
* Source code: https://github.com/cran/dialr
* Date/Publication: 2020-07-10 06:50:03 UTC
* Number of recursive dependencies: 61

Run `cloud_details(, "dialr")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      [2] "            ph"    -                                
      [3] "       <phone>"    -                                
      [4] "1           NA"    -                                
      [5] "2       +61123"    -                                
      [6] "3 +61412345678"    -                                
      [7] "4 +61412987654"    -                                
      [8] "5 +61391234567"    -                                
      [9] "6 +12015550123"    -                                
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      FAILURE (test-tibble.R:21:3): tibbles print successfully
      
      [ FAIL 1 | WARN 0 | SKIP 0 | PASS 161 ]
      Error: Test failures
      Execution halted
    ```

# dm

<details>

* Version: 0.1.7
* GitHub: https://github.com/krlmlr/dm
* Source code: https://github.com/cran/dm
* Date/Publication: 2020-09-02 06:50:20 UTC
* Number of recursive dependencies: 121

Run `cloud_details(, "dm")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ● dm argument (1)
      ● does not work on df (2)
      ● not testing deprecated cdm_nycflights13(): test too slow (1)
      ● not testing deprecated learning from DB: test too slow (1)
      ● works only on a DB (12)
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      FAILURE (test-zoom.R:31:3): print() and format() methods for subclass `zoomed_dm` work
      FAILURE (test-zoom.R:36:3): print() and format() methods for subclass `zoomed_dm` work
      
      [ FAIL 2 | WARN 0 | SKIP 53 | PASS 726 ]
      Error: Test failures
      In addition: Warning message:
      call dbDisconnect() when finished working with a connection 
      Execution halted
    ```

# fabletools

<details>

* Version: 0.2.1
* GitHub: https://github.com/tidyverts/fabletools
* Source code: https://github.com/cran/fabletools
* Date/Publication: 2020-09-03 22:42:11 UTC
* Number of recursive dependencies: 99

Run `cloud_details(, "fabletools")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      Reason: On CRAN
      
      ── Skipped tests  ──────────────────────────────────────────────────────────────
      ● On CRAN (1)
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      FAILURE (test-mable.R:11:3): Mable print output
      FAILURE (???): mable dplyr verbs
      FAILURE (???): mable dplyr verbs
      FAILURE (???): mable dplyr verbs
      FAILURE (test-reconciliation.R:15:3): reconciliation
      
      [ FAIL 5 | WARN 0 | SKIP 1 | PASS 290 ]
      Error: Test failures
      Execution halted
    ```

# fgeo.analyze

<details>

* Version: 1.1.13
* GitHub: https://github.com/forestgeo/fgeo.analyze
* Source code: https://github.com/cran/fgeo.analyze
* Date/Publication: 2020-03-23 14:50:05 UTC
* Number of recursive dependencies: 92

Run `cloud_details(, "fgeo.analyze")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘spelling.R’
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ● bciex cannot be loaded (3)
      ● bukittimah cannot be loaded (1)
      ● can_access_private_data is not TRUE (1)
      ● ctfs cannot be loaded (4)
      ● fgeo.data cannot be loaded (1)
      ● ngel cannot be loaded (1)
      ● pasoh cannot be loaded (1)
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      Warning (test-byyr.R:20:3): basal_area_byyr and abundance_byyr fail with informative errors
      FAILURE (test-summary.R:34:3): summary.tt_lst returns the expected output
      
      [ FAIL 1 | WARN 1 | SKIP 14 | PASS 306 ]
      Error: Test failures
      Execution halted
    ```

# groupr

<details>

* Version: 0.1.0
* GitHub: https://github.com/ngriffiths21/groupr
* Source code: https://github.com/cran/groupr
* Date/Publication: 2020-10-14 12:30:06 UTC
* Number of recursive dependencies: 61

Run `cloud_details(, "groupr")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      > library(testthat)
      > library(groupr)
      > 
      > test_check("groupr")
      ── FAILURE (test_igroup.R:68:3): can print a grouped tbl ───────────────────────
      grep("Row indices", paste0(format(tsti_a), collapse = "")) not equal to 1.
      Lengths differ: 0 is not 1
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      FAILURE (test_igroup.R:68:3): can print a grouped tbl
      
      [ FAIL 1 | WARN 0 | SKIP 0 | PASS 21 ]
      Error: Test failures
      Execution halted
    ```

# haven

<details>

* Version: 2.3.1
* GitHub: https://github.com/tidyverse/haven
* Source code: https://github.com/cran/haven
* Date/Publication: 2020-06-01 15:00:06 UTC
* Number of recursive dependencies: 65

Run `cloud_details(, "haven")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      
      ── Skipped tests  ──────────────────────────────────────────────────────────────
      ● On CRAN (1)
      ● todo (1)
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      FAILURE (test-pillar.R:4:3): pillar
      FAILURE (test-pillar.R:12:3): pillar
      FAILURE (test-pillar.R:20:3): pillar
      FAILURE (test-pillar.R:28:3): pillar
      FAILURE (test-pillar.R:36:3): pillar
      
      [ FAIL 5 | WARN 0 | SKIP 2 | PASS 320 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  6.3Mb
      sub-directories of 1Mb or more:
        libs   5.9Mb
    ```

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘dplyr’
    ```

*   checking for GNU extensions in Makefiles ... NOTE
    ```
    GNU make is a SystemRequirements.
    ```

# pmdplyr

<details>

* Version: 0.3.3
* GitHub: https://github.com/NickCH-K/pmdplyr
* Source code: https://github.com/cran/pmdplyr
* Date/Publication: 2020-05-30 07:30:02 UTC
* Number of recursive dependencies: 111

Run `cloud_details(, "pmdplyr")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      Warning (test-time_variable.R:82:3): time_variable works
      Warning (test-time_variable.R:82:3): time_variable works
      Warning (test-time_variable.R:82:3): time_variable works
      Warning (test-time_variable.R:88:3): time_variable works
      Warning (test-time_variable.R:88:3): time_variable works
      Warning (test-time_variable.R:88:3): time_variable works
      Warning (test-time_variable.R:88:3): time_variable works
      Warning (test-time_variable.R:88:3): time_variable works
      Warning (test-time_variable.R:88:3): time_variable works
      Warning (test-time_variable.R:94:3): time_variable works
      Warning (test-time_variable.R:94:3): time_variable works
      
      [ FAIL 5 | WARN 26 | SKIP 0 | PASS 298 ]
      Error: Test failures
      Execution halted
    ```

# rMorningStar

<details>

* Version: 1.0.6
* GitHub: NA
* Source code: https://github.com/cran/rMorningStar
* Date/Publication: 2020-06-26 09:20:02 UTC
* Number of recursive dependencies: 77

Run `cloud_details(, "rMorningStar")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > ### Title: ms.Top10Holding
    > ### Aliases: ms.Top10Holding ms.Top10HoldingTotal
    > 
    > ### ** Examples
    > 
    > ms.Top10Holding('FXAIX')
                                 Name Symbol Asset_Percentage
    1                       Apple Inc   AAPL           0.0723
    2                  Microsoft Corp   MSFT           0.0588
    3                  Amazon.com Inc   AMZN           0.0497
    4                  Facebook Inc A     FB           0.0242
    5                  Alphabet Inc A  GOOGL           0.0168
    6            Alphabet Inc Class C   GOOG           0.0164
    7  Berkshire Hathaway Inc Class B  BRK.B           0.0146
    8               Johnson & Johnson    JNJ           0.0139
    9                Visa Inc Class A      V           0.0123
    10            Procter & Gamble Co     PG           0.0118
    > ms.Top10HoldingTotal('FXAIX')
    Error in t1[[1]] : subscript out of bounds
    Calls: ms.Top10HoldingTotal -> ms.Top10Holding
    Execution halted
    ```

# ropenaq

<details>

* Version: 0.2.10
* GitHub: https://github.com/ropensci/ropenaq
* Source code: https://github.com/cran/ropenaq
* Date/Publication: 2020-07-27 14:20:02 UTC
* Number of recursive dependencies: 94

Run `cloud_details(, "ropenaq")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      1/1 mismatches
      x[1]: "red"
      y[1]: "green"
      
      ── Skipped tests  ──────────────────────────────────────────────────────────────
      ● On CRAN (3)
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      Warning (test-aq_measurements.R:56:3): measurements has the right columns
      Warning (test-aq_measurements.R:56:3): measurements has the right columns
      FAILURE (test-test-get_status.R:8:3): get_status works as expected
      
      [ FAIL 1 | WARN 2 | SKIP 3 | PASS 95 ]
      Error: Test failures
      Execution halted
    ```

# ruler

<details>

* Version: 0.2.3
* GitHub: https://github.com/echasnovski/ruler
* Source code: https://github.com/cran/ruler
* Date/Publication: 2020-05-09 15:00:03 UTC
* Number of recursive dependencies: 62

Run `cloud_details(, "ruler")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      Reason: packageVersion("dplyr") >= "0.8.0"  is TRUE
      
      ── Skipped tests  ──────────────────────────────────────────────────────────────
      ● packageVersion("dplyr") >= "0.8.0"  is TRUE (1)
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      FAILURE (test-actions.R:95:3): assert_any_breaker works
      FAILURE (test-actions.R:98:3): assert_any_breaker works
      FAILURE (test-actions.R:129:3): assert_any_breaker accounts for printing options
      FAILURE (test-actions.R:133:3): assert_any_breaker accounts for printing options
      FAILURE (test-actions.R:162:3): generate_breakers_informer works
      
      [ FAIL 5 | WARN 0 | SKIP 1 | PASS 301 ]
      Error: Test failures
      Execution halted
    ```

# SimBIID

<details>

* Version: 0.2.0
* GitHub: https://github.com/tjmckinley/SimBIID
* Source code: https://github.com/cran/SimBIID
* Date/Publication: 2020-05-20 20:00:03 UTC
* Number of recursive dependencies: 66

Run `cloud_details(, "SimBIID")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      + " 3     3   118     2     0     0     0     0"
      + " 4     4   118     2     0     0     0     0"
      + " 5     5   118     2     0     0     0     0"
      + " 6     6   118     2     0     0     0     0"
      and 14 more ...
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      FAILURE (test-run.R:52:5): mparse/run works
      FAILURE (test-run.R:79:5): mparse/run works
      FAILURE (test-run.R:107:5): mparse/run works
      FAILURE (test-run.R:136:5): mparse/run works
      
      [ FAIL 4 | WARN 0 | SKIP 0 | PASS 39 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  5.3Mb
      sub-directories of 1Mb or more:
        libs   4.9Mb
    ```

# skimr

<details>

* Version: 2.1.2
* GitHub: https://github.com/ropensci/skimr
* Source code: https://github.com/cran/skimr
* Date/Publication: 2020-07-06 05:10:03 UTC
* Number of recursive dependencies: 75

Run `cloud_details(, "skimr")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      FAILURE (test-skim_print.R:61:5): knit_print appropriately falls back to tibble printing
      FAILURE (test-skim_print.R:104:5): Skim falls back to tibble::print.tbl() appropriately
      FAILURE (test-skim_print.R:112:3): Print focused objects appropriately
      FAILURE (test-skim_print.R:118:3): Metadata is stripped from smaller consoles
      FAILURE (test-skim_print.R:142:3): skimr creates appropriate output for Jupyter
      FAILURE (test-skim_print.R:148:3): Metadata can be included: print
      FAILURE (test-skim_print.R:155:3): Metadata can be included: option
      FAILURE (test-skim_tee.R:5:3): Using skim_tee prints returns the object
      FAILURE (test-skim_tee.R:13:3): skim_tee prints only selected columns, but returns full object
      FAILURE (test-skim_tee.R:21:3): skim_tee supports dplyr helpers
      FAILURE (test-skim_tee.R:31:3): Skim_tee works with groups
      
      [ FAIL 23 | WARN 0 | SKIP 1 | PASS 580 ]
      Error: Test failures
      Execution halted
    ```

# tibbletime

<details>

* Version: 0.1.6
* GitHub: https://github.com/business-science/tibbletime
* Source code: https://github.com/cran/tibbletime
* Date/Publication: 2020-07-21 13:50:02 UTC
* Number of recursive dependencies: 68

Run `cloud_details(, "tibbletime")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ── FAILURE (test_print.R:19:3): Index is part of the tibble output ─────────────
      `print\.tbl_time\(test_tbl_time\)` does not match "Index: date".
      Actual value: "# A time tibble: 3 x 4\\n<print\(tibble::trunc_mat\(\)\)>"
      
      ── FAILURE (test_print.R:23:3): Groups are still printed ───────────────────────
      `print\.tbl_time\(test_tbl_time_g\)` does not match "Groups: group1".
      Actual value: "# A time tibble: 3 x 4\\n<print\(tibble::trunc_mat\(\)\)>"
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      FAILURE (test_print.R:19:3): Index is part of the tibble output
      FAILURE (test_print.R:23:3): Groups are still printed
      
      [ FAIL 2 | WARN 0 | SKIP 0 | PASS 143 ]
      Error: Test failures
      Execution halted
    ```

# tidyjson

<details>

* Version: 0.3.1
* GitHub: https://github.com/colearendt/tidyjson
* Source code: https://github.com/cran/tidyjson
* Date/Publication: 2020-05-31 21:30:03 UTC
* Number of recursive dependencies: 94

Run `cloud_details(, "tidyjson")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ● Vector input not yet supported in path (1)
      ● does not presently work (1)
      ● no longer an error (1)
      ● tests failing due to upstream print.tbl_df (4)
      ● this function had undefined and unexpected behavior (1)
      ● wait: testthat (1)
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      FAILURE (test-tbl_json.R:256:3): does not throw an error
      FAILURE (test-tbl_json.R:261:3): does not throw an error
      FAILURE (test-tbl_json.R:265:3): does not throw an error
      
      [ FAIL 3 | WARN 0 | SKIP 10 | PASS 356 ]
      Error: Test failures
      Execution halted
    ```

# tsibble

<details>

* Version: 0.9.3
* GitHub: https://github.com/tidyverts/tsibble
* Source code: https://github.com/cran/tsibble
* Date/Publication: 2020-10-06 21:30:02 UTC
* Number of recursive dependencies: 93

Run `cloud_details(, "tsibble")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘spelling.R’
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ── FAILURE (test-tsibble.R:331:3): A single key ────────────────────────────────
      `print\(tsbl\)` does not match "A tsibble: 10 x 3 \\[1D\\]".
      Actual value: "<print\(tibble::tibble\(\)\)>"
      
      ── Skipped tests  ──────────────────────────────────────────────────────────────
      ● On CRAN (2)
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      FAILURE (test-tsibble.R:199:3): Year week with 1 week interval
      FAILURE (test-tsibble.R:217:3): Year month with 1 month interval
      FAILURE (test-tsibble.R:331:3): A single key
      
      [ FAIL 3 | WARN 0 | SKIP 2 | PASS 731 ]
      Error: Test failures
      Execution halted
    ```

# weathercan

<details>

* Version: 0.4.0
* GitHub: https://github.com/ropensci/weathercan
* Source code: https://github.com/cran/weathercan
* Date/Publication: 2020-09-02 08:40:03 UTC
* Number of recursive dependencies: 133

Run `cloud_details(, "weathercan")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ── Skip (test_08_normals.R:80:3): normals_format()/frost_format() format data to
      Reason: On CRAN
      
      ── Skip (test_08_normals.R:106:3): normals_dl() downloads normals/frost dates as
      Reason: On CRAN
      
      ── Skipped tests  ──────────────────────────────────────────────────────────────
      ● On CRAN (12)
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      FAILURE (test_06_weather_dl_2_day.R:177:3): weather (day) verbose and quiet
      
      [ FAIL 1 | WARN 0 | SKIP 12 | PASS 545 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘memoise’
      All declared Imports should be used.
    ```

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 3 marked UTF-8 strings
    ```

# xpose

<details>

* Version: 0.4.11
* GitHub: https://github.com/UUPharmacometrics/xpose
* Source code: https://github.com/cran/xpose
* Date/Publication: 2020-07-22 21:10:03 UTC
* Number of recursive dependencies: 100

Run `cloud_details(, "xpose")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      
      ── Skip (test-xpose_data.R:48:3): properly creates the xpdb when using the runno
      Reason: On CRAN
      
      ── Skipped tests  ──────────────────────────────────────────────────────────────
      ● On CRAN (7)
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      FAILURE (test-console_outputs.R:40:3): Check list_data returns a proper message
      FAILURE (test-console_outputs.R:45:3): Check list_files returns a proper message
      FAILURE (test-console_outputs.R:50:3): Check list_special returns a proper message
      
      [ FAIL 3 | WARN 0 | SKIP 7 | PASS 519 ]
      Error: Test failures
      Execution halted
    ```

