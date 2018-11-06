# qwraps2

Version: 0.3.0

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    > # white noise
    > Z.1 <- rnorm(n, 0, 1)
    > Z.2 <- rnorm(n, 0, 2)
    > Z.3 <- rnorm(n, 0, 5)
    > 
    > for(i in 2:n)
    + {
    + 	x1[i] <- x1[i-1] + Z.1[i] - Z.1[i-1] + x4[i-1] - x2[i-1]
    + 	x2[i] <- x2[i-1] - 2 * Z.2[i] + Z.2[i-1] - x4[i-1]
    + 	x3[i] <- x3[i-1] + x2[i-1] + 0.2 * Z.3[i] + Z.3[i-1]
    + 	x4[i] <- x4[i-1] + runif(1, 0.5, 1.5) * x4[i-1]
    + }
    > testdf <- data.frame(x1, x2, x3, x4)
    > 
    > # Base acf plot for one variable
    > acf(testdf$x1)
    > 
    > # qacf plot for one variable
    > qacf(testdf$x1)
    Error: Columns 1, 2, 3, 4, 5, … (and 19 more) must be named.
    Execution halted
    ```

