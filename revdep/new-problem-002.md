# bayesammi

Version: 0.1.0

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > ### Title: Bayesian Estimation of the Additive Main Effects and
    > ###   Multiplicative Interaction Model
    > ### Aliases: bayes_ammi bayes_ammi.default
    > 
    > ### ** Examples
    > 
    > 
    > data(Maiz)
    > 
    > fm1 <-
    +  bayes_ammi(
    +      .data  = Maiz
    +    , .y     = y
    +    , .gen   = entry
    +    , .env   = site
    +    , .rep   = rep
    +    , .nIter = 20
    +   )
    Error: Column 1 must be named.
    Use .name_repair to specify repair.
    Execution halted
    ```

