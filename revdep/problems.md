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
    Error: $ operator is invalid for atomic vectors
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
    $ operator is invalid for atomic vectors
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
    
        groups
    
    The following object is masked from ‘package:stats’:
    
        filter
    
    > as_tbl_graph(g)
    Error: $ operator is invalid for atomic vectors
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
    Error: $ operator is invalid for atomic vectors
    Execution halted
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
    [46] 55--17  59--98  47--15  37--62  85--49  65--98  37--98  22--33  56--77 
    [55] 25--51  20--80  16--57  25--71  52--64  12--47  8 --80  79--18  22--62 
    [64] 14--31  37--69  54--16  26--90  38--94  79--20  70--97  19--90  11--71 
    + ... omitted several edges
    > 
    > ### sampling graphs as tidygraph graphs ---------------
    > 
    > sample_tidygraph(ufm)
    Error: $ operator is invalid for atomic vectors
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
    $ operator is invalid for atomic vectors
    --- failed re-building ‘Layouts.Rmd’
    ...
    Quitting from lines 67-77 (tidygraph.Rmd) 
    Error: processing vignette 'tidygraph.Rmd' failed with diagnostics:
    $ operator is invalid for atomic vectors
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
    > 
    > graph <- vegnett_list[[1]]
    > nodes <- vegnett_list[[2]]
    > edges <- vegnett_list[[3]]
    > graph_cppRouting_minutes <- vegnett_list[[4]]
    > graph_cppRouting_meters <- vegnett_list[[5]]
    > 
    > graph
    Error: $ operator is invalid for atomic vectors
    Execution halted
    ```

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 866 marked UTF-8 strings
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
    $ operator is invalid for atomic vectors
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
    B 1 0 1
    C 1 1 0
    > as_igraph(test)
    IGRAPH 90af426 DN-B 6 5 -- 
    + attr: name (v/c), type (v/l)
    + edges from 90af426 (vertex names):
    [1] A->I B->G B->I C->G C->H
    > as_tidygraph(test)
    Error: $ operator is invalid for atomic vectors
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
    > network_conditional(
    +   netfacs.data = conditional.probs,
    +   min.prob = 0.01,
    +   min.count = 3,
    +   ignore.element = "25",
    +   plot.bubbles = FALSE
    + )
    $network
    Error: $ operator is invalid for atomic vectors
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
    Error: $ operator is invalid for atomic vectors
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
    $ operator is invalid for atomic vectors
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
    > # With LINESTRING geometries.
    > as_sfnetwork(roxel)
    # A sfnetwork with 701 nodes and 851 edges
    #
    # CRS:  EPSG:4326 
    #
    # A directed multigraph with 14 components with spatially explicit edges
    #
    Error: $ operator is invalid for atomic vectors
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
    --- re-building ‘sfn01_structure.Rmd’ using rmarkdown
    Quitting from lines 64-82 (sfn01_structure.Rmd) 
    Error: processing vignette 'sfn01_structure.Rmd' failed with diagnostics:
    $ operator is invalid for atomic vectors
    --- failed re-building ‘sfn01_structure.Rmd’
    
    --- re-building ‘sfn02_preprocess_clean.Rmd’ using rmarkdown
    Quitting from lines 55-67 (sfn02_preprocess_clean.Rmd) 
    Error: processing vignette 'sfn02_preprocess_clean.Rmd' failed with diagnostics:
    ...
    Error: processing vignette 'sfn05_morphers.Rmd' failed with diagnostics:
    $ operator is invalid for atomic vectors
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
    Error: $ operator is invalid for atomic vectors
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
    > # small random subset of the original data...
    > 
    > freeassociationdata_part = dplyr::sample_n(freeassociationdata, 10)
    > 
    > df.word.combinations.as.tbl_graph = get.word.combinations.as.tbl_graph(
    + c("diet1stword", "diet2ndword", "diet3rdword"), freeassociationdata_part)
    > 
    > print(df.word.combinations.as.tbl_graph)
    Error: $ operator is invalid for atomic vectors
    Execution halted
    ```

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 6738 marked UTF-8 strings
    ```

