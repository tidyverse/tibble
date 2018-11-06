# stminsights

Version: 0.2.2

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > 
    > # fit model
    > gadarian_10 <- stm(documents = out$documents,
    +                    vocab = out$vocab,
    +                    data = out$meta,
    +                    prevalence = ~ treatment + s(pid_rep),
    +                    K = 10,
    +                    max.em.its = 1, # reduce computation time for example
    +                    verbose = FALSE)
    > 
    > # extract network
    > stm_corrs <- get_network(model = gadarian_10,
    +                          method = 'simple',
    +                          labels = paste('Topic', 1:10),
    +                          cutoff = 0.001,
    +                          cutiso = TRUE)
    Error in mutate_impl(.data, dots) : 
      Evaluation error: Columns 1, 2 must be named.
    Use .name_repair to specify repair..
    Calls: get_network ... mutate_as_tbl -> mutate -> mutate.tbl_df -> mutate_impl
    Execution halted
    ```

