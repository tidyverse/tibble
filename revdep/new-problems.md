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
    Warning in engine$weave(file, quiet = quiet, encoding = enc) :
      Pandoc (>= 1.12.3) and/or pandoc-citeproc not available. Falling back to R Markdown v1.
    Quitting from lines 72-81 (anomalize_methods.Rmd) 
    Error: processing vignette 'anomalize_methods.Rmd' failed with diagnostics:
    Must pass a scalar integer as `nrow` argument to `new_tibble()`.
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
             1)), .)))) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/as_tibble.R:76
      7: as_tibble(m, ...) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/as_tibble.R:187
      8: as_tibble.data.frame(m, ...) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/as_tibble.R:76
      9: as_tibble.list(unclass(x), ..., .rows = .rows, .name_repair = .name_repair) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/as_tibble.R:94
      10: set_repaired_names(x, .name_repair) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/as_tibble.R:118
      11: repaired_names(names(x), .name_repair = .name_repair) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/repair-names.R:137
      12: check_unique(new_name) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/repair-names.R:168
      13: abort(error_column_must_be_named(bad_name)) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/repair-names.R:256
      
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

# beadplexr

Version: 0.1.0

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > ### ** Examples
    > 
    > library(beadplexr)
    > library(magrittr)
    > library(ggplot2)
    > 
    > data("lplex")
    > 
    > lplex[[1]] %>%
    +   ggplot() +
    +   aes(x = `FL6-H`, y = `FL2-H`) +
    +   geom_point()
    > 
    > lplex[[1]] %>%
    +   despeckle(.parameters = c("FL6-H", "FL2-H"), .neighbours = 8) %>%
    +   ggplot() +
    +   aes(x = `FL6-H`, y = `FL2-H`) +
    +   geom_point()
    Loading required namespace: igraph
    Error: Columns 1, 2, 3, 4, 5, … (and 109 more) must be named.
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      15: as_tibble.matrix(x, ...) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/as_tibble.R:76
      16: as_tibble(m, ...) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/as_tibble.R:187
      17: as_tibble.data.frame(m, ...) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/as_tibble.R:76
      18: as_tibble.list(unclass(x), ..., .rows = .rows, .name_repair = .name_repair) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/as_tibble.R:94
      19: set_repaired_names(x, .name_repair) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/as_tibble.R:118
      20: repaired_names(names(x), .name_repair = .name_repair) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/repair-names.R:137
      21: check_unique(new_name) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/repair-names.R:168
      22: abort(error_column_must_be_named(bad_name)) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/repair-names.R:256
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 4574 SKIPPED: 1 FAILED: 1
      1. Error: Despeckle works (@test_despeckle.R#17) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    Warning in engine$weave(file, quiet = quiet, encoding = enc) :
      Pandoc (>= 1.12.3) and/or pandoc-citeproc not available. Falling back to R Markdown v1.
    Quitting from lines 140-146 (cba_macsplex_example.Rmd) 
    Error: processing vignette 'cba_macsplex_example.Rmd' failed with diagnostics:
    Columns 1, 2, 3, 4, 5, … (and 249 more) must be named.
    Execution halted
    ```

# breathtestcore

Version: 0.4.5

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/test-all.R’ failed.
    Last 13 lines of output:
      ── 3. Failure: A list of data frames is concatenated, comments are concatenated 
      comment(d) not identical to "A".
      1/1 mismatches
      x[1]: "A\n2 records,  m = 40±10, k =  0.010±0.003, beta = 2.00±0.40,\nGaussian n
      x[1]: oise amplitude = 1, 0% missing"
      y[1]: "A"
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 351 SKIPPED: 5 FAILED: 3
      1. Error: Columns without names are renamed (@test_cleanup_data.R#70) 
      2. Failure: A list of data frames is concatenated, comments are concatenated (@test_cleanup_data.R#136) 
      3. Failure: A list of data frames is concatenated, comments are concatenated (@test_cleanup_data.R#145) 
      
      Error: testthat unit tests failed
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

# circumplex

Version: 0.2.0

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘circumplex-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: ssm_analyze
    > ### Title: Perform analyses using the Structural Summary Method
    > ### Aliases: ssm_analyze
    > 
    > ### ** Examples
    > 
    > # Load example data
    > data("jz2017")
    > 
    > # Single-group mean-based SSM
    > ssm_analyze(jz2017, scales = PA:NO, angles = octants())
    Error: Columns 1, 2, 3, 4, 5, … (and 1 more) must be named.
    Use .name_repair to specify repair.
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 98 SKIPPED: 6 FAILED: 10
      1.  Error: The norms function detects when no norms are available (@test-instrument_oop.R#86) 
      2.  Error: Single-group mean-based SSM results are correct (@test-ssm_analysis.R#6) 
      3.  Error: Scale magnitudes greater than 5 trigger message (@test-ssm_analysis.R#171) 
      4.  Error: Single-group correlation-based SSM results are correct (@test-ssm_analysis.R#184) 
      5.  Error: Single-group mean-based SSM plot is correct (@test-ssm_visualization.R#5) 
      6.  Error: Single-group correlation-based SSM plot is correct (@test-ssm_visualization.R#17) 
      7.  Error: Measure-contrast SSM plot is correct (@test-ssm_visualization.R#27) 
      8.  Error: Group-contrast correlation-based SSM plot is correct (@test-ssm_visualization.R#40) 
      9.  Error: Removing plots with low fit works as expected (@test-ssm_visualization.R#54) 
      10. Error: SSM Table captions are correct (@test-ssm_visualization.R#61) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    Warning in engine$weave(file, quiet = quiet, encoding = enc) :
      Pandoc (>= 1.12.3) and/or pandoc-citeproc not available. Falling back to R Markdown v1.
    Quitting from lines 26-31 (intermediate-ssm-analysis.Rmd) 
    Error: processing vignette 'intermediate-ssm-analysis.Rmd' failed with diagnostics:
    Columns 1, 2, 3, 4, 5, … (and 1 more) must be named.
    Use .name_repair to specify repair.
    Execution halted
    ```

# classyfireR

Version: 0.1.1

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      3: eval_bare(get_expr(quo), get_env(quo)) at /tmp/RtmprUj4Zw/R.INSTALL86c769d3e964/testthat/R/expectation.R:90
      4: dplyr::is.tbl(retrieve_classification(inchi_sub$query_id)) at /tmp/RtmpMlC5Oo/R.INSTALL1a344ee67e36/rlang/R/eval.R:99
      5: retrieve_classification(inchi_sub$query_id) at /tmp/RtmpPSeHMW/R.INSTALLe5f7f454083/dplyr/R/tbl.r:34
      6: jsonlite::fromJSON(text_content) at /tmp/RtmpD0aMxw/filea54b75e5591f/classyfireR.Rcheck/00_pkg_src/classyfireR/R/retrieve_classification.R:27
      7: fromJSON_string(txt = txt, simplifyVector = simplifyVector, simplifyDataFrame = simplifyDataFrame, 
             simplifyMatrix = simplifyMatrix, flatten = flatten, ...) at /tmp/Rtmpejdz8t/R.INSTALL5d4d5780e00e/jsonlite/R/fromJSON.R:99
      8: parseJSON(txt, bigint_as_char) at /tmp/Rtmpejdz8t/R.INSTALL5d4d5780e00e/jsonlite/R/fromJSON.R:115
      9: parse_string(txt, bigint_as_char) at /tmp/Rtmpejdz8t/R.INSTALL5d4d5780e00e/jsonlite/R/parseJSON.R:5
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 10 SKIPPED: 0 FAILED: 1
      1. Error: submit-classification (@test-submission.R#16) 
      
      Error: testthat unit tests failed
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
      22: vars_select_eval(.vars, quos) at /tmp/RtmpGRBPQr/R.INSTALL9e601832037c/tidyselect/R/vars-select.R:123
      23: map_if(quos, !is_helper, eval_tidy, mask) at /tmp/RtmpGRBPQr/R.INSTALL9e601832037c/tidyselect/R/vars-select.R:239
      24: map(.x[sel], .f, ...) at /tmp/Rtmptt2trN/R.INSTALLba2c7b3c10a5/purrr/R/map.R:112
      25: .f(.x[[i]], ...) at /tmp/Rtmptt2trN/R.INSTALLba2c7b3c10a5/purrr/R/map.R:104
      26: -rowname at /tmp/RtmpMlC5Oo/R.INSTALL1a344ee67e36/rlang/R/eval-tidy.R:87
      27: is_character(x) at /tmp/RtmpGRBPQr/R.INSTALL9e601832037c/tidyselect/R/vars-select.R:266
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 71 SKIPPED: 0 FAILED: 3
      1. Error: Diagonal sets correctly (@test-as_cordf.R#18) 
      2. Error: Converts values accurately (@test-as_matrix.R#11) 
      3. Error: Diagonal sets correctly (@test-correlate.R#18) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# descriptr

Version: 0.4.1

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > ds_freq_cont(mtcarz, mpg, 4)
                                    Variable: mpg                                 
    |---------------------------------------------------------------------------|
    |      Bins       | Frequency | Cum Frequency |   Percent    | Cum Percent  |
    |---------------------------------------------------------------------------|
    |  10.4  -  16.3  |    10     |      10       |    31.25     |    31.25     |
    |---------------------------------------------------------------------------|
    |  16.3  -  22.1  |    13     |      23       |    40.62     |    71.88     |
    |---------------------------------------------------------------------------|
    |  22.1  -   28   |     5     |      28       |    15.62     |     87.5     |
    |---------------------------------------------------------------------------|
    |   28   -  33.9  |     4     |      32       |     12.5     |     100      |
    |---------------------------------------------------------------------------|
    |      Total      |    32     |       -       |    100.00    |      -       |
    |---------------------------------------------------------------------------|> 
    > # histogram
    > k <- ds_freq_cont(mtcarz, mpg, 4)
    > plot(k)
    Error: Columns 1, 2, 3, 4 must be named.
    Use .name_repair to specify repair.
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    Warning in engine$weave(file, quiet = quiet, encoding = enc) :
      Pandoc (>= 1.12.3) and/or pandoc-citeproc not available. Falling back to R Markdown v1.
    
    Attaching package: 'dplyr'
    
    The following objects are masked from 'package:stats':
    
        filter, lag
    
    The following objects are masked from 'package:base':
    
        intersect, setdiff, setequal, union
    
    Quitting from lines 135-137 (descriptive-stats.Rmd) 
    Error: processing vignette 'descriptive-stats.Rmd' failed with diagnostics:
    Columns 1, 2, 3, 4 must be named.
    Use .name_repair to specify repair.
    Execution halted
    ```

# DiagrammeR

Version: 1.0.0

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > # which several columns have
    > # values designated as graph nodes
    > df <-
    +   data.frame(
    +     col_1 = c("f", "p", "q"),
    +     col_2 = c("q", "x", "f"),
    +     col_3 = c(1, 5, 3),
    +     col_4 = c("a", "v", "h"),
    +     stringsAsFactors = FALSE)
    > 
    > # Add nodes from columns `col_1`
    > # and `col_2` from the data frame
    > # to the graph object
    > graph <-
    +   graph %>%
    +   add_nodes_from_df_cols(
    +     df = df,
    +     columns = c("col_1", "col_2"))
    Error: Columns 1, 2, 3 must be named.
    Use .name_repair to specify repair.
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      19: check_unique(new_name) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/repair-names.R:168
      20: abort(error_column_must_be_named(bad_name)) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/repair-names.R:256
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 2020 SKIPPED: 0 FAILED: 7
      1. Error: adding nodes from several table columns to a graph is possible (@test-add_nodes_edges_from_table.R#786) 
      2. Error: the display of the metagraph works (@test-metagraph.R#51) 
      3. Error: rendering a graph is indeed possible (@test-render_graph_series.R#35) 
      4. Error: rendering a graph from a series is also possible (@test-render_graph_series.R#74) 
      5. Error: simple traversals are possible (@test-traversals.R#49) 
      6. Error: selective traversals with `trav_both()` are possible (@test-traversals.R#1224) 
      7. Error: copying values with `trav_both()` works (@test-traversals_copying_attr_vals.R#249) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# diffdf

Version: 1.0.1

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘diffdf-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: diffdf
    > ### Title: diffdf
    > ### Aliases: diffdf
    > 
    > ### ** Examples
    > 
    > x <- subset( iris,  -Species)
    Warning in Ops.factor(Species) : ‘-’ not meaningful for factors
    > x[1,2] <- 5
    > COMPARE <- diffdf( iris, x)
    Error: The `names` must have length 6, not 2.
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 398 SKIPPED: 0 FAILED: 17
      1. Error: Check comparision of equal objects (@test-core.R#113) 
      2. Error: Unequal objects raise warnings (@test-core.R#141) 
      3. Error: Unequal object, checking numbers correct (@test-core.R#186) 
      4. Error: Differing modes error (@test-core.R#198) 
      5. Error: Differing classes error (@test-core.R#210) 
      6. Error: Illegal columns error (@test-core.R#242) 
      7. Error: Additional columns error (@test-core.R#262) 
      8. Error: Additional rows error (@test-core.R#278) 
      9. Error: Objets with differing attributes produce the correct warning (@test-core.R#312) 
      1. ...
      
      Error: testthat unit tests failed
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    Warning in engine$weave(file, quiet = quiet, encoding = enc) :
      Pandoc (>= 1.12.3) and/or pandoc-citeproc not available. Falling back to R Markdown v1.
    Quitting from lines 29-50 (diffdf-basic.Rmd) 
    Error: processing vignette 'diffdf-basic.Rmd' failed with diagnostics:
    The `names` must have length 12, not 2.
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

# drake

Version: 6.1.0

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘drake-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: map_plan
    > ### Title: Create a plan that maps a function to a grid of arguments.
    > ### Aliases: map_plan
    > 
    > ### ** Examples
    > 
    > # For the full tutorial, visit
    > # https://ropenscilabs.github.io/drake-manual/plans.html#map_plan.
    > my_model_fit <- function(x1, x2, data){
    +   lm(as.formula(paste("mpg ~", x1, "+", x1)), data = data)
    + }
    > covariates <- setdiff(colnames(mtcars), "mpg")
    > args <- tibble::as_tibble(t(combn(covariates, 2)))
    Error: Columns 1, 2 must be named.
    Use .name_repair to specify repair.
    Execution halted
    ```

# echarts4r

Version: 0.1.1

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > ### Aliases: e_heatmap e_heatmap_
    > 
    > ### ** Examples
    > 
    > v <- LETTERS[1:10]
    > matrix <- data.frame(
    +   x = sample(v, 300, replace = TRUE), 
    +   y = sample(v, 300, replace = TRUE), 
    +   z = rnorm(300, 10, 1),
    +   stringsAsFactors = FALSE
    + ) %>% 
    +   dplyr::group_by(x, y) %>% 
    +   dplyr::summarise(z = sum(z)) %>% 
    +   dplyr::ungroup()
    > 
    > matrix %>% 
    +   e_charts(x) %>% 
    +   e_heatmap(y, z) %>% 
    +   e_visual_map(z)
    Error: The `names` must not be `NULL`.
    Execution halted
    ```

# fastDummies

Version: 1.2.0

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      8: as_tibble(x, ...) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/deprecated.R:48
      9: as_tibble.default(x, ...) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/as_tibble.R:76
      10: as_tibble(as.list(x), ...) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/as_tibble.R:228
      11: as_tibble.list(as.list(x), ...) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/as_tibble.R:76
      12: set_repaired_names(x, .name_repair) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/as_tibble.R:118
      13: repaired_names(names(x), .name_repair = .name_repair) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/repair-names.R:137
      14: check_unique(new_name) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/repair-names.R:168
      15: abort(error_column_must_be_named(bad_name)) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/repair-names.R:256
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 398 SKIPPED: 0 FAILED: 1
      1. Error: tibble input returns tibble (@test-return-type.R#8) 
      
      Error: testthat unit tests failed
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
    Error: C stack usage  7970244 is too close to the limit
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
      Error: C stack usage  7969380 is too close to the limit
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
    Warning in engine$weave(file, quiet = quiet, encoding = enc) :
      Pandoc (>= 1.12.3) and/or pandoc-citeproc not available. Falling back to R Markdown v1.
    Warning in engine$weave(file, quiet = quiet, encoding = enc) :
      Pandoc (>= 1.12.3) and/or pandoc-citeproc not available. Falling back to R Markdown v1.
    Quitting from lines 117-125 (ggfan_stan.Rmd) 
    Error: processing vignette 'ggfan_stan.Rmd' failed with diagnostics:
    Columns 1, 2, 3, 4, 5, … (and 995 more) must be named.
    Use .name_repair to specify repair.
    Execution halted
    ```

# ggspatial

Version: 1.0.2

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘ggspatial-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: geom_polypath
    > ### Title: Polygons with holes in ggplot2
    > ### Aliases: geom_polypath
    > 
    > ### ** Examples
    > 
    > load_longlake_data()
    > ggplot(df_spatial(longlake_waterdf), aes(x, y, group = piece_id)) +
    +   geom_polypath()
    Error: Columns 1, 2 must be named.
    Use .name_repair to specify repair.
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      20: as_tibble.data.frame(m, ...) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/as_tibble.R:76
      21: as_tibble.list(unclass(x), ..., .rows = .rows, .name_repair = .name_repair) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/as_tibble.R:94
      22: set_repaired_names(x, .name_repair) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/as_tibble.R:118
      23: repaired_names(names(x), .name_repair = .name_repair) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/repair-names.R:137
      24: check_unique(new_name) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/repair-names.R:168
      25: abort(error_column_must_be_named(bad_name)) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/repair-names.R:256
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 62 SKIPPED: 0 FAILED: 3
      1. Error: Spatial* objects are fortified correctly (@test-df_spatial.R#31) 
      2. Error: polypath works as intended (@test-geom-polypath.R#5) 
      3. Error: geom_spatial_* geoms work properly (@test-geom_spatial.R#42) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# HURDAT

Version: 0.2.0

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      14: as_tibble(x, ...) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/deprecated.R:42
      15: as_tibble.default(x, ...) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/as_tibble.R:76
      16: as_tibble(as.list(x), ...) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/as_tibble.R:228
      17: as_tibble.list(as.list(x), ...) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/as_tibble.R:76
      18: set_repaired_names(x, .name_repair) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/as_tibble.R:118
      19: repaired_names(names(x), .name_repair = .name_repair) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/repair-names.R:137
      20: check_unique(new_name) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/repair-names.R:168
      21: abort(error_column_must_be_named(bad_name)) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/repair-names.R:256
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 0 SKIPPED: 0 FAILED: 1
      1. Error: (unknown) (@test-hurdat.R#4) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# jpmesh

Version: 1.1.1

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      9: as_tibble(x, ...) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/deprecated.R:42
      10: as_tibble.default(x, ...) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/as_tibble.R:76
      11: as_tibble(as.list(x), ...) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/as_tibble.R:228
      12: as_tibble.list(as.list(x), ...) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/as_tibble.R:76
      13: set_repaired_names(x, .name_repair) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/as_tibble.R:118
      14: repaired_names(names(x), .name_repair = .name_repair) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/repair-names.R:137
      15: check_unique(new_name) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/repair-names.R:168
      16: abort(error_column_must_be_named(bad_name)) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/repair-names.R:256
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 130 SKIPPED: 0 FAILED: 1
      1. Error: fine mesh (@test-meshcode_to_latlon.R#87) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# jpndistrict

Version: 0.3.2

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      
      options:        ENCODING=cp932 
      Reading layer `P34-14_47' from data source `/tmp/RtmpgubdRD/P34-14_47_GML/P34-14_47.shp' using driver `ESRI Shapefile'
      Simple feature collection with 65 features and 4 fields
      geometry type:  POINT
      dimension:      XY
      bbox:           xmin: 123.0045 ymin: 24.06092 xmax: 131.2989 ymax: 27.03917
      epsg (SRID):    NA
      proj4string:    +proj=longlat +ellps=GRS80 +no_defs
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 62 SKIPPED: 1 FAILED: 1
      1. Error: (unknown) (@test-export.R#3) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# jstor

Version: 0.3.4

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘jstor-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: jst_define_import
    > ### Title: Define an import specification
    > ### Aliases: jst_define_import
    > 
    > ### ** Examples
    > 
    > # articles will be imported via `jst_get_article()` and `jst_get_authors()`
    > jst_define_import(article = c(jst_get_article, jst_get_authors))
    Error: Must pass a scalar integer as `nrow` argument to `new_tibble()`.
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      OK: 116 SKIPPED: 4 FAILED: 14
      1. Error: total pages are computed (@test-augment.R#24) 
      2. Error: total pages are added (@test-augment.R#46) 
      3. Error: ranges are parsed correctly (@test-augment.R#53) 
      4. Error: data gets augmented (@test-augment.R#95) 
      5. Error: (unknown) (@test-author-import.R#7) 
      6. Error: (unknown) (@test-books.R#7) 
      7. Error: (unknown) (@test-footnotes.R#7) 
      8. Error: full-text is read correctly (@test-full_text.R#33) 
      9. Error: jst_define_import validates input (@test-import-spec.R#11) 
      1. ...
      
      Error: testthat unit tests failed
      Execution halted
      Error while shutting down parallel: unable to terminate some child processes
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    Warning in engine$weave(file, quiet = quiet, encoding = enc) :
      Pandoc (>= 1.12.3) and/or pandoc-citeproc not available. Falling back to R Markdown v1.
    
    Attaching package: 'dplyr'
    
    The following objects are masked from 'package:stats':
    
        filter, lag
    
    The following objects are masked from 'package:base':
    
        intersect, setdiff, setequal, union
    
    Quitting from lines 142-144 (Introduction.Rmd) 
    Error: processing vignette 'Introduction.Rmd' failed with diagnostics:
    Must pass a scalar integer as `nrow` argument to `new_tibble()`.
    Execution halted
    ```

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

# naniar

Version: 0.4.0.0

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘naniar-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: add_label_shadow
    > ### Title: Add a column describing whether there is a shadow
    > ### Aliases: add_label_shadow
    > 
    > ### ** Examples
    > 
    > 
    > airquality %>%
    +   add_shadow(Ozone, Solar.R) %>%
    +   add_label_shadow()
    Error: Must pass a scalar integer as `nrow` argument to `new_tibble()`.
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    Warning in engine$weave(file, quiet = quiet, encoding = enc) :
      Pandoc (>= 1.12.3) and/or pandoc-citeproc not available. Falling back to R Markdown v1.
    Quitting from lines 78-87 (exploring-imputed-values.Rmd) 
    Error: processing vignette 'exploring-imputed-values.Rmd' failed with diagnostics:
    Must pass a scalar integer as `nrow` argument to `new_tibble()`.
    Execution halted
    ```

# NLMR

Version: 0.3.2

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘NLMR-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: nlm_curds
    > ### Title: nlm_curds
    > ### Aliases: nlm_curds
    > 
    > ### ** Examples
    > 
    > 
    > # simulate random curdling
    > (random_curdling <- nlm_curds(curds = c(0.5, 0.3, 0.6),
    +                               recursion_steps = c(32, 6, 2)))
    Error: Columns 1, 2, 3, 4, 5, … (and 1019 more) must be named.
    Use .name_repair to specify repair.
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      3: as_tibble.default(vl) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/as_tibble.R:76
      4: as_tibble(as.list(x), ...) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/as_tibble.R:228
      5: as_tibble.list(as.list(x), ...) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/as_tibble.R:76
      6: set_repaired_names(x, .name_repair) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/as_tibble.R:118
      7: repaired_names(names(x), .name_repair = .name_repair) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/repair-names.R:137
      8: check_unique(new_name) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/repair-names.R:168
      9: abort(error_column_must_be_named(bad_name)) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/repair-names.R:256
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 76 SKIPPED: 0 FAILED: 2
      1. Error: nlm_curds is a good boy (@test_curds.R#5) 
      2. Error: nlm_curds with wheyed option is functional (@test_curds.R#12) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# Nmisc

Version: 0.3.3

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      22: as_tibble.default(.) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/as_tibble.R:76
      23: as_tibble(as.list(x), ...) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/as_tibble.R:228
      24: as_tibble.list(as.list(x), ...) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/as_tibble.R:76
      25: set_repaired_names(x, .name_repair) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/as_tibble.R:118
      26: repaired_names(names(x), .name_repair = .name_repair) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/repair-names.R:137
      27: check_unique(new_name) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/repair-names.R:168
      28: abort(error_column_must_be_named(bad_name)) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/repair-names.R:256
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 128 SKIPPED: 0 FAILED: 2
      1. Error: get_packages works (@test_project_packages.R#143) 
      2. Error: generate_install_file works (@test_project_packages.R#156) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# nullabor

Version: 0.3.5

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > ### Aliases: null_ts
    > 
    > ### ** Examples
    > 
    > require(forecast)
    Loading required package: forecast
    > require(tidyverse)
    Loading required package: tidyverse
    ── Attaching packages ─────────────────────────────────────── tidyverse 1.2.1 ──
    ✔ ggplot2 3.1.0           ✔ purrr   0.2.5      
    ✔ tibble  1.4.99.9005     ✔ dplyr   0.7.7      
    ✔ tidyr   0.8.2           ✔ stringr 1.3.1      
    ✔ readr   1.1.1           ✔ forcats 0.3.0      
    ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
    ✖ dplyr::filter() masks stats::filter()
    ✖ dplyr::lag()    masks stats::lag()
    > data(aud)
    > l <- lineup(null_ts("rate", auto.arima), aud)
    Error: Column 1 must be named.
    Use .name_repair to specify repair.
    Execution halted
    ```

# photobiology

Version: 0.9.24

## Newly broken

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    Warning in engine$weave(file, quiet = quiet, encoding = enc) :
      Pandoc (>= 1.12.3) and/or pandoc-citeproc not available. Falling back to R Markdown v1.
    Warning in engine$weave(file, quiet = quiet, encoding = enc) :
      Pandoc (>= 1.12.3) and/or pandoc-citeproc not available. Falling back to R Markdown v1.
    Quitting from lines 365-368 (userguide2-radiation.Rmd) 
    Error: processing vignette 'userguide2-radiation.Rmd' failed with diagnostics:
    Columns 2, 3 must be named.
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
    Warning in engine$weave(file, quiet = quiet, encoding = enc) :
      Pandoc (>= 1.12.3) and/or pandoc-citeproc not available. Falling back to R Markdown v1.
    Quitting from lines 478-486 (overview.Rmd) 
    Error: processing vignette 'overview.Rmd' failed with diagnostics:
    Columns 1, 2, 3 must be named.
    Use .name_repair to specify repair.
    Execution halted
    ```

# rcrtan

Version: 0.1.0

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘rcrtan-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: crt_iteman
    > ### Title: Calculate criterion-referenced item discrimination indices
    > ### Aliases: crt_iteman
    > 
    > ### ** Examples
    > 
    > crt_iteman(bh_depend, 2:31, 21, scale = 'raw')
    Error: Column 1 must be named.
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    Warning in engine$weave(file, quiet = quiet, encoding = enc) :
      Pandoc (>= 1.12.3) and/or pandoc-citeproc not available. Falling back to R Markdown v1.
    Quitting from lines 105-114 (rcrtan-vignette.Rmd) 
    Error: processing vignette 'rcrtan-vignette.Rmd' failed with diagnostics:
    Column 1 must be named.
    Execution halted
    ```

# rdefra

Version: 0.3.5

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      6: httr::http_error(myURL) at /tmp/RtmprUj4Zw/R.INSTALL86c769d3e964/testthat/R/expect-that.R:22
      7: http_error.character(myURL) at /tmp/Rtmp6CO8z7/R.INSTALL86d63e789f1c/httr/R/response-status.r:162
      8: http_error(HEAD(x, ...)) at /tmp/Rtmp6CO8z7/R.INSTALL86d63e789f1c/httr/R/response-status.r:166
      9: HEAD(x, ...) at /tmp/Rtmp6CO8z7/R.INSTALL86d63e789f1c/httr/R/response-status.r:166
      10: request_perform(req, hu$handle$handle) at /tmp/Rtmp6CO8z7/R.INSTALL86d63e789f1c/httr/R/http-head.r:28
      11: request_fetch(req$output, req$url, handle) at /tmp/Rtmp6CO8z7/R.INSTALL86d63e789f1c/httr/R/request.R:137
      12: request_fetch.write_memory(req$output, req$url, handle) at /tmp/Rtmp6CO8z7/R.INSTALL86d63e789f1c/httr/R/write-function.R:74
      13: curl::curl_fetch_memory(url, handle = handle) at /tmp/Rtmp6CO8z7/R.INSTALL86d63e789f1c/httr/R/write-function.R:76
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 20 SKIPPED: 1 FAILED: 1
      1. Error: Hourly data for station ABD/2014 should be available (@test-data.R#11) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# readxl

Version: 1.1.0

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      `df <- read_excel(test_sheet("missing-v-node-xlsx.xlsx"))` produced messages.
      
      ── 5. Failure: we can read LAPD arrest sheets (@test-compatibility.R#64)  ──────
      `... <- NULL` produced messages.
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 374 SKIPPED: 0 FAILED: 5
      1. Failure: column_names can anticipate skipping (@test-col-names.R#78) 
      2. Failure: column_names can anticipate skipping (@test-col-names.R#89) 
      3. Failure: we can finally read Ekaterinburg (@test-compatibility.R#27) 
      4. Failure: formula cell with no v node does not cause crash (@test-compatibility.R#53) 
      5. Failure: we can read LAPD arrest sheets (@test-compatibility.R#64) 
      
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
    Warning in engine$weave(file, quiet = quiet, encoding = enc) :
      Pandoc (>= 1.12.3) and/or pandoc-citeproc not available. Falling back to R Markdown v1.
    Quitting from lines 30-31 (a-intro.Rmd) 
    Error: processing vignette 'a-intro.Rmd' failed with diagnostics:
    Columns 1, 2, 3 must be named.
    Use .name_repair to specify repair.
    Execution halted
    ```

# ritis

Version: 0.7.2

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/test-all.R’ failed.
    Last 13 lines of output:
      20: as_tibble.matrix(x, ...) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/as_tibble.R:76
      21: as_tibble(m, ...) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/as_tibble.R:187
      22: as_tibble.data.frame(m, ...) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/as_tibble.R:76
      23: as_tibble.list(unclass(x), ..., .rows = .rows, .name_repair = .name_repair) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/as_tibble.R:94
      24: set_repaired_names(x, .name_repair) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/as_tibble.R:118
      25: repaired_names(names(x), .name_repair = .name_repair) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/repair-names.R:137
      26: check_unique(new_name) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/repair-names.R:168
      27: abort(error_column_must_be_named(bad_name)) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/repair-names.R:256
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 114 SKIPPED: 4 FAILED: 1
      1. Error: itis_facet basic functionality works (@test-itis_facet.R#4) 
      
      Error: testthat unit tests failed
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
      5: `[[.tbl_df`(total, "M", "est") at /tmp/RtmpMlC5Oo/R.INSTALL1a344ee67e36/rlang/R/eval.R:99
      6: NextMethod() at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/subsetting.R:77
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
     6 rnorm     5            2 rng      0.738  
     7 rnorm     5            2 median   0.487  
     8 rnorm     5            2 length   5      
     9 rnorm    10            1 rng     -2.21   
    10 rnorm    10            1 rng      1.51   
    11 rnorm    10            1 median   0.492  
    12 rnorm    10            1 length  10      
    13 rnorm    10            2 rng     -1.99   
    14 rnorm    10            2 rng      0.919  
    15 rnorm    10            2 median   0.00922
    16 rnorm    10            2 length  10      
    Number of data generating functions: 2
    Number of analyzing procedures: 3
    Number of replications: 2
    Estimated replications per hour: 6926373
    Start of the simulation: 2018-11-08 02:46:07
    End of the simulation: 2018-11-08 02:46:07
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
      OK: 37 SKIPPED: 0 FAILED: 9
      1. Error: Unnamed vector combined to one column (@test_bind_or_combine.R#4) 
      2. Error: Matrix is converted to tibble (@test_bind_or_combine.R#15) 
      3. Error: Tibbles for data generating functions can be used. Results were created and stored in simulation (@test_eval_tibbles.R#55) 
      4. Error: Tibbles for data generating and data analyzing functions can be used. Results were created and stored in simulation (@test_eval_tibbles.R#138) 
      5. Error: One analyzing function. Results were created and stored in simulation (@test_eval_tibbles.R#189) 
      6. Failure: Simplify the simulation results (@test_eval_tibbles.R#219) 
      7. Failure: Post analyze function works (@test_eval_tibbles.R#239) 
      8. Error: Three analyzing functions. Results were created and stored in simulation (@test_eval_tibbles.R#284) 
      9. Error: (unknown) (@test_eval_tibbles.R#300) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    Warning in engine$weave(file, quiet = quiet, encoding = enc) :
      Pandoc (>= 1.12.3) and/or pandoc-citeproc not available. Falling back to R Markdown v1.
    
    Attaching package: 'dplyr'
    
    The following objects are masked from 'package:stats':
    
        filter, lag
    
    The following objects are masked from 'package:base':
    
        intersect, setdiff, setequal, union
    
    Quitting from lines 179-189 (simTool.Rmd) 
    Error: processing vignette 'simTool.Rmd' failed with diagnostics:
    Columns 1, 2, 3, 4, 5, … (and 995 more) must be named.
    Use .name_repair to specify repair.
    Execution halted
    ```

# staRdom

Version: 1.0.8

## Newly broken

*   checking re-building of vignette outputs ... WARNING
    ```
    ...
    Scale for 'fill' is already present. Adding another scale for 'fill',
    which will replace the existing scale.
    Scale for 'fill' is already present. Adding another scale for 'fill',
    which will replace the existing scale.
    Scale for 'fill' is already present. Adding another scale for 'fill',
    which will replace the existing scale.
    Scale for 'fill' is already present. Adding another scale for 'fill',
    which will replace the existing scale.
    Scale for 'fill' is already present. Adding another scale for 'fill',
    which will replace the existing scale.
    Warning: This metric uses either excitation or emission wavelengths that were not present in the data. Data has been interpolated to fit the requested wavelengths.
    Warning: This metric uses either excitation or emission wavelengths that were not present in the data. Data has been interpolated to fit the requested wavelengths.
    Warning: This metric uses either excitation or emission wavelengths that were not present in the data. Data has been interpolated to fit the requested wavelengths.
    Warning: This metric uses either excitation or emission wavelengths that were not present in the data. Data has been interpolated to fit the requested wavelengths.
    Warning: This metric uses either excitation or emission wavelengths that were not present in the data. Data has been interpolated to fit the requested wavelengths.
    Warning: This metric uses either excitation or emission wavelengths that were not present in the data. Data has been interpolated to fit the requested wavelengths.
    Quitting from lines 267-269 (PARAFAC_analysis_of_EEM.Rmd) 
    Error: processing vignette 'PARAFAC_analysis_of_EEM.Rmd' failed with diagnostics:
    task 1 failed - "Column 1 must be named.
    Use .name_repair to specify repair."
    Execution halted
    ```

# stminsights

Version: 0.2.2

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > 
    > # fit model
    > gadarian_10 <- stm(documents = out$documents,
    +                    vocab = out$vocab,
    +                    data = out$meta,
    +                    prevalence = ~ treatment + s(pid_rep),
    +                    K = 10,
    +                    max.em.its = 1, # reduce computation time for example
    +                    verbose = FALSE)
    > 
    > # extract network
    > stm_corrs <- get_network(model = gadarian_10,
    +                          method = 'simple',
    +                          labels = paste('Topic', 1:10),
    +                          cutoff = 0.001,
    +                          cutiso = TRUE)
    Error in mutate_impl(.data, dots) : 
      Evaluation error: Columns 1, 2 must be named.
    Use .name_repair to specify repair..
    Calls: get_network ... mutate_as_tbl -> mutate -> mutate.tbl_df -> mutate_impl
    Execution halted
    ```

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

# swmmr

Version: 0.8.1

## Newly broken

*   checking re-building of vignette outputs ... WARNING
    ```
    ...
    Warning in engine$weave(file, quiet = quiet, encoding = enc) :
      Pandoc (>= 1.12.3) and/or pandoc-citeproc not available. Falling back to R Markdown v1.
    Warning in engine$weave(file, quiet = quiet, encoding = enc) :
      Pandoc (>= 1.12.3) and/or pandoc-citeproc not available. Falling back to R Markdown v1.
    
    Attaching package: 'dplyr'
    
    The following objects are masked from 'package:stats':
    
        filter, lag
    
    The following objects are masked from 'package:base':
    
        intersect, setdiff, setequal, union
    
    Linking to GEOS 3.5.1, GDAL 2.1.3, PROJ 4.9.2
    Quitting from lines 57-74 (How_to_convert_between_GIS_data_and_SWMM_with_swmmr.Rmd) 
    Error: processing vignette 'How_to_convert_between_GIS_data_and_SWMM_with_swmmr.Rmd' failed with diagnostics:
    Column 1 must be named.
    Use .name_repair to specify repair.
    Execution halted
    ```

# tabularaster

Version: 0.5.0

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      15: as_tibble(as.list(x), ...) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/as_tibble.R:228
      16: as_tibble.list(as.list(x), ...) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/as_tibble.R:76
      17: set_repaired_names(x, .name_repair) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/as_tibble.R:118
      18: repaired_names(names(x), .name_repair = .name_repair) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/repair-names.R:137
      19: check_unique(new_name) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/repair-names.R:168
      20: abort(error_column_must_be_named(bad_name)) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/repair-names.R:256
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 17 SKIPPED: 1 FAILED: 3
      1. Error: cellnumber extraction is available (@test-all-major-funs.R#11) 
      2. Error: extract of sf works (@test-all-major-funs.R#57) 
      3. Error: cell numbers for points works (@test-cellnumbers.R#34) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    Warning in engine$weave(file, quiet = quiet, encoding = enc) :
      Pandoc (>= 1.12.3) and/or pandoc-citeproc not available. Falling back to R Markdown v1.
    Warning in engine$weave(file, quiet = quiet, encoding = enc) :
      Pandoc (>= 1.12.3) and/or pandoc-citeproc not available. Falling back to R Markdown v1.
    Quitting from lines 45-49 (tabularaster-usage.Rmd) 
    Error: processing vignette 'tabularaster-usage.Rmd' failed with diagnostics:
    Column 1 must be named.
    Use .name_repair to specify repair.
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

# tidygraph

Version: 1.1.0

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘tidygraph-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: activate
    > ### Title: Determine the context of subsequent manipulations
    > ### Aliases: activate active %N>% %E>%
    > 
    > ### ** Examples
    > 
    > gr <- create_complete(5) %>%
    +   activate(nodes) %>%
    +   mutate(class = sample(c('a', 'b'), 5, TRUE)) %>%
    +   activate(edges) %>%
    +   arrange(from)
    Error: Columns 1, 2 must be named.
    Use .name_repair to specify repair.
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 133 SKIPPED: 0 FAILED: 36
      1. Error: activate activates all morphed graphs (@test-activate.R#26) 
      2. Error: arrange works with edges (@test-arrange.R#13) 
      3. Error: bind_graphs works (@test-bind.R#8) 
      4. Error: bind_edges works (@test-bind.R#22) 
      5. Error: centrality returns numeric (@test-centrality.R#8) 
      6. Error: centrality returns correct length (@test-centrality.R#25) 
      7. Error: graphs get added and stacked in the context (@test-context.R#12) 
      8. Error: distinct works (@test-distinct.R#4) 
      9. Error: edge types return logical (@test-edge_types.R#7) 
      1. ...
      
      Error: testthat unit tests failed
      Execution halted
    ```

# tidypredict

Version: 0.2.0

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > ### Aliases: parse_model
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
    Error: Column `value` not found in `.data`
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      41: .data$value at /tmp/RtmpMlC5Oo/R.INSTALL1a344ee67e36/rlang/R/eval-tidy.R:87
      42: `$.rlang_data_pronoun`(.data, value) at /tmp/RtmpMlC5Oo/R.INSTALL1a344ee67e36/rlang/R/eval-tidy.R:87
      43: data_pronoun_get(x, nm) at /tmp/RtmpMlC5Oo/R.INSTALL1a344ee67e36/rlang/R/eval-tidy.R:375
      44: rlang:::abort_data_pronoun(x) at /tmp/RtmpMlC5Oo/R.INSTALL1a344ee67e36/rlang/R/eval-tidy.R:386
      45: abort(msg, "rlang_data_pronoun_not_found") at /tmp/RtmpMlC5Oo/R.INSTALL1a344ee67e36/rlang/R/eval-tidy.R:390
      
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
    Warning in engine$weave(file, quiet = quiet, encoding = enc) :
      Pandoc (>= 1.12.3) and/or pandoc-citeproc not available. Falling back to R Markdown v1.
    Quitting from lines 47-50 (glm.Rmd) 
    Error: processing vignette 'glm.Rmd' failed with diagnostics:
    Column `value` not found in `.data`
    Execution halted
    ```

# tidyquant

Version: 0.5.5

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
             ... = ...) at /tmp/RtmpD0aMxw/filea5265e360d2/tidyquant.Rcheck/00_pkg_src/tidyquant/R/tq_mutate.R:228
      13: tq_transmute_xy_.tbl_df(data = data, x = x, y = y, mutate_fun = mutate_fun, col_rename = col_rename, 
             ... = ...) at /tmp/RtmpD0aMxw/filea5265e360d2/tidyquant.Rcheck/00_pkg_src/tidyquant/R/tq_transmute.R:163
      14: check_x_y_valid(data, x, y) at /tmp/RtmpD0aMxw/filea5265e360d2/tidyquant.Rcheck/00_pkg_src/tidyquant/R/tq_transmute.R:182
      15: stop(paste0("x = ", x, " not a valid name.")) at /tmp/RtmpD0aMxw/filea5265e360d2/tidyquant.Rcheck/00_pkg_src/tidyquant/R/tq_transmute.R:334
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 184 SKIPPED: 1 FAILED: 4
      1. Error: (unknown) (@test_tq_get_compound_getters.R#10) 
      2. Failure: Test returns tibble with correct rows and columns. (@test_tq_get_key_ratios.R#16) 
      3. Failure: Test unnest returns correct rows. (@test_tq_get_key_ratios.R#23) 
      4. Error: (unknown) (@test_tq_mutate.R#53) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    ...
    Warning: Computation failed in `stat_segment_left_bc()`:
    Evaluation error: argument "color_up" is missing, with no default.
    Warning: Computation failed in `stat_segment_left_bc()`:
    Evaluation error: argument "color_up" is missing, with no default.
    Warning: Computation failed in `stat_segment_right_bc()`:
    Evaluation error: argument "color_up" is missing, with no default.
    Warning: Computation failed in `stat_segment_right_bc()`:
    Evaluation error: argument "color_up" is missing, with no default.
    Warning: Computation failed in `stat_segment_right_bc()`:
    Evaluation error: argument "color_up" is missing, with no default.
    Warning: Computation failed in `stat_segment_right_bc()`:
    Evaluation error: argument "color_up" is missing, with no default.
    Warning in engine$weave(file, quiet = quiet, encoding = enc) :
      Pandoc (>= 1.12.3) and/or pandoc-citeproc not available. Falling back to R Markdown v1.
    additional arguments ignored in warning()
    Warning in bind_rows_(x, .id) :
      Vectorizing 'zoo' elements may not preserve their attributes
    Quitting from lines 183-193 (TQ01-core-functions-in-tidyquant.Rmd) 
    Error: processing vignette 'TQ01-core-functions-in-tidyquant.Rmd' failed with diagnostics:
    object 'value' not found
    Execution halted
    ```

# tidytree

Version: 0.1.9

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘tidytree-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: ancestor
    > ### Title: ancestor
    > ### Aliases: ancestor ancestor.tbl_tree
    > 
    > ### ** Examples
    > 
    > library(ape)
    > tree <- rtree(4)
    > x <- as_data_frame(tree)
    Error in as.data.frame.default(x) : 
      cannot coerce class ‘"phylo"’ to a data.frame
    Calls: as_data_frame ... as_tibble -> as.data.frame -> as.data.frame.default
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 0 SKIPPED: 0 FAILED: 14
      1. Error: conversion to table is reversible (@test-access-related-nodes.R#27) 
      2. Error: child works for bifurcating trees (@test-access-related-nodes.R#35) 
      3. Error: child works for non-bifurcating trees (@test-access-related-nodes.R#44) 
      4. Error: offspring works on bifurcating trees (@test-access-related-nodes.R#52) 
      5. Error: offspring works on non-bifurcating trees (@test-access-related-nodes.R#58) 
      6. Error: parent works for bifurcating trees (@test-access-related-nodes.R#64) 
      7. Error: parent works for non-bifurcating trees (@test-access-related-nodes.R#70) 
      8. Error: ancestor works for bifurcating trees (@test-access-related-nodes.R#76) 
      9. Error: ancestor works for non-bifurcating trees (@test-access-related-nodes.R#82) 
      1. ...
      
      Error: testthat unit tests failed
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    Warning in engine$weave(file, quiet = quiet, encoding = enc) :
      Pandoc (>= 1.12.3) and/or pandoc-citeproc not available. Falling back to R Markdown v1.
    
    Attaching package: 'tidytree'
    
    The following object is masked from 'package:stats':
    
        filter
    
    Quitting from lines 58-64 (tidytree.Rmd) 
    Error: processing vignette 'tidytree.Rmd' failed with diagnostics:
    cannot coerce class '"phylo"' to a data.frame
    Execution halted
    ```

# timetk

Version: 0.1.1.1

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > 
    > ### zooreg to tibble: Comparison between as.data.frame() and tk_tbl()
    > data_zooreg <- tk_zooreg(1:8, start = zoo::yearqtr(2000), frequency = 4)
    > 
    > # Dates are character class stored in row names
    > as.data.frame(data_zooreg)
            data_zooreg
    2000 Q1           1
    2000 Q2           2
    2000 Q3           3
    2000 Q4           4
    2001 Q1           5
    2001 Q2           6
    2001 Q3           7
    2001 Q4           8
    > 
    > # Dates are appropriate zoo yearqtr class within the data frame
    > tk_tbl(data_zooreg)
    Error: Column 1 must be named.
    Use .name_repair to specify repair.
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      14: set_repaired_names(x, .name_repair) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/as_tibble.R:118
      15: repaired_names(names(x), .name_repair = .name_repair) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/repair-names.R:137
      16: check_unique(new_name) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/repair-names.R:168
      17: abort(error_column_must_be_named(bad_name)) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/repair-names.R:256
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 262 SKIPPED: 0 FAILED: 5
      1. Error: tk_index(decomposed.ts) test returns correct format. (@test_tk_index.R#324) 
      2. Error: zooreg to tbl test returns tibble with correct rows and columns. (@test_tk_tbl.R#58) 
      3. Error: mts to tbl test returns tibble with correct rows and columns. (@test_tk_tbl.R#83) 
      4. Error: tseries to tbl test returns tibble with correct rows and columns. (@test_tk_tbl.R#123) 
      5. Error: forecast::msts to tbl test returns tibble with correct rows and columns. (@test_tk_tbl.R#132) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# understandBPMN

Version: 1.1.0

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > 
    > ### ** Examples
    > 
    > ## Don't show: 
    > file_path <- system.file("extdata", "doc.txt", package="understandBPMN")
    > repetition_and_path_log <- create_path_and_repetition_log(file_path)
    Joining, by = "start"
    Joining, by = "start"
    > ## End(Don't show)
    > calculate_metrics(file_path, generate_new_path_log = TRUE)
    Joining, by = "start"
    Joining, by = "start"
    Joining, by = "start"
    Joining, by = "start"
    Joining, by = "start"
    Joining, by = "start"
    Joining, by = "start"
    Joining, by = "start"
    Error: Columns 1, 2, 3, 4, 5, … (and 1 more) must be named.
    Use .name_repair to specify repair.
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      6: as_tibble(x, ...) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/deprecated.R:48
      7: as_tibble.default(x, ...) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/as_tibble.R:76
      8: as_tibble(as.list(x), ...) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/as_tibble.R:228
      9: as_tibble.list(as.list(x), ...) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/as_tibble.R:76
      10: set_repaired_names(x, .name_repair) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/as_tibble.R:118
      11: repaired_names(names(x), .name_repair = .name_repair) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/repair-names.R:137
      12: check_unique(new_name) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/repair-names.R:168
      13: abort(error_column_must_be_named(bad_name)) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/repair-names.R:256
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 289 SKIPPED: 0 FAILED: 1
      1. Error: separability (@testMetrics.R#157) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

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

# zbank

Version: 0.1.0

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/test-all.R’ failed.
    Last 13 lines of output:
      11: as_tibble.matrix(tmp$data) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/as_tibble.R:76
      12: as_tibble(m, ...) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/as_tibble.R:187
      13: as_tibble.data.frame(m, ...) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/as_tibble.R:76
      14: as_tibble.list(unclass(x), ..., .rows = .rows, .name_repair = .name_repair) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/as_tibble.R:94
      15: set_repaired_names(x, .name_repair) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/as_tibble.R:118
      16: repaired_names(names(x), .name_repair = .name_repair) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/repair-names.R:137
      17: check_unique(new_name) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/repair-names.R:168
      18: abort(error_column_must_be_named(bad_name)) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/repair-names.R:256
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 44 SKIPPED: 22 FAILED: 1
      1. Error: high level works (@test-zb_stats.R#4) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# ggtree

Version: 1.12.7

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘ggtree-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: facet_plot
    > ### Title: facet_plot
    > ### Aliases: facet_plot
    > 
    > ### ** Examples
    > 
    > tr <- rtree(10)
    > dd = data.frame(id=tr$tip.label, value=abs(rnorm(10)))
    > p <- ggtree(tr)
    Error in as.data.frame.default(x) : 
      cannot coerce class ‘"phylo"’ to a data.frame
    Calls: ggtree ... as_tibble -> as.data.frame -> as.data.frame.default
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      15: stop(gettextf("cannot coerce class %s to a data.frame", sQuote(deparse(class(x))[1L])), 
             domain = NA)
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 0 SKIPPED: 0 FAILED: 7
      1. Error: collapse tree to polytomy (@test-conversion.R#7) 
      2. Error: geom_balance gives proper errors if called on non-binary node (@test-geom_balance.R#12) 
      3. Error: geom_cladelabel support parsing expression (@test-geom_cladelabel.R#5) 
      4. Error: groupOTU (@test-group.R#7) 
      5. Error: groupClade (@test-group.R#28) 
      6. Error: dummy layer to set x axis limits of Tree panel (@test-xlim_expand.R#7) 
      7. Error: dummy layer to set x axis limits of data panel (@test-xlim_expand.R#22) 
      
      Error: testthat unit tests failed
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
      16: as_tibble.list(unclass(x), ..., .rows = .rows, .name_repair = .name_repair) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/as_tibble.R:94
      17: set_repaired_names(x, .name_repair) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/as_tibble.R:118
      18: repaired_names(names(x), .name_repair = .name_repair) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/repair-names.R:137
      19: check_unique(new_name) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/repair-names.R:168
      20: abort(error_column_must_be_named(bad_name)) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/repair-names.R:256
      
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
    See ‘/tmp/RtmpD0aMxw/filea55410ffb38f/Sconify.Rcheck/00install.out’ for details.
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    ...
    finding k-nearest neighbors
    k-nearest neighbors complete
    running per-knn statistics
    10 percent complete
    20 percent complete
    Warning in wilcox.test.default(basal[[j]], stim[[j]]) :
      cannot compute exact p-value with ties
    30 percent complete
    40 percent complete
    Warning in wilcox.test.default(basal[[j]], stim[[j]]) :
      cannot compute exact p-value with ties
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

# treeio

Version: 1.4.3

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      11: as_tibble(x, ...) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/deprecated.R:42
      12: as_tibble.default(x, ...) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/as_tibble.R:76
      13: as_tibble(as.data.frame(x), ...) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/as_tibble.R:230
      14: as.data.frame(x) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/as_tibble.R:230
      15: as.data.frame.default(x)
      16: stop(gettextf("cannot coerce class %s to a data.frame", sQuote(deparse(class(x))[1L])), 
             domain = NA)
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 91 SKIPPED: 0 FAILED: 2
      1. Error: (unknown) (@test-conversion.R#4) 
      2. Error: (unknown) (@test-treedata-accessor.R#34) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    ...
    Attaching package: 'dplyr'
    
    The following objects are masked from 'package:stats':
    
        filter, lag
    
    The following objects are masked from 'package:base':
    
        intersect, setdiff, setequal, union
    
    
    Attaching package: 'tidytree'
    
    The following object is masked from 'package:stats':
    
        filter
    
    Quitting from lines 467-478 (Importer.Rmd) 
    Error: processing vignette 'Importer.Rmd' failed with diagnostics:
    cannot coerce class 'structure("treedata", package = "tidytree")' to a data.frame
    Execution halted
    ```

# ggsn

Version: 0.4.0

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    Loading required package: sp
    rgdal: version: 1.3-6, (SVN revision 773)
     Geospatial Data Abstraction Library extensions to R successfully loaded
     Loaded GDAL runtime: GDAL 2.1.3, released 2017/20/01
     Path to GDAL shared files: /usr/share/gdal/2.1
     GDAL binary built with GEOS: TRUE 
     Loaded PROJ.4 runtime: Rel. 4.9.2, 08 September 2015, [PJ_VERSION: 492]
     Path to PROJ.4 shared files: (autodetected)
     Linking to sp version: 1.3-1 
    > library(broom)
    > dsn <- system.file('extdata', package = 'ggsn')
    > map <- readOGR(dsn, 'sp')
    OGR data source with driver: ESRI Shapefile 
    Source: "/tmp/RtmpD0aMxw/filea53e5ca04511/ggsn.Rcheck/ggsn/extdata", layer: "sp"
    with 96 features
    It has 2 fields
    > map@data$id <- 0:(nrow(map@data) - 1)
    > map.df <- merge(tidy(map), map, by = 'id')
    Error: Columns 1, 2 must be named.
    Use .name_repair to specify repair.
    Execution halted
    ```

# clustree

Version: 0.2.2

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘clustree-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: clustree
    > ### Title: Plot a clustering tree
    > ### Aliases: clustree clustree.matrix clustree.data.frame
    > ###   clustree.SingleCellExperiment clustree.seurat
    > 
    > ### ** Examples
    > 
    > data(iris_clusts)
    > clustree(iris_clusts, prefix = "K")
    Error: Columns 1, 2 must be named.
    Use .name_repair to specify repair.
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 11 SKIPPED: 0 FAILED: 20
      1. Error: node_colour aesthetic works (@test-aesthetics.R#6) 
      2. Error: static node_colour works (@test-aesthetics.R#19) 
      3. Error: node_size aesthetic works (@test-aesthetics.R#30) 
      4. Error: static node_size works (@test-aesthetics.R#43) 
      5. Error: node_alpha aesthetic works (@test-aesthetics.R#52) 
      6. Error: static node_size works (@test-aesthetics.R#65) 
      7. Error: all static works (@test-aesthetics.R#76) 
      8. Error: layout argument works (@test-aesthetics.R#82) 
      9. Error: data.frame interface works (@test-clustree-overlay.R#23) 
      1. ...
      
      Error: testthat unit tests failed
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    Warning in engine$weave(file, quiet = quiet, encoding = enc) :
      Pandoc (>= 1.12.3) and/or pandoc-citeproc not available. Falling back to R Markdown v1.
    Quitting from lines 77-78 (clustree.Rmd) 
    Error: processing vignette 'clustree.Rmd' failed with diagnostics:
    Columns 1, 2 must be named.
    Use .name_repair to specify repair.
    Execution halted
    ```

# metagenomeFeatures

Version: 2.0.0

## Newly broken

*   checking re-building of vignette outputs ... WARNING
    ```
    ...
    ✔ readr   1.1.1           ✔ forcats 0.3.0      
    ── Conflicts ───────────────────────────────────── tidyverse_conflicts() ──
    ✖ ggplot2::Position() masks BiocGenerics::Position(), base::Position()
    ✖ dplyr::combine()    masks Biobase::combine(), BiocGenerics::combine()
    ✖ dplyr::filter()     masks stats::filter()
    ✖ dplyr::lag()        masks stats::lag()
    ggtree v1.12.7  For help: https://guangchuangyu.github.io/software/ggtree
    
    If you use ggtree in published research, please cite:
    Guangchuang Yu, David Smith, Huachen Zhu, Yi Guan, Tommy Tsan-Yuk Lam. ggtree: an R package for visualization and annotation of phylogenetic trees with their covariates and other associated data. Methods in Ecology and Evolution 2017, 8(1):28-36, doi:10.1111/2041-210X.12628
    
    Attaching package: 'ggtree'
    
    The following object is masked from 'package:tidyr':
    
        expand
    
    Quitting from lines 106-120 (database-explore.Rmd) 
    Error: processing vignette 'database-explore.Rmd' failed with diagnostics:
    cannot coerce class '"phylo"' to a data.frame
    Execution halted
    ```

# data.tree

Version: 0.7.8

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    +              color = function(node) {
    +                paste0("grey", 
    +                       100 - as.integer( 100 * nrow(node$data)/nrow(node$root$data))
    +                       )
    +              }
    +              )
    > Do(tree$leaves, 
    +    function(node) {
    +      SetNodeStyle(node, 
    +                   shape = "box", 
    +                   color = ifelse(node$splitname == "yes", "darkolivegreen4", "lightsalmon4"),
    +                   fillcolor = ifelse(node$splitname == "yes", "darkolivegreen1", "lightsalmon"),
    +                   style = "filled,rounded",
    +                   penwidth = 2
    +                   )
    +    }
    +    )
    > 
    > plot(tree)
    Error: Columns 1, 2, 3, 4, 5, … (and 3 more) must be named.
    Execution halted
    ```

# petrinetR

Version: 0.2.0

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    The error most likely occurred in:
    
    > ### Name: create_PN
    > ### Title: Create Petri Net
    > ### Aliases: create_PN
    > 
    > ### ** Examples
    > 
    > 
    > create_PN("place_1",
    + 			"transition_1",
    + 			data.frame(from = "place_1",to = "transition_1"),
    + 			marking = "place_1")
    Marking:  place_1 
    Enabled transition
                id enabled
    1 transition_1    TRUE
    Warning: Column `from`/`id` joining factor and character vector, coercing into character vector
    Warning: Column `to`/`id` joining factor and character vector, coercing into character vector
    Error: Columns 1, 2 must be named.
    Execution halted
    ```

# xgboost

Version: 0.71.2

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘xgboost-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: xgb.plot.multi.trees
    > ### Title: Project all trees on one tree and plot it
    > ### Aliases: xgb.plot.multi.trees
    > 
    > ### ** Examples
    > 
    > 
    > data(agaricus.train, package='xgboost')
    > 
    > bst <- xgboost(data = agaricus.train$data, label = agaricus.train$label, max_depth = 15,
    +                eta = 1, nthread = 2, nrounds = 30, objective = "binary:logistic",
    +                min_child_weight = 50, verbose = 0)
    > 
    > p <- xgb.plot.multi.trees(model = bst, features_keep = 3)
    Error: Columns 1, 2, 3, 4, 5, … (and 14 more) must be named.
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      11: as_tibble(x, ...) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/deprecated.R:42
      12: as_tibble.default(x, ...) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/as_tibble.R:76
      13: as_tibble(as.list(x), ...) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/as_tibble.R:228
      14: as_tibble.list(as.list(x), ...) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/as_tibble.R:76
      15: set_repaired_names(x, .name_repair) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/as_tibble.R:118
      16: repaired_names(names(x), .name_repair = .name_repair) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/repair-names.R:137
      17: check_unique(new_name) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/repair-names.R:168
      18: abort(error_column_must_be_named(bad_name)) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/repair-names.R:256
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 542 SKIPPED: 3 FAILED: 1
      1. Error: xgb.plot.multi.trees works with and without feature names (@test_helpers.R#295) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# BayesMallows

Version: 0.1.1

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘BayesMallows-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: generate_constraints
    > ### Title: Generate Constraint Set from Pairwise Comparisons
    > ### Aliases: generate_constraints
    > 
    > ### ** Examples
    > 
    > # Here is an example with the beach preference data.
    > # First, generate the transitive closure.
    > beach_tc <- generate_transitive_closure(beach_preferences)
    Error: Columns 1, 2 must be named.
    Use .name_repair to specify repair.
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      9: as_tibble.matrix(.generate_transitive_closure(cbind(.data$bottom_item, .data$top_item))) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/as_tibble.R:76
      10: as_tibble(m, ...) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/as_tibble.R:187
      11: as_tibble.data.frame(m, ...) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/as_tibble.R:76
      12: as_tibble.list(unclass(x), ..., .rows = .rows, .name_repair = .name_repair) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/as_tibble.R:94
      13: set_repaired_names(x, .name_repair) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/as_tibble.R:118
      14: repaired_names(names(x), .name_repair = .name_repair) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/repair-names.R:137
      15: check_unique(new_name) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/repair-names.R:168
      16: abort(error_column_must_be_named(bad_name)) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/repair-names.R:256
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 75 SKIPPED: 1 FAILED: 1
      1. Error: transitive closure generation works (@test_pairwise_functions.R#36) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    Warning in engine$weave(file, quiet = quiet, encoding = enc) :
      Pandoc (>= 1.12.3) and/or pandoc-citeproc not available. Falling back to R Markdown v1.
    
    Attaching package: 'dplyr'
    
    The following objects are masked from 'package:stats':
    
        filter, lag
    
    The following objects are masked from 'package:base':
    
        intersect, setdiff, setequal, union
    
    Quitting from lines 448-449 (BayesMallowsPackage.Rmd) 
    Error: processing vignette 'BayesMallowsPackage.Rmd' failed with diagnostics:
    Columns 1, 2 must be named.
    Use .name_repair to specify repair.
    Execution halted
    ```

# BMSC

Version: 0.1.1

## Newly broken

*   checking PDF version of manual without hyperrefs or index ... ERROR
    ```
    Re-running with no redirection of stdout/stderr.
    Hmm ... looks like a package
    You may want to clean up by 'rm -Rf /tmp/Rtmpj7Legb/Rd2pdf91416e35c35b'
    ```

*   checking PDF version of manual ... WARNING
    ```
    LaTeX errors when creating PDF version.
    This typically indicates Rd problems.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 65.6Mb
      sub-directories of 1Mb or more:
        libs  65.1Mb
    ```

## Installation

### Devel

```
* installing *source* package ‘BMSC’ ...
** package ‘BMSC’ successfully unpacked and MD5 sums checked
** libs
g++ -std=gnu++14 -I"/usr/share/R/include" -DNDEBUG -I"../inst/include" -I"`"/usr/lib/R/bin/Rscript" --vanilla -e "cat(system.file('include', 'src', package = 'StanHeaders'))"`" -DBOOST_RESULT_OF_USE_TR1 -DBOOST_NO_DECLTYPE -DBOOST_DISABLE_ASSERTS -DEIGEN_NO_DEBUG -DBOOST_MATH_OVERFLOW_ERROR_POLICY=errno_on_error -I"/tmp/RtmpD0aMxw/checkliba521157ec90c/StanHeaders/include" -I"/tmp/RtmpD0aMxw/checkliba521157ec90c/rstan/include" -I"/tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include" -I"/tmp/RtmpD0aMxw/checkliba521157ec90c/Rcpp/include" -I"/tmp/RtmpD0aMxw/checkliba521157ec90c/RcppEigen/include"    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g -c init.cpp -o init.o
"/usr/lib/R/bin/Rscript" -e "source(file.path('..', 'tools', 'make_cc.R')); make_cc(commandArgs(TRUE))" stan_files/linReg.stan
Compiling with: 
STANHEADERS_SRC = `"$(R_HOME)/bin$(R_ARCH_BIN)/Rscript" --vanilla -e "cat(system.file('include', 'src', package = 'StanHeaders'))"`
PKG_CPPFLAGS = -I"../inst/include" -I"$(STANHEADERS_SRC)" -DBOOST_RESULT_OF_USE_TR1 -DBOOST_NO_DECLTYPE -DBOOST_DISABLE_ASSERTS -DEIGEN_NO_DEBUG -DBOOST_MATH_OVERFLOW_ERROR_POLICY=errno_on_error

CXX_STD = CXX14
SOURCES = stan_files/linReg.stan stan_files/linRegHorseHoe.stan stan_files/linRegHorseHoeUnConstr.stan stan_files/linRegUnConstr.stan
OBJECTS = $(SOURCES:.stan=.o) init.o

all: $(SHLIB)
		@if test -e "/usr/bin/install_name_tool" && test -e "/usr/local/clang4/lib/libc++.1.dylib" && test -e "/usr/lib/libc++.1.dylib"; then /usr/bin/install_name_tool -change /usr/local/clang4/lib/libc++.1.dylib /usr/lib/libc++.1.dylib $(SHLIB); fi

clean:
		rm -rf stan_files/*.o
		rm -rf *.so *.o
		rm -rf stan_files/*.cc
		rm -rf stan_files/*.hpp

%.cc: %.stan
		"$(R_HOME)/bin$(R_ARCH_BIN)/Rscript" -e "source(file.path('..', 'tools', 'make_cc.R')); make_cc(commandArgs(TRUE))" $<

.phony: all clean
Wrote C++ file "stan_files/linReg.cc"
"/usr/lib/R/bin/Rscript" -e "source(file.path('..', 'tools', 'make_cc.R')); make_cc(commandArgs(TRUE))" stan_files/linRegHorseHoeUnConstr.stan
Compiling with: 
STANHEADERS_SRC = `"$(R_HOME)/bin$(R_ARCH_BIN)/Rscript" --vanilla -e "cat(system.file('include', 'src', package = 'StanHeaders'))"`
PKG_CPPFLAGS = -I"../inst/include" -I"$(STANHEADERS_SRC)" -DBOOST_RESULT_OF_USE_TR1 -DBOOST_NO_DECLTYPE -DBOOST_DISABLE_ASSERTS -DEIGEN_NO_DEBUG -DBOOST_MATH_OVERFLOW_ERROR_POLICY=errno_on_error

CXX_STD = CXX14
SOURCES = stan_files/linReg.stan stan_files/linRegHorseHoe.stan stan_files/linRegHorseHoeUnConstr.stan stan_files/linRegUnConstr.stan
OBJECTS = $(SOURCES:.stan=.o) init.o

all: $(SHLIB)
		@if test -e "/usr/bin/install_name_tool" && test -e "/usr/local/clang4/lib/libc++.1.dylib" && test -e "/usr/lib/libc++.1.dylib"; then /usr/bin/install_name_tool -change /usr/local/clang4/lib/libc++.1.dylib /usr/lib/libc++.1.dylib $(SHLIB); fi

clean:
		rm -rf stan_files/*.o
		rm -rf *.so *.o
		rm -rf stan_files/*.cc
		rm -rf stan_files/*.hpp

%.cc: %.stan
		"$(R_HOME)/bin$(R_ARCH_BIN)/Rscript" -e "source(file.path('..', 'tools', 'make_cc.R')); make_cc(commandArgs(TRUE))" $<

.phony: all clean
Wrote C++ file "stan_files/linRegHorseHoeUnConstr.cc"
"/usr/lib/R/bin/Rscript" -e "source(file.path('..', 'tools', 'make_cc.R')); make_cc(commandArgs(TRUE))" stan_files/linRegHorseHoe.stan
Compiling with: 
STANHEADERS_SRC = `"$(R_HOME)/bin$(R_ARCH_BIN)/Rscript" --vanilla -e "cat(system.file('include', 'src', package = 'StanHeaders'))"`
PKG_CPPFLAGS = -I"../inst/include" -I"$(STANHEADERS_SRC)" -DBOOST_RESULT_OF_USE_TR1 -DBOOST_NO_DECLTYPE -DBOOST_DISABLE_ASSERTS -DEIGEN_NO_DEBUG -DBOOST_MATH_OVERFLOW_ERROR_POLICY=errno_on_error

CXX_STD = CXX14
SOURCES = stan_files/linReg.stan stan_files/linRegHorseHoe.stan stan_files/linRegHorseHoeUnConstr.stan stan_files/linRegUnConstr.stan
OBJECTS = $(SOURCES:.stan=.o) init.o

all: $(SHLIB)
		@if test -e "/usr/bin/install_name_tool" && test -e "/usr/local/clang4/lib/libc++.1.dylib" && test -e "/usr/lib/libc++.1.dylib"; then /usr/bin/install_name_tool -change /usr/local/clang4/lib/libc++.1.dylib /usr/lib/libc++.1.dylib $(SHLIB); fi

clean:
		rm -rf stan_files/*.o
		rm -rf *.so *.o
		rm -rf stan_files/*.cc
		rm -rf stan_files/*.hpp

%.cc: %.stan
		"$(R_HOME)/bin$(R_ARCH_BIN)/Rscript" -e "source(file.path('..', 'tools', 'make_cc.R')); make_cc(commandArgs(TRUE))" $<

.phony: all clean
Wrote C++ file "stan_files/linRegHorseHoe.cc"
"/usr/lib/R/bin/Rscript" -e "source(file.path('..', 'tools', 'make_cc.R')); make_cc(commandArgs(TRUE))" stan_files/linRegUnConstr.stan
Compiling with: 
STANHEADERS_SRC = `"$(R_HOME)/bin$(R_ARCH_BIN)/Rscript" --vanilla -e "cat(system.file('include', 'src', package = 'StanHeaders'))"`
PKG_CPPFLAGS = -I"../inst/include" -I"$(STANHEADERS_SRC)" -DBOOST_RESULT_OF_USE_TR1 -DBOOST_NO_DECLTYPE -DBOOST_DISABLE_ASSERTS -DEIGEN_NO_DEBUG -DBOOST_MATH_OVERFLOW_ERROR_POLICY=errno_on_error

CXX_STD = CXX14
SOURCES = stan_files/linReg.stan stan_files/linRegHorseHoe.stan stan_files/linRegHorseHoeUnConstr.stan stan_files/linRegUnConstr.stan
OBJECTS = $(SOURCES:.stan=.o) init.o

all: $(SHLIB)
		@if test -e "/usr/bin/install_name_tool" && test -e "/usr/local/clang4/lib/libc++.1.dylib" && test -e "/usr/lib/libc++.1.dylib"; then /usr/bin/install_name_tool -change /usr/local/clang4/lib/libc++.1.dylib /usr/lib/libc++.1.dylib $(SHLIB); fi

clean:
		rm -rf stan_files/*.o
		rm -rf *.so *.o
		rm -rf stan_files/*.cc
		rm -rf stan_files/*.hpp

%.cc: %.stan
		"$(R_HOME)/bin$(R_ARCH_BIN)/Rscript" -e "source(file.path('..', 'tools', 'make_cc.R')); make_cc(commandArgs(TRUE))" $<

.phony: all clean
Wrote C++ file "stan_files/linRegUnConstr.cc"
g++ -std=gnu++14 -I"/usr/share/R/include" -DNDEBUG -I"../inst/include" -I"`"/usr/lib/R/bin/Rscript" --vanilla -e "cat(system.file('include', 'src', package = 'StanHeaders'))"`" -DBOOST_RESULT_OF_USE_TR1 -DBOOST_NO_DECLTYPE -DBOOST_DISABLE_ASSERTS -DEIGEN_NO_DEBUG -DBOOST_MATH_OVERFLOW_ERROR_POLICY=errno_on_error -I"/tmp/RtmpD0aMxw/checkliba521157ec90c/StanHeaders/include" -I"/tmp/RtmpD0aMxw/checkliba521157ec90c/rstan/include" -I"/tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include" -I"/tmp/RtmpD0aMxw/checkliba521157ec90c/Rcpp/include" -I"/tmp/RtmpD0aMxw/checkliba521157ec90c/RcppEigen/include"    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g -c stan_files/linReg.cc -o stan_files/linReg.o
In file included from /tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/smart_ptr/shared_ptr.hpp:28:0,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/shared_ptr.hpp:17,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/linReg.hpp:18,
                 from stan_files/linReg.cc:3:
/tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/smart_ptr/detail/shared_count.hpp:355:33: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     explicit shared_count( std::auto_ptr<Y> & r ): pi_( new sp_counted_impl_p<Y>( r.get() ) )
                                 ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/Rcpp/include/Rcpp.h:27,
                 from stan_files/linReg.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/linReg.hpp:18,
                 from stan_files/linReg.cc:3:
/tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/smart_ptr/shared_ptr.hpp:256:65: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
 template< class T, class R > struct sp_enable_if_auto_ptr< std::auto_ptr< T >, R >
                                                                 ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/Rcpp/include/Rcpp.h:27,
                 from stan_files/linReg.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/linReg.hpp:18,
                 from stan_files/linReg.cc:3:
/tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/smart_ptr/shared_ptr.hpp:471:31: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     explicit shared_ptr( std::auto_ptr<Y> & r ): px(r.get()), pn()
                               ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/Rcpp/include/Rcpp.h:27,
                 from stan_files/linReg.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/linReg.hpp:18,
                 from stan_files/linReg.cc:3:
/tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/smart_ptr/shared_ptr.hpp:484:22: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr( std::auto_ptr<Y> && r ): px(r.get()), pn()
                      ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/Rcpp/include/Rcpp.h:27,
                 from stan_files/linReg.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/linReg.hpp:18,
                 from stan_files/linReg.cc:3:
/tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/smart_ptr/shared_ptr.hpp:567:34: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr & operator=( std::auto_ptr<Y> & r )
                                  ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/Rcpp/include/Rcpp.h:27,
                 from stan_files/linReg.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/linReg.hpp:18,
                 from stan_files/linReg.cc:3:
/tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/smart_ptr/shared_ptr.hpp:576:34: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr & operator=( std::auto_ptr<Y> && r )
                                  ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/Rcpp/include/Rcpp.h:27,
                 from stan_files/linReg.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/linReg.hpp:18,
                 from stan_files/linReg.cc:3:
/tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/smart_ptr/shared_ptr.hpp: In member function ‘boost::shared_ptr<T>& boost::shared_ptr<T>::operator=(std::auto_ptr<_Up>&&)’:
/tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/smart_ptr/shared_ptr.hpp:578:38: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
         this_type( static_cast< std::auto_ptr<Y> && >( r ) ).swap( *this );
                                      ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/Rcpp/include/Rcpp.h:27,
                 from stan_files/linReg.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/fusion/functional/invocation/detail/that_ptr.hpp:13:0,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/fusion/functional/invocation/invoke.hpp:52,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/fusion/functional/adapter/fused.hpp:17,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/fusion/functional/generation/make_fused.hpp:13,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/fusion/include/make_fused.hpp:11,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/numeric/odeint/util/resize.hpp:28,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/numeric/odeint/util/state_wrapper.hpp:26,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/numeric/odeint/util/ublas_wrapper.hpp:33,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/numeric/odeint.hpp:25,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/StanHeaders/include/stan/math/prim/arr/functor/integrate_ode_rk45.hpp:17,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/StanHeaders/include/stan/math/prim/arr.hpp:44,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/StanHeaders/include/stan/math/prim/mat.hpp:325,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/StanHeaders/include/stan/math/rev/mat.hpp:12,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/StanHeaders/include/src/stan/model/log_prob_grad.hpp:4,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/StanHeaders/include/src/stan/model/test_gradients.hpp:7,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/StanHeaders/include/src/stan/services/diagnose/diagnose.hpp:10,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/rstan/include/rstan/stan_fit.hpp:34,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/linReg.hpp:18,
                 from stan_files/linReg.cc:3:
/tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/get_pointer.hpp: At global scope:
/tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/get_pointer.hpp:48:40: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
 template<class T> T * get_pointer(std::auto_ptr<T> const& p)
                                        ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/Rcpp/include/Rcpp.h:27,
                 from stan_files/linReg.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
g++ -std=gnu++14 -I"/usr/share/R/include" -DNDEBUG -I"../inst/include" -I"`"/usr/lib/R/bin/Rscript" --vanilla -e "cat(system.file('include', 'src', package = 'StanHeaders'))"`" -DBOOST_RESULT_OF_USE_TR1 -DBOOST_NO_DECLTYPE -DBOOST_DISABLE_ASSERTS -DEIGEN_NO_DEBUG -DBOOST_MATH_OVERFLOW_ERROR_POLICY=errno_on_error -I"/tmp/RtmpD0aMxw/checkliba521157ec90c/StanHeaders/include" -I"/tmp/RtmpD0aMxw/checkliba521157ec90c/rstan/include" -I"/tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include" -I"/tmp/RtmpD0aMxw/checkliba521157ec90c/Rcpp/include" -I"/tmp/RtmpD0aMxw/checkliba521157ec90c/RcppEigen/include"    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g -c stan_files/linRegUnConstr.cc -o stan_files/linRegUnConstr.o
In file included from /tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/smart_ptr/shared_ptr.hpp:28:0,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/shared_ptr.hpp:17,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/linRegUnConstr.hpp:18,
                 from stan_files/linRegUnConstr.cc:3:
/tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/smart_ptr/detail/shared_count.hpp:355:33: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     explicit shared_count( std::auto_ptr<Y> & r ): pi_( new sp_counted_impl_p<Y>( r.get() ) )
                                 ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/Rcpp/include/Rcpp.h:27,
                 from stan_files/linRegUnConstr.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/linRegUnConstr.hpp:18,
                 from stan_files/linRegUnConstr.cc:3:
/tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/smart_ptr/shared_ptr.hpp:256:65: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
 template< class T, class R > struct sp_enable_if_auto_ptr< std::auto_ptr< T >, R >
                                                                 ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/Rcpp/include/Rcpp.h:27,
                 from stan_files/linRegUnConstr.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/linRegUnConstr.hpp:18,
                 from stan_files/linRegUnConstr.cc:3:
/tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/smart_ptr/shared_ptr.hpp:471:31: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     explicit shared_ptr( std::auto_ptr<Y> & r ): px(r.get()), pn()
                               ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/Rcpp/include/Rcpp.h:27,
                 from stan_files/linRegUnConstr.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/linRegUnConstr.hpp:18,
                 from stan_files/linRegUnConstr.cc:3:
/tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/smart_ptr/shared_ptr.hpp:484:22: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr( std::auto_ptr<Y> && r ): px(r.get()), pn()
                      ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/Rcpp/include/Rcpp.h:27,
                 from stan_files/linRegUnConstr.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/linRegUnConstr.hpp:18,
                 from stan_files/linRegUnConstr.cc:3:
/tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/smart_ptr/shared_ptr.hpp:567:34: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr & operator=( std::auto_ptr<Y> & r )
                                  ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/Rcpp/include/Rcpp.h:27,
                 from stan_files/linRegUnConstr.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/linRegUnConstr.hpp:18,
                 from stan_files/linRegUnConstr.cc:3:
/tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/smart_ptr/shared_ptr.hpp:576:34: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr & operator=( std::auto_ptr<Y> && r )
                                  ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/Rcpp/include/Rcpp.h:27,
                 from stan_files/linRegUnConstr.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/linRegUnConstr.hpp:18,
                 from stan_files/linRegUnConstr.cc:3:
/tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/smart_ptr/shared_ptr.hpp: In member function ‘boost::shared_ptr<T>& boost::shared_ptr<T>::operator=(std::auto_ptr<_Up>&&)’:
/tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/smart_ptr/shared_ptr.hpp:578:38: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
         this_type( static_cast< std::auto_ptr<Y> && >( r ) ).swap( *this );
                                      ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/Rcpp/include/Rcpp.h:27,
                 from stan_files/linRegUnConstr.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/fusion/functional/invocation/detail/that_ptr.hpp:13:0,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/fusion/functional/invocation/invoke.hpp:52,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/fusion/functional/adapter/fused.hpp:17,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/fusion/functional/generation/make_fused.hpp:13,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/fusion/include/make_fused.hpp:11,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/numeric/odeint/util/resize.hpp:28,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/numeric/odeint/util/state_wrapper.hpp:26,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/numeric/odeint/util/ublas_wrapper.hpp:33,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/numeric/odeint.hpp:25,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/StanHeaders/include/stan/math/prim/arr/functor/integrate_ode_rk45.hpp:17,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/StanHeaders/include/stan/math/prim/arr.hpp:44,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/StanHeaders/include/stan/math/prim/mat.hpp:325,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/StanHeaders/include/stan/math/rev/mat.hpp:12,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/StanHeaders/include/src/stan/model/log_prob_grad.hpp:4,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/StanHeaders/include/src/stan/model/test_gradients.hpp:7,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/StanHeaders/include/src/stan/services/diagnose/diagnose.hpp:10,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/rstan/include/rstan/stan_fit.hpp:34,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/linRegUnConstr.hpp:18,
                 from stan_files/linRegUnConstr.cc:3:
/tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/get_pointer.hpp: At global scope:
/tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/get_pointer.hpp:48:40: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
 template<class T> T * get_pointer(std::auto_ptr<T> const& p)
                                        ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/Rcpp/include/Rcpp.h:27,
                 from stan_files/linRegUnConstr.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
g++ -std=gnu++14 -I"/usr/share/R/include" -DNDEBUG -I"../inst/include" -I"`"/usr/lib/R/bin/Rscript" --vanilla -e "cat(system.file('include', 'src', package = 'StanHeaders'))"`" -DBOOST_RESULT_OF_USE_TR1 -DBOOST_NO_DECLTYPE -DBOOST_DISABLE_ASSERTS -DEIGEN_NO_DEBUG -DBOOST_MATH_OVERFLOW_ERROR_POLICY=errno_on_error -I"/tmp/RtmpD0aMxw/checkliba521157ec90c/StanHeaders/include" -I"/tmp/RtmpD0aMxw/checkliba521157ec90c/rstan/include" -I"/tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include" -I"/tmp/RtmpD0aMxw/checkliba521157ec90c/Rcpp/include" -I"/tmp/RtmpD0aMxw/checkliba521157ec90c/RcppEigen/include"    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g -c stan_files/linRegHorseHoeUnConstr.cc -o stan_files/linRegHorseHoeUnConstr.o
In file included from /tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/smart_ptr/shared_ptr.hpp:28:0,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/shared_ptr.hpp:17,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/linRegHorseHoeUnConstr.hpp:18,
                 from stan_files/linRegHorseHoeUnConstr.cc:3:
/tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/smart_ptr/detail/shared_count.hpp:355:33: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     explicit shared_count( std::auto_ptr<Y> & r ): pi_( new sp_counted_impl_p<Y>( r.get() ) )
                                 ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/Rcpp/include/Rcpp.h:27,
                 from stan_files/linRegHorseHoeUnConstr.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/linRegHorseHoeUnConstr.hpp:18,
                 from stan_files/linRegHorseHoeUnConstr.cc:3:
/tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/smart_ptr/shared_ptr.hpp:256:65: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
 template< class T, class R > struct sp_enable_if_auto_ptr< std::auto_ptr< T >, R >
                                                                 ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/Rcpp/include/Rcpp.h:27,
                 from stan_files/linRegHorseHoeUnConstr.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/linRegHorseHoeUnConstr.hpp:18,
                 from stan_files/linRegHorseHoeUnConstr.cc:3:
/tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/smart_ptr/shared_ptr.hpp:471:31: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     explicit shared_ptr( std::auto_ptr<Y> & r ): px(r.get()), pn()
                               ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/Rcpp/include/Rcpp.h:27,
                 from stan_files/linRegHorseHoeUnConstr.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/linRegHorseHoeUnConstr.hpp:18,
                 from stan_files/linRegHorseHoeUnConstr.cc:3:
/tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/smart_ptr/shared_ptr.hpp:484:22: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr( std::auto_ptr<Y> && r ): px(r.get()), pn()
                      ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/Rcpp/include/Rcpp.h:27,
                 from stan_files/linRegHorseHoeUnConstr.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/linRegHorseHoeUnConstr.hpp:18,
                 from stan_files/linRegHorseHoeUnConstr.cc:3:
/tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/smart_ptr/shared_ptr.hpp:567:34: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr & operator=( std::auto_ptr<Y> & r )
                                  ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/Rcpp/include/Rcpp.h:27,
                 from stan_files/linRegHorseHoeUnConstr.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/linRegHorseHoeUnConstr.hpp:18,
                 from stan_files/linRegHorseHoeUnConstr.cc:3:
/tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/smart_ptr/shared_ptr.hpp:576:34: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr & operator=( std::auto_ptr<Y> && r )
                                  ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/Rcpp/include/Rcpp.h:27,
                 from stan_files/linRegHorseHoeUnConstr.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/linRegHorseHoeUnConstr.hpp:18,
                 from stan_files/linRegHorseHoeUnConstr.cc:3:
/tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/smart_ptr/shared_ptr.hpp: In member function ‘boost::shared_ptr<T>& boost::shared_ptr<T>::operator=(std::auto_ptr<_Up>&&)’:
/tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/smart_ptr/shared_ptr.hpp:578:38: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
         this_type( static_cast< std::auto_ptr<Y> && >( r ) ).swap( *this );
                                      ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/Rcpp/include/Rcpp.h:27,
                 from stan_files/linRegHorseHoeUnConstr.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/fusion/functional/invocation/detail/that_ptr.hpp:13:0,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/fusion/functional/invocation/invoke.hpp:52,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/fusion/functional/adapter/fused.hpp:17,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/fusion/functional/generation/make_fused.hpp:13,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/fusion/include/make_fused.hpp:11,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/numeric/odeint/util/resize.hpp:28,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/numeric/odeint/util/state_wrapper.hpp:26,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/numeric/odeint/util/ublas_wrapper.hpp:33,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/numeric/odeint.hpp:25,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/StanHeaders/include/stan/math/prim/arr/functor/integrate_ode_rk45.hpp:17,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/StanHeaders/include/stan/math/prim/arr.hpp:44,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/StanHeaders/include/stan/math/prim/mat.hpp:325,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/StanHeaders/include/stan/math/rev/mat.hpp:12,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/StanHeaders/include/src/stan/model/log_prob_grad.hpp:4,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/StanHeaders/include/src/stan/model/test_gradients.hpp:7,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/StanHeaders/include/src/stan/services/diagnose/diagnose.hpp:10,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/rstan/include/rstan/stan_fit.hpp:34,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/linRegHorseHoeUnConstr.hpp:18,
                 from stan_files/linRegHorseHoeUnConstr.cc:3:
/tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/get_pointer.hpp: At global scope:
/tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/get_pointer.hpp:48:40: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
 template<class T> T * get_pointer(std::auto_ptr<T> const& p)
                                        ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/Rcpp/include/Rcpp.h:27,
                 from stan_files/linRegHorseHoeUnConstr.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
g++ -std=gnu++14 -I"/usr/share/R/include" -DNDEBUG -I"../inst/include" -I"`"/usr/lib/R/bin/Rscript" --vanilla -e "cat(system.file('include', 'src', package = 'StanHeaders'))"`" -DBOOST_RESULT_OF_USE_TR1 -DBOOST_NO_DECLTYPE -DBOOST_DISABLE_ASSERTS -DEIGEN_NO_DEBUG -DBOOST_MATH_OVERFLOW_ERROR_POLICY=errno_on_error -I"/tmp/RtmpD0aMxw/checkliba521157ec90c/StanHeaders/include" -I"/tmp/RtmpD0aMxw/checkliba521157ec90c/rstan/include" -I"/tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include" -I"/tmp/RtmpD0aMxw/checkliba521157ec90c/Rcpp/include" -I"/tmp/RtmpD0aMxw/checkliba521157ec90c/RcppEigen/include"    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g -c stan_files/linRegHorseHoe.cc -o stan_files/linRegHorseHoe.o
In file included from /tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/smart_ptr/shared_ptr.hpp:28:0,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/shared_ptr.hpp:17,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/linRegHorseHoe.hpp:18,
                 from stan_files/linRegHorseHoe.cc:3:
/tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/smart_ptr/detail/shared_count.hpp:355:33: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     explicit shared_count( std::auto_ptr<Y> & r ): pi_( new sp_counted_impl_p<Y>( r.get() ) )
                                 ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/Rcpp/include/Rcpp.h:27,
                 from stan_files/linRegHorseHoe.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/linRegHorseHoe.hpp:18,
                 from stan_files/linRegHorseHoe.cc:3:
/tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/smart_ptr/shared_ptr.hpp:256:65: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
 template< class T, class R > struct sp_enable_if_auto_ptr< std::auto_ptr< T >, R >
                                                                 ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/Rcpp/include/Rcpp.h:27,
                 from stan_files/linRegHorseHoe.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/linRegHorseHoe.hpp:18,
                 from stan_files/linRegHorseHoe.cc:3:
/tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/smart_ptr/shared_ptr.hpp:471:31: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     explicit shared_ptr( std::auto_ptr<Y> & r ): px(r.get()), pn()
                               ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/Rcpp/include/Rcpp.h:27,
                 from stan_files/linRegHorseHoe.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/linRegHorseHoe.hpp:18,
                 from stan_files/linRegHorseHoe.cc:3:
/tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/smart_ptr/shared_ptr.hpp:484:22: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr( std::auto_ptr<Y> && r ): px(r.get()), pn()
                      ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/Rcpp/include/Rcpp.h:27,
                 from stan_files/linRegHorseHoe.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/linRegHorseHoe.hpp:18,
                 from stan_files/linRegHorseHoe.cc:3:
/tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/smart_ptr/shared_ptr.hpp:567:34: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr & operator=( std::auto_ptr<Y> & r )
                                  ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/Rcpp/include/Rcpp.h:27,
                 from stan_files/linRegHorseHoe.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/linRegHorseHoe.hpp:18,
                 from stan_files/linRegHorseHoe.cc:3:
/tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/smart_ptr/shared_ptr.hpp:576:34: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr & operator=( std::auto_ptr<Y> && r )
                                  ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/Rcpp/include/Rcpp.h:27,
                 from stan_files/linRegHorseHoe.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/linRegHorseHoe.hpp:18,
                 from stan_files/linRegHorseHoe.cc:3:
/tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/smart_ptr/shared_ptr.hpp: In member function ‘boost::shared_ptr<T>& boost::shared_ptr<T>::operator=(std::auto_ptr<_Up>&&)’:
/tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/smart_ptr/shared_ptr.hpp:578:38: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
         this_type( static_cast< std::auto_ptr<Y> && >( r ) ).swap( *this );
                                      ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/Rcpp/include/Rcpp.h:27,
                 from stan_files/linRegHorseHoe.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/fusion/functional/invocation/detail/that_ptr.hpp:13:0,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/fusion/functional/invocation/invoke.hpp:52,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/fusion/functional/adapter/fused.hpp:17,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/fusion/functional/generation/make_fused.hpp:13,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/fusion/include/make_fused.hpp:11,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/numeric/odeint/util/resize.hpp:28,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/numeric/odeint/util/state_wrapper.hpp:26,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/numeric/odeint/util/ublas_wrapper.hpp:33,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/numeric/odeint.hpp:25,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/StanHeaders/include/stan/math/prim/arr/functor/integrate_ode_rk45.hpp:17,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/StanHeaders/include/stan/math/prim/arr.hpp:44,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/StanHeaders/include/stan/math/prim/mat.hpp:325,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/StanHeaders/include/stan/math/rev/mat.hpp:12,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/StanHeaders/include/src/stan/model/log_prob_grad.hpp:4,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/StanHeaders/include/src/stan/model/test_gradients.hpp:7,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/StanHeaders/include/src/stan/services/diagnose/diagnose.hpp:10,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/rstan/include/rstan/stan_fit.hpp:34,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/linRegHorseHoe.hpp:18,
                 from stan_files/linRegHorseHoe.cc:3:
/tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/get_pointer.hpp: At global scope:
/tmp/RtmpD0aMxw/checkliba521157ec90c/BH/include/boost/get_pointer.hpp:48:40: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
 template<class T> T * get_pointer(std::auto_ptr<T> const& p)
                                        ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpD0aMxw/checkliba521157ec90c/Rcpp/include/Rcpp.h:27,
                 from stan_files/linRegHorseHoe.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
g++ -std=gnu++14 -shared -L/usr/lib/R/lib -Wl,-Bsymbolic-functions -Wl,-z,relro -o BMSC.so stan_files/linReg.o stan_files/linRegHorseHoe.o stan_files/linRegHorseHoeUnConstr.o stan_files/linRegUnConstr.o init.o -L/usr/lib/R/lib -lR
rm stan_files/linRegUnConstr.cc stan_files/linRegHorseHoe.cc stan_files/linRegHorseHoeUnConstr.cc stan_files/linReg.cc
installing to /tmp/RtmpD0aMxw/filea521598fadbc/BMSC.Rcheck/BMSC/libs
** R
** inst
** byte-compile and prepare package for lazy loading
** help
*** installing help indices
** building package indices
** testing if installed package can be loaded
* DONE (BMSC)

```
### CRAN

```
* installing *source* package ‘BMSC’ ...
** package ‘BMSC’ successfully unpacked and MD5 sums checked
** libs
g++ -std=gnu++14 -I"/usr/share/R/include" -DNDEBUG -I"../inst/include" -I"`"/usr/lib/R/bin/Rscript" --vanilla -e "cat(system.file('include', 'src', package = 'StanHeaders'))"`" -DBOOST_RESULT_OF_USE_TR1 -DBOOST_NO_DECLTYPE -DBOOST_DISABLE_ASSERTS -DEIGEN_NO_DEBUG -DBOOST_MATH_OVERFLOW_ERROR_POLICY=errno_on_error -I"/tmp/RtmpcwuZam/checklibfdea629b8f68/StanHeaders/include" -I"/tmp/RtmpcwuZam/checklibfdea629b8f68/rstan/include" -I"/tmp/RtmpcwuZam/checklibfdea629b8f68/BH/include" -I"/tmp/RtmpcwuZam/checklibfdea629b8f68/Rcpp/include" -I"/tmp/RtmpcwuZam/checklibfdea629b8f68/RcppEigen/include"    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g -c init.cpp -o init.o
"/usr/lib/R/bin/Rscript" -e "source(file.path('..', 'tools', 'make_cc.R')); make_cc(commandArgs(TRUE))" stan_files/linReg.stan
Compiling with: 
STANHEADERS_SRC = `"$(R_HOME)/bin$(R_ARCH_BIN)/Rscript" --vanilla -e "cat(system.file('include', 'src', package = 'StanHeaders'))"`
PKG_CPPFLAGS = -I"../inst/include" -I"$(STANHEADERS_SRC)" -DBOOST_RESULT_OF_USE_TR1 -DBOOST_NO_DECLTYPE -DBOOST_DISABLE_ASSERTS -DEIGEN_NO_DEBUG -DBOOST_MATH_OVERFLOW_ERROR_POLICY=errno_on_error

CXX_STD = CXX14
SOURCES = stan_files/linReg.stan stan_files/linRegHorseHoe.stan stan_files/linRegHorseHoeUnConstr.stan stan_files/linRegUnConstr.stan
OBJECTS = $(SOURCES:.stan=.o) init.o

all: $(SHLIB)
		@if test -e "/usr/bin/install_name_tool" && test -e "/usr/local/clang4/lib/libc++.1.dylib" && test -e "/usr/lib/libc++.1.dylib"; then /usr/bin/install_name_tool -change /usr/local/clang4/lib/libc++.1.dylib /usr/lib/libc++.1.dylib $(SHLIB); fi

clean:
		rm -rf stan_files/*.o
		rm -rf *.so *.o
		rm -rf stan_files/*.cc
		rm -rf stan_files/*.hpp

%.cc: %.stan
		"$(R_HOME)/bin$(R_ARCH_BIN)/Rscript" -e "source(file.path('..', 'tools', 'make_cc.R')); make_cc(commandArgs(TRUE))" $<

.phony: all clean
Wrote C++ file "stan_files/linReg.cc"
"/usr/lib/R/bin/Rscript" -e "source(file.path('..', 'tools', 'make_cc.R')); make_cc(commandArgs(TRUE))" stan_files/linRegHorseHoe.stan
Compiling with: 
STANHEADERS_SRC = `"$(R_HOME)/bin$(R_ARCH_BIN)/Rscript" --vanilla -e "cat(system.file('include', 'src', package = 'StanHeaders'))"`
PKG_CPPFLAGS = -I"../inst/include" -I"$(STANHEADERS_SRC)" -DBOOST_RESULT_OF_USE_TR1 -DBOOST_NO_DECLTYPE -DBOOST_DISABLE_ASSERTS -DEIGEN_NO_DEBUG -DBOOST_MATH_OVERFLOW_ERROR_POLICY=errno_on_error

CXX_STD = CXX14
SOURCES = stan_files/linReg.stan stan_files/linRegHorseHoe.stan stan_files/linRegHorseHoeUnConstr.stan stan_files/linRegUnConstr.stan
OBJECTS = $(SOURCES:.stan=.o) init.o

all: $(SHLIB)
		@if test -e "/usr/bin/install_name_tool" && test -e "/usr/local/clang4/lib/libc++.1.dylib" && test -e "/usr/lib/libc++.1.dylib"; then /usr/bin/install_name_tool -change /usr/local/clang4/lib/libc++.1.dylib /usr/lib/libc++.1.dylib $(SHLIB); fi

clean:
		rm -rf stan_files/*.o
		rm -rf *.so *.o
		rm -rf stan_files/*.cc
		rm -rf stan_files/*.hpp

%.cc: %.stan
		"$(R_HOME)/bin$(R_ARCH_BIN)/Rscript" -e "source(file.path('..', 'tools', 'make_cc.R')); make_cc(commandArgs(TRUE))" $<

.phony: all clean
Wrote C++ file "stan_files/linRegHorseHoe.cc"
"/usr/lib/R/bin/Rscript" -e "source(file.path('..', 'tools', 'make_cc.R')); make_cc(commandArgs(TRUE))" stan_files/linRegHorseHoeUnConstr.stan
Compiling with: 
STANHEADERS_SRC = `"$(R_HOME)/bin$(R_ARCH_BIN)/Rscript" --vanilla -e "cat(system.file('include', 'src', package = 'StanHeaders'))"`
PKG_CPPFLAGS = -I"../inst/include" -I"$(STANHEADERS_SRC)" -DBOOST_RESULT_OF_USE_TR1 -DBOOST_NO_DECLTYPE -DBOOST_DISABLE_ASSERTS -DEIGEN_NO_DEBUG -DBOOST_MATH_OVERFLOW_ERROR_POLICY=errno_on_error

CXX_STD = CXX14
SOURCES = stan_files/linReg.stan stan_files/linRegHorseHoe.stan stan_files/linRegHorseHoeUnConstr.stan stan_files/linRegUnConstr.stan
OBJECTS = $(SOURCES:.stan=.o) init.o

all: $(SHLIB)
		@if test -e "/usr/bin/install_name_tool" && test -e "/usr/local/clang4/lib/libc++.1.dylib" && test -e "/usr/lib/libc++.1.dylib"; then /usr/bin/install_name_tool -change /usr/local/clang4/lib/libc++.1.dylib /usr/lib/libc++.1.dylib $(SHLIB); fi

clean:
		rm -rf stan_files/*.o
		rm -rf *.so *.o
		rm -rf stan_files/*.cc
		rm -rf stan_files/*.hpp

%.cc: %.stan
		"$(R_HOME)/bin$(R_ARCH_BIN)/Rscript" -e "source(file.path('..', 'tools', 'make_cc.R')); make_cc(commandArgs(TRUE))" $<

.phony: all clean
Wrote C++ file "stan_files/linRegHorseHoeUnConstr.cc"
"/usr/lib/R/bin/Rscript" -e "source(file.path('..', 'tools', 'make_cc.R')); make_cc(commandArgs(TRUE))" stan_files/linRegUnConstr.stan
Compiling with: 
STANHEADERS_SRC = `"$(R_HOME)/bin$(R_ARCH_BIN)/Rscript" --vanilla -e "cat(system.file('include', 'src', package = 'StanHeaders'))"`
PKG_CPPFLAGS = -I"../inst/include" -I"$(STANHEADERS_SRC)" -DBOOST_RESULT_OF_USE_TR1 -DBOOST_NO_DECLTYPE -DBOOST_DISABLE_ASSERTS -DEIGEN_NO_DEBUG -DBOOST_MATH_OVERFLOW_ERROR_POLICY=errno_on_error

CXX_STD = CXX14
SOURCES = stan_files/linReg.stan stan_files/linRegHorseHoe.stan stan_files/linRegHorseHoeUnConstr.stan stan_files/linRegUnConstr.stan
OBJECTS = $(SOURCES:.stan=.o) init.o

all: $(SHLIB)
		@if test -e "/usr/bin/install_name_tool" && test -e "/usr/local/clang4/lib/libc++.1.dylib" && test -e "/usr/lib/libc++.1.dylib"; then /usr/bin/install_name_tool -change /usr/local/clang4/lib/libc++.1.dylib /usr/lib/libc++.1.dylib $(SHLIB); fi

clean:
		rm -rf stan_files/*.o
		rm -rf *.so *.o
		rm -rf stan_files/*.cc
		rm -rf stan_files/*.hpp

%.cc: %.stan
		"$(R_HOME)/bin$(R_ARCH_BIN)/Rscript" -e "source(file.path('..', 'tools', 'make_cc.R')); make_cc(commandArgs(TRUE))" $<

.phony: all clean
Wrote C++ file "stan_files/linRegUnConstr.cc"
Error in readRDS("/tmp/RtmpcwuZam/filefdea8e329fd") : 
  error reading from connection
Calls: .Last -> readRDS
3: traceback(1)
2: readRDS("/tmp/RtmpcwuZam/filefdea8e329fd")
1: .Last()
Makevars:18: recipe for target 'stan_files/linRegUnConstr.cc' failed
make: *** [stan_files/linRegUnConstr.cc] Error 1
make: *** Waiting for unfinished jobs....
g++ -std=gnu++14 -I"/usr/share/R/include" -DNDEBUG -I"../inst/include" -I"`"/usr/lib/R/bin/Rscript" --vanilla -e "cat(system.file('include', 'src', package = 'StanHeaders'))"`" -DBOOST_RESULT_OF_USE_TR1 -DBOOST_NO_DECLTYPE -DBOOST_DISABLE_ASSERTS -DEIGEN_NO_DEBUG -DBOOST_MATH_OVERFLOW_ERROR_POLICY=errno_on_error -I"/tmp/RtmpcwuZam/checklibfdea629b8f68/StanHeaders/include" -I"/tmp/RtmpcwuZam/checklibfdea629b8f68/rstan/include" -I"/tmp/RtmpcwuZam/checklibfdea629b8f68/BH/include" -I"/tmp/RtmpcwuZam/checklibfdea629b8f68/Rcpp/include" -I"/tmp/RtmpcwuZam/checklibfdea629b8f68/RcppEigen/include"    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g -c stan_files/linReg.cc -o stan_files/linReg.o
In file included from /tmp/RtmpcwuZam/checklibfdea629b8f68/BH/include/boost/smart_ptr/shared_ptr.hpp:28:0,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/BH/include/boost/shared_ptr.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/linReg.hpp:18,
                 from stan_files/linReg.cc:3:
/tmp/RtmpcwuZam/checklibfdea629b8f68/BH/include/boost/smart_ptr/detail/shared_count.hpp:355:33: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     explicit shared_count( std::auto_ptr<Y> & r ): pi_( new sp_counted_impl_p<Y>( r.get() ) )
                                 ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/Rcpp/include/Rcpp.h:27,
                 from stan_files/linReg.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdea629b8f68/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/linReg.hpp:18,
                 from stan_files/linReg.cc:3:
/tmp/RtmpcwuZam/checklibfdea629b8f68/BH/include/boost/smart_ptr/shared_ptr.hpp:256:65: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
 template< class T, class R > struct sp_enable_if_auto_ptr< std::auto_ptr< T >, R >
                                                                 ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/Rcpp/include/Rcpp.h:27,
                 from stan_files/linReg.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdea629b8f68/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/linReg.hpp:18,
                 from stan_files/linReg.cc:3:
/tmp/RtmpcwuZam/checklibfdea629b8f68/BH/include/boost/smart_ptr/shared_ptr.hpp:471:31: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     explicit shared_ptr( std::auto_ptr<Y> & r ): px(r.get()), pn()
                               ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/Rcpp/include/Rcpp.h:27,
                 from stan_files/linReg.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdea629b8f68/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/linReg.hpp:18,
                 from stan_files/linReg.cc:3:
/tmp/RtmpcwuZam/checklibfdea629b8f68/BH/include/boost/smart_ptr/shared_ptr.hpp:484:22: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr( std::auto_ptr<Y> && r ): px(r.get()), pn()
                      ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/Rcpp/include/Rcpp.h:27,
                 from stan_files/linReg.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdea629b8f68/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/linReg.hpp:18,
                 from stan_files/linReg.cc:3:
/tmp/RtmpcwuZam/checklibfdea629b8f68/BH/include/boost/smart_ptr/shared_ptr.hpp:567:34: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr & operator=( std::auto_ptr<Y> & r )
                                  ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/Rcpp/include/Rcpp.h:27,
                 from stan_files/linReg.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdea629b8f68/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/linReg.hpp:18,
                 from stan_files/linReg.cc:3:
/tmp/RtmpcwuZam/checklibfdea629b8f68/BH/include/boost/smart_ptr/shared_ptr.hpp:576:34: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr & operator=( std::auto_ptr<Y> && r )
                                  ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/Rcpp/include/Rcpp.h:27,
                 from stan_files/linReg.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdea629b8f68/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/linReg.hpp:18,
                 from stan_files/linReg.cc:3:
/tmp/RtmpcwuZam/checklibfdea629b8f68/BH/include/boost/smart_ptr/shared_ptr.hpp: In member function ‘boost::shared_ptr<T>& boost::shared_ptr<T>::operator=(std::auto_ptr<_Up>&&)’:
/tmp/RtmpcwuZam/checklibfdea629b8f68/BH/include/boost/smart_ptr/shared_ptr.hpp:578:38: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
         this_type( static_cast< std::auto_ptr<Y> && >( r ) ).swap( *this );
                                      ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/Rcpp/include/Rcpp.h:27,
                 from stan_files/linReg.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdea629b8f68/BH/include/boost/fusion/functional/invocation/detail/that_ptr.hpp:13:0,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/BH/include/boost/fusion/functional/invocation/invoke.hpp:52,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/BH/include/boost/fusion/functional/adapter/fused.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/BH/include/boost/fusion/functional/generation/make_fused.hpp:13,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/BH/include/boost/fusion/include/make_fused.hpp:11,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/BH/include/boost/numeric/odeint/util/resize.hpp:28,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/BH/include/boost/numeric/odeint/util/state_wrapper.hpp:26,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/BH/include/boost/numeric/odeint/util/ublas_wrapper.hpp:33,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/BH/include/boost/numeric/odeint.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/StanHeaders/include/stan/math/prim/arr/functor/integrate_ode_rk45.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/StanHeaders/include/stan/math/prim/arr.hpp:44,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/StanHeaders/include/stan/math/prim/mat.hpp:325,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/StanHeaders/include/stan/math/rev/mat.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/StanHeaders/include/src/stan/model/log_prob_grad.hpp:4,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/StanHeaders/include/src/stan/model/test_gradients.hpp:7,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/StanHeaders/include/src/stan/services/diagnose/diagnose.hpp:10,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/rstan/include/rstan/stan_fit.hpp:34,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/linReg.hpp:18,
                 from stan_files/linReg.cc:3:
/tmp/RtmpcwuZam/checklibfdea629b8f68/BH/include/boost/get_pointer.hpp: At global scope:
/tmp/RtmpcwuZam/checklibfdea629b8f68/BH/include/boost/get_pointer.hpp:48:40: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
 template<class T> T * get_pointer(std::auto_ptr<T> const& p)
                                        ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/Rcpp/include/Rcpp.h:27,
                 from stan_files/linReg.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
g++ -std=gnu++14 -I"/usr/share/R/include" -DNDEBUG -I"../inst/include" -I"`"/usr/lib/R/bin/Rscript" --vanilla -e "cat(system.file('include', 'src', package = 'StanHeaders'))"`" -DBOOST_RESULT_OF_USE_TR1 -DBOOST_NO_DECLTYPE -DBOOST_DISABLE_ASSERTS -DEIGEN_NO_DEBUG -DBOOST_MATH_OVERFLOW_ERROR_POLICY=errno_on_error -I"/tmp/RtmpcwuZam/checklibfdea629b8f68/StanHeaders/include" -I"/tmp/RtmpcwuZam/checklibfdea629b8f68/rstan/include" -I"/tmp/RtmpcwuZam/checklibfdea629b8f68/BH/include" -I"/tmp/RtmpcwuZam/checklibfdea629b8f68/Rcpp/include" -I"/tmp/RtmpcwuZam/checklibfdea629b8f68/RcppEigen/include"    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g -c stan_files/linRegHorseHoe.cc -o stan_files/linRegHorseHoe.o
In file included from /tmp/RtmpcwuZam/checklibfdea629b8f68/BH/include/boost/smart_ptr/shared_ptr.hpp:28:0,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/BH/include/boost/shared_ptr.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/linRegHorseHoe.hpp:18,
                 from stan_files/linRegHorseHoe.cc:3:
/tmp/RtmpcwuZam/checklibfdea629b8f68/BH/include/boost/smart_ptr/detail/shared_count.hpp:355:33: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     explicit shared_count( std::auto_ptr<Y> & r ): pi_( new sp_counted_impl_p<Y>( r.get() ) )
                                 ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/Rcpp/include/Rcpp.h:27,
                 from stan_files/linRegHorseHoe.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdea629b8f68/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/linRegHorseHoe.hpp:18,
                 from stan_files/linRegHorseHoe.cc:3:
/tmp/RtmpcwuZam/checklibfdea629b8f68/BH/include/boost/smart_ptr/shared_ptr.hpp:256:65: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
 template< class T, class R > struct sp_enable_if_auto_ptr< std::auto_ptr< T >, R >
                                                                 ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/Rcpp/include/Rcpp.h:27,
                 from stan_files/linRegHorseHoe.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdea629b8f68/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/linRegHorseHoe.hpp:18,
                 from stan_files/linRegHorseHoe.cc:3:
/tmp/RtmpcwuZam/checklibfdea629b8f68/BH/include/boost/smart_ptr/shared_ptr.hpp:471:31: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     explicit shared_ptr( std::auto_ptr<Y> & r ): px(r.get()), pn()
                               ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/Rcpp/include/Rcpp.h:27,
                 from stan_files/linRegHorseHoe.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdea629b8f68/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/linRegHorseHoe.hpp:18,
                 from stan_files/linRegHorseHoe.cc:3:
/tmp/RtmpcwuZam/checklibfdea629b8f68/BH/include/boost/smart_ptr/shared_ptr.hpp:484:22: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr( std::auto_ptr<Y> && r ): px(r.get()), pn()
                      ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/Rcpp/include/Rcpp.h:27,
                 from stan_files/linRegHorseHoe.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdea629b8f68/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/linRegHorseHoe.hpp:18,
                 from stan_files/linRegHorseHoe.cc:3:
/tmp/RtmpcwuZam/checklibfdea629b8f68/BH/include/boost/smart_ptr/shared_ptr.hpp:567:34: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr & operator=( std::auto_ptr<Y> & r )
                                  ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/Rcpp/include/Rcpp.h:27,
                 from stan_files/linRegHorseHoe.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdea629b8f68/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/linRegHorseHoe.hpp:18,
                 from stan_files/linRegHorseHoe.cc:3:
/tmp/RtmpcwuZam/checklibfdea629b8f68/BH/include/boost/smart_ptr/shared_ptr.hpp:576:34: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr & operator=( std::auto_ptr<Y> && r )
                                  ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/Rcpp/include/Rcpp.h:27,
                 from stan_files/linRegHorseHoe.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdea629b8f68/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/linRegHorseHoe.hpp:18,
                 from stan_files/linRegHorseHoe.cc:3:
/tmp/RtmpcwuZam/checklibfdea629b8f68/BH/include/boost/smart_ptr/shared_ptr.hpp: In member function ‘boost::shared_ptr<T>& boost::shared_ptr<T>::operator=(std::auto_ptr<_Up>&&)’:
/tmp/RtmpcwuZam/checklibfdea629b8f68/BH/include/boost/smart_ptr/shared_ptr.hpp:578:38: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
         this_type( static_cast< std::auto_ptr<Y> && >( r ) ).swap( *this );
                                      ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/Rcpp/include/Rcpp.h:27,
                 from stan_files/linRegHorseHoe.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdea629b8f68/BH/include/boost/fusion/functional/invocation/detail/that_ptr.hpp:13:0,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/BH/include/boost/fusion/functional/invocation/invoke.hpp:52,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/BH/include/boost/fusion/functional/adapter/fused.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/BH/include/boost/fusion/functional/generation/make_fused.hpp:13,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/BH/include/boost/fusion/include/make_fused.hpp:11,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/BH/include/boost/numeric/odeint/util/resize.hpp:28,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/BH/include/boost/numeric/odeint/util/state_wrapper.hpp:26,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/BH/include/boost/numeric/odeint/util/ublas_wrapper.hpp:33,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/BH/include/boost/numeric/odeint.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/StanHeaders/include/stan/math/prim/arr/functor/integrate_ode_rk45.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/StanHeaders/include/stan/math/prim/arr.hpp:44,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/StanHeaders/include/stan/math/prim/mat.hpp:325,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/StanHeaders/include/stan/math/rev/mat.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/StanHeaders/include/src/stan/model/log_prob_grad.hpp:4,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/StanHeaders/include/src/stan/model/test_gradients.hpp:7,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/StanHeaders/include/src/stan/services/diagnose/diagnose.hpp:10,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/rstan/include/rstan/stan_fit.hpp:34,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/linRegHorseHoe.hpp:18,
                 from stan_files/linRegHorseHoe.cc:3:
/tmp/RtmpcwuZam/checklibfdea629b8f68/BH/include/boost/get_pointer.hpp: At global scope:
/tmp/RtmpcwuZam/checklibfdea629b8f68/BH/include/boost/get_pointer.hpp:48:40: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
 template<class T> T * get_pointer(std::auto_ptr<T> const& p)
                                        ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/Rcpp/include/Rcpp.h:27,
                 from stan_files/linRegHorseHoe.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
g++ -std=gnu++14 -I"/usr/share/R/include" -DNDEBUG -I"../inst/include" -I"`"/usr/lib/R/bin/Rscript" --vanilla -e "cat(system.file('include', 'src', package = 'StanHeaders'))"`" -DBOOST_RESULT_OF_USE_TR1 -DBOOST_NO_DECLTYPE -DBOOST_DISABLE_ASSERTS -DEIGEN_NO_DEBUG -DBOOST_MATH_OVERFLOW_ERROR_POLICY=errno_on_error -I"/tmp/RtmpcwuZam/checklibfdea629b8f68/StanHeaders/include" -I"/tmp/RtmpcwuZam/checklibfdea629b8f68/rstan/include" -I"/tmp/RtmpcwuZam/checklibfdea629b8f68/BH/include" -I"/tmp/RtmpcwuZam/checklibfdea629b8f68/Rcpp/include" -I"/tmp/RtmpcwuZam/checklibfdea629b8f68/RcppEigen/include"    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g -c stan_files/linRegHorseHoeUnConstr.cc -o stan_files/linRegHorseHoeUnConstr.o
In file included from /tmp/RtmpcwuZam/checklibfdea629b8f68/BH/include/boost/smart_ptr/shared_ptr.hpp:28:0,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/BH/include/boost/shared_ptr.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/linRegHorseHoeUnConstr.hpp:18,
                 from stan_files/linRegHorseHoeUnConstr.cc:3:
/tmp/RtmpcwuZam/checklibfdea629b8f68/BH/include/boost/smart_ptr/detail/shared_count.hpp:355:33: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     explicit shared_count( std::auto_ptr<Y> & r ): pi_( new sp_counted_impl_p<Y>( r.get() ) )
                                 ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/Rcpp/include/Rcpp.h:27,
                 from stan_files/linRegHorseHoeUnConstr.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdea629b8f68/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/linRegHorseHoeUnConstr.hpp:18,
                 from stan_files/linRegHorseHoeUnConstr.cc:3:
/tmp/RtmpcwuZam/checklibfdea629b8f68/BH/include/boost/smart_ptr/shared_ptr.hpp:256:65: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
 template< class T, class R > struct sp_enable_if_auto_ptr< std::auto_ptr< T >, R >
                                                                 ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/Rcpp/include/Rcpp.h:27,
                 from stan_files/linRegHorseHoeUnConstr.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdea629b8f68/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/linRegHorseHoeUnConstr.hpp:18,
                 from stan_files/linRegHorseHoeUnConstr.cc:3:
/tmp/RtmpcwuZam/checklibfdea629b8f68/BH/include/boost/smart_ptr/shared_ptr.hpp:471:31: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     explicit shared_ptr( std::auto_ptr<Y> & r ): px(r.get()), pn()
                               ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/Rcpp/include/Rcpp.h:27,
                 from stan_files/linRegHorseHoeUnConstr.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdea629b8f68/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/linRegHorseHoeUnConstr.hpp:18,
                 from stan_files/linRegHorseHoeUnConstr.cc:3:
/tmp/RtmpcwuZam/checklibfdea629b8f68/BH/include/boost/smart_ptr/shared_ptr.hpp:484:22: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr( std::auto_ptr<Y> && r ): px(r.get()), pn()
                      ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/Rcpp/include/Rcpp.h:27,
                 from stan_files/linRegHorseHoeUnConstr.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdea629b8f68/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/linRegHorseHoeUnConstr.hpp:18,
                 from stan_files/linRegHorseHoeUnConstr.cc:3:
/tmp/RtmpcwuZam/checklibfdea629b8f68/BH/include/boost/smart_ptr/shared_ptr.hpp:567:34: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr & operator=( std::auto_ptr<Y> & r )
                                  ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/Rcpp/include/Rcpp.h:27,
                 from stan_files/linRegHorseHoeUnConstr.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdea629b8f68/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/linRegHorseHoeUnConstr.hpp:18,
                 from stan_files/linRegHorseHoeUnConstr.cc:3:
/tmp/RtmpcwuZam/checklibfdea629b8f68/BH/include/boost/smart_ptr/shared_ptr.hpp:576:34: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr & operator=( std::auto_ptr<Y> && r )
                                  ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/Rcpp/include/Rcpp.h:27,
                 from stan_files/linRegHorseHoeUnConstr.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdea629b8f68/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/BH/include/boost/date_time/time_clock.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/BH/include/boost/date_time/posix_time/posix_time_types.hpp:10,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/rstan/include/rstan/stan_fit.hpp:13,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/linRegHorseHoeUnConstr.hpp:18,
                 from stan_files/linRegHorseHoeUnConstr.cc:3:
/tmp/RtmpcwuZam/checklibfdea629b8f68/BH/include/boost/smart_ptr/shared_ptr.hpp: In member function ‘boost::shared_ptr<T>& boost::shared_ptr<T>::operator=(std::auto_ptr<_Up>&&)’:
/tmp/RtmpcwuZam/checklibfdea629b8f68/BH/include/boost/smart_ptr/shared_ptr.hpp:578:38: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
         this_type( static_cast< std::auto_ptr<Y> && >( r ) ).swap( *this );
                                      ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/Rcpp/include/Rcpp.h:27,
                 from stan_files/linRegHorseHoeUnConstr.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdea629b8f68/BH/include/boost/fusion/functional/invocation/detail/that_ptr.hpp:13:0,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/BH/include/boost/fusion/functional/invocation/invoke.hpp:52,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/BH/include/boost/fusion/functional/adapter/fused.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/BH/include/boost/fusion/functional/generation/make_fused.hpp:13,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/BH/include/boost/fusion/include/make_fused.hpp:11,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/BH/include/boost/numeric/odeint/util/resize.hpp:28,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/BH/include/boost/numeric/odeint/util/state_wrapper.hpp:26,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/BH/include/boost/numeric/odeint/util/ublas_wrapper.hpp:33,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/BH/include/boost/numeric/odeint.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/StanHeaders/include/stan/math/prim/arr/functor/integrate_ode_rk45.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/StanHeaders/include/stan/math/prim/arr.hpp:44,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/StanHeaders/include/stan/math/prim/mat.hpp:325,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/StanHeaders/include/stan/math/rev/mat.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/StanHeaders/include/src/stan/model/log_prob_grad.hpp:4,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/StanHeaders/include/src/stan/model/test_gradients.hpp:7,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/StanHeaders/include/src/stan/services/diagnose/diagnose.hpp:10,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/rstan/include/rstan/stan_fit.hpp:34,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/rstan/include/rstan/rstaninc.hpp:3,
                 from stan_files/linRegHorseHoeUnConstr.hpp:18,
                 from stan_files/linRegHorseHoeUnConstr.cc:3:
/tmp/RtmpcwuZam/checklibfdea629b8f68/BH/include/boost/get_pointer.hpp: At global scope:
/tmp/RtmpcwuZam/checklibfdea629b8f68/BH/include/boost/get_pointer.hpp:48:40: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
 template<class T> T * get_pointer(std::auto_ptr<T> const& p)
                                        ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/Rcpp/include/RcppCommon.h:52,
                 from /tmp/RtmpcwuZam/checklibfdea629b8f68/Rcpp/include/Rcpp.h:27,
                 from stan_files/linRegHorseHoeUnConstr.cc:1:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
rm stan_files/linRegUnConstr.cc stan_files/linRegHorseHoe.cc stan_files/linRegHorseHoeUnConstr.cc stan_files/linReg.cc
ERROR: compilation failed for package ‘BMSC’
* removing ‘/tmp/RtmpcwuZam/filefdea2d2318f7/BMSC.Rcheck/BMSC’

```
# colorednoise

Version: 1.0.3

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘colorednoise-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: matrix_model
    > ### Title: Temporally Autocorrelated Matrix Population Models
    > ### Aliases: matrix_model
    > 
    > ### ** Examples
    > 
    > meanMat <- matrix(c(0.55, 0.6, 0.24, 0.4), byrow = TRUE, ncol = 2)
    > sdMat <- matrix(c(0.3, 0.35, 0.05, 0.1), byrow = TRUE, ncol = 2)
    > phiMat <- matrix(c(-0.2, -0.2, 0, 0), byrow = TRUE, ncol = 2)
    > initialPop <- c(100, 100)
    > sim <- matrix_model(list(meanMat, sdMat, phiMat), initialPop, 50)
    Error: Columns 1, 2 must be named.
    Use .name_repair to specify repair.
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      13: as_tibble.data.frame(m, ...) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/as_tibble.R:76
      14: as_tibble.list(unclass(x), ..., .rows = .rows, .name_repair = .name_repair) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/as_tibble.R:94
      15: set_repaired_names(x, .name_repair) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/as_tibble.R:118
      16: repaired_names(names(x), .name_repair = .name_repair) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/repair-names.R:137
      17: check_unique(new_name) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/repair-names.R:168
      18: abort(error_column_must_be_named(bad_name)) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/repair-names.R:256
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 6 SKIPPED: 0 FAILED: 3
      1. Error: colored_multi_rnorm can produce red noise (@test_noise.R#29) 
      2. Error: colored_multi_rnorm can produce blue noise (@test_noise.R#37) 
      3. Error: matrix_model can produce cross-correlated autocorrelated populations with demographic stochasticity (@test_simulations.R#31) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# eesim

Version: 0.1.0

## Newly broken

*   checking re-building of vignette outputs ... WARNING
    ```
    ...
    
        filter, lag
    
    The following objects are masked from 'package:base':
    
        intersect, setdiff, setequal, union
    
    
    Attaching package: 'gridExtra'
    
    The following object is masked from 'package:dplyr':
    
        combine
    
    This is dlnm 2.3.6. For details: help(dlnm) and vignette('dlnmOverview').
    This function may take a minute or two to run, especially if you
    are creating lots of replications (`n_reps`).
    Quitting from lines 683-690 (eesim.Rmd) 
    Error: processing vignette 'eesim.Rmd' failed with diagnostics:
    Columns 1, 2, 3, 4, 5, … (and 1821 more) must be named.
    Execution halted
    ```

# epidata

Version: 0.2.0

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘epidata-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: get_annual_wages_and_work_hours
    > ### Title: Retreive CPS ASEC Annual Wages and Work Hours
    > ### Aliases: get_annual_wages_and_work_hours
    > 
    > ### ** Examples
    > 
    > get_annual_wages_and_work_hours()
    Error: Columns 1, 2, 3, 4, 5, … (and 2 more) must be named.
    Execution halted
    ```

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

# genBaRcode

Version: 1.1.0

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘genBaRcode-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: plotClusterGgTree
    > ### Title: Plotting a Cluster ggTree
    > ### Aliases: plotClusterGgTree
    > 
    > ### ** Examples
    > 
    > data(BC_dat)
    > plotClusterGgTree(BC_dat, tree_est = "UPGMA", type = "circular")
    Error in as.data.frame.default(x) : 
      cannot coerce class ‘"phylo"’ to a data.frame
    Calls: plotClusterGgTree ... as_tibble -> as.data.frame -> as.data.frame.default
    Execution halted
    ```

# janitor

Version: 1.1.1

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      11: freduce(value, `_function_list`) at /tmp/RtmpgVFdE2/R.INSTALL778e5edf4faf/magrittr/R/pipe.R:28
      12: withVisible(function_list[[k]](value)) at /tmp/RtmpgVFdE2/R.INSTALL778e5edf4faf/magrittr/R/freduce.R:20
      13: function_list[[k]](value) at /tmp/RtmpgVFdE2/R.INSTALL778e5edf4faf/magrittr/R/freduce.R:20
      14: row_to_names(., row_number = 1)
      15: `names<-`(`*tmp*`, value = new_names) at /tmp/RtmpD0aMxw/filea53742ddd9a4/janitor.Rcheck/00_pkg_src/janitor/R/row_to_names.R:24
      16: `names<-.tbl_df`(`*tmp*`, value = new_names) at /tmp/RtmpD0aMxw/filea53742ddd9a4/janitor.Rcheck/00_pkg_src/janitor/R/row_to_names.R:24
      17: check_names_non_na(value) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/tbl-df.r:79
      18: abort(error_column_must_be_named(bad_name)) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/repair-names.R:235
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 423 SKIPPED: 0 FAILED: 1
      1. Error: row_to_names invalid and semi-valid input checking (@test-row-to-names.R#25) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# keyholder

Version: 0.1.2

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘keyholder-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: keys-set
    > ### Title: Set keys
    > ### Aliases: keys-set keys<- assign_keys key_by unkey
    > 
    > ### ** Examples
    > 
    > df <- dplyr::as_tibble(mtcars)
    > 
    > # Value is converted to tibble
    > keys(df) <- 1:nrow(df)
    Error: Columns 1, 2, 3, 4, 5, … (and 27 more) must be named.
    Use .name_repair to specify repair.
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 302 SKIPPED: 0 FAILED: 18
      1. Error: has_keys works (@test-keys-get.R#39) 
      2. Failure: restore_keys.default works (@test-keys-manip.R#44) 
      3. Failure: restore_keys.default works (@test-keys-manip.R#54) 
      4. Failure: restore_keys.default handles .remove and .unkey arguments (@test-keys-manip.R#65) 
      5. Failure: restore_keys.default handles .remove and .unkey arguments (@test-keys-manip.R#72) 
      6. Failure: restore_keys.default handles .remove and .unkey arguments (@test-keys-manip.R#80) 
      7. Failure: restore_keys.default handles .remove and .unkey arguments (@test-keys-manip.R#85) 
      8. Error: `keys<-` converts value to tibble (@test-keys-set.R#19) 
      9. Failure: `keys<-` throws an error (@test-keys-set.R#33) 
      1. ...
      
      Error: testthat unit tests failed
      Execution halted
    ```

# metacoder

Version: 0.3.0

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
                 stop(call. = FALSE, paste0("The following taxon IDs do not exist:\n", limited_print(invalid_ids, 
                     type = "silent")))
             }
             return(result)
         }) at /tmp/RtmpCv6Hba/R.INSTALLbb9a7e4db9b8/taxa/R/taxonomy--class.R:1256
      13: FUN(X[[i]], ...)
      14: stop(call. = FALSE, paste0("The following taxon IDs do not exist:\n", limited_print(invalid_ids, 
             type = "silent"))) at /tmp/RtmpCv6Hba/R.INSTALLbb9a7e4db9b8/taxa/R/taxonomy--class.R:1261
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 94 SKIPPED: 1 FAILED: 1
      1. Error: Converting to phyloseq (@test--parsers_and_writers.R#204) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# mixpack

Version: 0.3.6

## Newly broken

*   checking re-building of vignette outputs ... WARNING
    ```
    ...
      ...
    Warning in engine$weave(file, quiet = quiet, encoding = enc) :
      The vignette engine knitr::rmarkdown is not available, because the rmarkdown package is not installed. Please install it.
    Package 'mclust' version 5.4.1
    Type 'citation("mclust")' for citing this R package in publications.
    mixpack: a package for mixture components analysis
    
    Attaching package: 'dplyr'
    
    The following objects are masked from 'package:stats':
    
        filter, lag
    
    The following objects are masked from 'package:base':
    
        intersect, setdiff, setequal, union
    
    Quitting from lines 50-51 (mixture_components.Rmd) 
    Error: processing vignette 'mixture_components.Rmd' failed with diagnostics:
    Columns 1, 2, 3, 4, 5, … (and 1 more) must be named.
    Execution halted
    ```

# Momocs

Version: 1.2.9

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    3 AN   
    4 AN   
    5 AN   
    6 AN   
    # … with 121 more rows
     - All components: sdev, rotation, center, scale, x, eig, fac, mshape, method, cuts, links.
    > plot(wpp, 1)
    > 
    > # "foreign prcomp"
    > head(iris)
      Sepal.Length Sepal.Width Petal.Length Petal.Width Species
    1          5.1         3.5          1.4         0.2  setosa
    2          4.9         3.0          1.4         0.2  setosa
    3          4.7         3.2          1.3         0.2  setosa
    4          4.6         3.1          1.5         0.2  setosa
    5          5.0         3.6          1.4         0.2  setosa
    6          5.4         3.9          1.7         0.4  setosa
    > iris.p <- prcomp(iris[, 1:4])
    > iris.p <- as_PCA(iris.p, iris[, 5])
    Error: Columns 1, 2, 3, 4, 5, … (and 145 more) must be named.
    Execution halted
    ```

# particles

Version: 0.2.1

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘particles-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: evolve
    > ### Title: Move the simulation forward one or more steps
    > ### Aliases: evolve
    > 
    > ### ** Examples
    > 
    > graph <- tidygraph::create_notable('folkman')
    > sim <- graph %>%
    +   simulate() %>%
    +   wield(link_force) %>%
    +   wield(manybody_force)
    Error in is.force(force) : Columns 1, 2 must be named.
    Use .name_repair to specify repair.
    Calls: %>% ... tryCatch -> tryCatchList -> tryCatchOne -> <Anonymous>
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    ...
    Warning in engine$weave(file, quiet = quiet, encoding = enc) :
      Pandoc (>= 1.12.3) and/or pandoc-citeproc not available. Falling back to R Markdown v1.
    
    Attaching package: 'particles'
    
    The following objects are masked from 'package:stats':
    
        filter, simulate
    
    
    Attaching package: 'tidygraph'
    
    The following object is masked from 'package:stats':
    
        filter
    
    Quitting from lines 61-71 (intro.Rmd) 
    Error: processing vignette 'intro.Rmd' failed with diagnostics:
    Columns 1, 2 must be named.
    Use .name_repair to specify repair.
    Execution halted
    ```

# prophet

Version: 0.3.0.1

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 286 SKIPPED: 0 FAILED: 15
      1. Error: cross_validation (@test_diagnostics.R#20) 
      2. Error: cross_validation_logistic (@test_diagnostics.R#46) 
      3. Error: cross_validation_extra_regressors (@test_diagnostics.R#62) 
      4. Error: cross_validation_default_value_check (@test_diagnostics.R#77) 
      5. Error: performance_metrics (@test_diagnostics.R#87) 
      6. Failure: fit_predict (@test_prophet.R#17) 
      7. Failure: fit_predict_no_seasons (@test_prophet.R#23) 
      8. Failure: fit_predict_no_changepoints (@test_prophet.R#28) 
      9. Failure: fit_predict_changepoint_not_in_history (@test_prophet.R#42) 
      1. ...
      
      Error: testthat unit tests failed
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    ...
      ...
    Warning in engine$weave(file, quiet = quiet, encoding = enc) :
      The vignette engine knitr::rmarkdown is not available, because the rmarkdown package is not installed. Please install it.
    Loading required package: Rcpp
    code for methods in class "Rcpp_stan_fit4model574a249a4f_prophet" was not checked for suspicious field assignments (recommended package 'codetools' not available?)
    code for methods in class "Rcpp_stan_fit4model574a249a4f_prophet" was not checked for suspicious field assignments (recommended package 'codetools' not available?)
    
    Attaching package: 'dplyr'
    
    The following objects are masked from 'package:stats':
    
        filter, lag
    
    The following objects are masked from 'package:base':
    
        intersect, setdiff, setequal, union
    
    Quitting from lines 44-46 (quick_start.Rmd) 
    Error: processing vignette 'quick_start.Rmd' failed with diagnostics:
    Column names `10%`, `90%` must not be duplicated.
    Execution halted
    ```

# purrrlyr

Version: 0.0.3

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      [4] 258 - 358 ==  -99.62
      [5] 360 - 358 ==    2.38
      [6] 225 - 358 == -132.62
      [7] 360 - 358 ==    2.38
      [8] 147 - 358 == -210.92
      [9] 141 - 358 == -216.82
      ...
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 81 SKIPPED: 0 FAILED: 2
      1. Failure: conditional sliced mapping recycles within groups (@test-dmap.R#32) 
      2. Failure: conditional sliced mapping recycles within groups (@test-dmap.R#33) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# qwraps2

Version: 0.3.0

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > # white noise
    > Z.1 <- rnorm(n, 0, 1)
    > Z.2 <- rnorm(n, 0, 2)
    > Z.3 <- rnorm(n, 0, 5)
    > 
    > for(i in 2:n)
    + {
    + 	x1[i] <- x1[i-1] + Z.1[i] - Z.1[i-1] + x4[i-1] - x2[i-1]
    + 	x2[i] <- x2[i-1] - 2 * Z.2[i] + Z.2[i-1] - x4[i-1]
    + 	x3[i] <- x3[i-1] + x2[i-1] + 0.2 * Z.3[i] + Z.3[i-1]
    + 	x4[i] <- x4[i-1] + runif(1, 0.5, 1.5) * x4[i-1]
    + }
    > testdf <- data.frame(x1, x2, x3, x4)
    > 
    > # Base acf plot for one variable
    > acf(testdf$x1)
    > 
    > # qacf plot for one variable
    > qacf(testdf$x1)
    Error: Columns 1, 2, 3, 4, 5, … (and 19 more) must be named.
    Execution halted
    ```

# rplos

Version: 0.8.4

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/test-all.R’ failed.
    Last 13 lines of output:
      17: as_tibble.matrix(x, ...) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/as_tibble.R:76
      18: as_tibble(m, ...) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/as_tibble.R:187
      19: as_tibble.data.frame(m, ...) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/as_tibble.R:76
      20: as_tibble.list(unclass(x), ..., .rows = .rows, .name_repair = .name_repair) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/as_tibble.R:94
      21: set_repaired_names(x, .name_repair) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/as_tibble.R:118
      22: repaired_names(names(x), .name_repair = .name_repair) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/repair-names.R:137
      23: check_unique(new_name) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/repair-names.R:168
      24: abort(error_column_must_be_named(bad_name)) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/repair-names.R:256
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 100 SKIPPED: 7 FAILED: 1
      1. Error: facetplos (@test-facetplos.R#5) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# rrr

Version: 1.0.0

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘rrr-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: pairwise_plot
    > ### Title: Pairwise Plots
    > ### Aliases: pairwise_plot
    > 
    > ### ** Examples
    > 
    > data(pendigits)
    > digits_features <- pendigits[,1:34]
    > digits_class <- pendigits[,35]
    > pairwise_plot(digits_features, digits_class, type = "pca", pair_x = 1, pair_y = 3)
    Error: Columns 1, 2, 3, 4, 5, … (and 29 more) must be named.
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    Warning in engine$weave(file, quiet = quiet, encoding = enc) :
      Pandoc (>= 1.12.3) and/or pandoc-citeproc not available. Falling back to R Markdown v1.
    Quitting from lines 241-242 (rrr.Rmd) 
    Error: processing vignette 'rrr.Rmd' failed with diagnostics:
    Columns 1, 2, 3, 4, 5, … (and 20 more) must be named.
    Execution halted
    ```

# ruler

Version: 0.1.3

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      2: `names<-.tbl_df`(`*tmp*`, value = "vs...rule..1") at testthat/test-expose.R:585
      3: abort(error_names_must_have_length(length(value), length(x))) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/tbl-df.r:76
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 305 SKIPPED: 0 FAILED: 7
      1. Error: add_pack_names works (@test-expose-helpers.R#73) 
      2. Failure: expose works (@test-expose.R#159) 
      3. Error: expose works (@test-expose.R#188) 
      4. Error: expose removes obeyers (@test-expose.R#202) 
      5. Error: expose preserves pack names (@test-expose.R#246) 
      6. Error: expose accounts for rule separator (@test-expose.R#264) 
      7. Error: interp_col_pack_out works (@test-expose.R#585) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# scholar

Version: 0.1.7

## Newly broken

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    Warning in engine$weave(file, quiet = quiet, encoding = enc) :
      Pandoc (>= 1.12.3) and/or pandoc-citeproc not available. Falling back to R Markdown v1.
    Quitting from lines 131-132 (scholar.Rmd) 
    Error: processing vignette 'scholar.Rmd' failed with diagnostics:
    Evaluation error: Columns 1, 2 must be named.
    Use .name_repair to specify repair..
    Execution halted
    ```

# vqtl

Version: 2.0.4

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘vqtl-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: plot.scanonevar
    > ### Title: plot.scanonevar
    > ### Aliases: plot.scanonevar
    > 
    > ### ** Examples
    > 
    > set.seed(27599)
    > test.cross <- qtl::sim.cross(map = qtl::sim.map(len = rep(20, 3), n.mar = 5), n.ind = 50)
    > test.sov <- scanonevar(cross = test.cross)
    calculating genoprobs with stepwidth = 5, off.end = 0, error.prob = 1e-4, map.function = 'haldane'
    Error: Columns 1, 2, 3, 4, 5, … (and 45 more) must be named.
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      13: repaired_names(names(x), .name_repair = .name_repair) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/repair-names.R:137
      14: check_unique(new_name) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/repair-names.R:168
      15: abort(error_column_must_be_named(bad_name)) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/repair-names.R:256
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 58 SKIPPED: 2 FAILED: 6
      1. Error: testing scanonevar with dglm with gaussian model (@test-2-scanonevar.R#23) 
      2. Error: testing conditional scanonevar with dglm with gaussian model (@test-2-scanonevar.R#61) 
      3. Error: testing scanonevar with dglm with poisson model (@test-2-scanonevar.R#95) 
      4. Error: testing conditional scanonevar with dglm with poisson model (@test-2-scanonevar.R#129) 
      5. Error: testing scanonevar with hglm (@test-2-scanonevar.R#164) 
      6. Error: (unknown) (@test-4-plots.R#53) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# wakefield

Version: 0.3.3

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    The following objects are masked from ‘package:stats’:
    
        filter, lag
    
    The following objects are masked from ‘package:base’:
    
        intersect, setdiff, setequal, union
    
    > 
    > dat <- r_data_frame(12,
    +     name,
    +     r_series(likert, 10, relate = "+1_.5")
    + )
    > 
    > # Suggested use of tidyr or reshape2 package here instead
    > dat <- data.frame(
    +     ID = rep(dat[[1]], ncol(dat[-1])),
    +     stack(dat[-1])
    + )
    Error: The `names` must not be `NULL`.
    Execution halted
    ```

# LymphoSeq

Version: 1.8.0

## Newly broken

*   checking examples ... ERROR
    ```
    ...
      |                                                                            
      |============================                                          |  40%
      |                                                                            
      |===================================                                   |  50%
      |                                                                            
      |==========================================                            |  60%
      |                                                                            
      |=================================================                     |  70%
      |                                                                            
      |========================================================              |  80%
      |                                                                            
      |===============================================================       |  90%
      |                                                                            
      |======================================================================| 100%
    > 
    > phyloTree(list = productive.nt, sample = "IGH_MVQ92552A_BL", type = "nucleotide", 
    +          layout = "rectangular")
    Error in as.data.frame.default(x) : 
      cannot coerce class ‘"phylo"’ to a data.frame
    Calls: phyloTree ... as_tibble -> as.data.frame -> as.data.frame.default
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error in re-building vignettes:
      ...
    Warning in engine$weave(file, quiet = quiet, encoding = enc) :
      Pandoc (>= 1.12.3) and/or pandoc-citeproc not available. Falling back to R Markdown v1.
    Quitting from lines 140-142 (LymphoSeq.Rmd) 
    Error: processing vignette 'LymphoSeq.Rmd' failed with diagnostics:
    cannot coerce class '"phylo"' to a data.frame
    Execution halted
    ```

# philr

Version: 1.6.0

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘philr-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: annotate_balance
    > ### Title: annotate_balance
    > ### Aliases: annotate_balance
    > 
    > ### ** Examples
    > 
    > tr <- named_rtree(10)
    > 
    > annotate_balance(tr, 'n4', size=7)
    Error in as.data.frame.default(x) : 
      cannot coerce class ‘"phylo"’ to a data.frame
    Calls: annotate_balance ... as_tibble -> as.data.frame -> as.data.frame.default
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    ...
        expand
    
    The following object is masked from 'package:ape':
    
        rotate
    
    
    Attaching package: 'dplyr'
    
    The following objects are masked from 'package:stats':
    
        filter, lag
    
    The following objects are masked from 'package:base':
    
        intersect, setdiff, setequal, union
    
    Quitting from lines 218-230 (philr-intro.Rmd) 
    Error: processing vignette 'philr-intro.Rmd' failed with diagnostics:
    cannot coerce class '"phylo"' to a data.frame
    Execution halted
    ```

# rhierbaps

Version: 1.1.0

## Newly broken

*   checking re-building of vignette outputs ... WARNING
    ```
    ...
    Warning in block_exec(params) :
      failed to tidy R code in chunk <unnamed-chunk-5>
    reason: Error in loadNamespace(name) : there is no package called 'formatR'
    
    Warning in block_exec(params) :
      failed to tidy R code in chunk <unnamed-chunk-6>
    reason: Error in loadNamespace(name) : there is no package called 'formatR'
    
    Warning in block_exec(params) :
      failed to tidy R code in chunk <unnamed-chunk-7>
    reason: Error in loadNamespace(name) : there is no package called 'formatR'
    
    Read 1 item
    Warning in block_exec(params) :
      failed to tidy R code in chunk <unnamed-chunk-8>
    reason: Error in loadNamespace(name) : there is no package called 'formatR'
    
    Quitting from lines 106-110 (introduction.Rmd) 
    Error: processing vignette 'introduction.Rmd' failed with diagnostics:
    cannot coerce class '"phylo"' to a data.frame
    Execution halted
    ```

# curl

Version: 3.2

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      This is libcurl version 7.47.0 with GnuTLS/3.4.10 
      Using test server: http://hb.opencpu.org 
      ── 1. Failure: host_con works via and multi_fdset (@test-multi.R#165)  ─────────
      multi_fdset(pool = pool)$reads has length 1, not length 2.
      
      ── 2. Failure: host_con works via and multi_fdset (@test-multi.R#165)  ─────────
      multi_fdset(pool = pool)$reads has length 0, not length 1.
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 174 SKIPPED: 1 FAILED: 2
      1. Failure: host_con works via and multi_fdset (@test-multi.R#165) 
      2. Failure: host_con works via and multi_fdset (@test-multi.R#165) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

# protViz

Version: 0.3.1

## Newly broken

*   checking PDF version of manual without hyperrefs or index ... ERROR
    ```
    Re-running with no redirection of stdout/stderr.
    Hmm ... looks like a package
    You may want to clean up by 'rm -Rf /tmp/RtmpYaayRW/Rd2pdf892747a4ec7d'
    ```

*   checking PDF version of manual ... WARNING
    ```
    LaTeX errors when creating PDF version.
    This typically indicates Rd problems.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is  6.5Mb
      sub-directories of 1Mb or more:
        data   2.1Mb
        libs   3.4Mb
    ```

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘XML’
    ```

*   checking re-building of vignette outputs ... NOTE
    ```
    Error in re-building vignettes:
      ...
    code for methods in class "Rcpp_Fasta" was not checked for suspicious field assignments (recommended package 'codetools' not available?)
    code for methods in class "Rcpp_Fasta" was not checked for suspicious field assignments (recommended package 'codetools' not available?)
    Warning in system2(command, args, env = env, stdout = outfile, stderr = errfile,  :
      error in running command
    Warning in system2(command, args, env = env, stdout = outfile, stderr = errfile,  :
      error in running command
    Error in texi2dvi(file = file, pdf = TRUE, clean = clean, quiet = quiet,  : 
      Running 'texi2dvi' on 'PTM_MarkerFinder.tex' failed.
    Messages:
    sh: 1: /usr/bin/texi2dvi: not found
    Calls: buildVignettes -> texi2pdf -> texi2dvi
    Execution halted
    ```

## Installation

### Devel

```
* installing *source* package ‘protViz’ ...
** package ‘protViz’ successfully unpacked and MD5 sums checked
** libs
gcc -std=gnu99 -I"/usr/share/R/include" -DNDEBUG  -I"/tmp/RtmpD0aMxw/checkliba53332281371/Rcpp/include"    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -c findNN.c -o findNN.o
gcc -std=gnu99 -I"/usr/share/R/include" -DNDEBUG  -I"/tmp/RtmpD0aMxw/checkliba53332281371/Rcpp/include"    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -c protViz_init.c -o protViz_init.o
gcc -std=gnu99 -I"/usr/share/R/include" -DNDEBUG  -I"/tmp/RtmpD0aMxw/checkliba53332281371/Rcpp/include"    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -c computeParentIonMass.c -o computeParentIonMass.o
gcc -std=gnu99 -I"/usr/share/R/include" -DNDEBUG  -I"/tmp/RtmpD0aMxw/checkliba53332281371/Rcpp/include"    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -c computeFragmentIons.c -o computeFragmentIons.o
g++ -std=gnu++11 -I"/usr/share/R/include" -DNDEBUG  -I"/tmp/RtmpD0aMxw/checkliba53332281371/Rcpp/include"   `/usr/lib/R/bin/Rscript -e "Rcpp:::CxxFlags()"` -I. -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g -c findNN_.cpp -o findNN_.o
Compiling with: 

# $HeadURL: $
# $Id: $


OBJECTS=protViz_init.o deisotoper.o aa2mass.o findNN_.o computeFragmentIons.o computeParentIonMass.o findNN.o RcppExports.o fasta.o
PKG_CXXFLAGS=`$(R_HOME)/bin/Rscript -e "Rcpp:::CxxFlags()"` -I.
PKG_LIBS=`$(R_HOME)/bin/Rscript -e "Rcpp:::LdFlags()"` 
g++ -std=gnu++11 -I"/usr/share/R/include" -DNDEBUG  -I"/tmp/RtmpD0aMxw/checkliba53332281371/Rcpp/include"   `/usr/lib/R/bin/Rscript -e "Rcpp:::CxxFlags()"` -I. -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g -c RcppExports.cpp -o RcppExports.o
Compiling with: 

# $HeadURL: $
# $Id: $


OBJECTS=protViz_init.o deisotoper.o aa2mass.o findNN_.o computeFragmentIons.o computeParentIonMass.o findNN.o RcppExports.o fasta.o
PKG_CXXFLAGS=`$(R_HOME)/bin/Rscript -e "Rcpp:::CxxFlags()"` -I.
PKG_LIBS=`$(R_HOME)/bin/Rscript -e "Rcpp:::LdFlags()"` 
g++ -std=gnu++11 -I"/usr/share/R/include" -DNDEBUG  -I"/tmp/RtmpD0aMxw/checkliba53332281371/Rcpp/include"   `/usr/lib/R/bin/Rscript -e "Rcpp:::CxxFlags()"` -I. -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g -c aa2mass.cpp -o aa2mass.o
Compiling with: 

# $HeadURL: $
# $Id: $


OBJECTS=protViz_init.o deisotoper.o aa2mass.o findNN_.o computeFragmentIons.o computeParentIonMass.o findNN.o RcppExports.o fasta.o
PKG_CXXFLAGS=`$(R_HOME)/bin/Rscript -e "Rcpp:::CxxFlags()"` -I.
PKG_LIBS=`$(R_HOME)/bin/Rscript -e "Rcpp:::LdFlags()"` 
g++ -std=gnu++11 -I"/usr/share/R/include" -DNDEBUG  -I"/tmp/RtmpD0aMxw/checkliba53332281371/Rcpp/include"   `/usr/lib/R/bin/Rscript -e "Rcpp:::CxxFlags()"` -I. -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g -c fasta.cpp -o fasta.o
Compiling with: 

# $HeadURL: $
# $Id: $


OBJECTS=protViz_init.o deisotoper.o aa2mass.o findNN_.o computeFragmentIons.o computeParentIonMass.o findNN.o RcppExports.o fasta.o
PKG_CXXFLAGS=`$(R_HOME)/bin/Rscript -e "Rcpp:::CxxFlags()"` -I.
PKG_LIBS=`$(R_HOME)/bin/Rscript -e "Rcpp:::LdFlags()"` 
g++ -std=gnu++11 -I"/usr/share/R/include" -DNDEBUG  -I"/tmp/RtmpD0aMxw/checkliba53332281371/Rcpp/include"   `/usr/lib/R/bin/Rscript -e "Rcpp:::CxxFlags()"` -I. -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g -c deisotoper.cpp -o deisotoper.o
Compiling with: 

# $HeadURL: $
# $Id: $


OBJECTS=protViz_init.o deisotoper.o aa2mass.o findNN_.o computeFragmentIons.o computeParentIonMass.o findNN.o RcppExports.o fasta.o
PKG_CXXFLAGS=`$(R_HOME)/bin/Rscript -e "Rcpp:::CxxFlags()"` -I.
PKG_LIBS=`$(R_HOME)/bin/Rscript -e "Rcpp:::LdFlags()"` 
Compiling with: 

# $HeadURL: $
# $Id: $


OBJECTS=protViz_init.o deisotoper.o aa2mass.o findNN_.o computeFragmentIons.o computeParentIonMass.o findNN.o RcppExports.o fasta.o
PKG_CXXFLAGS=`$(R_HOME)/bin/Rscript -e "Rcpp:::CxxFlags()"` -I.
PKG_LIBS=`$(R_HOME)/bin/Rscript -e "Rcpp:::LdFlags()"` 
g++ -std=gnu++11 -shared -L/usr/lib/R/lib -Wl,-Bsymbolic-functions -Wl,-z,relro -o protViz.so protViz_init.o deisotoper.o aa2mass.o findNN_.o computeFragmentIons.o computeParentIonMass.o findNN.o RcppExports.o fasta.o -L/usr/lib/R/lib -lR
Compiling with: 

# $HeadURL: $
# $Id: $


OBJECTS=protViz_init.o deisotoper.o aa2mass.o findNN_.o computeFragmentIons.o computeParentIonMass.o findNN.o RcppExports.o fasta.o
PKG_CXXFLAGS=`$(R_HOME)/bin/Rscript -e "Rcpp:::CxxFlags()"` -I.
PKG_LIBS=`$(R_HOME)/bin/Rscript -e "Rcpp:::LdFlags()"` 
installing to /tmp/RtmpD0aMxw/filea533170077af/protViz.Rcheck/protViz/libs
** R
** data
*** moving datasets to lazyload DB
** demo
** exec
** inst
** byte-compile and prepare package for lazy loading
** help
*** installing help indices
** building package indices
** installing vignettes
** testing if installed package can be loaded
code for methods in class “Rcpp_Fasta” was not checked for suspicious field assignments (recommended package ‘codetools’ not available?)
code for methods in class “Rcpp_Fasta” was not checked for suspicious field assignments (recommended package ‘codetools’ not available?)
* DONE (protViz)

```
### CRAN

```
* installing *source* package ‘protViz’ ...
** package ‘protViz’ successfully unpacked and MD5 sums checked
** libs
gcc -std=gnu99 -I"/usr/share/R/include" -DNDEBUG  -I"/tmp/RtmpcwuZam/checklibfdcc1727ff4e/Rcpp/include"    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -c findNN.c -o findNN.o
gcc -std=gnu99 -I"/usr/share/R/include" -DNDEBUG  -I"/tmp/RtmpcwuZam/checklibfdcc1727ff4e/Rcpp/include"    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -c protViz_init.c -o protViz_init.o
gcc -std=gnu99 -I"/usr/share/R/include" -DNDEBUG  -I"/tmp/RtmpcwuZam/checklibfdcc1727ff4e/Rcpp/include"    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -c computeParentIonMass.c -o computeParentIonMass.o
gcc -std=gnu99 -I"/usr/share/R/include" -DNDEBUG  -I"/tmp/RtmpcwuZam/checklibfdcc1727ff4e/Rcpp/include"    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g  -c computeFragmentIons.c -o computeFragmentIons.o
g++ -std=gnu++11 -I"/usr/share/R/include" -DNDEBUG  -I"/tmp/RtmpcwuZam/checklibfdcc1727ff4e/Rcpp/include"   `/usr/lib/R/bin/Rscript -e "Rcpp:::CxxFlags()"` -I. -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g -c fasta.cpp -o fasta.o
Compiling with: 

# $HeadURL: $
# $Id: $


OBJECTS=protViz_init.o deisotoper.o aa2mass.o findNN_.o computeFragmentIons.o computeParentIonMass.o findNN.o RcppExports.o fasta.o
PKG_CXXFLAGS=`$(R_HOME)/bin/Rscript -e "Rcpp:::CxxFlags()"` -I.
PKG_LIBS=`$(R_HOME)/bin/Rscript -e "Rcpp:::LdFlags()"` 
Error in readRDS("/tmp/RtmpcwuZam/filefdcc1bfdeb30") : 
  error reading from connection
Calls: .Last -> readRDS
g++: error: traceback(1): No such file or directory
g++: error: 2:: No such file or directory
g++: error: readRDS("/tmp/RtmpcwuZam/filefdcc1bfdeb30"): No such file or directory
g++: error: 1:: No such file or directory
g++: error: .Last(): No such file or directory
/usr/lib/R/etc/Makeconf:168: recipe for target 'fasta.o' failed
make: *** [fasta.o] Error 1
make: *** Waiting for unfinished jobs....
g++ -std=gnu++11 -I"/usr/share/R/include" -DNDEBUG  -I"/tmp/RtmpcwuZam/checklibfdcc1727ff4e/Rcpp/include"   `/usr/lib/R/bin/Rscript -e "Rcpp:::CxxFlags()"` -I. -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g -c findNN_.cpp -o findNN_.o
Compiling with: 

# $HeadURL: $
# $Id: $


OBJECTS=protViz_init.o deisotoper.o aa2mass.o findNN_.o computeFragmentIons.o computeParentIonMass.o findNN.o RcppExports.o fasta.o
PKG_CXXFLAGS=`$(R_HOME)/bin/Rscript -e "Rcpp:::CxxFlags()"` -I.
PKG_LIBS=`$(R_HOME)/bin/Rscript -e "Rcpp:::LdFlags()"` 
g++ -std=gnu++11 -I"/usr/share/R/include" -DNDEBUG  -I"/tmp/RtmpcwuZam/checklibfdcc1727ff4e/Rcpp/include"   `/usr/lib/R/bin/Rscript -e "Rcpp:::CxxFlags()"` -I. -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g -c RcppExports.cpp -o RcppExports.o
Compiling with: 

# $HeadURL: $
# $Id: $


OBJECTS=protViz_init.o deisotoper.o aa2mass.o findNN_.o computeFragmentIons.o computeParentIonMass.o findNN.o RcppExports.o fasta.o
PKG_CXXFLAGS=`$(R_HOME)/bin/Rscript -e "Rcpp:::CxxFlags()"` -I.
PKG_LIBS=`$(R_HOME)/bin/Rscript -e "Rcpp:::LdFlags()"` 
g++ -std=gnu++11 -I"/usr/share/R/include" -DNDEBUG  -I"/tmp/RtmpcwuZam/checklibfdcc1727ff4e/Rcpp/include"   `/usr/lib/R/bin/Rscript -e "Rcpp:::CxxFlags()"` -I. -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g -c aa2mass.cpp -o aa2mass.o
Compiling with: 

# $HeadURL: $
# $Id: $


OBJECTS=protViz_init.o deisotoper.o aa2mass.o findNN_.o computeFragmentIons.o computeParentIonMass.o findNN.o RcppExports.o fasta.o
PKG_CXXFLAGS=`$(R_HOME)/bin/Rscript -e "Rcpp:::CxxFlags()"` -I.
PKG_LIBS=`$(R_HOME)/bin/Rscript -e "Rcpp:::LdFlags()"` 
g++ -std=gnu++11 -I"/usr/share/R/include" -DNDEBUG  -I"/tmp/RtmpcwuZam/checklibfdcc1727ff4e/Rcpp/include"   `/usr/lib/R/bin/Rscript -e "Rcpp:::CxxFlags()"` -I. -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g -c deisotoper.cpp -o deisotoper.o
Compiling with: 

# $HeadURL: $
# $Id: $


OBJECTS=protViz_init.o deisotoper.o aa2mass.o findNN_.o computeFragmentIons.o computeParentIonMass.o findNN.o RcppExports.o fasta.o
PKG_CXXFLAGS=`$(R_HOME)/bin/Rscript -e "Rcpp:::CxxFlags()"` -I.
PKG_LIBS=`$(R_HOME)/bin/Rscript -e "Rcpp:::LdFlags()"` 
ERROR: compilation failed for package ‘protViz’
* removing ‘/tmp/RtmpcwuZam/filefdcc26c00807/protViz.Rcheck/protViz’

```
# bsts

Version: 0.8.0

## Newly broken

*   checking whether package ‘bsts’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/RtmpD0aMxw/filea552a17dc7e/bsts.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘bsts’ ...
** package ‘bsts’ successfully unpacked and MD5 sums checked
** libs
g++ -std=gnu++11 -I"/usr/share/R/include" -DNDEBUG -I`/usr/lib/R/bin/Rscript -e "cat(system.file(package='Boom'))"`/include -DADD_ -DR_NO_REMAP -DRLANGUAGE  -I"/tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include" -I"/tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include"    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g -c bsts_init.cc -o bsts_init.o
Compiling with: 
BOOM_DIR = `$(R_HOME)/bin/Rscript -e "cat(system.file(package='Boom'))"`
BOOM_LIB = ${BOOM_DIR}/lib${R_ARCH}/libboom.a
PKG_LIBS = ${BOOM_LIB}
PKG_CPPFLAGS = -I${BOOM_DIR}/include -DADD_ -DR_NO_REMAP -DRLANGUAGE 
CXX_STD = CXX11
g++ -std=gnu++11 -I"/usr/share/R/include" -DNDEBUG -I`/usr/lib/R/bin/Rscript -e "cat(system.file(package='Boom'))"`/include -DADD_ -DR_NO_REMAP -DRLANGUAGE  -I"/tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include" -I"/tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include"    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g -c state_space_regression_model_manager.cc -o state_space_regression_model_manager.o
Compiling with: 
BOOM_DIR = `$(R_HOME)/bin/Rscript -e "cat(system.file(package='Boom'))"`
BOOM_LIB = ${BOOM_DIR}/lib${R_ARCH}/libboom.a
PKG_LIBS = ${BOOM_LIB}
PKG_CPPFLAGS = -I${BOOM_DIR}/include -DADD_ -DR_NO_REMAP -DRLANGUAGE 
CXX_STD = CXX11
Error in readRDS("/tmp/RtmpD0aMxw/filea55256389e3a") : 
  error reading from connection
Calls: .Last -> readRDS
g++: error: traceback(1): No such file or directory
g++: error: 2:: No such file or directory
g++: error: readRDS("/tmp/RtmpD0aMxw/filea55256389e3a"): No such file or directory
g++: error: 1:: No such file or directory
g++: error: .Last()/include: No such file or directory
/usr/lib/R/etc/Makeconf:166: recipe for target 'state_space_regression_model_manager.o' failed
make: *** [state_space_regression_model_manager.o] Error 1
make: *** Waiting for unfinished jobs....
g++ -std=gnu++11 -I"/usr/share/R/include" -DNDEBUG -I`/usr/lib/R/bin/Rscript -e "cat(system.file(package='Boom'))"`/include -DADD_ -DR_NO_REMAP -DRLANGUAGE  -I"/tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include" -I"/tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include"    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g -c aggregate_time_series.cc -o aggregate_time_series.o
Compiling with: 
BOOM_DIR = `$(R_HOME)/bin/Rscript -e "cat(system.file(package='Boom'))"`
BOOM_LIB = ${BOOM_DIR}/lib${R_ARCH}/libboom.a
PKG_LIBS = ${BOOM_LIB}
PKG_CPPFLAGS = -I${BOOM_DIR}/include -DADD_ -DR_NO_REMAP -DRLANGUAGE 
CXX_STD = CXX11
g++ -std=gnu++11 -I"/usr/share/R/include" -DNDEBUG -I`/usr/lib/R/bin/Rscript -e "cat(system.file(package='Boom'))"`/include -DADD_ -DR_NO_REMAP -DRLANGUAGE  -I"/tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include" -I"/tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include"    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g -c get_date_ranges.cc -o get_date_ranges.o
Compiling with: 
BOOM_DIR = `$(R_HOME)/bin/Rscript -e "cat(system.file(package='Boom'))"`
BOOM_LIB = ${BOOM_DIR}/lib${R_ARCH}/libboom.a
PKG_LIBS = ${BOOM_LIB}
PKG_CPPFLAGS = -I${BOOM_DIR}/include -DADD_ -DR_NO_REMAP -DRLANGUAGE 
CXX_STD = CXX11
In file included from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/smart_ptr/shared_ptr.hpp:28:0,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/shared_ptr.hpp:17,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/r_interface/create_state_model.hpp:24,
                 from get_date_ranges.cc:24:
/tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/smart_ptr/detail/shared_count.hpp:355:33: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     explicit shared_count( std::auto_ptr<Y> & r ): pi_( new sp_counted_impl_p<Y>( r.get() ) )
                                 ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from get_date_ranges.cc:23:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/r_interface/create_state_model.hpp:24,
                 from get_date_ranges.cc:24:
/tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/smart_ptr/shared_ptr.hpp:256:65: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
 template< class T, class R > struct sp_enable_if_auto_ptr< std::auto_ptr< T >, R >
                                                                 ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from get_date_ranges.cc:23:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/r_interface/create_state_model.hpp:24,
                 from get_date_ranges.cc:24:
/tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/smart_ptr/shared_ptr.hpp:471:31: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     explicit shared_ptr( std::auto_ptr<Y> & r ): px(r.get()), pn()
                               ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from get_date_ranges.cc:23:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/r_interface/create_state_model.hpp:24,
                 from get_date_ranges.cc:24:
/tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/smart_ptr/shared_ptr.hpp:484:22: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr( std::auto_ptr<Y> && r ): px(r.get()), pn()
                      ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from get_date_ranges.cc:23:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/r_interface/create_state_model.hpp:24,
                 from get_date_ranges.cc:24:
/tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/smart_ptr/shared_ptr.hpp:567:34: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr & operator=( std::auto_ptr<Y> & r )
                                  ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from get_date_ranges.cc:23:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/r_interface/create_state_model.hpp:24,
                 from get_date_ranges.cc:24:
/tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/smart_ptr/shared_ptr.hpp:576:34: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr & operator=( std::auto_ptr<Y> && r )
                                  ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from get_date_ranges.cc:23:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/r_interface/create_state_model.hpp:24,
                 from get_date_ranges.cc:24:
/tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/smart_ptr/shared_ptr.hpp: In member function ‘boost::shared_ptr<T>& boost::shared_ptr<T>::operator=(std::auto_ptr<_Up>&&)’:
/tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/smart_ptr/shared_ptr.hpp:578:38: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
         this_type( static_cast< std::auto_ptr<Y> && >( r ) ).swap( *this );
                                      ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from get_date_ranges.cc:23:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
g++ -std=gnu++11 -I"/usr/share/R/include" -DNDEBUG -I`/usr/lib/R/bin/Rscript -e "cat(system.file(package='Boom'))"`/include -DADD_ -DR_NO_REMAP -DRLANGUAGE  -I"/tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include" -I"/tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include"    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g -c utils.cc -o utils.o
Compiling with: 
BOOM_DIR = `$(R_HOME)/bin/Rscript -e "cat(system.file(package='Boom'))"`
BOOM_LIB = ${BOOM_DIR}/lib${R_ARCH}/libboom.a
PKG_LIBS = ${BOOM_LIB}
PKG_CPPFLAGS = -I${BOOM_DIR}/include -DADD_ -DR_NO_REMAP -DRLANGUAGE 
CXX_STD = CXX11
In file included from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/smart_ptr/shared_ptr.hpp:28:0,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/shared_ptr.hpp:17,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from utils.h:23,
                 from utils.cc:17:
/tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/smart_ptr/detail/shared_count.hpp:355:33: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     explicit shared_count( std::auto_ptr<Y> & r ): pi_( new sp_counted_impl_p<Y>( r.get() ) )
                                 ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from utils.h:20,
                 from utils.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from utils.h:23,
                 from utils.cc:17:
/tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/smart_ptr/shared_ptr.hpp:256:65: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
 template< class T, class R > struct sp_enable_if_auto_ptr< std::auto_ptr< T >, R >
                                                                 ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from utils.h:20,
                 from utils.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from utils.h:23,
                 from utils.cc:17:
/tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/smart_ptr/shared_ptr.hpp:471:31: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     explicit shared_ptr( std::auto_ptr<Y> & r ): px(r.get()), pn()
                               ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from utils.h:20,
                 from utils.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from utils.h:23,
                 from utils.cc:17:
/tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/smart_ptr/shared_ptr.hpp:484:22: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr( std::auto_ptr<Y> && r ): px(r.get()), pn()
                      ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from utils.h:20,
                 from utils.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from utils.h:23,
                 from utils.cc:17:
/tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/smart_ptr/shared_ptr.hpp:567:34: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr & operator=( std::auto_ptr<Y> & r )
                                  ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from utils.h:20,
                 from utils.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from utils.h:23,
                 from utils.cc:17:
/tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/smart_ptr/shared_ptr.hpp:576:34: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr & operator=( std::auto_ptr<Y> && r )
                                  ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from utils.h:20,
                 from utils.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from utils.h:23,
                 from utils.cc:17:
/tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/smart_ptr/shared_ptr.hpp: In member function ‘boost::shared_ptr<T>& boost::shared_ptr<T>::operator=(std::auto_ptr<_Up>&&)’:
/tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/smart_ptr/shared_ptr.hpp:578:38: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
         this_type( static_cast< std::auto_ptr<Y> && >( r ) ).swap( *this );
                                      ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from utils.h:20,
                 from utils.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
g++ -std=gnu++11 -I"/usr/share/R/include" -DNDEBUG -I`/usr/lib/R/bin/Rscript -e "cat(system.file(package='Boom'))"`/include -DADD_ -DR_NO_REMAP -DRLANGUAGE  -I"/tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include" -I"/tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include"    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g -c mixed_frequency.cc -o mixed_frequency.o
Compiling with: 
BOOM_DIR = `$(R_HOME)/bin/Rscript -e "cat(system.file(package='Boom'))"`
BOOM_LIB = ${BOOM_DIR}/lib${R_ARCH}/libboom.a
PKG_LIBS = ${BOOM_LIB}
PKG_CPPFLAGS = -I${BOOM_DIR}/include -DADD_ -DR_NO_REMAP -DRLANGUAGE 
CXX_STD = CXX11
In file included from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/smart_ptr/shared_ptr.hpp:28:0,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/shared_ptr.hpp:17,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/r_interface/create_state_model.hpp:24,
                 from mixed_frequency.cc:20:
/tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/smart_ptr/detail/shared_count.hpp:355:33: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     explicit shared_count( std::auto_ptr<Y> & r ): pi_( new sp_counted_impl_p<Y>( r.get() ) )
                                 ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from mixed_frequency.cc:19:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/r_interface/create_state_model.hpp:24,
                 from mixed_frequency.cc:20:
/tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/smart_ptr/shared_ptr.hpp:256:65: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
 template< class T, class R > struct sp_enable_if_auto_ptr< std::auto_ptr< T >, R >
                                                                 ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from mixed_frequency.cc:19:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/r_interface/create_state_model.hpp:24,
                 from mixed_frequency.cc:20:
/tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/smart_ptr/shared_ptr.hpp:471:31: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     explicit shared_ptr( std::auto_ptr<Y> & r ): px(r.get()), pn()
                               ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from mixed_frequency.cc:19:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/r_interface/create_state_model.hpp:24,
                 from mixed_frequency.cc:20:
/tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/smart_ptr/shared_ptr.hpp:484:22: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr( std::auto_ptr<Y> && r ): px(r.get()), pn()
                      ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from mixed_frequency.cc:19:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/r_interface/create_state_model.hpp:24,
                 from mixed_frequency.cc:20:
/tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/smart_ptr/shared_ptr.hpp:567:34: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr & operator=( std::auto_ptr<Y> & r )
                                  ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from mixed_frequency.cc:19:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/r_interface/create_state_model.hpp:24,
                 from mixed_frequency.cc:20:
/tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/smart_ptr/shared_ptr.hpp:576:34: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr & operator=( std::auto_ptr<Y> && r )
                                  ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from mixed_frequency.cc:19:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/r_interface/create_state_model.hpp:24,
                 from mixed_frequency.cc:20:
/tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/smart_ptr/shared_ptr.hpp: In member function ‘boost::shared_ptr<T>& boost::shared_ptr<T>::operator=(std::auto_ptr<_Up>&&)’:
/tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/smart_ptr/shared_ptr.hpp:578:38: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
         this_type( static_cast< std::auto_ptr<Y> && >( r ) ).swap( *this );
                                      ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from mixed_frequency.cc:19:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
g++ -std=gnu++11 -I"/usr/share/R/include" -DNDEBUG -I`/usr/lib/R/bin/Rscript -e "cat(system.file(package='Boom'))"`/include -DADD_ -DR_NO_REMAP -DRLANGUAGE  -I"/tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include" -I"/tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include"    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g -c state_space_gaussian_model_manager.cc -o state_space_gaussian_model_manager.o
Compiling with: 
BOOM_DIR = `$(R_HOME)/bin/Rscript -e "cat(system.file(package='Boom'))"`
BOOM_LIB = ${BOOM_DIR}/lib${R_ARCH}/libboom.a
PKG_LIBS = ${BOOM_LIB}
PKG_CPPFLAGS = -I${BOOM_DIR}/include -DADD_ -DR_NO_REMAP -DRLANGUAGE 
CXX_STD = CXX11
In file included from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/smart_ptr/shared_ptr.hpp:28:0,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/shared_ptr.hpp:17,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from state_space_gaussian_model_manager.h:20,
                 from state_space_gaussian_model_manager.cc:17:
/tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/smart_ptr/detail/shared_count.hpp:355:33: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     explicit shared_count( std::auto_ptr<Y> & r ): pi_( new sp_counted_impl_p<Y>( r.get() ) )
                                 ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from state_space_gaussian_model_manager.h:20,
                 from state_space_gaussian_model_manager.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from state_space_gaussian_model_manager.h:20,
                 from state_space_gaussian_model_manager.cc:17:
/tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/smart_ptr/shared_ptr.hpp:256:65: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
 template< class T, class R > struct sp_enable_if_auto_ptr< std::auto_ptr< T >, R >
                                                                 ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from state_space_gaussian_model_manager.h:20,
                 from state_space_gaussian_model_manager.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from state_space_gaussian_model_manager.h:20,
                 from state_space_gaussian_model_manager.cc:17:
/tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/smart_ptr/shared_ptr.hpp:471:31: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     explicit shared_ptr( std::auto_ptr<Y> & r ): px(r.get()), pn()
                               ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from state_space_gaussian_model_manager.h:20,
                 from state_space_gaussian_model_manager.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from state_space_gaussian_model_manager.h:20,
                 from state_space_gaussian_model_manager.cc:17:
/tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/smart_ptr/shared_ptr.hpp:484:22: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr( std::auto_ptr<Y> && r ): px(r.get()), pn()
                      ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from state_space_gaussian_model_manager.h:20,
                 from state_space_gaussian_model_manager.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from state_space_gaussian_model_manager.h:20,
                 from state_space_gaussian_model_manager.cc:17:
/tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/smart_ptr/shared_ptr.hpp:567:34: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr & operator=( std::auto_ptr<Y> & r )
                                  ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from state_space_gaussian_model_manager.h:20,
                 from state_space_gaussian_model_manager.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from state_space_gaussian_model_manager.h:20,
                 from state_space_gaussian_model_manager.cc:17:
/tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/smart_ptr/shared_ptr.hpp:576:34: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr & operator=( std::auto_ptr<Y> && r )
                                  ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from state_space_gaussian_model_manager.h:20,
                 from state_space_gaussian_model_manager.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from state_space_gaussian_model_manager.h:20,
                 from state_space_gaussian_model_manager.cc:17:
/tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/smart_ptr/shared_ptr.hpp: In member function ‘boost::shared_ptr<T>& boost::shared_ptr<T>::operator=(std::auto_ptr<_Up>&&)’:
/tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/smart_ptr/shared_ptr.hpp:578:38: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
         this_type( static_cast< std::auto_ptr<Y> && >( r ) ).swap( *this );
                                      ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from state_space_gaussian_model_manager.h:20,
                 from state_space_gaussian_model_manager.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
g++ -std=gnu++11 -I"/usr/share/R/include" -DNDEBUG -I`/usr/lib/R/bin/Rscript -e "cat(system.file(package='Boom'))"`/include -DADD_ -DR_NO_REMAP -DRLANGUAGE  -I"/tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include" -I"/tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include"    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g -c model_manager.cc -o model_manager.o
Compiling with: 
BOOM_DIR = `$(R_HOME)/bin/Rscript -e "cat(system.file(package='Boom'))"`
BOOM_LIB = ${BOOM_DIR}/lib${R_ARCH}/libboom.a
PKG_LIBS = ${BOOM_LIB}
PKG_CPPFLAGS = -I${BOOM_DIR}/include -DADD_ -DR_NO_REMAP -DRLANGUAGE 
CXX_STD = CXX11
In file included from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/smart_ptr/shared_ptr.hpp:28:0,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/shared_ptr.hpp:17,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from model_manager.cc:19:
/tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/smart_ptr/detail/shared_count.hpp:355:33: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     explicit shared_count( std::auto_ptr<Y> & r ): pi_( new sp_counted_impl_p<Y>( r.get() ) )
                                 ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from model_manager.cc:19:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from model_manager.cc:19:
/tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/smart_ptr/shared_ptr.hpp:256:65: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
 template< class T, class R > struct sp_enable_if_auto_ptr< std::auto_ptr< T >, R >
                                                                 ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from model_manager.cc:19:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from model_manager.cc:19:
/tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/smart_ptr/shared_ptr.hpp:471:31: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     explicit shared_ptr( std::auto_ptr<Y> & r ): px(r.get()), pn()
                               ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from model_manager.cc:19:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from model_manager.cc:19:
/tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/smart_ptr/shared_ptr.hpp:484:22: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr( std::auto_ptr<Y> && r ): px(r.get()), pn()
                      ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from model_manager.cc:19:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from model_manager.cc:19:
/tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/smart_ptr/shared_ptr.hpp:567:34: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr & operator=( std::auto_ptr<Y> & r )
                                  ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from model_manager.cc:19:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from model_manager.cc:19:
/tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/smart_ptr/shared_ptr.hpp:576:34: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr & operator=( std::auto_ptr<Y> && r )
                                  ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from model_manager.cc:19:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from model_manager.cc:19:
/tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/smart_ptr/shared_ptr.hpp: In member function ‘boost::shared_ptr<T>& boost::shared_ptr<T>::operator=(std::auto_ptr<_Up>&&)’:
/tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/smart_ptr/shared_ptr.hpp:578:38: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
         this_type( static_cast< std::auto_ptr<Y> && >( r ) ).swap( *this );
                                      ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from model_manager.cc:19:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
g++ -std=gnu++11 -I"/usr/share/R/include" -DNDEBUG -I`/usr/lib/R/bin/Rscript -e "cat(system.file(package='Boom'))"`/include -DADD_ -DR_NO_REMAP -DRLANGUAGE  -I"/tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include" -I"/tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include"    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g -c state_space_poisson_model_manager.cc -o state_space_poisson_model_manager.o
Compiling with: 
BOOM_DIR = `$(R_HOME)/bin/Rscript -e "cat(system.file(package='Boom'))"`
BOOM_LIB = ${BOOM_DIR}/lib${R_ARCH}/libboom.a
PKG_LIBS = ${BOOM_LIB}
PKG_CPPFLAGS = -I${BOOM_DIR}/include -DADD_ -DR_NO_REMAP -DRLANGUAGE 
CXX_STD = CXX11
In file included from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/smart_ptr/shared_ptr.hpp:28:0,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/shared_ptr.hpp:17,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from state_space_poisson_model_manager.h:20,
                 from state_space_poisson_model_manager.cc:17:
/tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/smart_ptr/detail/shared_count.hpp:355:33: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     explicit shared_count( std::auto_ptr<Y> & r ): pi_( new sp_counted_impl_p<Y>( r.get() ) )
                                 ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from state_space_poisson_model_manager.h:20,
                 from state_space_poisson_model_manager.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from state_space_poisson_model_manager.h:20,
                 from state_space_poisson_model_manager.cc:17:
/tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/smart_ptr/shared_ptr.hpp:256:65: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
 template< class T, class R > struct sp_enable_if_auto_ptr< std::auto_ptr< T >, R >
                                                                 ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from state_space_poisson_model_manager.h:20,
                 from state_space_poisson_model_manager.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from state_space_poisson_model_manager.h:20,
                 from state_space_poisson_model_manager.cc:17:
/tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/smart_ptr/shared_ptr.hpp:471:31: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     explicit shared_ptr( std::auto_ptr<Y> & r ): px(r.get()), pn()
                               ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from state_space_poisson_model_manager.h:20,
                 from state_space_poisson_model_manager.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from state_space_poisson_model_manager.h:20,
                 from state_space_poisson_model_manager.cc:17:
/tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/smart_ptr/shared_ptr.hpp:484:22: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr( std::auto_ptr<Y> && r ): px(r.get()), pn()
                      ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from state_space_poisson_model_manager.h:20,
                 from state_space_poisson_model_manager.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from state_space_poisson_model_manager.h:20,
                 from state_space_poisson_model_manager.cc:17:
/tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/smart_ptr/shared_ptr.hpp:567:34: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr & operator=( std::auto_ptr<Y> & r )
                                  ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from state_space_poisson_model_manager.h:20,
                 from state_space_poisson_model_manager.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from state_space_poisson_model_manager.h:20,
                 from state_space_poisson_model_manager.cc:17:
/tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/smart_ptr/shared_ptr.hpp:576:34: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr & operator=( std::auto_ptr<Y> && r )
                                  ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from state_space_poisson_model_manager.h:20,
                 from state_space_poisson_model_manager.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from state_space_poisson_model_manager.h:20,
                 from state_space_poisson_model_manager.cc:17:
/tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/smart_ptr/shared_ptr.hpp: In member function ‘boost::shared_ptr<T>& boost::shared_ptr<T>::operator=(std::auto_ptr<_Up>&&)’:
/tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/smart_ptr/shared_ptr.hpp:578:38: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
         this_type( static_cast< std::auto_ptr<Y> && >( r ) ).swap( *this );
                                      ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from state_space_poisson_model_manager.h:20,
                 from state_space_poisson_model_manager.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
g++ -std=gnu++11 -I"/usr/share/R/include" -DNDEBUG -I`/usr/lib/R/bin/Rscript -e "cat(system.file(package='Boom'))"`/include -DADD_ -DR_NO_REMAP -DRLANGUAGE  -I"/tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include" -I"/tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include"    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g -c state_space_logit_model_manager.cc -o state_space_logit_model_manager.o
Compiling with: 
BOOM_DIR = `$(R_HOME)/bin/Rscript -e "cat(system.file(package='Boom'))"`
BOOM_LIB = ${BOOM_DIR}/lib${R_ARCH}/libboom.a
PKG_LIBS = ${BOOM_LIB}
PKG_CPPFLAGS = -I${BOOM_DIR}/include -DADD_ -DR_NO_REMAP -DRLANGUAGE 
CXX_STD = CXX11
In file included from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/smart_ptr/shared_ptr.hpp:28:0,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/shared_ptr.hpp:17,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from state_space_logit_model_manager.h:20,
                 from state_space_logit_model_manager.cc:17:
/tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/smart_ptr/detail/shared_count.hpp:355:33: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     explicit shared_count( std::auto_ptr<Y> & r ): pi_( new sp_counted_impl_p<Y>( r.get() ) )
                                 ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from state_space_logit_model_manager.h:20,
                 from state_space_logit_model_manager.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from state_space_logit_model_manager.h:20,
                 from state_space_logit_model_manager.cc:17:
/tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/smart_ptr/shared_ptr.hpp:256:65: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
 template< class T, class R > struct sp_enable_if_auto_ptr< std::auto_ptr< T >, R >
                                                                 ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from state_space_logit_model_manager.h:20,
                 from state_space_logit_model_manager.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from state_space_logit_model_manager.h:20,
                 from state_space_logit_model_manager.cc:17:
/tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/smart_ptr/shared_ptr.hpp:471:31: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     explicit shared_ptr( std::auto_ptr<Y> & r ): px(r.get()), pn()
                               ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from state_space_logit_model_manager.h:20,
                 from state_space_logit_model_manager.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from state_space_logit_model_manager.h:20,
                 from state_space_logit_model_manager.cc:17:
/tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/smart_ptr/shared_ptr.hpp:484:22: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr( std::auto_ptr<Y> && r ): px(r.get()), pn()
                      ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from state_space_logit_model_manager.h:20,
                 from state_space_logit_model_manager.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from state_space_logit_model_manager.h:20,
                 from state_space_logit_model_manager.cc:17:
/tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/smart_ptr/shared_ptr.hpp:567:34: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr & operator=( std::auto_ptr<Y> & r )
                                  ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from state_space_logit_model_manager.h:20,
                 from state_space_logit_model_manager.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from state_space_logit_model_manager.h:20,
                 from state_space_logit_model_manager.cc:17:
/tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/smart_ptr/shared_ptr.hpp:576:34: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr & operator=( std::auto_ptr<Y> && r )
                                  ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from state_space_logit_model_manager.h:20,
                 from state_space_logit_model_manager.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from state_space_logit_model_manager.h:20,
                 from state_space_logit_model_manager.cc:17:
/tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/smart_ptr/shared_ptr.hpp: In member function ‘boost::shared_ptr<T>& boost::shared_ptr<T>::operator=(std::auto_ptr<_Up>&&)’:
/tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/smart_ptr/shared_ptr.hpp:578:38: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
         this_type( static_cast< std::auto_ptr<Y> && >( r ) ).swap( *this );
                                      ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from state_space_logit_model_manager.h:20,
                 from state_space_logit_model_manager.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
g++ -std=gnu++11 -I"/usr/share/R/include" -DNDEBUG -I`/usr/lib/R/bin/Rscript -e "cat(system.file(package='Boom'))"`/include -DADD_ -DR_NO_REMAP -DRLANGUAGE  -I"/tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include" -I"/tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include"    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g -c bsts.cc -o bsts.o
Compiling with: 
BOOM_DIR = `$(R_HOME)/bin/Rscript -e "cat(system.file(package='Boom'))"`
BOOM_LIB = ${BOOM_DIR}/lib${R_ARCH}/libboom.a
PKG_LIBS = ${BOOM_LIB}
PKG_CPPFLAGS = -I${BOOM_DIR}/include -DADD_ -DR_NO_REMAP -DRLANGUAGE 
CXX_STD = CXX11
In file included from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/smart_ptr/shared_ptr.hpp:28:0,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/shared_ptr.hpp:17,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from bsts.cc:20:
/tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/smart_ptr/detail/shared_count.hpp:355:33: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     explicit shared_count( std::auto_ptr<Y> & r ): pi_( new sp_counted_impl_p<Y>( r.get() ) )
                                 ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from bsts.cc:20:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from bsts.cc:20:
/tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/smart_ptr/shared_ptr.hpp:256:65: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
 template< class T, class R > struct sp_enable_if_auto_ptr< std::auto_ptr< T >, R >
                                                                 ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from bsts.cc:20:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from bsts.cc:20:
/tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/smart_ptr/shared_ptr.hpp:471:31: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     explicit shared_ptr( std::auto_ptr<Y> & r ): px(r.get()), pn()
                               ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from bsts.cc:20:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from bsts.cc:20:
/tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/smart_ptr/shared_ptr.hpp:484:22: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr( std::auto_ptr<Y> && r ): px(r.get()), pn()
                      ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from bsts.cc:20:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from bsts.cc:20:
/tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/smart_ptr/shared_ptr.hpp:567:34: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr & operator=( std::auto_ptr<Y> & r )
                                  ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from bsts.cc:20:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from bsts.cc:20:
/tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/smart_ptr/shared_ptr.hpp:576:34: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr & operator=( std::auto_ptr<Y> && r )
                                  ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from bsts.cc:20:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from bsts.cc:20:
/tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/smart_ptr/shared_ptr.hpp: In member function ‘boost::shared_ptr<T>& boost::shared_ptr<T>::operator=(std::auto_ptr<_Up>&&)’:
/tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/smart_ptr/shared_ptr.hpp:578:38: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
         this_type( static_cast< std::auto_ptr<Y> && >( r ) ).swap( *this );
                                      ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from bsts.cc:20:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
g++ -std=gnu++11 -I"/usr/share/R/include" -DNDEBUG -I`/usr/lib/R/bin/Rscript -e "cat(system.file(package='Boom'))"`/include -DADD_ -DR_NO_REMAP -DRLANGUAGE  -I"/tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include" -I"/tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include"    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g -c state_space_student_model_manager.cc -o state_space_student_model_manager.o
Compiling with: 
BOOM_DIR = `$(R_HOME)/bin/Rscript -e "cat(system.file(package='Boom'))"`
BOOM_LIB = ${BOOM_DIR}/lib${R_ARCH}/libboom.a
PKG_LIBS = ${BOOM_LIB}
PKG_CPPFLAGS = -I${BOOM_DIR}/include -DADD_ -DR_NO_REMAP -DRLANGUAGE 
CXX_STD = CXX11
In file included from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/smart_ptr/shared_ptr.hpp:28:0,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/shared_ptr.hpp:17,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from state_space_student_model_manager.h:20,
                 from state_space_student_model_manager.cc:17:
/tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/smart_ptr/detail/shared_count.hpp:355:33: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     explicit shared_count( std::auto_ptr<Y> & r ): pi_( new sp_counted_impl_p<Y>( r.get() ) )
                                 ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from state_space_student_model_manager.h:20,
                 from state_space_student_model_manager.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from state_space_student_model_manager.h:20,
                 from state_space_student_model_manager.cc:17:
/tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/smart_ptr/shared_ptr.hpp:256:65: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
 template< class T, class R > struct sp_enable_if_auto_ptr< std::auto_ptr< T >, R >
                                                                 ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from state_space_student_model_manager.h:20,
                 from state_space_student_model_manager.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from state_space_student_model_manager.h:20,
                 from state_space_student_model_manager.cc:17:
/tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/smart_ptr/shared_ptr.hpp:471:31: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     explicit shared_ptr( std::auto_ptr<Y> & r ): px(r.get()), pn()
                               ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from state_space_student_model_manager.h:20,
                 from state_space_student_model_manager.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from state_space_student_model_manager.h:20,
                 from state_space_student_model_manager.cc:17:
/tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/smart_ptr/shared_ptr.hpp:484:22: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr( std::auto_ptr<Y> && r ): px(r.get()), pn()
                      ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from state_space_student_model_manager.h:20,
                 from state_space_student_model_manager.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from state_space_student_model_manager.h:20,
                 from state_space_student_model_manager.cc:17:
/tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/smart_ptr/shared_ptr.hpp:567:34: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr & operator=( std::auto_ptr<Y> & r )
                                  ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from state_space_student_model_manager.h:20,
                 from state_space_student_model_manager.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from state_space_student_model_manager.h:20,
                 from state_space_student_model_manager.cc:17:
/tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/smart_ptr/shared_ptr.hpp:576:34: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr & operator=( std::auto_ptr<Y> && r )
                                  ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from state_space_student_model_manager.h:20,
                 from state_space_student_model_manager.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from state_space_student_model_manager.h:20,
                 from state_space_student_model_manager.cc:17:
/tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/smart_ptr/shared_ptr.hpp: In member function ‘boost::shared_ptr<T>& boost::shared_ptr<T>::operator=(std::auto_ptr<_Up>&&)’:
/tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/smart_ptr/shared_ptr.hpp:578:38: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
         this_type( static_cast< std::auto_ptr<Y> && >( r ) ).swap( *this );
                                      ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpD0aMxw/checkliba55234e5c8b2/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from state_space_student_model_manager.h:20,
                 from state_space_student_model_manager.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
ERROR: compilation failed for package ‘bsts’
* removing ‘/tmp/RtmpD0aMxw/filea552a17dc7e/bsts.Rcheck/bsts’

```
### CRAN

```
* installing *source* package ‘bsts’ ...
** package ‘bsts’ successfully unpacked and MD5 sums checked
** libs
g++ -std=gnu++11 -I"/usr/share/R/include" -DNDEBUG -I`/usr/lib/R/bin/Rscript -e "cat(system.file(package='Boom'))"`/include -DADD_ -DR_NO_REMAP -DRLANGUAGE  -I"/tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include" -I"/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include"    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g -c bsts_init.cc -o bsts_init.o
Compiling with: 
BOOM_DIR = `$(R_HOME)/bin/Rscript -e "cat(system.file(package='Boom'))"`
BOOM_LIB = ${BOOM_DIR}/lib${R_ARCH}/libboom.a
PKG_LIBS = ${BOOM_LIB}
PKG_CPPFLAGS = -I${BOOM_DIR}/include -DADD_ -DR_NO_REMAP -DRLANGUAGE 
CXX_STD = CXX11
g++ -std=gnu++11 -I"/usr/share/R/include" -DNDEBUG -I`/usr/lib/R/bin/Rscript -e "cat(system.file(package='Boom'))"`/include -DADD_ -DR_NO_REMAP -DRLANGUAGE  -I"/tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include" -I"/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include"    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g -c aggregate_time_series.cc -o aggregate_time_series.o
Compiling with: 
BOOM_DIR = `$(R_HOME)/bin/Rscript -e "cat(system.file(package='Boom'))"`
BOOM_LIB = ${BOOM_DIR}/lib${R_ARCH}/libboom.a
PKG_LIBS = ${BOOM_LIB}
PKG_CPPFLAGS = -I${BOOM_DIR}/include -DADD_ -DR_NO_REMAP -DRLANGUAGE 
CXX_STD = CXX11
g++ -std=gnu++11 -I"/usr/share/R/include" -DNDEBUG -I`/usr/lib/R/bin/Rscript -e "cat(system.file(package='Boom'))"`/include -DADD_ -DR_NO_REMAP -DRLANGUAGE  -I"/tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include" -I"/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include"    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g -c get_date_ranges.cc -o get_date_ranges.o
Compiling with: 
BOOM_DIR = `$(R_HOME)/bin/Rscript -e "cat(system.file(package='Boom'))"`
BOOM_LIB = ${BOOM_DIR}/lib${R_ARCH}/libboom.a
PKG_LIBS = ${BOOM_LIB}
PKG_CPPFLAGS = -I${BOOM_DIR}/include -DADD_ -DR_NO_REMAP -DRLANGUAGE 
CXX_STD = CXX11
In file included from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/shared_ptr.hpp:28:0,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/shared_ptr.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/create_state_model.hpp:24,
                 from get_date_ranges.cc:24:
/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/detail/shared_count.hpp:355:33: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     explicit shared_count( std::auto_ptr<Y> & r ): pi_( new sp_counted_impl_p<Y>( r.get() ) )
                                 ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from get_date_ranges.cc:23:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/create_state_model.hpp:24,
                 from get_date_ranges.cc:24:
/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/shared_ptr.hpp:256:65: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
 template< class T, class R > struct sp_enable_if_auto_ptr< std::auto_ptr< T >, R >
                                                                 ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from get_date_ranges.cc:23:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/create_state_model.hpp:24,
                 from get_date_ranges.cc:24:
/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/shared_ptr.hpp:471:31: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     explicit shared_ptr( std::auto_ptr<Y> & r ): px(r.get()), pn()
                               ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from get_date_ranges.cc:23:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/create_state_model.hpp:24,
                 from get_date_ranges.cc:24:
/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/shared_ptr.hpp:484:22: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr( std::auto_ptr<Y> && r ): px(r.get()), pn()
                      ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from get_date_ranges.cc:23:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/create_state_model.hpp:24,
                 from get_date_ranges.cc:24:
/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/shared_ptr.hpp:567:34: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr & operator=( std::auto_ptr<Y> & r )
                                  ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from get_date_ranges.cc:23:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/create_state_model.hpp:24,
                 from get_date_ranges.cc:24:
/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/shared_ptr.hpp:576:34: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr & operator=( std::auto_ptr<Y> && r )
                                  ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from get_date_ranges.cc:23:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/create_state_model.hpp:24,
                 from get_date_ranges.cc:24:
/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/shared_ptr.hpp: In member function ‘boost::shared_ptr<T>& boost::shared_ptr<T>::operator=(std::auto_ptr<_Up>&&)’:
/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/shared_ptr.hpp:578:38: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
         this_type( static_cast< std::auto_ptr<Y> && >( r ) ).swap( *this );
                                      ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from get_date_ranges.cc:23:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
g++ -std=gnu++11 -I"/usr/share/R/include" -DNDEBUG -I`/usr/lib/R/bin/Rscript -e "cat(system.file(package='Boom'))"`/include -DADD_ -DR_NO_REMAP -DRLANGUAGE  -I"/tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include" -I"/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include"    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g -c utils.cc -o utils.o
Compiling with: 
BOOM_DIR = `$(R_HOME)/bin/Rscript -e "cat(system.file(package='Boom'))"`
BOOM_LIB = ${BOOM_DIR}/lib${R_ARCH}/libboom.a
PKG_LIBS = ${BOOM_LIB}
PKG_CPPFLAGS = -I${BOOM_DIR}/include -DADD_ -DR_NO_REMAP -DRLANGUAGE 
CXX_STD = CXX11
In file included from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/shared_ptr.hpp:28:0,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/shared_ptr.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from utils.h:23,
                 from utils.cc:17:
/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/detail/shared_count.hpp:355:33: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     explicit shared_count( std::auto_ptr<Y> & r ): pi_( new sp_counted_impl_p<Y>( r.get() ) )
                                 ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from utils.h:20,
                 from utils.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from utils.h:23,
                 from utils.cc:17:
/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/shared_ptr.hpp:256:65: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
 template< class T, class R > struct sp_enable_if_auto_ptr< std::auto_ptr< T >, R >
                                                                 ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from utils.h:20,
                 from utils.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from utils.h:23,
                 from utils.cc:17:
/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/shared_ptr.hpp:471:31: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     explicit shared_ptr( std::auto_ptr<Y> & r ): px(r.get()), pn()
                               ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from utils.h:20,
                 from utils.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from utils.h:23,
                 from utils.cc:17:
/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/shared_ptr.hpp:484:22: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr( std::auto_ptr<Y> && r ): px(r.get()), pn()
                      ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from utils.h:20,
                 from utils.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from utils.h:23,
                 from utils.cc:17:
/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/shared_ptr.hpp:567:34: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr & operator=( std::auto_ptr<Y> & r )
                                  ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from utils.h:20,
                 from utils.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from utils.h:23,
                 from utils.cc:17:
/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/shared_ptr.hpp:576:34: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr & operator=( std::auto_ptr<Y> && r )
                                  ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from utils.h:20,
                 from utils.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from utils.h:23,
                 from utils.cc:17:
/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/shared_ptr.hpp: In member function ‘boost::shared_ptr<T>& boost::shared_ptr<T>::operator=(std::auto_ptr<_Up>&&)’:
/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/shared_ptr.hpp:578:38: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
         this_type( static_cast< std::auto_ptr<Y> && >( r ) ).swap( *this );
                                      ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from utils.h:20,
                 from utils.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
g++ -std=gnu++11 -I"/usr/share/R/include" -DNDEBUG -I`/usr/lib/R/bin/Rscript -e "cat(system.file(package='Boom'))"`/include -DADD_ -DR_NO_REMAP -DRLANGUAGE  -I"/tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include" -I"/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include"    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g -c state_space_poisson_model_manager.cc -o state_space_poisson_model_manager.o
Compiling with: 
BOOM_DIR = `$(R_HOME)/bin/Rscript -e "cat(system.file(package='Boom'))"`
BOOM_LIB = ${BOOM_DIR}/lib${R_ARCH}/libboom.a
PKG_LIBS = ${BOOM_LIB}
PKG_CPPFLAGS = -I${BOOM_DIR}/include -DADD_ -DR_NO_REMAP -DRLANGUAGE 
CXX_STD = CXX11
In file included from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/shared_ptr.hpp:28:0,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/shared_ptr.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from state_space_poisson_model_manager.h:20,
                 from state_space_poisson_model_manager.cc:17:
/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/detail/shared_count.hpp:355:33: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     explicit shared_count( std::auto_ptr<Y> & r ): pi_( new sp_counted_impl_p<Y>( r.get() ) )
                                 ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from state_space_poisson_model_manager.h:20,
                 from state_space_poisson_model_manager.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from state_space_poisson_model_manager.h:20,
                 from state_space_poisson_model_manager.cc:17:
/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/shared_ptr.hpp:256:65: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
 template< class T, class R > struct sp_enable_if_auto_ptr< std::auto_ptr< T >, R >
                                                                 ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from state_space_poisson_model_manager.h:20,
                 from state_space_poisson_model_manager.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from state_space_poisson_model_manager.h:20,
                 from state_space_poisson_model_manager.cc:17:
/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/shared_ptr.hpp:471:31: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     explicit shared_ptr( std::auto_ptr<Y> & r ): px(r.get()), pn()
                               ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from state_space_poisson_model_manager.h:20,
                 from state_space_poisson_model_manager.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from state_space_poisson_model_manager.h:20,
                 from state_space_poisson_model_manager.cc:17:
/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/shared_ptr.hpp:484:22: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr( std::auto_ptr<Y> && r ): px(r.get()), pn()
                      ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from state_space_poisson_model_manager.h:20,
                 from state_space_poisson_model_manager.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from state_space_poisson_model_manager.h:20,
                 from state_space_poisson_model_manager.cc:17:
/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/shared_ptr.hpp:567:34: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr & operator=( std::auto_ptr<Y> & r )
                                  ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from state_space_poisson_model_manager.h:20,
                 from state_space_poisson_model_manager.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from state_space_poisson_model_manager.h:20,
                 from state_space_poisson_model_manager.cc:17:
/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/shared_ptr.hpp:576:34: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr & operator=( std::auto_ptr<Y> && r )
                                  ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from state_space_poisson_model_manager.h:20,
                 from state_space_poisson_model_manager.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from state_space_poisson_model_manager.h:20,
                 from state_space_poisson_model_manager.cc:17:
/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/shared_ptr.hpp: In member function ‘boost::shared_ptr<T>& boost::shared_ptr<T>::operator=(std::auto_ptr<_Up>&&)’:
/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/shared_ptr.hpp:578:38: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
         this_type( static_cast< std::auto_ptr<Y> && >( r ) ).swap( *this );
                                      ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from state_space_poisson_model_manager.h:20,
                 from state_space_poisson_model_manager.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
g++ -std=gnu++11 -I"/usr/share/R/include" -DNDEBUG -I`/usr/lib/R/bin/Rscript -e "cat(system.file(package='Boom'))"`/include -DADD_ -DR_NO_REMAP -DRLANGUAGE  -I"/tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include" -I"/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include"    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g -c state_space_logit_model_manager.cc -o state_space_logit_model_manager.o
Compiling with: 
BOOM_DIR = `$(R_HOME)/bin/Rscript -e "cat(system.file(package='Boom'))"`
BOOM_LIB = ${BOOM_DIR}/lib${R_ARCH}/libboom.a
PKG_LIBS = ${BOOM_LIB}
PKG_CPPFLAGS = -I${BOOM_DIR}/include -DADD_ -DR_NO_REMAP -DRLANGUAGE 
CXX_STD = CXX11
In file included from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/shared_ptr.hpp:28:0,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/shared_ptr.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from state_space_logit_model_manager.h:20,
                 from state_space_logit_model_manager.cc:17:
/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/detail/shared_count.hpp:355:33: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     explicit shared_count( std::auto_ptr<Y> & r ): pi_( new sp_counted_impl_p<Y>( r.get() ) )
                                 ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from state_space_logit_model_manager.h:20,
                 from state_space_logit_model_manager.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from state_space_logit_model_manager.h:20,
                 from state_space_logit_model_manager.cc:17:
/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/shared_ptr.hpp:256:65: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
 template< class T, class R > struct sp_enable_if_auto_ptr< std::auto_ptr< T >, R >
                                                                 ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from state_space_logit_model_manager.h:20,
                 from state_space_logit_model_manager.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from state_space_logit_model_manager.h:20,
                 from state_space_logit_model_manager.cc:17:
/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/shared_ptr.hpp:471:31: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     explicit shared_ptr( std::auto_ptr<Y> & r ): px(r.get()), pn()
                               ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from state_space_logit_model_manager.h:20,
                 from state_space_logit_model_manager.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from state_space_logit_model_manager.h:20,
                 from state_space_logit_model_manager.cc:17:
/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/shared_ptr.hpp:484:22: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr( std::auto_ptr<Y> && r ): px(r.get()), pn()
                      ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from state_space_logit_model_manager.h:20,
                 from state_space_logit_model_manager.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from state_space_logit_model_manager.h:20,
                 from state_space_logit_model_manager.cc:17:
/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/shared_ptr.hpp:567:34: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr & operator=( std::auto_ptr<Y> & r )
                                  ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from state_space_logit_model_manager.h:20,
                 from state_space_logit_model_manager.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from state_space_logit_model_manager.h:20,
                 from state_space_logit_model_manager.cc:17:
/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/shared_ptr.hpp:576:34: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr & operator=( std::auto_ptr<Y> && r )
                                  ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from state_space_logit_model_manager.h:20,
                 from state_space_logit_model_manager.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from state_space_logit_model_manager.h:20,
                 from state_space_logit_model_manager.cc:17:
/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/shared_ptr.hpp: In member function ‘boost::shared_ptr<T>& boost::shared_ptr<T>::operator=(std::auto_ptr<_Up>&&)’:
/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/shared_ptr.hpp:578:38: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
         this_type( static_cast< std::auto_ptr<Y> && >( r ) ).swap( *this );
                                      ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from state_space_logit_model_manager.h:20,
                 from state_space_logit_model_manager.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
g++ -std=gnu++11 -I"/usr/share/R/include" -DNDEBUG -I`/usr/lib/R/bin/Rscript -e "cat(system.file(package='Boom'))"`/include -DADD_ -DR_NO_REMAP -DRLANGUAGE  -I"/tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include" -I"/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include"    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g -c state_space_gaussian_model_manager.cc -o state_space_gaussian_model_manager.o
Compiling with: 
BOOM_DIR = `$(R_HOME)/bin/Rscript -e "cat(system.file(package='Boom'))"`
BOOM_LIB = ${BOOM_DIR}/lib${R_ARCH}/libboom.a
PKG_LIBS = ${BOOM_LIB}
PKG_CPPFLAGS = -I${BOOM_DIR}/include -DADD_ -DR_NO_REMAP -DRLANGUAGE 
CXX_STD = CXX11
In file included from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/shared_ptr.hpp:28:0,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/shared_ptr.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from state_space_gaussian_model_manager.h:20,
                 from state_space_gaussian_model_manager.cc:17:
/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/detail/shared_count.hpp:355:33: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     explicit shared_count( std::auto_ptr<Y> & r ): pi_( new sp_counted_impl_p<Y>( r.get() ) )
                                 ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from state_space_gaussian_model_manager.h:20,
                 from state_space_gaussian_model_manager.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from state_space_gaussian_model_manager.h:20,
                 from state_space_gaussian_model_manager.cc:17:
/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/shared_ptr.hpp:256:65: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
 template< class T, class R > struct sp_enable_if_auto_ptr< std::auto_ptr< T >, R >
                                                                 ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from state_space_gaussian_model_manager.h:20,
                 from state_space_gaussian_model_manager.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from state_space_gaussian_model_manager.h:20,
                 from state_space_gaussian_model_manager.cc:17:
/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/shared_ptr.hpp:471:31: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     explicit shared_ptr( std::auto_ptr<Y> & r ): px(r.get()), pn()
                               ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from state_space_gaussian_model_manager.h:20,
                 from state_space_gaussian_model_manager.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from state_space_gaussian_model_manager.h:20,
                 from state_space_gaussian_model_manager.cc:17:
/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/shared_ptr.hpp:484:22: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr( std::auto_ptr<Y> && r ): px(r.get()), pn()
                      ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from state_space_gaussian_model_manager.h:20,
                 from state_space_gaussian_model_manager.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from state_space_gaussian_model_manager.h:20,
                 from state_space_gaussian_model_manager.cc:17:
/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/shared_ptr.hpp:567:34: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr & operator=( std::auto_ptr<Y> & r )
                                  ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from state_space_gaussian_model_manager.h:20,
                 from state_space_gaussian_model_manager.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from state_space_gaussian_model_manager.h:20,
                 from state_space_gaussian_model_manager.cc:17:
/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/shared_ptr.hpp:576:34: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr & operator=( std::auto_ptr<Y> && r )
                                  ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from state_space_gaussian_model_manager.h:20,
                 from state_space_gaussian_model_manager.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from state_space_gaussian_model_manager.h:20,
                 from state_space_gaussian_model_manager.cc:17:
/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/shared_ptr.hpp: In member function ‘boost::shared_ptr<T>& boost::shared_ptr<T>::operator=(std::auto_ptr<_Up>&&)’:
/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/shared_ptr.hpp:578:38: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
         this_type( static_cast< std::auto_ptr<Y> && >( r ) ).swap( *this );
                                      ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from state_space_gaussian_model_manager.h:20,
                 from state_space_gaussian_model_manager.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
g++ -std=gnu++11 -I"/usr/share/R/include" -DNDEBUG -I`/usr/lib/R/bin/Rscript -e "cat(system.file(package='Boom'))"`/include -DADD_ -DR_NO_REMAP -DRLANGUAGE  -I"/tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include" -I"/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include"    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g -c model_manager.cc -o model_manager.o
Compiling with: 
BOOM_DIR = `$(R_HOME)/bin/Rscript -e "cat(system.file(package='Boom'))"`
BOOM_LIB = ${BOOM_DIR}/lib${R_ARCH}/libboom.a
PKG_LIBS = ${BOOM_LIB}
PKG_CPPFLAGS = -I${BOOM_DIR}/include -DADD_ -DR_NO_REMAP -DRLANGUAGE 
CXX_STD = CXX11
In file included from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/shared_ptr.hpp:28:0,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/shared_ptr.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from model_manager.cc:19:
/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/detail/shared_count.hpp:355:33: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     explicit shared_count( std::auto_ptr<Y> & r ): pi_( new sp_counted_impl_p<Y>( r.get() ) )
                                 ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from model_manager.cc:19:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from model_manager.cc:19:
/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/shared_ptr.hpp:256:65: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
 template< class T, class R > struct sp_enable_if_auto_ptr< std::auto_ptr< T >, R >
                                                                 ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from model_manager.cc:19:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from model_manager.cc:19:
/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/shared_ptr.hpp:471:31: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     explicit shared_ptr( std::auto_ptr<Y> & r ): px(r.get()), pn()
                               ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from model_manager.cc:19:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from model_manager.cc:19:
/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/shared_ptr.hpp:484:22: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr( std::auto_ptr<Y> && r ): px(r.get()), pn()
                      ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from model_manager.cc:19:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from model_manager.cc:19:
/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/shared_ptr.hpp:567:34: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr & operator=( std::auto_ptr<Y> & r )
                                  ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from model_manager.cc:19:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from model_manager.cc:19:
/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/shared_ptr.hpp:576:34: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr & operator=( std::auto_ptr<Y> && r )
                                  ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from model_manager.cc:19:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from model_manager.cc:19:
/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/shared_ptr.hpp: In member function ‘boost::shared_ptr<T>& boost::shared_ptr<T>::operator=(std::auto_ptr<_Up>&&)’:
/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/shared_ptr.hpp:578:38: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
         this_type( static_cast< std::auto_ptr<Y> && >( r ) ).swap( *this );
                                      ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from model_manager.cc:19:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
g++ -std=gnu++11 -I"/usr/share/R/include" -DNDEBUG -I`/usr/lib/R/bin/Rscript -e "cat(system.file(package='Boom'))"`/include -DADD_ -DR_NO_REMAP -DRLANGUAGE  -I"/tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include" -I"/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include"    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g -c bsts.cc -o bsts.o
Compiling with: 
BOOM_DIR = `$(R_HOME)/bin/Rscript -e "cat(system.file(package='Boom'))"`
BOOM_LIB = ${BOOM_DIR}/lib${R_ARCH}/libboom.a
PKG_LIBS = ${BOOM_LIB}
PKG_CPPFLAGS = -I${BOOM_DIR}/include -DADD_ -DR_NO_REMAP -DRLANGUAGE 
CXX_STD = CXX11
In file included from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/shared_ptr.hpp:28:0,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/shared_ptr.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from bsts.cc:20:
/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/detail/shared_count.hpp:355:33: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     explicit shared_count( std::auto_ptr<Y> & r ): pi_( new sp_counted_impl_p<Y>( r.get() ) )
                                 ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from bsts.cc:20:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from bsts.cc:20:
/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/shared_ptr.hpp:256:65: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
 template< class T, class R > struct sp_enable_if_auto_ptr< std::auto_ptr< T >, R >
                                                                 ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from bsts.cc:20:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from bsts.cc:20:
/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/shared_ptr.hpp:471:31: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     explicit shared_ptr( std::auto_ptr<Y> & r ): px(r.get()), pn()
                               ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from bsts.cc:20:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from bsts.cc:20:
/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/shared_ptr.hpp:484:22: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr( std::auto_ptr<Y> && r ): px(r.get()), pn()
                      ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from bsts.cc:20:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from bsts.cc:20:
/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/shared_ptr.hpp:567:34: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr & operator=( std::auto_ptr<Y> & r )
                                  ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from bsts.cc:20:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from bsts.cc:20:
/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/shared_ptr.hpp:576:34: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr & operator=( std::auto_ptr<Y> && r )
                                  ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from bsts.cc:20:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from bsts.cc:20:
/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/shared_ptr.hpp: In member function ‘boost::shared_ptr<T>& boost::shared_ptr<T>::operator=(std::auto_ptr<_Up>&&)’:
/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/shared_ptr.hpp:578:38: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
         this_type( static_cast< std::auto_ptr<Y> && >( r ) ).swap( *this );
                                      ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from bsts.cc:20:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
g++ -std=gnu++11 -I"/usr/share/R/include" -DNDEBUG -I`/usr/lib/R/bin/Rscript -e "cat(system.file(package='Boom'))"`/include -DADD_ -DR_NO_REMAP -DRLANGUAGE  -I"/tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include" -I"/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include"    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g -c mixed_frequency.cc -o mixed_frequency.o
Compiling with: 
BOOM_DIR = `$(R_HOME)/bin/Rscript -e "cat(system.file(package='Boom'))"`
BOOM_LIB = ${BOOM_DIR}/lib${R_ARCH}/libboom.a
PKG_LIBS = ${BOOM_LIB}
PKG_CPPFLAGS = -I${BOOM_DIR}/include -DADD_ -DR_NO_REMAP -DRLANGUAGE 
CXX_STD = CXX11
In file included from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/shared_ptr.hpp:28:0,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/shared_ptr.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/create_state_model.hpp:24,
                 from mixed_frequency.cc:20:
/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/detail/shared_count.hpp:355:33: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     explicit shared_count( std::auto_ptr<Y> & r ): pi_( new sp_counted_impl_p<Y>( r.get() ) )
                                 ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from mixed_frequency.cc:19:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/create_state_model.hpp:24,
                 from mixed_frequency.cc:20:
/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/shared_ptr.hpp:256:65: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
 template< class T, class R > struct sp_enable_if_auto_ptr< std::auto_ptr< T >, R >
                                                                 ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from mixed_frequency.cc:19:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/create_state_model.hpp:24,
                 from mixed_frequency.cc:20:
/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/shared_ptr.hpp:471:31: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     explicit shared_ptr( std::auto_ptr<Y> & r ): px(r.get()), pn()
                               ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from mixed_frequency.cc:19:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/create_state_model.hpp:24,
                 from mixed_frequency.cc:20:
/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/shared_ptr.hpp:484:22: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr( std::auto_ptr<Y> && r ): px(r.get()), pn()
                      ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from mixed_frequency.cc:19:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/create_state_model.hpp:24,
                 from mixed_frequency.cc:20:
/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/shared_ptr.hpp:567:34: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr & operator=( std::auto_ptr<Y> & r )
                                  ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from mixed_frequency.cc:19:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/create_state_model.hpp:24,
                 from mixed_frequency.cc:20:
/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/shared_ptr.hpp:576:34: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr & operator=( std::auto_ptr<Y> && r )
                                  ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from mixed_frequency.cc:19:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/create_state_model.hpp:24,
                 from mixed_frequency.cc:20:
/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/shared_ptr.hpp: In member function ‘boost::shared_ptr<T>& boost::shared_ptr<T>::operator=(std::auto_ptr<_Up>&&)’:
/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/shared_ptr.hpp:578:38: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
         this_type( static_cast< std::auto_ptr<Y> && >( r ) ).swap( *this );
                                      ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from mixed_frequency.cc:19:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
g++ -std=gnu++11 -I"/usr/share/R/include" -DNDEBUG -I`/usr/lib/R/bin/Rscript -e "cat(system.file(package='Boom'))"`/include -DADD_ -DR_NO_REMAP -DRLANGUAGE  -I"/tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include" -I"/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include"    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g -c state_space_student_model_manager.cc -o state_space_student_model_manager.o
Compiling with: 
BOOM_DIR = `$(R_HOME)/bin/Rscript -e "cat(system.file(package='Boom'))"`
BOOM_LIB = ${BOOM_DIR}/lib${R_ARCH}/libboom.a
PKG_LIBS = ${BOOM_LIB}
PKG_CPPFLAGS = -I${BOOM_DIR}/include -DADD_ -DR_NO_REMAP -DRLANGUAGE 
CXX_STD = CXX11
In file included from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/shared_ptr.hpp:28:0,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/shared_ptr.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from state_space_student_model_manager.h:20,
                 from state_space_student_model_manager.cc:17:
/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/detail/shared_count.hpp:355:33: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     explicit shared_count( std::auto_ptr<Y> & r ): pi_( new sp_counted_impl_p<Y>( r.get() ) )
                                 ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from state_space_student_model_manager.h:20,
                 from state_space_student_model_manager.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from state_space_student_model_manager.h:20,
                 from state_space_student_model_manager.cc:17:
/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/shared_ptr.hpp:256:65: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
 template< class T, class R > struct sp_enable_if_auto_ptr< std::auto_ptr< T >, R >
                                                                 ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from state_space_student_model_manager.h:20,
                 from state_space_student_model_manager.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from state_space_student_model_manager.h:20,
                 from state_space_student_model_manager.cc:17:
/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/shared_ptr.hpp:471:31: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     explicit shared_ptr( std::auto_ptr<Y> & r ): px(r.get()), pn()
                               ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from state_space_student_model_manager.h:20,
                 from state_space_student_model_manager.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from state_space_student_model_manager.h:20,
                 from state_space_student_model_manager.cc:17:
/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/shared_ptr.hpp:484:22: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr( std::auto_ptr<Y> && r ): px(r.get()), pn()
                      ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from state_space_student_model_manager.h:20,
                 from state_space_student_model_manager.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from state_space_student_model_manager.h:20,
                 from state_space_student_model_manager.cc:17:
/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/shared_ptr.hpp:567:34: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr & operator=( std::auto_ptr<Y> & r )
                                  ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from state_space_student_model_manager.h:20,
                 from state_space_student_model_manager.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from state_space_student_model_manager.h:20,
                 from state_space_student_model_manager.cc:17:
/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/shared_ptr.hpp:576:34: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr & operator=( std::auto_ptr<Y> && r )
                                  ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from state_space_student_model_manager.h:20,
                 from state_space_student_model_manager.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from state_space_student_model_manager.h:20,
                 from state_space_student_model_manager.cc:17:
/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/shared_ptr.hpp: In member function ‘boost::shared_ptr<T>& boost::shared_ptr<T>::operator=(std::auto_ptr<_Up>&&)’:
/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/shared_ptr.hpp:578:38: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
         this_type( static_cast< std::auto_ptr<Y> && >( r ) ).swap( *this );
                                      ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from state_space_student_model_manager.h:20,
                 from state_space_student_model_manager.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
g++ -std=gnu++11 -I"/usr/share/R/include" -DNDEBUG -I`/usr/lib/R/bin/Rscript -e "cat(system.file(package='Boom'))"`/include -DADD_ -DR_NO_REMAP -DRLANGUAGE  -I"/tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include" -I"/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include"    -fpic  -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g -c state_space_regression_model_manager.cc -o state_space_regression_model_manager.o
Compiling with: 
BOOM_DIR = `$(R_HOME)/bin/Rscript -e "cat(system.file(package='Boom'))"`
BOOM_LIB = ${BOOM_DIR}/lib${R_ARCH}/libboom.a
PKG_LIBS = ${BOOM_LIB}
PKG_CPPFLAGS = -I${BOOM_DIR}/include -DADD_ -DR_NO_REMAP -DRLANGUAGE 
CXX_STD = CXX11
In file included from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/shared_ptr.hpp:28:0,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/shared_ptr.hpp:17,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from state_space_gaussian_model_manager.h:20,
                 from state_space_regression_model_manager.h:20,
                 from state_space_regression_model_manager.cc:17:
/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/detail/shared_count.hpp:355:33: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     explicit shared_count( std::auto_ptr<Y> & r ): pi_( new sp_counted_impl_p<Y>( r.get() ) )
                                 ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from state_space_gaussian_model_manager.h:20,
                 from state_space_regression_model_manager.h:20,
                 from state_space_regression_model_manager.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from state_space_gaussian_model_manager.h:20,
                 from state_space_regression_model_manager.h:20,
                 from state_space_regression_model_manager.cc:17:
/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/shared_ptr.hpp:256:65: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
 template< class T, class R > struct sp_enable_if_auto_ptr< std::auto_ptr< T >, R >
                                                                 ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from state_space_gaussian_model_manager.h:20,
                 from state_space_regression_model_manager.h:20,
                 from state_space_regression_model_manager.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from state_space_gaussian_model_manager.h:20,
                 from state_space_regression_model_manager.h:20,
                 from state_space_regression_model_manager.cc:17:
/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/shared_ptr.hpp:471:31: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     explicit shared_ptr( std::auto_ptr<Y> & r ): px(r.get()), pn()
                               ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from state_space_gaussian_model_manager.h:20,
                 from state_space_regression_model_manager.h:20,
                 from state_space_regression_model_manager.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from state_space_gaussian_model_manager.h:20,
                 from state_space_regression_model_manager.h:20,
                 from state_space_regression_model_manager.cc:17:
/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/shared_ptr.hpp:484:22: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr( std::auto_ptr<Y> && r ): px(r.get()), pn()
                      ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from state_space_gaussian_model_manager.h:20,
                 from state_space_regression_model_manager.h:20,
                 from state_space_regression_model_manager.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from state_space_gaussian_model_manager.h:20,
                 from state_space_regression_model_manager.h:20,
                 from state_space_regression_model_manager.cc:17:
/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/shared_ptr.hpp:567:34: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr & operator=( std::auto_ptr<Y> & r )
                                  ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from state_space_gaussian_model_manager.h:20,
                 from state_space_regression_model_manager.h:20,
                 from state_space_regression_model_manager.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from state_space_gaussian_model_manager.h:20,
                 from state_space_regression_model_manager.h:20,
                 from state_space_regression_model_manager.cc:17:
/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/shared_ptr.hpp:576:34: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
     shared_ptr & operator=( std::auto_ptr<Y> && r )
                                  ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from state_space_gaussian_model_manager.h:20,
                 from state_space_regression_model_manager.h:20,
                 from state_space_regression_model_manager.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
In file included from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/shared_ptr.hpp:17:0,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/Filters/SparseMatrix.hpp:23,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/Models/StateSpace/StateSpaceModelBase.hpp:26,
                 from model_manager.h:22,
                 from state_space_gaussian_model_manager.h:20,
                 from state_space_regression_model_manager.h:20,
                 from state_space_regression_model_manager.cc:17:
/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/shared_ptr.hpp: In member function ‘boost::shared_ptr<T>& boost::shared_ptr<T>::operator=(std::auto_ptr<_Up>&&)’:
/tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/smart_ptr/shared_ptr.hpp:578:38: warning: ‘template<class> class std::auto_ptr’ is deprecated [-Wdeprecated-declarations]
         this_type( static_cast< std::auto_ptr<Y> && >( r ) ).swap( *this );
                                      ^
In file included from /usr/include/c++/5/bits/locale_conv.h:41:0,
                 from /usr/include/c++/5/locale:43,
                 from /usr/include/c++/5/iomanip:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/policies/error_handling.hpp:12,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/BH/include/boost/math/special_functions/round.hpp:14,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/portable_math.hpp:43,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/cpputil/math_utils.hpp:25,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/LinAlg/Vector.hpp:31,
                 from /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/include/r_interface/boom_r_tools.hpp:24,
                 from model_manager.h:20,
                 from state_space_gaussian_model_manager.h:20,
                 from state_space_regression_model_manager.h:20,
                 from state_space_regression_model_manager.cc:17:
/usr/include/c++/5/bits/unique_ptr.h:49:28: note: declared here
   template<typename> class auto_ptr;
                            ^
Compiling with: 
BOOM_DIR = `$(R_HOME)/bin/Rscript -e "cat(system.file(package='Boom'))"`
BOOM_LIB = ${BOOM_DIR}/lib${R_ARCH}/libboom.a
PKG_LIBS = ${BOOM_LIB}
PKG_CPPFLAGS = -I${BOOM_DIR}/include -DADD_ -DR_NO_REMAP -DRLANGUAGE 
CXX_STD = CXX11
g++ -std=gnu++11 -shared -L/usr/lib/R/lib -Wl,-Bsymbolic-functions -Wl,-z,relro -o bsts.so aggregate_time_series.o bsts.o bsts_init.o get_date_ranges.o mixed_frequency.o model_manager.o state_space_gaussian_model_manager.o state_space_logit_model_manager.o state_space_poisson_model_manager.o state_space_regression_model_manager.o state_space_student_model_manager.o utils.o /tmp/RtmpcwuZam/checklibfdec1e278f50/Boom/lib/libboom.a -L/usr/lib/R/lib -lR
Compiling with: 
BOOM_DIR = `$(R_HOME)/bin/Rscript -e "cat(system.file(package='Boom'))"`
BOOM_LIB = ${BOOM_DIR}/lib${R_ARCH}/libboom.a
PKG_LIBS = ${BOOM_LIB}
PKG_CPPFLAGS = -I${BOOM_DIR}/include -DADD_ -DR_NO_REMAP -DRLANGUAGE 
CXX_STD = CXX11
installing to /tmp/RtmpcwuZam/filefdecf907f28/bsts.Rcheck/bsts/libs
** R
** data
** inst
** byte-compile and prepare package for lazy loading
** help
*** installing help indices
** building package indices
** testing if installed package can be loaded
* DONE (bsts)

```
# MeSH.Ani.FGSC.eg.db

Version: 1.10.0

## Newly broken

*   checking PDF version of manual without hyperrefs or index ... ERROR
    ```
    Re-running with no redirection of stdout/stderr.
    Hmm ... looks like a package
    You may want to clean up by 'rm -Rf /tmp/RtmppmNt3o/Rd2pdf21786d6f05cc'
    ```

*   checking PDF version of manual ... WARNING
    ```
    LaTeX errors when creating PDF version.
    This typically indicates Rd problems.
    ```

# MeSH.Mml.eg.db

Version: 1.10.0

## Newly broken

*   checking PDF version of manual without hyperrefs or index ... ERROR
    ```
    Re-running with no redirection of stdout/stderr.
    Hmm ... looks like a package
    You may want to clean up by 'rm -Rf /tmp/RtmpKxgKOC/Rd2pdfc33f5b68278a'
    ```

*   checking PDF version of manual ... WARNING
    ```
    LaTeX errors when creating PDF version.
    This typically indicates Rd problems.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 411.7Mb
      sub-directories of 1Mb or more:
        extdata  411.6Mb
    ```

## Installation

### Devel

```
* installing *source* package ‘MeSH.Mml.eg.db’ ...
** R
** inst
** byte-compile and prepare package for lazy loading
** help
*** installing help indices
** building package indices
** testing if installed package can be loaded
* DONE (MeSH.Mml.eg.db)

```
### CRAN

```
* installing *source* package ‘MeSH.Mml.eg.db’ ...
** R
** inst
Warning in file.append(to[okay], from[okay]) :
  write error during file append
** byte-compile and prepare package for lazy loading
** help
*** installing help indices
Warning in close.connection(file) :
  Problem closing connection:  No space left on device
Warning in file(file.path(outman, "00Index.html"), "wt") :
  cannot open file '/tmp/RtmpcwuZam/filefdee2bde2e88/MeSH.Mml.eg.db.Rcheck/MeSH.Mml.eg.db/html/00Index.html': No such file or directory
Error in file(file.path(outman, "00Index.html"), "wt") : 
  cannot open the connection
6: traceback(1)
5: file(file.path(outman, "00Index.html"), "wt")
4: .writePkgIndices(pkg_dir, instdir)
3: do_install_source(pkg_name, instdir, pkg, desc)
2: do_install(pkg)
1: tools:::.install_packages()

```
# MeSH.Vvi.eg.db

Version: 1.10.0

## Newly broken

*   checking PDF version of manual without hyperrefs or index ... ERROR
    ```
    Re-running with no redirection of stdout/stderr.
    Hmm ... looks like a package
    You may want to clean up by 'rm -Rf /tmp/RtmpfrELsl/Rd2pdf9d2d7eb2856c'
    ```

*   checking PDF version of manual ... WARNING
    ```
    LaTeX errors when creating PDF version.
    This typically indicates Rd problems.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 376.7Mb
      sub-directories of 1Mb or more:
        extdata  376.6Mb
    ```

## Installation

### Devel

```
* installing *source* package ‘MeSH.Vvi.eg.db’ ...
** R
** inst
** byte-compile and prepare package for lazy loading
** help
*** installing help indices
** building package indices
** testing if installed package can be loaded
* DONE (MeSH.Vvi.eg.db)

```
### CRAN

```
* installing *source* package ‘MeSH.Vvi.eg.db’ ...
** R
** inst
Warning in file.append(to[okay], from[okay]) :
  write error during file append
** byte-compile and prepare package for lazy loading
** help
*** installing help indices
Warning in close.connection(file) :
  Problem closing connection:  No space left on device
Warning in file(file.path(outman, "00Index.html"), "wt") :
  cannot open file '/tmp/RtmpcwuZam/filefdc67f7b3b37/MeSH.Vvi.eg.db.Rcheck/MeSH.Vvi.eg.db/html/00Index.html': No such file or directory
Error in file(file.path(outman, "00Index.html"), "wt") : 
  cannot open the connection
6: traceback(1)
5: file(file.path(outman, "00Index.html"), "wt")
4: .writePkgIndices(pkg_dir, instdir)
3: do_install_source(pkg_name, instdir, pkg, desc)
2: do_install(pkg)
1: tools:::.install_packages()

```
# BSgenome.Mfuro.UCSC.musFur1

Version: 1.4.1

## Newly broken

*   checking PDF version of manual without hyperrefs or index ... ERROR
    ```
    Re-running with no redirection of stdout/stderr.
    Hmm ... looks like a package
    You may want to clean up by 'rm -Rf /tmp/RtmpKF1RAp/Rd2pdfcf03370d030e'
    ```

*   checking PDF version of manual ... WARNING
    ```
    LaTeX errors when creating PDF version.
    This typically indicates Rd problems.
    ```

*   checking installed package size ... NOTE
    ```
      installed size is 602.8Mb
      sub-directories of 1Mb or more:
        extdata  602.7Mb
    ```

*   checking DESCRIPTION meta-information ... NOTE
    ```
    Package listed in more than one of Depends, Imports, Suggests, Enhances:
      ‘BSgenome’
    A package should be listed in only one of these fields.
    ```

*   checking Rd files ... NOTE
    ```
    prepare_Rd: package.Rd:14-16: Dropping empty section \details
    ```

## Installation

### Devel

```
* installing *source* package ‘BSgenome.Mfuro.UCSC.musFur1’ ...
** R
** inst
** byte-compile and prepare package for lazy loading
** help
*** installing help indices
** building package indices
** testing if installed package can be loaded
* DONE (BSgenome.Mfuro.UCSC.musFur1)

```
### CRAN

```
* installing *source* package ‘BSgenome.Mfuro.UCSC.musFur1’ ...
** R
** inst
** byte-compile and prepare package for lazy loading
** help
Error : /tmp/RtmpcwuZam/filefdbe1fbcdfad/BSgenome.Mfuro.UCSC.musFur1.Rcheck/00_pkg_src/BSgenome.Mfuro.UCSC.musFur1/man/package.Rd: Sections \title, and \name must exist and be unique in Rd files
ERROR: installing Rd objects failed for package ‘BSgenome.Mfuro.UCSC.musFur1’
* removing ‘/tmp/RtmpcwuZam/filefdbe1fbcdfad/BSgenome.Mfuro.UCSC.musFur1.Rcheck/BSgenome.Mfuro.UCSC.musFur1’

```
