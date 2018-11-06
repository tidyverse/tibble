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
    See ‘/tmp/RtmpcwuZam/filefdf0633d137a/Sconify.Rcheck/00install.out’ for details.
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    ...
      cannot compute exact p-value with ties
    50 percent complete
    Warning in wilcox.test.default(basal[[j]], stim[[j]]) :
      cannot compute exact p-value with ties
    60 percent complete
    70 percent complete
    Warning in wilcox.test.default(basal[[j]], stim[[j]]) :
      cannot compute exact p-value with ties
    80 percent complete
    Warning in wilcox.test.default(basal[[j]], stim[[j]]) :
      cannot compute exact p-value with ties
    Warning in wilcox.test.default(basal[[j]], stim[[j]]) :
      cannot compute exact p-value with ties
    90 percent complete
    Warning in wilcox.test.default(basal[[j]], stim[[j]]) :
      cannot compute exact p-value with ties
    100 percent complete
    Quitting from lines 85-91 (Step2.TheSconeWorkflow.Rmd) 
    Error: processing vignette 'Step2.TheSconeWorkflow.Rmd' failed with diagnostics:
    Columns 1, 2, 3, 4, 5, … (and 11 more) must be named.
    Execution halted
    ```

