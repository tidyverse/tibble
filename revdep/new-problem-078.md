# Momocs

Version: 1.2.9

## Newly broken

*   checking examples ... ERROR
    ```
    ...
    3 AN   
    4 AN   
    5 AN   
    6 AN   
    # … with 121 more rows
     - All components: sdev, rotation, center, scale, x, eig, fac, mshape, method, cuts, links.
    > plot(wpp, 1)
    > 
    > # "foreign prcomp"
    > head(iris)
      Sepal.Length Sepal.Width Petal.Length Petal.Width Species
    1          5.1         3.5          1.4         0.2  setosa
    2          4.9         3.0          1.4         0.2  setosa
    3          4.7         3.2          1.3         0.2  setosa
    4          4.6         3.1          1.5         0.2  setosa
    5          5.0         3.6          1.4         0.2  setosa
    6          5.4         3.9          1.7         0.4  setosa
    > iris.p <- prcomp(iris[, 1:4])
    > iris.p <- as_PCA(iris.p, iris[, 5])
    Error: Columns 1, 2, 3, 4, 5, … (and 145 more) must be named.
    Execution halted
    ```

