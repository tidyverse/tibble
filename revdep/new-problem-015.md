# drake

Version: 6.1.0

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘drake-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: map_plan
    > ### Title: Create a plan that maps a function to a grid of arguments.
    > ### Aliases: map_plan
    > 
    > ### ** Examples
    > 
    > # For the full tutorial, visit
    > # https://ropenscilabs.github.io/drake-manual/plans.html#map_plan.
    > my_model_fit <- function(x1, x2, data){
    +   lm(as.formula(paste("mpg ~", x1, "+", x1)), data = data)
    + }
    > covariates <- setdiff(colnames(mtcars), "mpg")
    > args <- tibble::as_tibble(t(combn(covariates, 2)))
    Error: Columns 1, 2 must be named.
    Use .name_repair to specify repair.
    Execution halted
    ```

