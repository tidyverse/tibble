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

