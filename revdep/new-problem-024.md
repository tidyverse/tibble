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

