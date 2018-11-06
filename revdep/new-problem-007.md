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

