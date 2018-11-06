# STROMA4

Version: 1.4.0

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    The error most likely occurred in:
    
    > ### Name: assign.properties
    > ### Title: Function to assign properties to an expression matrix
    > ### Aliases: assign.properties
    > 
    > ### ** Examples
    > 
    > library(breastCancerMAINZ)
    > data(mainz, package='breastCancerMAINZ')
    > all.properties <- assign.properties(ESet=mainz, geneID.column='Gene.symbol',
    + 	genelists=c('Stroma4', 'TNBCType'), n=10)
    --Assigning properties to expression data--
    --There are duplicated genes. Using most variable to collapse--
    ----206 out of 297 total genes matching for D.stroma.property----
    Warning in socketConnection(port = port, server = TRUE, blocking = TRUE,  :
      port 11041 cannot be opened
    Error in socketConnection(port = port, server = TRUE, blocking = TRUE,  : 
      cannot open the connection
    Calls: assign.properties ... <Anonymous> -> <Anonymous> -> newSOCKnode -> socketConnection
    Execution halted
    ```

