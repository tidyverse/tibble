# anomalize

Version: 0.1.1

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    The following objects are masked from ‘package:stats’:
    
        filter, lag
    
    The following objects are masked from ‘package:base’:
    
        intersect, setdiff, setequal, union
    
    > 
    > # Needed to pass CRAN check / This is loaded by default
    > set_time_scale_template(time_scale_template())
    > 
    > data(tidyverse_cran_downloads)
    > 
    > tidyverse_cran_downloads %>%
    +     time_decompose(count, method = "stl") %>%
    +     anomalize(remainder, method = "iqr")
    Error in mutate_impl(.data, dots) : 
      Evaluation error: Must pass a scalar integer as `nrow` argument to `new_tibble()`..
    Calls: %>% ... <Anonymous> -> <Anonymous> -> mutate.tbl_df -> mutate_impl
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 14 SKIPPED: 0 FAILED: 21
      1. Error: iqr_grouped_df works (@test-anomalize.R#32) 
      2. Error: gesd_grouped_df works (@test-anomalize.R#45) 
      3. Error: returns a ggplot (@test-plot_anomalies.R#8) 
      4. Error: returns a ggplot (@test-plot_anomaly_decomposition.R#10) 
      5. Error: converts tibble to tbl_time (@test-prep_tbl_time.R#14) 
      6. Error: tbl_time returns tbl_time (@test-prep_tbl_time.R#19) 
      7. Error: grouped_tbl_time works (@test-time_apply.R#11) 
      8. Error: tbl_time works (@test-time_apply.R#17) 
      9. Error: single tbl_df (@test-time_decompose.R#14) 
      1. ...
      
      Error: testthat unit tests failed
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    Quitting from lines 72-81 (anomalize_methods.Rmd) 
    Error: processing vignette 'anomalize_methods.Rmd' failed with diagnostics:
    Must pass a scalar integer as `nrow` argument to `new_tibble()`.
    Execution halted
    ```

# anomalyDetection

Version: 0.2.5

## Newly broken

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    
    Attaching package: 'dplyr'
    
    The following objects are masked from 'package:stats':
    
        filter, lag
    
    The following objects are masked from 'package:base':
    
        intersect, setdiff, setequal, union
    
    Quitting from lines 159-164 (Introduction.Rmd) 
    Error: processing vignette 'Introduction.Rmd' failed with diagnostics:
    Columns 1, 2, 3, 4, 5, … (and 20 more) must be named.
    Use .name_repair to specify repair.
    Execution halted
    ```

# atlantistools

Version: 0.4.3

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      10: set_repaired_names(x, .name_repair) at /tmp/Rtmp9B5iV1/R.INSTALLf03714b2ac16/tibble/R/as_tibble.R:117
      11: set_names(x, repaired_names(names(x), .name_repair = .name_repair)) at /tmp/Rtmp9B5iV1/R.INSTALLf03714b2ac16/tibble/R/repair-names.R:143
      12: set_names_impl(x, x, nm, ...) at /tmp/RtmpQd7eDE/R.INSTALL8ca31dfbdc57/rlang/R/attr.R:163
      13: is_function(nm) at /tmp/RtmpQd7eDE/R.INSTALL8ca31dfbdc57/rlang/R/attr.R:170
      14: is_closure(x) at /tmp/RtmpQd7eDE/R.INSTALL8ca31dfbdc57/rlang/R/fn.R:287
      15: repaired_names(names(x), .name_repair = .name_repair) at /tmp/Rtmp9B5iV1/R.INSTALLf03714b2ac16/tibble/R/repair-names.R:143
      16: check_unique(new_name) at /tmp/Rtmp9B5iV1/R.INSTALLf03714b2ac16/tibble/R/repair-names.R:173
      17: abort(error_column_must_be_named(bad_name)) at /tmp/Rtmp9B5iV1/R.INSTALLf03714b2ac16/tibble/R/repair-names.R:261
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 195 SKIPPED: 1 FAILED: 1
      1. Error: (unknown) (@test-diet-fishbase.R#12) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# bayesammi

Version: 0.1.0

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > ### Title: Bayesian Estimation of the Additive Main Effects and
    > ###   Multiplicative Interaction Model
    > ### Aliases: bayes_ammi bayes_ammi.default
    > 
    > ### ** Examples
    > 
    > 
    > data(Maiz)
    > 
    > fm1 <-
    +  bayes_ammi(
    +      .data  = Maiz
    +    , .y     = y
    +    , .gen   = entry
    +    , .env   = site
    +    , .rep   = rep
    +    , .nIter = 20
    +   )
    Error: Column 1 must be named.
    Use .name_repair to specify repair.
    Execution halted
    ```

# baystability

Version: 0.1.0

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > ge_means0 <- fm1$ge_means$ge_means
    > 
    > data(cultivo2008)
    > 
    > fm2 <-
    +  ge_ammi(
    +    .data = cultivo2009
    +    , .y    = y
    +    , .gen  = entry
    +    , .env  = site
    +    , .rep  = rep
    +   )
    > 
    > k        <- fm2$k
    > alphasa  <- fm2$alphas
    > gammasa  <- fm2$gammas
    > 
    > alphas1  <- tibble::as_tibble(fm2$alphas)
    Error: Columns 1, 2, 3, 4, 5, … (and 6 more) must be named.
    Use .name_repair to specify repair.
    Execution halted
    ```

# caffsim

Version: 0.2.2

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘caffsim-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: caffConcTime
    > ### Title: Create a dataset of the concentration-time curve of single oral
    > ###   administration of caffeine
    > ### Aliases: caffConcTime
    > 
    > ### ** Examples
    > 
    > caffConcTime(Weight = 20, Dose = 200, N = 20)
    Error: Columns 1, 2, 3 must be named.
    Use .name_repair to specify repair.
    Execution halted
    ```

# corrr

Version: 0.3.0

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

# dexter

Version: 0.8.3

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      25: set_names_impl(x, x, nm, ...) at /tmp/RtmpQd7eDE/R.INSTALL8ca31dfbdc57/rlang/R/attr.R:163
      26: is_function(nm) at /tmp/RtmpQd7eDE/R.INSTALL8ca31dfbdc57/rlang/R/attr.R:170
      27: is_closure(x) at /tmp/RtmpQd7eDE/R.INSTALL8ca31dfbdc57/rlang/R/fn.R:287
      28: repaired_names(names(x), .name_repair = .name_repair) at /tmp/Rtmp9B5iV1/R.INSTALLf03714b2ac16/tibble/R/repair-names.R:143
      29: check_unique(new_name) at /tmp/Rtmp9B5iV1/R.INSTALLf03714b2ac16/tibble/R/repair-names.R:173
      30: abort(error_column_must_be_named(bad_name)) at /tmp/Rtmp9B5iV1/R.INSTALLf03714b2ac16/tibble/R/repair-names.R:261
      
      ==
      ==
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 56 SKIPPED: 5 FAILED: 1
      1. Error: calibration of verbal aggression dataset matches oplm results, with fixed and unfixed (@test_enorm.R#31) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# diffdf

Version: 1.0.1

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
    Error: C stack usage  7970516 is too close to the limit
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
      Error: C stack usage  7969412 is too close to the limit
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 15 SKIPPED: 0 FAILED: 0
      Execution halted
    ```

# ggfan

Version: 0.1.2

## Newly broken

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    Quitting from lines 117-125 (ggfan_stan.Rmd) 
    Error: processing vignette 'ggfan_stan.Rmd' failed with diagnostics:
    Columns 1, 2, 3, 4, 5, … (and 995 more) must be named.
    Use .name_repair to specify repair.
    Execution halted
    ```

# mfa

Version: 1.2.0

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘mfa-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: summary.mfa
    > ### Title: Summarise an mfa fit
    > ### Aliases: summary.mfa
    > 
    > ### ** Examples
    > 
    > synth <- create_synthetic(C = 20, G = 5)
    > m <- mfa(synth$X)
    Sampling for 20 cells and 5 genes
    > ms <- summary(m)
    Error: Columns 1, 2 must be named.
    Execution halted
    ```

# parsnip

Version: 0.0.1

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      18: set_repaired_names(x, .name_repair) at /tmp/Rtmp9B5iV1/R.INSTALLf03714b2ac16/tibble/R/as_tibble.R:117
      19: set_names(x, repaired_names(names(x), .name_repair = .name_repair)) at /tmp/Rtmp9B5iV1/R.INSTALLf03714b2ac16/tibble/R/repair-names.R:143
      20: set_names_impl(x, x, nm, ...) at /tmp/RtmpQd7eDE/R.INSTALL8ca31dfbdc57/rlang/R/attr.R:163
      21: is_function(nm) at /tmp/RtmpQd7eDE/R.INSTALL8ca31dfbdc57/rlang/R/attr.R:170
      22: is_closure(x) at /tmp/RtmpQd7eDE/R.INSTALL8ca31dfbdc57/rlang/R/fn.R:287
      23: repaired_names(names(x), .name_repair = .name_repair) at /tmp/Rtmp9B5iV1/R.INSTALLf03714b2ac16/tibble/R/repair-names.R:143
      24: check_unique(new_name) at /tmp/Rtmp9B5iV1/R.INSTALLf03714b2ac16/tibble/R/repair-names.R:173
      25: abort(error_column_must_be_named(bad_name)) at /tmp/Rtmp9B5iV1/R.INSTALLf03714b2ac16/tibble/R/repair-names.R:261
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 440 SKIPPED: 82 FAILED: 1
      1. Error: survival prediction (@test_surv_reg_survreg.R#67) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# phenopath

Version: 1.4.0

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘phenopath-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: clvm
    > ### Title: Fit a CLVM Model
    > ### Aliases: clvm
    > 
    > ### ** Examples
    > 
    > sim <- simulate_phenopath()
    Error: Columns 1, 2, 3 must be named.
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(phenopath)
      > 
      > test_check("phenopath")
      Error: Columns 1, 2, 3 must be named.
      Execution halted
    ```

# plotly

Version: 4.8.0

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘plotly-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: plot_dendro
    > ### Title: Plot an interactive dendrogram
    > ### Aliases: plot_dendro
    > 
    > ### ** Examples
    > 
    > 
    > hc <- hclust(dist(USArrests), "ave")
    > dend1 <- as.dendrogram(hc)
    > plot_dendro(dend1, height = 600) %>% 
    +   hide_legend() %>% 
    +   highlight(persistent = TRUE, dynamic = TRUE)
    Error: Columns 1, 2 must be named.
    Use .name_repair to specify repair.
    Execution halted
    ```

# poio

Version: 0.0-3

## Newly broken

*   checking Rd cross-references ... WARNING
    ```
    Package unavailable to check Rd xrefs: ‘ISOcodes’
    Missing link or links in documentation object 'print.po.Rd':
      ‘[tibble]{print.tbl_df}’
    
    See section 'Cross-references' in the 'Writing R Extensions' manual.
    ```

# postal

Version: 0.1.0

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(postal)
      > 
      > test_check("postal")
      ── 1. Failure: Extract date works (@test_utils.R#244)  ─────────────────────────
      extract_dates(future_date) %>% as.numeric() is not strictly more than lubridate::today() %>% as.numeric(). Difference: 0
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 108 SKIPPED: 0 FAILED: 1
      1. Failure: Extract date works (@test_utils.R#244) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# psychmeta

Version: 2.2.1

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    The error most likely occurred in:
    
    > ### Name: create_ad_tibble
    > ### Title: Create a tibble of artifact distributions by construct
    > ### Aliases: create_ad_tibble create_ad_list
    > 
    > ### ** Examples
    > 
    > ## Examples to create Taylor series artifact distributions:
    > # Overall artifact distributions (not pairwise, not moderated)
    > create_ad_tibble(ad_type = "tsa",
    +                  n = n, rxx = rxxi, ryy = ryyi,
    +                  construct_x = x_name, construct_y = y_name,
    +                  sample_id = sample_id, moderators = moderator,
    +                  data = data_r_meas_multi,
    +                  control = control_psychmeta(pairwise_ads = FALSE,
    +                                              moderated_ads = FALSE))
    Tibble of artifact distributions 
    ---------------------------------------------------------------------- 
    # A tibble: 3 x 3
      construct_x analysis_type ad_x        
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    Quitting from lines 478-486 (overview.Rmd) 
    Error: processing vignette 'overview.Rmd' failed with diagnostics:
    Columns 1, 2, 3 must be named.
    Use .name_repair to specify repair.
    Execution halted
    ```

# rcosmo

Version: 1.0.0

## Newly broken

*   checking Rd cross-references ... WARNING
    ```
    Missing link or links in documentation object 'print.CMBDataFrame.Rd':
      ‘print.tbl_df’
    
    Missing link or links in documentation object 'print.HPDataFrame.Rd':
      ‘print.tbl_df’
    
    See section 'Cross-references' in the 'Writing R Extensions' manual.
    ```

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
      22: abort(error_column_must_be_named(bad_name)) at /tmp/Rtmp9B5iV1/R.INSTALLf03714b2ac16/tibble/R/repair-names.R:261
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 1118 SKIPPED: 4 FAILED: 8
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
    Error in dimension %in% get_gho_dimensions() : 
      Columns 1, 2, 3 must be named.
    Use .name_repair to specify repair.
    Calls: get_gho_data ... tryCatch -> tryCatchList -> tryCatchOne -> <Anonymous>
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    Quitting from lines 30-31 (a-intro.Rmd) 
    Error: processing vignette 'a-intro.Rmd' failed with diagnostics:
    Columns 1, 2, 3 must be named.
    Use .name_repair to specify repair.
    Execution halted
    ```

# rsample

Version: 0.0.3

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

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘Sconify-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: QuantNormalizeElements
    > ### Title: Takes a list of tibbles as input, and performs per-column
    > ###   quantile normalization, then outputs the quantile normalized list
    > ### Aliases: QuantNormalizeElements
    > 
    > ### ** Examples
    > 
    > basal <- wand.combined[wand.combined$condition == "basal",][,1:10]
    > il7 <- wand.combined[wand.combined$condition == "IL7",][,1:10]
    > QuantNormalizeElements(list(basal, il7))
    Error: Columns 1, 2, 3, 4, 5, … (and 5 more) must be named.
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      20: is_function(nm) at /tmp/RtmpQd7eDE/R.INSTALL8ca31dfbdc57/rlang/R/attr.R:170
      21: is_closure(x) at /tmp/RtmpQd7eDE/R.INSTALL8ca31dfbdc57/rlang/R/fn.R:287
      22: repaired_names(names(x), .name_repair = .name_repair) at /tmp/Rtmp9B5iV1/R.INSTALLf03714b2ac16/tibble/R/repair-names.R:143
      23: check_unique(new_name) at /tmp/Rtmp9B5iV1/R.INSTALLf03714b2ac16/tibble/R/repair-names.R:173
      24: abort(error_column_must_be_named(bad_name)) at /tmp/Rtmp9B5iV1/R.INSTALLf03714b2ac16/tibble/R/repair-names.R:261
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 40 SKIPPED: 0 FAILED: 4
      1. Error: Simple quantile normalization case (@test.file.processing.R#116) 
      2. Error: (unknown) (@test.knn.and.statistics.R#10) 
      3. Error: Subsampling and tSNE functionality works (@test.post.processing.R#9) 
      4. Error: Basic post-processing functionality (@test.post.processing.R#21) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

*   checking whether package ‘Sconify’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: replacing previous import ‘flowCore::view’ by ‘tibble::view’ when loading ‘Sconify’
    See ‘/tmp/RtmpEz7NkN/filed6541b96ee4e/Sconify.Rcheck/00install.out’ for details.
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    ...
    cols(
      surface = col_character(),
      functional = col_character()
    )
    finding k-nearest neighbors
    k-nearest neighbors complete
    running per-knn statistics
    10 percent complete
    20 percent complete
    30 percent complete
    40 percent complete
    50 percent complete
    60 percent complete
    70 percent complete
    80 percent complete
    90 percent complete
    100 percent complete
    Quitting from lines 85-91 (Step2.TheSconeWorkflow.Rmd) 
    Error: processing vignette 'Step2.TheSconeWorkflow.Rmd' failed with diagnostics:
    Columns 1, 2, 3, 4, 5, … (and 11 more) must be named.
    Execution halted
    ```

# segregation

Version: 0.1.0

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      5: `[[.tbl_df`(total, "M", "est") at /tmp/RtmpQd7eDE/R.INSTALL8ca31dfbdc57/rlang/R/eval.R:99
      6: NextMethod() at /tmp/Rtmp9B5iV1/R.INSTALLf03714b2ac16/tibble/R/subsetting.R:79
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

## Newly broken

*   checking examples ... ERROR
    ```
    ...
     6 rnorm     5            2 rng     0.738  
     7 rnorm     5            2 median  0.487  
     8 rnorm     5            2 length  5      
     9 rnorm    10            1 rng    -2.21   
    10 rnorm    10            1 rng     1.51   
    11 rnorm    10            1 median  0.492  
    12 rnorm    10            1 length 10      
    13 rnorm    10            2 rng    -1.99   
    14 rnorm    10            2 rng     0.919  
    15 rnorm    10            2 median  0.00922
    16 rnorm    10            2 length 10      
    Number of data generating functions: 2
    Number of analyzing procedures: 3
    Number of replications: 2
    Estimated replications per hour: 6974362
    Start of the simulation: 2018-12-20 10:12:17
    End of the simulation: 2018-12-20 10:12:17
    > eval_tibbles(dg, pg,rep = 2, post_analyze = purrr::compose(tibble::as_tibble, t))
    Error: Column 1 must be named.
    Use .name_repair to specify repair.
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 45 SKIPPED: 0 FAILED: 12
      1. Error: Matrix is converted to tibble (@test_bind_or_combine.R#15) 
      2. Error: Tibbles for data generating functions can be used. Results were created and stored in simulation (@test_eval_tibbles.R#55) 
      3. Error: Tibbles for data generating and data analyzing functions can be used. Results were created and stored in simulation (@test_eval_tibbles.R#138) 
      4. Error: One analyzing function. Results were created and stored in simulation (@test_eval_tibbles.R#189) 
      5. Failure: Simplify the simulation results (@test_eval_tibbles.R#219) 
      6. Failure: Post analyze function works (@test_eval_tibbles.R#239) 
      7. Error: Three analyzing functions. Results were created and stored in simulation (@test_eval_tibbles.R#284) 
      8. Error: Three analyzing functions and one summary function. Results were created and stored in simulation (@test_eval_tibbles.R#360) 
      9. Error: Three analyzing functions and three summary function. Results were created and stored in simulation (@test_eval_tibbles.R#504) 
      1. ...
      
      Error: testthat unit tests failed
      Execution halted
    ```

# suropt

Version: 0.1.0

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘suropt-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: build_surmodel
    > ### Title: Build an surmodel object
    > ### Aliases: build_surmodel
    > 
    > ### ** Examples
    > 
    > 
    > fn <- function(x) list(y = x^2)
    > model <- build_surmodel(fn, 20, 1)
    Error: Column 1 must be named.
    Execution halted
    ```

# taxa

Version: 0.3.1

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

# tibbletime

Version: 0.1.1

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘tibbletime-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: as_period
    > ### Title: Change 'tbl_time' periodicity
    > ### Aliases: as_period
    > 
    > ### ** Examples
    > 
    > 
    > # Basic usage ---------------------------------------------------------------
    > 
    > # FB stock prices
    > data(FB)
    > FB <- as_tbl_time(FB, date)
    Error: Must pass a scalar integer as `nrow` argument to `new_tibble()`.
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 32 SKIPPED: 0 FAILED: 21
      1. Error: (unknown) (@test_as_period.R#7) 
      2. Error: (unknown) (@test_ceiling_index.R#7) 
      3. Error: Can coerce tbl_df to tbl_time (@test_coercion.R#23) 
      4. Error: Can coerce data.frame to tbl_time using default method (@test_coercion.R#27) 
      5. Error: Can coerce grouped_df to tbl_time (@test_coercion.R#32) 
      6. Error: Can coerce tbl_time back to tbl_df (@test_coercion.R#40) 
      7. Error: Collapsing works on yearmon (@test_collapse_index.R#34) 
      8. Error: Collapsing works on yearqtr (@test_collapse_index.R#41) 
      9. Error: Collapsing works on hms (@test_collapse_index.R#48) 
      1. ...
      
      Error: testthat unit tests failed
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    ...
    Attaching package: 'tibbletime'
    
    The following object is masked from 'package:stats':
    
        filter
    
    
    Attaching package: 'dplyr'
    
    The following objects are masked from 'package:stats':
    
        filter, lag
    
    The following objects are masked from 'package:base':
    
        intersect, setdiff, setequal, union
    
    Quitting from lines 29-45 (TT-01-time-based-filtering.Rmd) 
    Error: processing vignette 'TT-01-time-based-filtering.Rmd' failed with diagnostics:
    Must pass a scalar integer as `nrow` argument to `new_tibble()`.
    Execution halted
    ```

# tidypredict

Version: 0.2.0

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > 
    > ### ** Examples
    > 
    > library(dplyr)
    
    Attaching package: ‘dplyr’
    
    The following objects are masked from ‘package:stats’:
    
        filter, lag
    
    The following objects are masked from ‘package:base’:
    
        intersect, setdiff, setequal, union
    
    > df <- mutate(mtcars, cyl = paste0("cyl", cyl))
    > model <- lm(mpg ~ wt + cyl * disp, offset = am, data = df)
    > parse_model(model)
    Error in parse_model_lm(model) : There was a parsing error
    Calls: parse_model -> parse_model.lm -> parse_model_lm
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      23: tidypredict_fit.lm(model) at /tmp/RtmpEz7NkN/filed6521b96ee4e/tidypredict.Rcheck/00_pkg_src/tidypredict/R/predict-fit.R:18
      24: parse_model(model) at /tmp/RtmpEz7NkN/filed6521b96ee4e/tidypredict.Rcheck/00_pkg_src/tidypredict/R/predict-fit.R:23
      25: parse_model.lm(model) at /tmp/RtmpEz7NkN/filed6521b96ee4e/tidypredict.Rcheck/00_pkg_src/tidypredict/R/parsemodel.R:20
      26: parse_model_lm(model) at /tmp/RtmpEz7NkN/filed6521b96ee4e/tidypredict.Rcheck/00_pkg_src/tidypredict/R/parsemodel.R:26
      27: stop("There was a parsing error") at /tmp/RtmpEz7NkN/filed6521b96ee4e/tidypredict.Rcheck/00_pkg_src/tidypredict/R/parsemodel.R:120
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 11 SKIPPED: 0 FAILED: 4
      1. Error: Returns a data frame (@test-parsemodel.R#9) 
      2. Error: (unknown) (@test-parsemodel.R#13) 
      3. Error: Individual prediction difference is never above 1e-12 (@test_glm.R#13) 
      4. Error: Predictions within threshold and parsed model results are equal (@test_lm.R#23) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    Quitting from lines 47-50 (glm.Rmd) 
    Error: processing vignette 'glm.Rmd' failed with diagnostics:
    There was a parsing error
    Execution halted
    ```

# zbank

Version: 0.1.0

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/test-all.R’ failed.
    Last 13 lines of output:
      15: set_repaired_names(x, .name_repair) at /tmp/Rtmp9B5iV1/R.INSTALLf03714b2ac16/tibble/R/as_tibble.R:117
      16: set_names(x, repaired_names(names(x), .name_repair = .name_repair)) at /tmp/Rtmp9B5iV1/R.INSTALLf03714b2ac16/tibble/R/repair-names.R:143
      17: set_names_impl(x, x, nm, ...) at /tmp/RtmpQd7eDE/R.INSTALL8ca31dfbdc57/rlang/R/attr.R:163
      18: is_function(nm) at /tmp/RtmpQd7eDE/R.INSTALL8ca31dfbdc57/rlang/R/attr.R:170
      19: is_closure(x) at /tmp/RtmpQd7eDE/R.INSTALL8ca31dfbdc57/rlang/R/fn.R:287
      20: repaired_names(names(x), .name_repair = .name_repair) at /tmp/Rtmp9B5iV1/R.INSTALLf03714b2ac16/tibble/R/repair-names.R:143
      21: check_unique(new_name) at /tmp/Rtmp9B5iV1/R.INSTALLf03714b2ac16/tibble/R/repair-names.R:173
      22: abort(error_column_must_be_named(bad_name)) at /tmp/Rtmp9B5iV1/R.INSTALLf03714b2ac16/tibble/R/repair-names.R:261
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 44 SKIPPED: 22 FAILED: 1
      1. Error: high level works (@test-zb_stats.R#4) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

