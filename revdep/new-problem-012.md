# DiagrammeR

Version: 1.0.0

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > # which several columns have
    > # values designated as graph nodes
    > df <-
    +   data.frame(
    +     col_1 = c("f", "p", "q"),
    +     col_2 = c("q", "x", "f"),
    +     col_3 = c(1, 5, 3),
    +     col_4 = c("a", "v", "h"),
    +     stringsAsFactors = FALSE)
    > 
    > # Add nodes from columns `col_1`
    > # and `col_2` from the data frame
    > # to the graph object
    > graph <-
    +   graph %>%
    +   add_nodes_from_df_cols(
    +     df = df,
    +     columns = c("col_1", "col_2"))
    Error: Columns 1, 2, 3 must be named.
    Use .name_repair to specify repair.
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      19: check_unique(new_name) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/repair-names.R:168
      20: abort(error_column_must_be_named(bad_name)) at /tmp/Rtmp8wuu7e/R.INSTALL1db573dd5d93/tibble/R/repair-names.R:256
      
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 2020 SKIPPED: 0 FAILED: 7
      1. Error: adding nodes from several table columns to a graph is possible (@test-add_nodes_edges_from_table.R#786) 
      2. Error: the display of the metagraph works (@test-metagraph.R#51) 
      3. Error: rendering a graph is indeed possible (@test-render_graph_series.R#35) 
      4. Error: rendering a graph from a series is also possible (@test-render_graph_series.R#74) 
      5. Error: simple traversals are possible (@test-traversals.R#49) 
      6. Error: selective traversals with `trav_both()` are possible (@test-traversals.R#1224) 
      7. Error: copying values with `trav_both()` works (@test-traversals_copying_attr_vals.R#249) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

