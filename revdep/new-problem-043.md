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

