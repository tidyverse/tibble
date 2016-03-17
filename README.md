<!-- README.md is generated from README.Rmd. Please edit that file -->
tibble [![Build Status](https://travis-ci.org/hadley/tibble.svg?branch=master)](https://travis-ci.org/hadley/tibble) [![AppVeyor Build Status](https://ci.appveyor.com/api/projects/status/github/hadley/tibble?branch=master&svg=true)](https://ci.appveyor.com/project/hadley/tibble) [![Coverage Status](https://img.shields.io/codecov/c/github/hadley/tibble/master.svg)](https://codecov.io/github/hadley/tibble?branch=master)
=====================================================================================================================================================================================================================================================================================================================================================================================================================================

Data frames in `dplyr` style.

``` r
library(tibble)
tbl_df(iris)
#> Source: local data frame [150 x 5]
#> 
#>    Sepal.Length Sepal.Width Petal.Length Petal.Width Species
#>           (dbl)       (dbl)        (dbl)       (dbl)  (fctr)
#> 1           5.1         3.5          1.4         0.2  setosa
#> 2           4.9         3.0          1.4         0.2  setosa
#> 3           4.7         3.2          1.3         0.2  setosa
#> 4           4.6         3.1          1.5         0.2  setosa
#> 5           5.0         3.6          1.4         0.2  setosa
#> 6           5.4         3.9          1.7         0.4  setosa
#> 7           4.6         3.4          1.4         0.3  setosa
#> 8           5.0         3.4          1.5         0.2  setosa
#> 9           4.4         2.9          1.4         0.2  setosa
#> 10          4.9         3.1          1.5         0.1  setosa
#> ..          ...         ...          ...         ...     ...
glimpse(iris)
#> Observations: 150
#> Variables: 5
#> $ Sepal.Length (dbl) 5.1, 4.9, 4.7, 4.6, 5.0, 5.4, 4.6, 5.0, 4.4, 4.9,...
#> $ Sepal.Width  (dbl) 3.5, 3.0, 3.2, 3.1, 3.6, 3.9, 3.4, 3.4, 2.9, 3.1,...
#> $ Petal.Length (dbl) 1.4, 1.4, 1.3, 1.5, 1.4, 1.7, 1.4, 1.5, 1.4, 1.5,...
#> $ Petal.Width  (dbl) 0.2, 0.2, 0.2, 0.2, 0.2, 0.4, 0.3, 0.2, 0.2, 0.1,...
#> $ Species      (fctr) setosa, setosa, setosa, setosa, setosa, setosa, ...
head(rownames_to_column(mtcars, "model"))
#>               model  mpg cyl disp  hp drat    wt  qsec vs am gear carb
#> 1         Mazda RX4 21.0   6  160 110 3.90 2.620 16.46  0  1    4    4
#> 2     Mazda RX4 Wag 21.0   6  160 110 3.90 2.875 17.02  0  1    4    4
#> 3        Datsun 710 22.8   4  108  93 3.85 2.320 18.61  1  1    4    1
#> 4    Hornet 4 Drive 21.4   6  258 110 3.08 3.215 19.44  1  0    3    1
#> 5 Hornet Sportabout 18.7   8  360 175 3.15 3.440 17.02  0  0    3    2
#> 6           Valiant 18.1   6  225 105 2.76 3.460 20.22  1  0    3    1
trunc_mat(iris)
```

| Sepal.Length | Sepal.Width | Petal.Length | Petal.Width | Species |
|:-------------|:------------|:-------------|:------------|:--------|
| (dbl)        | (dbl)       | (dbl)        | (dbl)       | (fctr)  |
| 5.1          | 3.5         | 1.4          | 0.2         | setosa  |
| 4.9          | 3.0         | 1.4          | 0.2         | setosa  |
| 4.7          | 3.2         | 1.3          | 0.2         | setosa  |
| 4.6          | 3.1         | 1.5          | 0.2         | setosa  |
| 5.0          | 3.6         | 1.4          | 0.2         | setosa  |
| 5.4          | 3.9         | 1.7          | 0.4         | setosa  |
| 4.6          | 3.4         | 1.4          | 0.3         | setosa  |
| 5.0          | 3.4         | 1.5          | 0.2         | setosa  |
| 4.4          | 2.9         | 1.4          | 0.2         | setosa  |
| 4.9          | 3.1         | 1.5          | 0.1         | setosa  |
| ...          | ...         | ...          | ...         | ...     |
