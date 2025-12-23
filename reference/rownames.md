# Tools for working with row names

While a tibble can have row names (e.g., when converting from a regular
data frame), they are removed when subsetting with the `[` operator. A
warning will be raised when attempting to assign non-`NULL` row names to
a tibble. Generally, it is best to avoid row names, because they are
basically a character column with different semantics than every other
column.

These functions allow to you detect if a data frame has row names
(`has_rownames()`), remove them (`remove_rownames()`), or convert them
back-and-forth between an explicit column (`rownames_to_column()` and
`column_to_rownames()`). Also included is `rowid_to_column()`, which
adds a column at the start of the dataframe of ascending sequential row
ids starting at 1. Note that this will remove any existing row names.

## Usage

``` r
has_rownames(.data)

remove_rownames(.data)

rownames_to_column(.data, var = "rowname")

rowid_to_column(.data, var = "rowid")

column_to_rownames(.data, var = "rowname")
```

## Arguments

- .data:

  A data frame.

- var:

  Name of column to use for rownames.

## Value

`column_to_rownames()` always returns a data frame. `has_rownames()`
returns a scalar logical. All other functions return an object of the
same class as the input.

## Examples

``` r
# Detect row names ----------------------------------------------------
has_rownames(mtcars)
#> [1] TRUE
has_rownames(trees)
#> [1] FALSE

# Remove row names ----------------------------------------------------
remove_rownames(mtcars) %>% has_rownames()
#> [1] FALSE

# Convert between row names and column --------------------------------
mtcars_tbl <- rownames_to_column(mtcars, var = "car") %>% as_tibble()
mtcars_tbl
#> # A tibble: 32 × 12
#>    car        mpg   cyl  disp    hp  drat    wt  qsec    vs    am  gear
#>    <chr>    <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl>
#>  1 Mazda R…  21       6  160    110  3.9   2.62  16.5     0     1     4
#>  2 Mazda R…  21       6  160    110  3.9   2.88  17.0     0     1     4
#>  3 Datsun …  22.8     4  108     93  3.85  2.32  18.6     1     1     4
#>  4 Hornet …  21.4     6  258    110  3.08  3.22  19.4     1     0     3
#>  5 Hornet …  18.7     8  360    175  3.15  3.44  17.0     0     0     3
#>  6 Valiant   18.1     6  225    105  2.76  3.46  20.2     1     0     3
#>  7 Duster …  14.3     8  360    245  3.21  3.57  15.8     0     0     3
#>  8 Merc 24…  24.4     4  147.    62  3.69  3.19  20       1     0     4
#>  9 Merc 230  22.8     4  141.    95  3.92  3.15  22.9     1     0     4
#> 10 Merc 280  19.2     6  168.   123  3.92  3.44  18.3     1     0     4
#> # ℹ 22 more rows
#> # ℹ 1 more variable: carb <dbl>
column_to_rownames(mtcars_tbl, var = "car") %>% head()
#>                    mpg cyl disp  hp drat    wt  qsec vs am gear carb
#> Mazda RX4         21.0   6  160 110 3.90 2.620 16.46  0  1    4    4
#> Mazda RX4 Wag     21.0   6  160 110 3.90 2.875 17.02  0  1    4    4
#> Datsun 710        22.8   4  108  93 3.85 2.320 18.61  1  1    4    1
#> Hornet 4 Drive    21.4   6  258 110 3.08 3.215 19.44  1  0    3    1
#> Hornet Sportabout 18.7   8  360 175 3.15 3.440 17.02  0  0    3    2
#> Valiant           18.1   6  225 105 2.76 3.460 20.22  1  0    3    1

# Adding rowid as a column --------------------------------------------
rowid_to_column(trees) %>% head()
#>   rowid Girth Height Volume
#> 1     1   8.3     70   10.3
#> 2     2   8.6     65   10.3
#> 3     3   8.8     63   10.2
#> 4     4  10.5     72   16.4
#> 5     5  10.7     81   18.8
#> 6     6  10.8     83   19.7
```
