# tidygraph

Version: 1.1.0

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘tidygraph-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: activate
    > ### Title: Determine the context of subsequent manipulations
    > ### Aliases: activate active %N>% %E>%
    > 
    > ### ** Examples
    > 
    > gr <- create_complete(5) %>%
    +   activate(nodes) %>%
    +   mutate(class = sample(c('a', 'b'), 5, TRUE)) %>%
    +   activate(edges) %>%
    +   arrange(from)
    Error: Columns 1, 2 must be named.
    Use .name_repair to specify repair.
    Execution halted
    ```

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ testthat results  ═══════════════════════════════════════════════════════════
      OK: 133 SKIPPED: 0 FAILED: 36
      1. Error: activate activates all morphed graphs (@test-activate.R#26) 
      2. Error: arrange works with edges (@test-arrange.R#13) 
      3. Error: bind_graphs works (@test-bind.R#8) 
      4. Error: bind_edges works (@test-bind.R#22) 
      5. Error: centrality returns numeric (@test-centrality.R#8) 
      6. Error: centrality returns correct length (@test-centrality.R#25) 
      7. Error: graphs get added and stacked in the context (@test-context.R#12) 
      8. Error: distinct works (@test-distinct.R#4) 
      9. Error: edge types return logical (@test-edge_types.R#7) 
      1. ...
      
      Error: testthat unit tests failed
      Execution halted
    ```

