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

