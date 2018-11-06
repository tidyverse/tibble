# mfa

Version: 1.2.0

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘mfa-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: summary.mfa
    > ### Title: Summarise an mfa fit
    > ### Aliases: summary.mfa
    > 
    > ### ** Examples
    > 
    > synth <- create_synthetic(C = 20, G = 5)
    > m <- mfa(synth$X)
    Sampling for 20 cells and 5 genes
    > ms <- summary(m)
    Error: Columns 1, 2 must be named.
    Execution halted
    ```

