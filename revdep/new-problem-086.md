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

