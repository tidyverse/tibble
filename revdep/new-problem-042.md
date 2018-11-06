# sweep

Version: 0.2.1.1

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘sweep-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: sw_sweep
    > ### Title: Tidy forecast objects
    > ### Aliases: sw_sweep
    > 
    > ### ** Examples
    > 
    > library(forecast)
    > library(sweep)
    > 
    > # ETS forecasts
    > USAccDeaths %>%
    +     ets() %>%
    +     forecast(level = c(80, 95, 99)) %>%
    +     sw_sweep()
    Error: Column 1 must be named.
    Use .name_repair to specify repair.
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      18: repaired_names(names(x), .name_repair = .name_repair) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/repair-names.R:137
      19: check_unique(new_name) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/repair-names.R:168
      20: abort(error_column_must_be_named(bad_name)) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/repair-names.R:256
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 128 SKIPPED: 0 FAILED: 6
      1. Error: sw_sweep test returns tibble with correct rows and columns. (@test_sw_sweep.R#11) 
      2. Error: sw_*.Arima test returns tibble with correct rows and columns. (@test_tidiers_arima.R#57) 
      3. Error: sw_*.bats test returns tibble with correct rows and columns. (@test_tidiers_bats_tbats.R#106) 
      4. Error: sw_*.decomposed.ts test returns tibble with correct rows and columns. (@test_tidiers_decomposed_ts.R#23) 
      5. Error: sw_*.HoltWinters test returns tibble with correct rows and columns. (@test_tidiers_hw.R#34) 
      6. Error: sw_*.nnetar test returns tibble with correct rows and columns. (@test_tidiers_nnetar.R#38) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    ...
    Version 0.4-0 included new data defaults. See ?getSymbols.
    Loading required package: tidyverse
    ── Attaching packages ────────────────────────────────── tidyverse 1.2.1 ──
    ✔ ggplot2 3.1.0           ✔ purrr   0.2.5      
    ✔ tibble  1.4.99.9005     ✔ dplyr   0.7.7      
    ✔ tidyr   0.8.2           ✔ stringr 1.3.1      
    ✔ readr   1.1.1           ✔ forcats 0.3.0      
    ── Conflicts ───────────────────────────────────── tidyverse_conflicts() ──
    ✖ lubridate::as.difftime() masks base::as.difftime()
    ✖ lubridate::date()        masks base::date()
    ✖ dplyr::filter()          masks stats::filter()
    ✖ dplyr::first()           masks xts::first()
    ✖ lubridate::intersect()   masks base::intersect()
    ✖ dplyr::lag()             masks stats::lag()
    ✖ dplyr::last()            masks xts::last()
    ✖ lubridate::setdiff()     masks base::setdiff()
    ✖ lubridate::union()       masks base::union()
    Quitting from lines 206-217 (SW00_Introduction_to_sweep.Rmd) 
    Error: processing vignette 'SW00_Introduction_to_sweep.Rmd' failed with diagnostics:
    series cannot be merged with non-unique index entries in a series
    Execution halted
    ```

