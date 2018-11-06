# baystability

Version: 0.1.0

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > ge_means0 <- fm1$ge_means$ge_means
    > 
    > data(cultivo2008)
    > 
    > fm2 <-
    +  ge_ammi(
    +    .data = cultivo2009
    +    , .y    = y
    +    , .gen  = entry
    +    , .env  = site
    +    , .rep  = rep
    +   )
    > 
    > k        <- fm2$k
    > alphasa  <- fm2$alphas
    > gammasa  <- fm2$gammas
    > 
    > alphas1  <- tibble::as_tibble(fm2$alphas)
    Error: Columns 1, 2, 3, 4, 5, … (and 6 more) must be named.
    Use .name_repair to specify repair.
    Execution halted
    ```

