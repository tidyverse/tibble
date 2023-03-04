# akc

<details>

* Version: 0.9.9
* GitHub: https://github.com/hope-data-science/akc
* Source code: https://github.com/cran/akc
* Date/Publication: 2023-01-06 08:00:02 UTC
* Number of recursive dependencies: 117

Run `revdepcheck::cloud_details(, "akc")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘akc-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: doc_group
    > ### Title: Construct network of documents based on keyword co-occurrence
    > ### Aliases: doc_group
    > 
    > ### ** Examples
    > 
    >  library(akc)
    >  bibli_data_table %>%
    +    keyword_clean(id = "id",keyword = "keyword") %>%
    +    doc_group(id = "id",keyword = "keyword") -> grouped_doc
    > 
    >  grouped_doc
    Error in tbl_format_header(x, setup) : 
      could not find function "tbl_format_header"
    Calls: <Anonymous> -> print.tbl_graph -> do.call -> <Anonymous>
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘Benchmarking.Rmd’ using rmarkdown
    --- finished re-building ‘Benchmarking.Rmd’
    
    --- re-building ‘akc_vignette.Rmd’ using rmarkdown
    Quitting from lines 75-79 (akc_vignette.Rmd) 
    Error: processing vignette 'akc_vignette.Rmd' failed with diagnostics:
    could not find function "tbl_format_header"
    --- failed re-building ‘akc_vignette.Rmd’
    ...
      Some words could not fit on page. They have been placed at their original positions.
    Warning in wordcloud_boxes(data_points = points_valid_first, boxes = boxes,  :
      Some words could not fit on page. They have been placed at their original positions.
    --- finished re-building ‘tutorial_raw_text.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘akc_vignette.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# arulesViz

<details>

* Version: 1.5-1
* GitHub: https://github.com/mhahsler/arulesViz
* Source code: https://github.com/cran/arulesViz
* Date/Publication: 2021-11-19 17:40:07 UTC
* Number of recursive dependencies: 111

Run `revdepcheck::cloud_details(, "arulesViz")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘arulesViz-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: associations2igraph
    > ### Title: Convert rules or itemsets into a graph
    > ### Aliases: saveAsGraph associations2igraph igraph tidygraph
    > ### Keywords: file
    > 
    > ### ** Examples
    > 
    ...
    
    The following object is masked from ‘package:stats’:
    
        filter
    
    > as_tbl_graph(g)
    Error in tbl_format_header(x, setup) : 
      could not find function "tbl_format_header"
    Calls: <Anonymous> -> print.tbl_graph -> do.call -> <Anonymous>
    Execution halted
    ```

## In both

*   checking re-building of vignette outputs ... NOTE
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘arulesViz.Rnw’ using Sweave
    Loading required package: arules
    Loading required package: Matrix
    
    Attaching package: ‘arules’
    
    The following objects are masked from ‘package:base’:
    
        abbreviate, write
    ...
    l.55 \RequirePackage
                        [T1]{fontenc}^^M
    !  ==> Fatal error occurred, no output PDF file produced!
    --- failed re-building ‘arulesViz.Rnw’
    
    SUMMARY: processing the following file failed:
      ‘arulesViz.Rnw’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# cellranger

<details>

* Version: 1.1.0
* GitHub: https://github.com/rsheets/cellranger
* Source code: https://github.com/cran/cellranger
* Date/Publication: 2016-07-27 03:17:48
* Number of recursive dependencies: 58

Run `revdepcheck::cloud_details(, "cellranger")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘cellranger-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: as.cell_addr
    > ### Title: Convert to a cell_addr object
    > ### Aliases: as.cell_addr as.cell_addr.character as.cell_addr.ra_ref
    > ###   as.cell_addr_v as.cell_addr_v.character as.cell_addr_v.list
    > 
    > ### ** Examples
    > 
    ...
    <cell_addr: 1 cells>
    Warning: `as_data_frame()` was deprecated in tibble 2.0.0.
    ℹ Please use `as_tibble()` (with slightly different semantics) to convert to a
      tibble, or `as.data.frame()` to convert to a data frame.
    ℹ The deprecated feature was likely used in the cellranger package.
      Please report the issue at <https://github.com/rsheets/cellranger/issues>.
    Error in tbl_format_header(x, setup) : 
      could not find function "tbl_format_header"
    Calls: <Anonymous> -> print.cell_addr -> print -> <Anonymous>
    Execution halted
    ```

## In both

*   checking LazyData ... NOTE
    ```
      'LazyData' is specified without a 'data' directory
    ```

# chemodiv

<details>

* Version: 0.2.0
* GitHub: https://github.com/hpetren/chemodiv
* Source code: https://github.com/cran/chemodiv
* Date/Publication: 2023-01-12 09:30:06 UTC
* Number of recursive dependencies: 167

Run `revdepcheck::cloud_details(, "chemodiv")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘chemodiv-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: molNet
    > ### Title: Generate a molecular network with some properties
    > ### Aliases: molNet
    > 
    > ### ** Examples
    > 
    > data(minimalCompDis)
    > data(minimalNPCTable)
    > molNet(minimalCompDis, minimalNPCTable, cutOff = 0)
    Using cut-off value = 0
    $networkObject
    Error in tbl_format_header(x, setup) : 
      could not find function "tbl_format_header"
    Calls: <Anonymous> -> print.tbl_graph -> do.call -> <Anonymous>
    Execution halted
    ```

# eflm

<details>

* Version: 0.3.0
* GitHub: https://github.com/pachadotdev/eflm
* Source code: https://github.com/cran/eflm
* Date/Publication: 2021-05-31 21:20:02 UTC
* Number of recursive dependencies: 55

Run `revdepcheck::cloud_details(, "eflm")` for more info

</details>

## Newly broken

*   checking whether package ‘eflm’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/eflm/new/eflm.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘eflm’ ...
** package ‘eflm’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** inst
** byte-compile and prepare package for lazy loading
Error : The `x` argument of `as_tibble()` can't be missing as of tibble 3.0.0.
Error: unable to load R code in package ‘eflm’
Execution halted
ERROR: lazy loading failed for package ‘eflm’
* removing ‘/tmp/workdir/eflm/new/eflm.Rcheck/eflm’


```
### CRAN

```
* installing *source* package ‘eflm’ ...
** package ‘eflm’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** inst
** byte-compile and prepare package for lazy loading
** help
*** installing help indices
*** copying figures
** building package indices
** testing if installed package can be loaded from temporary location
** testing if installed package can be loaded from final location
** testing if installed package keeps a record of temporary installation path
* DONE (eflm)


```
# fastRG

<details>

* Version: 0.3.1
* GitHub: https://github.com/RoheLab/fastRG
* Source code: https://github.com/cran/fastRG
* Date/Publication: 2022-06-30 07:30:12 UTC
* Number of recursive dependencies: 83

Run `revdepcheck::cloud_details(, "fastRG")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘fastRG-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: sample_edgelist
    > ### Title: Sample a random edgelist from a random dot product graph
    > ### Aliases: sample_edgelist sample_edgelist.undirected_factor_model
    > ###   sample_edgelist.directed_factor_model
    > 
    > ### ** Examples
    > 
    ...
    [64] 14--31  37--69  54--16  26--90  38--94  79--20  70--97  19--90  11--71 
    + ... omitted several edges
    > 
    > ### sampling graphs as tidygraph graphs ---------------
    > 
    > sample_tidygraph(ufm)
    Error in tbl_format_header(x, setup) : 
      could not find function "tbl_format_header"
    Calls: <Anonymous> -> print.tbl_graph -> do.call -> <Anonymous>
    Execution halted
    ```

# ggESDA

<details>

* Version: 0.2.0
* GitHub: https://github.com/kiangkiangkiang/ggESDA
* Source code: https://github.com/cran/ggESDA
* Date/Publication: 2022-08-19 08:40:10 UTC
* Number of recursive dependencies: 208

Run `revdepcheck::cloud_details(, "ggESDA")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘ggESDA-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: Cardiological
    > ### Title: Cardiological data example
    > ### Aliases: Cardiological
    > ### Keywords: datasets
    > 
    > ### ** Examples
    > 
    > data(Cardiological)
    > ggInterval_index(Cardiological, aes(x = Syst))
    Error in get(x, envir = ns, inherits = FALSE) : 
      object 'tbl_subset_col' not found
    Calls: ggInterval_index ... as.data.frame -> [ -> [.symbolic_tbl -> getFromNamespace -> get
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘ggESDA.Rmd’ using rmarkdown
    Quitting from lines 47-57 (ggESDA.Rmd) 
    Error: processing vignette 'ggESDA.Rmd' failed with diagnostics:
    object 'tbl_subset_col' not found
    --- failed re-building ‘ggESDA.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘ggESDA.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# ggraph

<details>

* Version: 2.1.0
* GitHub: https://github.com/thomasp85/ggraph
* Source code: https://github.com/cran/ggraph
* Date/Publication: 2022-10-09 20:33:19 UTC
* Number of recursive dependencies: 97

Run `revdepcheck::cloud_details(, "ggraph")` for more info

</details>

## Newly broken

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘Edges.Rmd’ using rmarkdown
    --- finished re-building ‘Edges.Rmd’
    
    --- re-building ‘Layouts.Rmd’ using rmarkdown
    Quitting from lines 93-94 (Layouts.Rmd) 
    Error: processing vignette 'Layouts.Rmd' failed with diagnostics:
    could not find function "tbl_format_header"
    --- failed re-building ‘Layouts.Rmd’
    ...
    Quitting from lines 67-77 (tidygraph.Rmd) 
    Error: processing vignette 'tidygraph.Rmd' failed with diagnostics:
    could not find function "tbl_format_header"
    --- failed re-building ‘tidygraph.Rmd’
    
    SUMMARY: processing the following files failed:
      ‘Layouts.Rmd’ ‘tidygraph.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 10.7Mb
      sub-directories of 1Mb or more:
        doc    3.5Mb
        libs   5.9Mb
    ```

# GISSB

<details>

* Version: 1.1
* GitHub: NA
* Source code: https://github.com/cran/GISSB
* Date/Publication: 2023-01-10 18:33:14 UTC
* Number of recursive dependencies: 113

Run `revdepcheck::cloud_details(, "GISSB")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘GISSB-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: vegnett_to_R
    > ### Title: Convert the Norwegian road network (NVDB Ruteplan
    > ###   nettverksdatasett) into network graphs in R
    > ### Aliases: vegnett_to_R
    > 
    > ### ** Examples
    > 
    ...
    > nodes <- vegnett_list[[2]]
    > edges <- vegnett_list[[3]]
    > graph_cppRouting_minutes <- vegnett_list[[4]]
    > graph_cppRouting_meters <- vegnett_list[[5]]
    > 
    > graph
    Error in tbl_format_header(x, setup) : 
      could not find function "tbl_format_header"
    Calls: <Anonymous> -> print.tbl_graph -> do.call -> <Anonymous>
    Execution halted
    ```

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 866 marked UTF-8 strings
    ```

# hyperSpec

<details>

* Version: 0.100.0
* GitHub: https://github.com/r-hyperspec/hyperSpec
* Source code: https://github.com/cran/hyperSpec
* Date/Publication: 2021-09-13 13:00:02 UTC
* Number of recursive dependencies: 142

Run `revdepcheck::cloud_details(, "hyperSpec")` for more info

</details>

## Newly broken

*   checking running R code from vignettes ... ERROR
    ```
    Errors in running code in vignettes:
    when running code in ‘plotting.Rnw’
      ...
      'x' values are not equispaced; output may be wrong
    Warning in (function (x, y, z, subscripts, at = pretty(z), ..., col.regions = regions$col,  :
      'y' values are not equispaced; output may be wrong
    
    > plotvoronoi(uneven)
    Warning in (function (x, y, z, subscripts = TRUE, at = pretty(z), points = TRUE,  :
      The 'use.tripack' argument is deprecated and ignored. See ?panel.voronoi
    ...
    
    ... incomplete output.  Crash?
    
      ‘chondro.pdf.asis’ using ‘UTF-8’... OK
      ‘fileio.pdf.asis’ using ‘UTF-8’... OK
      ‘baseline.Rnw’ using ‘UTF-8’... OK
      ‘flu.Rnw’ using ‘UTF-8’... OK
      ‘hyperspec.Rnw’ using ‘UTF-8’... OK
      ‘laser.Rnw’ using ‘UTF-8’... OK
      ‘plotting.Rnw’ using ‘UTF-8’... failed to complete the test
    ```

## In both

*   checking re-building of vignette outputs ... NOTE
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘chondro.pdf.asis’ using asis
    --- finished re-building ‘chondro.pdf.asis’
    
    --- re-building ‘fileio.pdf.asis’ using asis
    --- finished re-building ‘fileio.pdf.asis’
    
    --- re-building ‘baseline.Rnw’ using Sweave
    Loading required package: lattice
    Loading required package: grid
    ...
    Warning in (function (x, y, z, subscripts, at = pretty(z), ..., col.regions = regions$col,  :
      'y' values are not equispaced; output may be wrong
    Warning in (function (x, y, z, subscripts = TRUE, at = pretty(z), points = TRUE,  :
      The 'use.tripack' argument is deprecated and ignored. See ?panel.voronoi
    Killed
    SUMMARY: processing the following files failed:
      ‘baseline.Rnw’ ‘flu.Rnw’ ‘hyperspec.Rnw’ ‘laser.Rnw’ ‘plotting.Rnw’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# incidence2

<details>

* Version: 1.2.3
* GitHub: https://github.com/reconverse/incidence2
* Source code: https://github.com/cran/incidence2
* Date/Publication: 2021-11-07 22:00:02 UTC
* Number of recursive dependencies: 87

Run `revdepcheck::cloud_details(, "incidence2")` for more info

</details>

## Newly broken

*   checking whether package ‘incidence2’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/tmp/workdir/incidence2/new/incidence2.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘incidence2’ ...
** package ‘incidence2’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** data
*** moving datasets to lazyload DB
** inst
** byte-compile and prepare package for lazy loading
Error : The `x` argument of `as_tibble()` can't be missing as of tibble 3.0.0.
Error: unable to load R code in package ‘incidence2’
Execution halted
ERROR: lazy loading failed for package ‘incidence2’
* removing ‘/tmp/workdir/incidence2/new/incidence2.Rcheck/incidence2’


```
### CRAN

```
* installing *source* package ‘incidence2’ ...
** package ‘incidence2’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** data
*** moving datasets to lazyload DB
** inst
** byte-compile and prepare package for lazy loading
** help
*** installing help indices
** building package indices
** installing vignettes
** testing if installed package can be loaded from temporary location
** testing if installed package can be loaded from final location
** testing if installed package keeps a record of temporary installation path
* DONE (incidence2)


```
# malan

<details>

* Version: 1.0.2
* GitHub: https://github.com/mikldk/malan
* Source code: https://github.com/cran/malan
* Date/Publication: 2020-06-25 12:00:06 UTC
* Number of recursive dependencies: 88

Run `revdepcheck::cloud_details(, "malan")` for more info

</details>

## Newly broken

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘case-study-partial.Rmd’ using rmarkdown
    Quitting from lines 76-78 (case-study-partial.Rmd) 
    Error: processing vignette 'case-study-partial.Rmd' failed with diagnostics:
    could not find function "tbl_format_header"
    --- failed re-building ‘case-study-partial.Rmd’
    
    --- re-building ‘introduction.Rmd’ using rmarkdown
    --- finished re-building ‘introduction.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘case-study-partial.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 22.8Mb
      sub-directories of 1Mb or more:
        libs  21.8Mb
    ```

# migraph

<details>

* Version: 0.13.2
* GitHub: https://github.com/snlab-ch/migraph
* Source code: https://github.com/cran/migraph
* Date/Publication: 2022-12-20 16:20:02 UTC
* Number of recursive dependencies: 137

Run `revdepcheck::cloud_details(, "migraph")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘migraph-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: as
    > ### Title: Coercion between migraph-compatible object classes
    > ### Aliases: as as_edgelist as_matrix as_igraph as_tidygraph as_network
    > ###   as_siena as_graphAM
    > 
    > ### ** Examples
    > 
    ...
    > as_igraph(test)
    IGRAPH 6b8d0d7 DN-B 6 5 -- 
    + attr: name (v/c), type (v/l)
    + edges from 6b8d0d7 (vertex names):
    [1] A->I B->G B->I C->G C->H
    > as_tidygraph(test)
    Error in tbl_format_header(x, setup) : 
      could not find function "tbl_format_header"
    Calls: <Anonymous> -> print.tbl_graph -> do.call -> <Anonymous>
    Execution halted
    ```

# multidplyr

<details>

* Version: 0.1.2
* GitHub: https://github.com/tidyverse/multidplyr
* Source code: https://github.com/cran/multidplyr
* Date/Publication: 2022-09-26 19:40:02 UTC
* Number of recursive dependencies: 80

Run `revdepcheck::cloud_details(, "multidplyr")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘multidplyr-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: partition
    > ### Title: Partition data across workers in a cluster
    > ### Aliases: partition
    > 
    > ### ** Examples
    > 
    > library(dplyr)
    ...
    > 
    > mtcars2 <- partition(mtcars, cl)
    > mtcars2 %>% mutate(cyl2 = 2 * cyl)
    Source: party_df [32 x 12]
    Shards: 2 [16--16 rows]
    
    Error in tbl_format_header(x, setup) : 
      could not find function "tbl_format_header"
    Calls: <Anonymous> -> print.multidplyr_party_df -> print -> <Anonymous>
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      • On CRAN (6)
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Error ('test-partydf.R:14'): can construct and print partydf ────────────────
      `df` threw an unexpected error.
      Message: could not find function "tbl_format_header"
      Class:   simpleError/error/condition
      ── Error ('test-partydf.R:15'): can construct and print partydf ────────────────
      `group_by(df, y)` threw an unexpected error.
      Message: could not find function "tbl_format_header"
      Class:   simpleError/error/condition
      
      [ FAIL 2 | WARN 0 | SKIP 6 | PASS 49 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘multidplyr.Rmd’ using rmarkdown
    Quitting from lines 50-52 (multidplyr.Rmd) 
    Error: processing vignette 'multidplyr.Rmd' failed with diagnostics:
    could not find function "tbl_format_header"
    --- failed re-building ‘multidplyr.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘multidplyr.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# NetFACS

<details>

* Version: 0.5.0
* GitHub: NA
* Source code: https://github.com/cran/NetFACS
* Date/Publication: 2022-12-06 17:32:35 UTC
* Number of recursive dependencies: 99

Run `revdepcheck::cloud_details(, "NetFACS")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘NetFACS-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: network_conditional
    > ### Title: Create a network based on conditional probabilities of dyads of
    > ###   elements
    > ### Aliases: network_conditional
    > 
    > ### ** Examples
    > 
    ...
    +   min.prob = 0.01,
    +   min.count = 3,
    +   ignore.element = "25",
    +   plot.bubbles = FALSE
    + )
    $network
    Error in tbl_format_header(x, setup) : 
      could not find function "tbl_format_header"
    Calls: <Anonymous> -> print.tbl_graph -> do.call -> <Anonymous>
    Execution halted
    ```

# panelr

<details>

* Version: 0.7.7
* GitHub: https://github.com/jacob-long/panelr
* Source code: https://github.com/cran/panelr
* Date/Publication: 2023-02-09 16:00:02 UTC
* Number of recursive dependencies: 169

Run `revdepcheck::cloud_details(, "panelr")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘panelr-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: complete_data
    > ### Title: Filter out entities with too few observations
    > ### Aliases: complete_data
    > 
    > ### ** Examples
    > 
    > 
    > data("WageData")
    > wages <- panel_data(WageData, id = id, wave = t)
    > complete_data(wages, wks, lwage, min.waves = 3)
    Error in tbl_format_header(x, setup) : 
      could not find function "tbl_format_header"
    Calls: <Anonymous> -> print.panel_data -> <Anonymous>
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘reshape.Rmd’ using rmarkdown
    --- finished re-building ‘reshape.Rmd’
    
    --- re-building ‘wbm.Rmd’ using rmarkdown
    Quitting from lines 59-61 (wbm.Rmd) 
    Error: processing vignette 'wbm.Rmd' failed with diagnostics:
    could not find function "tbl_format_header"
    --- failed re-building ‘wbm.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘wbm.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

## In both

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      > test_check("panelr")
      Failed with error:  'there is no package called 'rstan''
      [ FAIL 1 | WARN 0 | SKIP 0 | PASS 272 ]
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Error ('test_wbm.R:283'): (code run outside of `test_that()`) ───────────────
      Error in `wbm_stan(lwage ~ lag(union) + wks | blk + fem | blk * lag(union), 
          data = wages, chains = 1, iter = 2000, fit_model = FALSE)`: You must have the brms package installed to use wbm_stan.
      Backtrace:
          ▆
       1. └─panelr::wbm_stan(...) at test_wbm.R:283:0
      
      [ FAIL 1 | WARN 0 | SKIP 0 | PASS 272 ]
      Error: Test failures
      Execution halted
    ```

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘AER’
    ```

# readtext

<details>

* Version: 0.81
* GitHub: https://github.com/quanteda/readtext
* Source code: https://github.com/cran/readtext
* Date/Publication: 2021-07-14 14:40:02 UTC
* Number of recursive dependencies: 91

Run `revdepcheck::cloud_details(, "readtext")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
        5. │       ├─testthat (local) .capture(...)
        6. │       │ └─testthat::capture_output_lines(code, print, width = width)
        7. │       │   └─testthat:::eval_with_output(code, print = print, width = width)
        8. │       │     ├─withr::with_output_sink(path, withVisible(code))
        9. │       │     │ └─base::force(code)
       10. │       │     └─base::withVisible(code)
       11. │       └─rlang::eval_bare(quo_get_expr(.quo), quo_get_env(.quo))
       12. ├─base::print(readtext("../data/fox/fox.txt"))
       13. └─readtext:::print.readtext(readtext("../data/fox/fox.txt"))
       14.   ├─base::print(tibble::trunc_mat(x, n = n))
       15.   └─tibble::trunc_mat(x, n = n)
      
      [ FAIL 1 | WARN 1 | SKIP 10 | PASS 156 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘readtext_vignette.Rmd’ using rmarkdown
    Quitting from lines 47-49 (readtext_vignette.Rmd) 
    Error: processing vignette 'readtext_vignette.Rmd' failed with diagnostics:
    could not find function "tbl_format_header"
    --- failed re-building ‘readtext_vignette.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘readtext_vignette.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 1 marked Latin-1 string
      Note: found 1 marked UTF-8 string
      Note: found 7 strings marked as "bytes"
    ```

# RSDA

<details>

* Version: 3.0.13
* GitHub: NA
* Source code: https://github.com/cran/RSDA
* Date/Publication: 2022-07-16 07:30:37 UTC
* Number of recursive dependencies: 151

Run `revdepcheck::cloud_details(, "RSDA")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘RSDA-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: abalone
    > ### Title: SODAS XML data file.
    > ### Aliases: abalone
    > ### Keywords: datasets
    > 
    > ### ** Examples
    > 
    > data(abalone)
    > res <- sym.pca(abalone, 'centers')
    Error in get(x, envir = ns, inherits = FALSE) : 
      object 'tbl_subset_col' not found
    Calls: sym.pca ... %in% -> [ -> [.symbolic_tbl -> getFromNamespace -> get
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘introduction.Rmd’ using rmarkdown
    Quitting from lines 60-64 (introduction.Rmd) 
    Error: processing vignette 'introduction.Rmd' failed with diagnostics:
    object 'tbl_subset_col' not found
    --- failed re-building ‘introduction.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘introduction.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# saeSim

<details>

* Version: 0.11.0
* GitHub: https://github.com/wahani/saeSim
* Source code: https://github.com/cran/saeSim
* Date/Publication: 2022-02-07 16:40:02 UTC
* Number of recursive dependencies: 97

Run `revdepcheck::cloud_details(, "saeSim")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘saeSim-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: agg_all
    > ### Title: Aggregation function
    > ### Aliases: agg_all
    > 
    > ### ** Examples
    > 
    > sim_base() %>% sim_gen_x() %>% sim_gen_e() %>% sim_agg(agg_all())
    ...
      Please report the issue at <https://github.com/wahani/saeSim/issues>.
    Warning: `group_by_()` was deprecated in dplyr 0.7.0.
    ℹ Please use `group_by()` instead.
    ℹ See vignette('programming') for more help
    ℹ The deprecated feature was likely used in the saeSim package.
      Please report the issue at <https://github.com/wahani/saeSim/issues>.
    Error in tbl_format_header(x, setup) : 
      could not find function "tbl_format_header"
    Calls: <Anonymous> -> <Anonymous> -> print -> trunc_mat
    Execution halted
    ```

*   checking tests ... ERROR
    ```
      Running ‘test-all.R’
    Running the tests in ‘tests/test-all.R’ failed.
    Last 13 lines of output:
      [ FAIL 1 | WARN 254 | SKIP 0 | PASS 133 ]
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Error ('test-sim_setup.R:14'): methods equal ────────────────────────────────
      Error in `tbl_format_header(x, setup)`: could not find function "tbl_format_header"
      Backtrace:
          ▆
       1. ├─methods::show(setup) at test-sim_setup.R:14:2
       2. └─saeSim::show(setup)
       3.   ├─base::print(trunc_mat(dat, n = 6, width = NULL))
       4.   └─tibble::trunc_mat(dat, n = 6, width = NULL)
      
      [ FAIL 1 | WARN 254 | SKIP 0 | PASS 133 ]
      Error: Test failures
      Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘Introduction.Rmd’ using rmarkdown
    Quitting from lines 31-39 (Introduction.Rmd) 
    Error: processing vignette 'Introduction.Rmd' failed with diagnostics:
    could not find function "tbl_format_header"
    --- failed re-building ‘Introduction.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘Introduction.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# sfnetworks

<details>

* Version: 0.6.2
* GitHub: https://github.com/luukvdmeer/sfnetworks
* Source code: https://github.com/cran/sfnetworks
* Date/Publication: 2023-02-26 19:00:02 UTC
* Number of recursive dependencies: 105

Run `revdepcheck::cloud_details(, "sfnetworks")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘sfnetworks-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: as_sfnetwork
    > ### Title: Convert a foreign object to a sfnetwork
    > ### Aliases: as_sfnetwork as_sfnetwork.default as_sfnetwork.sf
    > ###   as_sfnetwork.linnet as_sfnetwork.psp as_sfnetwork.sfc
    > ###   as_sfnetwork.sfNetwork as_sfnetwork.sfnetwork as_sfnetwork.tbl_graph
    > 
    > ### ** Examples
    ...
    # A sfnetwork with 701 nodes and 851 edges
    #
    # CRS:  EPSG:4326 
    #
    # A directed multigraph with 14 components with spatially explicit edges
    #
    Error in tbl_format_header(x, setup) : 
      could not find function "tbl_format_header"
    Calls: <Anonymous> ... summarise_network_element -> do.call -> <Anonymous>
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘sfn01_structure.Rmd’ using rmarkdown
    Quitting from lines 64-82 (sfn01_structure.Rmd) 
    Error: processing vignette 'sfn01_structure.Rmd' failed with diagnostics:
    could not find function "tbl_format_header"
    --- failed re-building ‘sfn01_structure.Rmd’
    
    --- re-building ‘sfn02_preprocess_clean.Rmd’ using rmarkdown
    Quitting from lines 55-67 (sfn02_preprocess_clean.Rmd) 
    Error: processing vignette 'sfn02_preprocess_clean.Rmd' failed with diagnostics:
    ...
    Error: processing vignette 'sfn05_morphers.Rmd' failed with diagnostics:
    could not find function "tbl_format_header"
    --- failed re-building ‘sfn05_morphers.Rmd’
    
    SUMMARY: processing the following files failed:
      ‘sfn01_structure.Rmd’ ‘sfn02_preprocess_clean.Rmd’
      ‘sfn03_join_filter.Rmd’ ‘sfn04_routing.Rmd’ ‘sfn05_morphers.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# tidygraph

<details>

* Version: 1.2.3
* GitHub: https://github.com/thomasp85/tidygraph
* Source code: https://github.com/cran/tidygraph
* Date/Publication: 2023-02-01 21:10:02 UTC
* Number of recursive dependencies: 77

Run `revdepcheck::cloud_details(, "tidygraph")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘tidygraph-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: bind_graphs
    > ### Title: Add graphs, nodes, or edges to a tbl_graph
    > ### Aliases: bind_graphs bind_nodes bind_edges
    > 
    > ### ** Examples
    > 
    > graph <- create_notable('bull')
    > new_graph <- create_notable('housex')
    > 
    > # Add nodes
    > graph %>% bind_nodes(data.frame(new = 1:4))
    Error in tbl_format_header(x, setup) : 
      could not find function "tbl_format_header"
    Calls: <Anonymous> -> print.tbl_graph -> do.call -> <Anonymous>
    Execution halted
    ```

# wordgraph

<details>

* Version: 0.1.0
* GitHub: NA
* Source code: https://github.com/cran/wordgraph
* Date/Publication: 2020-07-01 08:40:03 UTC
* Number of recursive dependencies: 52

Run `revdepcheck::cloud_details(, "wordgraph")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘wordgraph-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: get.word.combinations.as.tbl_graph
    > ### Title: Calculate all word pairs frequencies.
    > ### Aliases: get.word.combinations.as.tbl_graph
    > 
    > ### ** Examples
    > 
    > # It is a time consuming function...
    ...
    > freeassociationdata_part = dplyr::sample_n(freeassociationdata, 10)
    > 
    > df.word.combinations.as.tbl_graph = get.word.combinations.as.tbl_graph(
    + c("diet1stword", "diet2ndword", "diet3rdword"), freeassociationdata_part)
    > 
    > print(df.word.combinations.as.tbl_graph)
    Error in tbl_format_header(x, setup) : 
      could not find function "tbl_format_header"
    Calls: print -> print.tbl_graph -> do.call -> <Anonymous>
    Execution halted
    ```

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 6738 marked UTF-8 strings
    ```

