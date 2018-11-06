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

