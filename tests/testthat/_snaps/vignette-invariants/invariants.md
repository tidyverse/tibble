---
title: "Invariants: Comparing behavior with data frames"
#output: rmarkdown::word_document
output: rmarkdown::html_vignette
vignette: >
  %\VignetteIndexEntry{Invariants: Comparing behavior with data frames}
  %\VignetteEngine{knitr::rmarkdown}
  %\VignetteEncoding{UTF-8}
---

<style type="text/css">
.dftbl {
    width: 100%;
    table-layout: fixed;
    display: inline-table;
}

.error pre code {
    color: red;
}

.warning pre code {
    color: violet;
}
</style>



This vignette defines invariants for subsetting and subset-assignment for tibbles, and illustrates where their behaviour differs from data frames.
The goal is to define a small set of invariants that consistently define how behaviors interact.
Some behaviors are defined using functions of the vctrs package, e.g. `vec_slice()`, `vec_recycle()` and `vec_as_index()`.
Refer to their documentation for more details about the invariants that they follow.

The subsetting and subassignment operators for data frames and tibbles are particularly tricky, because they support both row and column indexes, both of which are optionally missing.
We resolve this by first defining column access with `[[` and `$`, then column-wise subsetting with `[`, then row-wise subsetting, then the composition of both.

## Conventions

In this article, all behaviors are demonstrated using one example data frame and its tibble equivalent:


```r
library(tibble)
library(vctrs)
new_df <- function() {
  df <- data.frame(n = c(1L, NA, 3L, NA))
  df$c <- letters[5:8]
  df$li <- list(9, 10:11, 12:14, "text")
  df
}
new_tbl <- function() {
  as_tibble(new_df())
}
```

Results of the same code for data frames and tibbles are presented side by side:

<table class="dftbl"><tbody><tr style="vertical-align:top"><td>

```r
new_df()
#>    n c         li
#> 1  1 e          9
#> 2 NA f     10, 11
#> 3  3 g 12, 13, 14
#> 4 NA h       text
```

</td><td>

```r
new_tbl()
#> # A tibble: 4 x 3
#>       n c     li       
#>   <int> <chr> <list>   
#> 1     1 e     <dbl [1]>
#> 2    NA f     <int [2]>
#> 3     3 g     <int [3]>
#> 4    NA h     <chr [1]>
```

</td></tr></tbody></table>

If the results are identical (after converting to a data frame if necessary), only the tibble result is shown.

Subsetting operations are read-only.
The same objects are reused in all examples:


```r
df <- new_df()
tbl <- new_tbl()
```

Where needed, we also show examples with hierarchical columns containing a data frame or a matrix:


```r
new_tbl2 <- function() {
  tibble(
    tb = tbl,
    m = diag(4)
  )
}
new_df2 <- function() {
  df2 <- new_tbl2()
  class(df2) <- "data.frame"
  class(df2$tb) <- "data.frame"
  df2
}
df2 <- new_df2()
tbl2 <- new_tbl2()
```

<table class="dftbl"><tbody><tr style="vertical-align:top"><td>

```r
new_df()
#>    n c         li
#> 1  1 e          9
#> 2 NA f     10, 11
#> 3  3 g 12, 13, 14
#> 4 NA h       text
```

</td><td>

```r
new_tbl()
#> # A tibble: 4 x 3
#>       n c     li       
#>   <int> <chr> <list>   
#> 1     1 e     <dbl [1]>
#> 2    NA f     <int [2]>
#> 3     3 g     <int [3]>
#> 4    NA h     <chr [1]>
```

</td></tr></tbody></table>

For subset assignment (subassignment, for short), we need a fresh copy of the data for each test.
The `with_*()` functions (omitted here for brevity) allow for a more concise notation.
These functions take an assignment expression, execute it on a fresh copy of the data, and return the data for printing.
The first example prints what's really executed, further examples omit this output.



<table class="dftbl"><tbody><tr style="vertical-align:top"><td>

```r
with_df(df$n <- rev(df$n), verbose = TRUE)
#> {
#>   df <- new_df()
#>   df$n <- rev(df$n)
#>   df
#> }
#>    n c         li
#> 1 NA e          9
#> 2  3 f     10, 11
#> 3 NA g 12, 13, 14
#> 4  1 h       text
```

</td><td>

```r
with_tbl(tbl$n <- rev(tbl$n), verbose = TRUE)
#> {
#>   tbl <- new_tbl()
#>   tbl$n <- rev(tbl$n)
#>   tbl
#> }
#> # A tibble: 4 x 3
#>       n c     li       
#>   <int> <chr> <list>   
#> 1    NA e     <dbl [1]>
#> 2     3 f     <int [2]>
#> 3    NA g     <int [3]>
#> 4     1 h     <chr [1]>
```

</td></tr></tbody></table>

## Column extraction

### Definition of `x[[j]]`

`x[[j]]` is equal to `.subset2(x, j)`.

<table class="dftbl"><tbody><tr style="vertical-align:top"><td>

```r
df[[1]]
#> [1]  1 NA  3 NA
```

</td><td>

```r
tbl[[1]]
#> [1]  1 NA  3 NA
```

</td></tr><tr style="vertical-align:top"><td>

```r
.subset2(df, 1)
#> [1]  1 NA  3 NA
```

</td><td>

```r
.subset2(tbl, 1)
#> [1]  1 NA  3 NA
```

</td></tr></tbody></table>


<table class="dftbl"><tbody><tr style="vertical-align:top"><td>

```r
identical(df[[3]], .subset2(df, 3))
#> [1] TRUE
```

</td><td>

```r
identical(tbl[[3]], .subset2(tbl, 3))
#> [1] TRUE
```

</td></tr><tr style="vertical-align:top"><td>

```r
identical(df2[["df"]], .subset2(df2, "df"))
#> [1] TRUE
```

</td><td>

```r
identical(tbl2[["tbl"]], .subset2(tbl2, "tbl"))
#> [1] TRUE
```

</td></tr></tbody></table>

NB: `x[[j]]` always returns an object of size `nrow(x)` if the column exists.

<table class="dftbl"><tbody><tr style="vertical-align:top"><td>

```r
vec_size(df[[1]])
#> [1] 4
```

</td><td>

```r
vec_size(tbl[[1]])
#> [1] 4
```

</td></tr><tr style="vertical-align:top"><td>

```r
vec_size(df[[3]])
#> [1] 4
```

</td><td>

```r
vec_size(tbl[[3]])
#> [1] 4
```

</td></tr><tr style="vertical-align:top"><td>

```r
vec_size(df2[[1]])
#> [1] 4
```

</td><td>

```r
vec_size(tbl2[[1]])
#> [1] 4
```

</td></tr><tr style="vertical-align:top"><td>

```r
vec_size(df2[[2]])
#> [1] 4
```

</td><td>

```r
vec_size(tbl2[[2]])
#> [1] 4
```

</td></tr></tbody></table>

`j` must be a single number or a string, as enforced by `.subset2(x, j)`.

<table class="dftbl"><tbody><tr style="vertical-align:top"><td>

```r
df[[1:2]]
#> [1] NA
```

</td><td>

```r
tbl[[1:2]]
```

<div class="warning">

```
#> Warning: The `j` argument of `[[.tbl_df`
#> can't be a vector of length 2 as of
#> tibble 3.0.0.
#> Recursive subsetting is deprecated for
#> tibbles.
```

</div>

```
#> [1] NA
```

</td></tr><tr style="vertical-align:top"><td>

```r
df[[c("n", "c")]]
```

<div class="error">

```
#> Error in .subset2(x, i, exact = exact):
#> subscript out of bounds
```

</div></td><td>

```r
tbl[[c("n", "c")]]
```

<div class="error">

```
#> Error in `vectbl_as_col_location2()`:
#> ! Must extract column with a single
#> valid subscript.
#> x Subscript `c("n", "c")` has size 2 but
#> must be size 1.
```

</div></td></tr><tr style="vertical-align:top"><td>

```r
df[[TRUE]]
#> [1]  1 NA  3 NA
```

</td><td>

```r
tbl[[TRUE]]
```

<div class="error">

```
#> Error in `vectbl_as_col_location2()`:
#> ! Must extract column with a single
#> valid subscript.
#> x Subscript `TRUE` has the wrong type
#> `logical`.
#> i It must be numeric or character.
```

</div></td></tr><tr style="vertical-align:top"><td>

```r
df[[mean]]
```

<div class="error">

```
#> Error in .subset2(x, i, exact = exact):
#> invalid subscript type 'closure'
```

</div></td><td>

```r
tbl[[mean]]
```

<div class="error">

```
#> Error in `vectbl_as_col_location2()`:
#> ! Must extract column with a single
#> valid subscript.
#> x Subscript `mean` has the wrong type
#> `function`.
#> i It must be numeric or character.
```

</div>

</td></tr></tbody></table>

`NA` indexes, numeric out-of-bounds (OOB) values, and non-integers throw an error:

<table class="dftbl"><tbody><tr style="vertical-align:top"><td>

```r
df[[NA]]
#> NULL
```

</td><td>

```r
tbl[[NA]]
```

<div class="error">

```
#> Error in `vectbl_as_col_location2()`:
#> ! Must extract column with a single
#> valid subscript.
#> x Subscript `NA` can't be `NA`.
```

</div></td></tr><tr style="vertical-align:top"><td>

```r
df[[NA_character_]]
#> NULL
```

</td><td>

```r
tbl[[NA_character_]]
```

<div class="error">

```
#> Error in `vectbl_as_col_location2()`:
#> ! Must extract column with a single
#> valid subscript.
#> x Subscript `NA_character_` can't be
#> `NA`.
```

</div></td></tr><tr style="vertical-align:top"><td>

```r
df[[NA_integer_]]
#> NULL
```

</td><td>

```r
tbl[[NA_integer_]]
```

<div class="error">

```
#> Error in `vectbl_as_col_location2()`:
#> ! Must extract column with a single
#> valid subscript.
#> x Subscript `NA_integer_` can't be `NA`.
```

</div></td></tr><tr style="vertical-align:top"><td>

```r
df[[-1]]
```

<div class="error">

```
#> Error in .subset2(x, i, exact = exact):
#> invalid negative subscript in get1index
#> <real>
```

</div></td><td>

```r
tbl[[-1]]
```

<div class="error">

```
#> Error in `vectbl_as_col_location2()`:
#> ! Must extract column with a single
#> valid subscript.
#> x Subscript `-1` has value -1 but must
#> be a positive location.
```

</div></td></tr><tr style="vertical-align:top"><td>

```r
df[[4]]
```

<div class="error">

```
#> Error in .subset2(x, i, exact = exact):
#> subscript out of bounds
```

</div></td><td>

```r
tbl[[4]]
```

<div class="error">

```
#> Error in `vec_as_location2_result()`:
#> ! Can't subset columns past the end.
#> i Location 4 doesn't exist.
#> i There are only 3 columns.
```

</div></td></tr><tr style="vertical-align:top"><td>

```r
df[[1.5]]
#> [1]  1 NA  3 NA
```

</td><td>

```r
tbl[[1.5]]
```

<div class="error">

```
#> Error in `vectbl_as_col_location2()`:
#> ! Must extract column with a single
#> valid subscript.
#> x Subscript `1.5` has the wrong type
#> `double`.
#> i It must be numeric or character.
```

</div></td></tr><tr style="vertical-align:top"><td>

```r
df[[Inf]]
#> NULL
```

</td><td>

```r
tbl[[Inf]]
```

<div class="error">

```
#> Error in `vectbl_as_col_location2()`:
#> ! Must extract column with a single
#> valid subscript.
#> x Subscript `Inf` has the wrong type
#> `double`.
#> i It must be numeric or character.
```

</div>

</td></tr></tbody></table>

Character OOB access is silent because a common package idiom is to check for the absence of a column with `is.null(df[[var]])`.

<table class="dftbl"><tbody><tr style="vertical-align:top"><td>

```r
df[["x"]]
#> NULL
```

</td><td>

```r
tbl[["x"]]
#> NULL
```

</td></tr></tbody></table>

### Definition of `x$name`

`x$name` and `x$"name"` are equal to `x[["name"]]`.

<table class="dftbl"><tbody><tr style="vertical-align:top"><td>

```r
df$n
#> [1]  1 NA  3 NA
```

</td><td>

```r
tbl$n
#> [1]  1 NA  3 NA
```

</td></tr><tr style="vertical-align:top"><td>

```r
df$"n"
#> [1]  1 NA  3 NA
```

</td><td>

```r
tbl$"n"
#> [1]  1 NA  3 NA
```

</td></tr><tr style="vertical-align:top"><td>

```r
df[["n"]]
#> [1]  1 NA  3 NA
```

</td><td>

```r
tbl[["n"]]
#> [1]  1 NA  3 NA
```

</td></tr></tbody></table>

<table class="dftbl"><tbody><tr style="vertical-align:top"><td>

```r
identical(df$li, df[["li"]])
#> [1] TRUE
```

</td><td>

```r
identical(tbl$li, tbl[["li"]])
#> [1] TRUE
```

</td></tr><tr style="vertical-align:top"><td>

```r
identical(df2$tb, df2[["tb"]])
#> [1] TRUE
```

</td><td>

```r
identical(tbl2$tb, tbl2[["tb"]])
#> [1] TRUE
```

</td></tr><tr style="vertical-align:top"><td>

```r
identical(df2$m, df2[["m"]])
#> [1] TRUE
```

</td><td>

```r
identical(tbl2$m, tbl2[["m"]])
#> [1] TRUE
```

</td></tr></tbody></table>

Unlike data frames, tibbles do not partially match names.
Because `df$x` is rarely used in packages, it can raise a warning:

<table class="dftbl"><tbody><tr style="vertical-align:top"><td>

```r
df$l
#> [[1]]
#> [1] 9
#> 
#> [[2]]
#> [1] 10 11
#> 
#> [[3]]
#> [1] 12 13 14
#> 
#> [[4]]
#> [1] "text"
```

</td><td>

```r
tbl$l
```

<div class="warning">

```
#> Warning: Unknown or uninitialised
#> column: `l`.
```

</div>

```
#> NULL
```

</td></tr><tr style="vertical-align:top"><td>

```r
df$not_present
#> NULL
```

</td><td>

```r
tbl$not_present
```

<div class="warning">

```
#> Warning: Unknown or uninitialised
#> column: `not_present`.
```

</div>

```
#> NULL
```

</td></tr></tbody></table>

## Column subsetting

### Definition of `x[j]`

`j` is converted to an integer vector by `vec_as_index(j, ncol(x), names = names(x))`.
Then `x[c(j_1, j_2, ..., j_n)]` is equivalent to `tibble(x[[j_1]], x[[j_2]], ..., x[[j_3]])`, keeping the corresponding column names.
This implies that `j` must be a numeric or character vector, or a logical vector with length 1 or `ncol(x)`.[^subset-extract-commute]

[^subset-extract-commute]: `x[j][[jj]]` is equal to `x[[ j[[jj]] ]]`, in particular `x[j][[1]]` is equal to `x[[j]]` for scalar numeric or integer `j`.


<table class="dftbl"><tbody><tr style="vertical-align:top"><td>

```r
df[1:2]
#>    n c
#> 1  1 e
#> 2 NA f
#> 3  3 g
#> 4 NA h
```

</td><td>

```r
tbl[1:2]
#> # A tibble: 4 x 2
#>       n c    
#>   <int> <chr>
#> 1     1 e    
#> 2    NA f    
#> 3     3 g    
#> 4    NA h
```

</td></tr></tbody></table>

When subsetting repeated indexes, the resulting column names are undefined, do not rely on them.

<table class="dftbl"><tbody><tr style="vertical-align:top"><td>

```r
df[c(1, 1)]
#>    n n.1
#> 1  1   1
#> 2 NA  NA
#> 3  3   3
#> 4 NA  NA
```

</td><td>

```r
tbl[c(1, 1)]
#> # A tibble: 4 x 2
#>       n     n
#>   <int> <int>
#> 1     1     1
#> 2    NA    NA
#> 3     3     3
#> 4    NA    NA
```

</td></tr></tbody></table>

For tibbles with repeated column names, subsetting by name uses the first matching column.

`nrow(df[j])` equals `nrow(df)`.

<table class="dftbl"><tbody><tr style="vertical-align:top"><td>

```r
df[integer()]
#> data frame with 0 columns and 4 rows
```

</td><td>

```r
tbl[integer()]
#> # A tibble: 4 x 0
```

</td></tr></tbody></table>

Tibbles support indexing by a logical matrix, but only if all values in the returned vector are compatible.

<table class="dftbl"><tbody><tr style="vertical-align:top"><td>

```r
df[is.na(df)]
#> [[1]]
#> [1] NA
#> 
#> [[2]]
#> [1] NA
```

</td><td>

```r
tbl[is.na(tbl)]
#> [1] NA NA
```

</td></tr><tr style="vertical-align:top"><td>

```r
df[!is.na(df)]
#> [[1]]
#> [1] 1
#> 
#> [[2]]
#> [1] 3
#> 
#> [[3]]
#> [1] "e"
#> 
#> [[4]]
#> [1] "f"
#> 
#> [[5]]
#> [1] "g"
#> 
#> [[6]]
#> [1] "h"
#> 
#> [[7]]
#> [1] 9
#> 
#> [[8]]
#> [1] 10 11
#> 
#> [[9]]
#> [1] 12 13 14
#> 
#> [[10]]
#> [1] "text"
```

</td><td>

```r
tbl[!is.na(tbl)]
```

<div class="error">

```
#> Error:
#> ! Can't combine `n` <integer> and `c`
#> <character>.
```

</div>

</td></tr></tbody></table>

### Definition of `x[, j]`

`x[, j]` is equal to `x[j]`.
Tibbles do not perform column extraction if `x[j]` would yield a single column.

<table class="dftbl"><tbody><tr style="vertical-align:top"><td>

```r
df[, 1]
#> [1]  1 NA  3 NA
```

</td><td>

```r
tbl[, 1]
#> # A tibble: 4 x 1
#>       n
#>   <int>
#> 1     1
#> 2    NA
#> 3     3
#> 4    NA
```

</td></tr><tr style="vertical-align:top"><td>

```r
df[, 1:2]
#>    n c
#> 1  1 e
#> 2 NA f
#> 3  3 g
#> 4 NA h
```

</td><td>

```r
tbl[, 1:2]
#> # A tibble: 4 x 2
#>       n c    
#>   <int> <chr>
#> 1     1 e    
#> 2    NA f    
#> 3     3 g    
#> 4    NA h
```

</td></tr></tbody></table>

<table class="dftbl"><tbody><tr style="vertical-align:top"><td>

```r
identical(df[, 2:3], df[2:3])
#> [1] TRUE
```

</td><td>

```r
identical(tbl[, 2:3], tbl[2:3])
#> [1] TRUE
```

</td></tr><tr style="vertical-align:top"><td>

```r
identical(df2[, 1:2], df2[1:2])
#> [1] TRUE
```

</td><td>

```r
identical(tbl2[, 1:2], tbl2[1:2])
#> [1] TRUE
```

</td></tr></tbody></table>

### Definition of `x[, j, drop = TRUE]`

For backward compatiblity, `x[, j, drop = TRUE]` performs column __extraction__, returning `x[j][[1]]` when `ncol(x[j])` is 1.

<table class="dftbl"><tbody><tr style="vertical-align:top"><td>

```r
df[, 1, drop = TRUE]
#> [1]  1 NA  3 NA
```

</td><td>

```r
tbl[, 1, drop = TRUE]
#> [1]  1 NA  3 NA
```

</td></tr></tbody></table>

<table class="dftbl"><tbody><tr style="vertical-align:top"><td>

```r
identical(df[, 3, drop = TRUE], df[[3]])
#> [1] TRUE
```

</td><td>

```r
identical(tbl[, 3, drop = TRUE], tbl[[3]])
#> [1] TRUE
```

</td></tr><tr style="vertical-align:top"><td>

```r
identical(df2[, 1, drop = TRUE], df2[[1]])
#> [1] TRUE
```

</td><td>

```r
identical(tbl2[, 1, drop = TRUE], tbl2[[1]])
#> [1] TRUE
```

</td></tr><tr style="vertical-align:top"><td>

```r
identical(df2[, 2, drop = TRUE], df2[[2]])
#> [1] TRUE
```

</td><td>

```r
identical(tbl2[, 2, drop = TRUE], tbl2[[2]])
#> [1] TRUE
```

</td></tr></tbody></table>

## Row subsetting

### Definition of `x[i, ]`

`x[i, ]` is equal to `tibble(vec_slice(x[[1]], i), vec_slice(x[[2]], i), ...)`.[^row-subset-efficiency]

[^row-subset-efficiency]: Row subsetting `x[i, ]` is not defined in terms of `x[[j]][i]` because that definition does not generalise to matrix and data frame columns.
For efficiency and backward compatibility, `i` is converted to an integer vector by `vec_as_index(i, nrow(x))` first.

<table class="dftbl"><tbody><tr style="vertical-align:top"><td>

```r
df[3, ]
#>   n c         li
#> 3 3 g 12, 13, 14
```

</td><td>

```r
tbl[3, ]
#> # A tibble: 1 x 3
#>       n c     li       
#>   <int> <chr> <list>   
#> 1     3 g     <int [3]>
```

</td></tr></tbody></table>

This means that `i` must be a numeric vector, or a logical vector of length `nrow(x)` or 1.
For compatibility, `i` can also be a character vector containing positive numbers.

<table class="dftbl"><tbody><tr style="vertical-align:top"><td>

```r
df[mean, ]
```

<div class="error">

```
#> Error in xj[i]: invalid subscript type
#> 'closure'
```

</div></td><td>

```r
tbl[mean, ]
```

<div class="error">

```
#> Error in `vectbl_as_row_location()`:
#> ! Must subset rows with a valid
#> subscript vector.
#> x Subscript `mean` has the wrong type
#> `function`.
#> i It must be logical, numeric, or
#> character.
```

</div></td></tr><tr style="vertical-align:top"><td>

```r
df[list(1), ]
```

<div class="error">

```
#> Error in xj[i]: invalid subscript type
#> 'list'
```

</div></td><td>

```r
tbl[list(1), ]
```

<div class="error">

```
#> Error in `vectbl_as_row_location()`:
#> ! Must subset rows with a valid
#> subscript vector.
#> x Subscript `list(1)` has the wrong type
#> `list`.
#> i It must be logical, numeric, or
#> character.
```

</div></td></tr><tr style="vertical-align:top"><td>

```r
df["1", ]
#>   n c li
#> 1 1 e  9
```

</td><td>

```r
tbl["1", ]
#> # A tibble: 1 x 3
#>       n c     li       
#>   <int> <chr> <list>   
#> 1     1 e     <dbl [1]>
```

</td></tr></tbody></table>

Exception: OOB values generate warnings instead of errors:

<table class="dftbl"><tbody><tr style="vertical-align:top"><td>

```r
df[10, ]
#>     n    c   li
#> NA NA <NA> NULL
```

</td><td>

```r
tbl[10, ]
```

<div class="warning">

```
#> Warning: The `i` argument of `[.tbl_df`
#> must lie in [0, rows] if positive, as of
#> tibble 3.0.0.
#> Use `NA_integer_` as row index to obtain
#> a row full of `NA` values.
```

</div>

```
#> # A tibble: 1 x 3
#>       n c     li    
#>   <int> <chr> <list>
#> 1    NA <NA>  <NULL>
```

</td></tr><tr style="vertical-align:top"><td>

```r
df["x", ]
#>     n    c   li
#> NA NA <NA> NULL
```

</td><td>

```r
tbl["x", ]
```

<div class="warning">

```
#> Warning: The `i` argument of `[.tbl_df`
#> must use valid row names as of tibble
#> 3.0.0.
#> Use `NA_integer_` as row index to obtain
#> a row full of `NA` values.
```

</div>

```
#> # A tibble: 1 x 3
#>       n c     li    
#>   <int> <chr> <list>
#> 1    NA <NA>  <NULL>
```

</td></tr></tbody></table>


Unlike data frames, only logical vectors of length 1 are recycled.
<!-- TODO: should this be an error? #648 -->

<table class="dftbl"><tbody><tr style="vertical-align:top"><td>

```r
df[c(TRUE, FALSE), ]
#>   n c         li
#> 1 1 e          9
#> 3 3 g 12, 13, 14
```

</td><td>

```r
tbl[c(TRUE, FALSE), ]
```

<div class="error">

```
#> Error in `vectbl_as_row_location()`:
#> ! Must subset rows with a valid
#> subscript vector.
#> i Logical subscripts must match the size
#> of the indexed input.
#> x Input has size 4 but subscript
#> `c(TRUE, FALSE)` has size 2.
```

</div>

</td></tr></tbody></table>

NB: scalar logicals are recycled, but scalar numerics are not.
That makes the `x[NA, ]` and `x[NA_integer_, ]` return different results.

<table class="dftbl"><tbody><tr style="vertical-align:top"><td>

```r
df[NA, ]
#>       n    c   li
#> NA   NA <NA> NULL
#> NA.1 NA <NA> NULL
#> NA.2 NA <NA> NULL
#> NA.3 NA <NA> NULL
```

</td><td>

```r
tbl[NA, ]
#> # A tibble: 4 x 3
#>       n c     li    
#>   <int> <chr> <list>
#> 1    NA <NA>  <NULL>
#> 2    NA <NA>  <NULL>
#> 3    NA <NA>  <NULL>
#> 4    NA <NA>  <NULL>
```

</td></tr><tr style="vertical-align:top"><td>

```r
df[NA_integer_, ]
#>     n    c   li
#> NA NA <NA> NULL
```

</td><td>

```r
tbl[NA_integer_, ]
#> # A tibble: 1 x 3
#>       n c     li    
#>   <int> <chr> <list>
#> 1    NA <NA>  <NULL>
```

</td></tr></tbody></table>

### Definition of `x[i, , drop = TRUE]`

`drop = TRUE` has no effect when not selecting a single row:

<table class="dftbl"><tbody><tr style="vertical-align:top"><td>

```r
df[1, , drop = TRUE]
#> $n
#> [1] 1
#> 
#> $c
#> [1] "e"
#> 
#> $li
#> $li[[1]]
#> [1] 9
```

</td><td>

```r
tbl[1, , drop = TRUE]
#> # A tibble: 1 x 3
#>       n c     li       
#>   <int> <chr> <list>   
#> 1     1 e     <dbl [1]>
```

</td></tr></tbody></table>

<!-- TODO: soft-deprecate -->

## Row and column subsetting

### Definition of `x[]` and `x[,]`

`x[]` and `x[,]` are equivalent to `x`.[^bracket-comma]

[^bracket-comma]: `x[,]` is equivalent to `x[]` because `x[, j]` is equivalent to `x[j]`.

### Definition of `x[i, j]`

`x[i, j]` is equal to `x[i, ][j]`.[^bracket-flip]

[^bracket-flip]: A more efficient implementation of `x[i, j]` would forward to `x[j][i, ]`.

<table class="dftbl"><tbody><tr style="vertical-align:top"><td>

```r
df[1, 1]
#> [1] 1
```

</td><td>

```r
tbl[1, 1]
#> # A tibble: 1 x 1
#>       n
#>   <int>
#> 1     1
```

</td></tr><tr style="vertical-align:top"><td>

```r
df[1, ][1]
#>   n
#> 1 1
```

</td><td>

```r
tbl[1, ][1]
#> # A tibble: 1 x 1
#>       n
#>   <int>
#> 1     1
```

</td></tr><tr style="vertical-align:top"><td>

```r
identical(df[1, 2:3], df[2:3][1, ])
#> [1] TRUE
```

</td><td>

```r
identical(tbl[1, 2:3], tbl[2:3][1, ])
#> [1] TRUE
```

</td></tr><tr style="vertical-align:top"><td>

```r
identical(df[2:3, 1], df[1][2:3, ])
#> [1] TRUE
```

</td><td>

```r
identical(tbl[2:3, 1], tbl[1][2:3, ])
#> [1] TRUE
```

</td></tr><tr style="vertical-align:top"><td>

```r
identical(df2[2:3, 1:2], df2[1:2][2:3, ])
#> [1] TRUE
```

</td><td>

```r
identical(tbl2[2:3, 1:2], tbl2[1:2][2:3, ])
#> [1] TRUE
```

</td></tr></tbody></table>


### Definition of `x[[i, j]]`

`i` must be a numeric vector of length 1.
`x[[i, j]]` is equal to `x[i, ][[j]]`, or `vctrs::vec_slice(x[[j]], i)`.[^bracket2-flip]

[^bracket2-flip]: Cell subsetting `x[[i, j]]` is not defined in terms of `x[[j]][[i]]` because that definition does not generalise to list, matrix and data frame columns.
A more efficient implementation of `x[[i, j]]` would check that `j` is a scalar and forward to `x[i, j][[1]]`.


```r
df[[1, 1]]
#> [1] 1
df[[1, 3]]
#> [1] 9
```

This implies that `j` must be a numeric or character vector of length 1.

NB: `vec_size(x[[i, j]])` always equals 1.
Unlike `x[i, ]`, `x[[i, ]]` is not valid.

## Column update

### Definition of `x[[j]] <- a`

If `a` is a vector then `x[[j]] <- a` replaces the `j`th column with value `a`.

<table class="dftbl"><tbody><tr style="vertical-align:top"><td>

```r
with_df(df[[1]] <- 0)
#>   n c         li
#> 1 0 e          9
#> 2 0 f     10, 11
#> 3 0 g 12, 13, 14
#> 4 0 h       text
```

</td><td>

```r
with_tbl(tbl[[1]] <- 0)
#> # A tibble: 4 x 3
#>       n c     li       
#>   <dbl> <chr> <list>   
#> 1     0 e     <dbl [1]>
#> 2     0 f     <int [2]>
#> 3     0 g     <int [3]>
#> 4     0 h     <chr [1]>
```

</td></tr><tr style="vertical-align:top"><td>

```r
with_df(df[[3]] <- 4:1)
#>    n c li
#> 1  1 e  4
#> 2 NA f  3
#> 3  3 g  2
#> 4 NA h  1
```

</td><td>

```r
with_tbl(tbl[[3]] <- 4:1)
#> # A tibble: 4 x 3
#>       n c        li
#>   <int> <chr> <int>
#> 1     1 e         4
#> 2    NA f         3
#> 3     3 g         2
#> 4    NA h         1
```

</td></tr><tr style="vertical-align:top"><td>

```r
with_df2(df2[[1]] <- 0)
#>   tb m.1 m.2 m.3 m.4
#> 1  0   1   0   0   0
#> 2  0   0   1   0   0
#> 3  0   0   0   1   0
#> 4  0   0   0   0   1
```

</td><td>

```r
with_tbl2(tbl2[[1]] <- 0)
#> # A tibble: 4 x 2
#>      tb m[,1]  [,2]  [,3]  [,4]
#>   <dbl> <dbl> <dbl> <dbl> <dbl>
#> 1     0     1     0     0     0
#> 2     0     0     1     0     0
#> 3     0     0     0     1     0
#> 4     0     0     0     0     1
```

</td></tr><tr style="vertical-align:top"><td>

```r
with_df2(df2[[2]] <- 4:1)
#>   tb.n tb.c      tb.li m
#> 1    1    e          9 4
#> 2   NA    f     10, 11 3
#> 3    3    g 12, 13, 14 2
#> 4   NA    h       text 1
```

</td><td>

```r
with_tbl2(tbl2[[2]] <- 4:1)
#> # A tibble: 4 x 2
#>    tb$n $c    $li           m
#>   <int> <chr> <list>    <int>
#> 1     1 e     <dbl [1]>     4
#> 2    NA f     <int [2]>     3
#> 3     3 g     <int [3]>     2
#> 4    NA h     <chr [1]>     1
```

</td></tr></tbody></table>

<table class="dftbl"><tbody><tr style="vertical-align:top"><td>

```r
with_df(df[[1]] <- 0)
#>   n c         li
#> 1 0 e          9
#> 2 0 f     10, 11
#> 3 0 g 12, 13, 14
#> 4 0 h       text
```

</td><td>

```r
with_tbl(tbl[[1]] <- 0)
#> # A tibble: 4 x 3
#>       n c     li       
#>   <dbl> <chr> <list>   
#> 1     0 e     <dbl [1]>
#> 2     0 f     <int [2]>
#> 3     0 g     <int [3]>
#> 4     0 h     <chr [1]>
```

</td></tr><tr style="vertical-align:top"><td>

```r
with_df(df[["c"]] <- 0)
#>    n c         li
#> 1  1 0          9
#> 2 NA 0     10, 11
#> 3  3 0 12, 13, 14
#> 4 NA 0       text
```

</td><td>

```r
with_tbl(tbl[["c"]] <- 0)
#> # A tibble: 4 x 3
#>       n     c li       
#>   <int> <dbl> <list>   
#> 1     1     0 <dbl [1]>
#> 2    NA     0 <int [2]>
#> 3     3     0 <int [3]>
#> 4    NA     0 <chr [1]>
```

</td></tr></tbody></table>

<table class="dftbl"><tbody><tr style="vertical-align:top"><td>

```r
with_df(df[[TRUE]] <- 0)
#>   n c         li
#> 1 0 e          9
#> 2 0 f     10, 11
#> 3 0 g 12, 13, 14
#> 4 0 h       text
```

</td><td>

```r
with_tbl(tbl[[TRUE]] <- 0)
```

<div class="error">

```
#> Error in `vectbl_as_col_location2()`:
#> ! Must assign to column with a single
#> valid subscript.
#> x Subscript `TRUE` has the wrong type
#> `logical`.
#> i It must be numeric or character.
```

</div></td></tr><tr style="vertical-align:top"><td>

```r
with_df(df[[1:3]] <- 0)
```

<div class="error">

```
#> Error in `[[<-`(`*tmp*`, i, value =
#> value): recursive indexing failed at
#> level 2
```

</div></td><td>

```r
with_tbl(tbl[[1:3]] <- 0)
```

<div class="error">

```
#> Error in `vectbl_as_col_location2()`:
#> ! Must assign to column with a single
#> valid subscript.
#> x Subscript `1:3` has size 3 but must be
#> size 1.
```

</div></td></tr><tr style="vertical-align:top"><td>

```r
with_df(df[[c("n", "c")]] <- 0)
```

<div class="error">

```
#> Error in x[[i]] <- value: more elements
#> supplied than there are to replace
```

</div></td><td>

```r
with_tbl(tbl[[c("n", "c")]] <- 0)
```

<div class="error">

```
#> Error in `vectbl_as_col_location2()`:
#> ! Must assign to column with a single
#> valid subscript.
#> x Subscript `c("n", "c")` has size 2 but
#> must be size 1.
```

</div></td></tr><tr style="vertical-align:top"><td>

```r
with_df(df[[FALSE]] <- 0)
```

<div class="error">

```
#> Error in x[[i]] <- value: attempt to
#> select less than one element in
#> integerOneIndex
```

</div></td><td>

```r
with_tbl(tbl[[FALSE]] <- 0)
```

<div class="error">

```
#> Error in `vectbl_as_col_location2()`:
#> ! Must assign to column with a single
#> valid subscript.
#> x Subscript `FALSE` has the wrong type
#> `logical`.
#> i It must be numeric or character.
```

</div></td></tr><tr style="vertical-align:top"><td>

```r
with_df(df[[1:2]] <- 0)
```

<div class="error">

```
#> Error in x[[i]] <- value: more elements
#> supplied than there are to replace
```

</div></td><td>

```r
with_tbl(tbl[[1:2]] <- 0)
```

<div class="error">

```
#> Error in `vectbl_as_col_location2()`:
#> ! Must assign to column with a single
#> valid subscript.
#> x Subscript `1:2` has size 2 but must be
#> size 1.
```

</div></td></tr><tr style="vertical-align:top"><td>

```r
with_df(df[[NA_integer_]] <- 0)
```

<div class="error">

```
#> Error in x[[i]] <- value: attempt to
#> select more than one element in
#> integerOneIndex
```

</div></td><td>

```r
with_tbl(tbl[[NA_integer_]] <- 0)
```

<div class="error">

```
#> Error in `vectbl_as_col_location2()`:
#> ! Must assign to column with a single
#> valid subscript.
#> x Subscript `NA_integer_` can't be `NA`.
```

</div></td></tr><tr style="vertical-align:top"><td>

```r
with_df(df[[NA]] <- 0)
```

<div class="error">

```
#> Error in x[[i]] <- value: attempt to
#> select more than one element in
#> integerOneIndex
```

</div></td><td>

```r
with_tbl(tbl[[NA]] <- 0)
```

<div class="error">

```
#> Error in `vectbl_as_col_location2()`:
#> ! Must assign to column with a single
#> valid subscript.
#> x Subscript `NA` can't be `NA`.
```

</div></td></tr><tr style="vertical-align:top"><td>

```r
with_df(df[[NA_character_]] <- 0)
```

<div class="error">

```
#> Error in if (names(x)[nc] == "")
#> names(x)[nc] <- paste0("V", nc): missing
#> value where TRUE/FALSE needed
```

</div></td><td>

```r
with_tbl(tbl[[NA_character_]] <- 0)
```

<div class="error">

```
#> Error in `vectbl_as_col_location2()`:
#> ! Must assign to column with a single
#> valid subscript.
#> x Subscript `NA_character_` can't be
#> `NA`.
```

</div>

</td></tr></tbody></table>

`a` is recycled to the same size as `x` so must have size `nrow(x)` or 1.
(The only exception is when `a` is `NULL`, as described below.)
Recycling also works for list, data frame, and matrix columns.

<table class="dftbl"><tbody><tr style="vertical-align:top"><td>

```r
with_df(df[["li"]] <- list(0))
#>    n c li
#> 1  1 e  0
#> 2 NA f  0
#> 3  3 g  0
#> 4 NA h  0
```

</td><td>

```r
with_tbl(tbl[["li"]] <- list(0))
#> # A tibble: 4 x 3
#>       n c     li       
#>   <int> <chr> <list>   
#> 1     1 e     <dbl [1]>
#> 2    NA f     <dbl [1]>
#> 3     3 g     <dbl [1]>
#> 4    NA h     <dbl [1]>
```

</td></tr><tr style="vertical-align:top"><td>

```r
with_df2(df2[["tb"]] <- df[1, ])
```

<div class="error">

```
#> Error in `[[<-.data.frame`(`*tmp*`,
#> "tb", value = structure(list(n = 1L, :
#> replacement has 1 row, data has 4
```

</div></td><td>

```r
with_tbl2(tbl2[["tb"]] <- tbl[1, ])
#> # A tibble: 4 x 2
#>    tb$n $c    $li       m[,1]  [,2]
#>   <int> <chr> <list>    <dbl> <dbl>
#> 1     1 e     <dbl [1]>     1     0
#> 2     1 e     <dbl [1]>     0     1
#> 3     1 e     <dbl [1]>     0     0
#> 4     1 e     <dbl [1]>     0     0
#> # ... with 1 more variable:
#> #   m[3:4] <dbl>
```

</td></tr><tr style="vertical-align:top"><td>

```r
with_df2(df2[["m"]] <- df2[["m"]][1, , drop = FALSE])
```

<div class="error">

```
#> Error in `[[<-.data.frame`(`*tmp*`, "m",
#> value = structure(c(1, 0, 0, :
#> replacement has 1 row, data has 4
```

</div></td><td>

```r
with_tbl2(tbl2[["m"]] <- tbl2[["m"]][1, , drop = FALSE])
#> # A tibble: 4 x 2
#>    tb$n $c    $li       m[,1]  [,2]
#>   <int> <chr> <list>    <dbl> <dbl>
#> 1     1 e     <dbl [1]>     1     0
#> 2    NA f     <int [2]>     1     0
#> 3     3 g     <int [3]>     1     0
#> 4    NA h     <chr [1]>     1     0
#> # ... with 1 more variable:
#> #   m[3:4] <dbl>
```

</td></tr></tbody></table>

<table class="dftbl"><tbody><tr style="vertical-align:top"><td>

```r
with_df(df[[1]] <- 1)
#>   n c         li
#> 1 1 e          9
#> 2 1 f     10, 11
#> 3 1 g 12, 13, 14
#> 4 1 h       text
```

</td><td>

```r
with_tbl(tbl[[1]] <- 1)
#> # A tibble: 4 x 3
#>       n c     li       
#>   <dbl> <chr> <list>   
#> 1     1 e     <dbl [1]>
#> 2     1 f     <int [2]>
#> 3     1 g     <int [3]>
#> 4     1 h     <chr [1]>
```

</td></tr><tr style="vertical-align:top"><td>

```r
with_df(df[[1]] <- 4:1)
#>   n c         li
#> 1 4 e          9
#> 2 3 f     10, 11
#> 3 2 g 12, 13, 14
#> 4 1 h       text
```

</td><td>

```r
with_tbl(tbl[[1]] <- 4:1)
#> # A tibble: 4 x 3
#>       n c     li       
#>   <int> <chr> <list>   
#> 1     4 e     <dbl [1]>
#> 2     3 f     <int [2]>
#> 3     2 g     <int [3]>
#> 4     1 h     <chr [1]>
```

</td></tr><tr style="vertical-align:top"><td>

```r
with_df(df[[1]] <- 3:1)
```

<div class="error">

```
#> Error in `[[<-.data.frame`(`*tmp*`, 1,
#> value = 3:1): replacement has 3 rows,
#> data has 4
```

</div></td><td>

```r
with_tbl(tbl[[1]] <- 3:1)
```

<div class="error">

```
#> Error:
#> ! Assigned data `3:1` must be compatible
#> with existing data.
#> x Existing data has 4 rows.
#> x Assigned data has 3 rows.
#> i Only vectors of size 1 are recycled.
```

</div></td></tr><tr style="vertical-align:top"><td>

```r
with_df(df[[1]] <- 2:1)
#>   n c         li
#> 1 2 e          9
#> 2 1 f     10, 11
#> 3 2 g 12, 13, 14
#> 4 1 h       text
```

</td><td>

```r
with_tbl(tbl[[1]] <- 2:1)
```

<div class="error">

```
#> Error:
#> ! Assigned data `2:1` must be compatible
#> with existing data.
#> x Existing data has 4 rows.
#> x Assigned data has 2 rows.
#> i Only vectors of size 1 are recycled.
```

</div>

</td></tr></tbody></table>

`j` must be a scalar numeric or a string, and cannot be `NA`.
If `j` is OOB, a new column is added on the right hand side, with name repair if needed.

<table class="dftbl"><tbody><tr style="vertical-align:top"><td>

```r
with_df(df[["x"]] <- 0)
#>    n c         li x
#> 1  1 e          9 0
#> 2 NA f     10, 11 0
#> 3  3 g 12, 13, 14 0
#> 4 NA h       text 0
```

</td><td>

```r
with_tbl(tbl[["x"]] <- 0)
#> # A tibble: 4 x 4
#>       n c     li            x
#>   <int> <chr> <list>    <dbl>
#> 1     1 e     <dbl [1]>     0
#> 2    NA f     <int [2]>     0
#> 3     3 g     <int [3]>     0
#> 4    NA h     <chr [1]>     0
```

</td></tr><tr style="vertical-align:top"><td>

```r
with_df(df[[4]] <- 0)
#>    n c         li V4
#> 1  1 e          9  0
#> 2 NA f     10, 11  0
#> 3  3 g 12, 13, 14  0
#> 4 NA h       text  0
```

</td><td>

```r
with_tbl(tbl[[4]] <- 0)
#> # A tibble: 4 x 4
#>       n c     li         ...4
#>   <int> <chr> <list>    <dbl>
#> 1     1 e     <dbl [1]>     0
#> 2    NA f     <int [2]>     0
#> 3     3 g     <int [3]>     0
#> 4    NA h     <chr [1]>     0
```

</td></tr><tr style="vertical-align:top"><td>

```r
with_df(df[[5]] <- 0)
```

<div class="warning">

```
#> Warning in format.data.frame(if (omit)
#> x[seq_len(n0), , drop = FALSE] else
#> x, : corrupt data frame: columns will be
#> truncated or padded with NAs
```

</div>

```
#>    n c         li      V5
#> 1  1 e          9 NULL  0
#> 2 NA f     10, 11 <NA>  0
#> 3  3 g 12, 13, 14 <NA>  0
#> 4 NA h       text <NA>  0
```

</td><td>

```r
with_tbl(tbl[[5]] <- 0)
```

<div class="error">

```
#> Error in
#> `numtbl_as_col_location_assign()`:
#> ! Can't assign to columns beyond the end
#> with non-consecutive locations.
#> i Input has size 3.
#> x Subscript `5` contains non-consecutive
#> location 5.
```

</div>

</td></tr></tbody></table>

<!-- HW: should we permitted oob assignment with numeric j? It's a bit weird to create a column with unknonw column -->

`df[[j]] <- a` replaces the complete column so can change the type.

<table class="dftbl"><tbody><tr style="vertical-align:top"><td>

```r
with_df(df[[1]] <- df[[2]])
#>   n c         li
#> 1 e e          9
#> 2 f f     10, 11
#> 3 g g 12, 13, 14
#> 4 h h       text
```

</td><td>

```r
with_tbl(tbl[[1]] <- tbl[[2]])
#> # A tibble: 4 x 3
#>   n     c     li       
#>   <chr> <chr> <list>   
#> 1 e     e     <dbl [1]>
#> 2 f     f     <int [2]>
#> 3 g     g     <int [3]>
#> 4 h     h     <chr [1]>
```

</td></tr><tr style="vertical-align:top"><td>

```r
with_df(df[[2]] <- df[[3]])
#>    n          c         li
#> 1  1          9          9
#> 2 NA     10, 11     10, 11
#> 3  3 12, 13, 14 12, 13, 14
#> 4 NA       text       text
```

</td><td>

```r
with_tbl(tbl[[2]] <- tbl[[3]])
#> # A tibble: 4 x 3
#>       n c         li       
#>   <int> <list>    <list>   
#> 1     1 <dbl [1]> <dbl [1]>
#> 2    NA <int [2]> <int [2]>
#> 3     3 <int [3]> <int [3]>
#> 4    NA <chr [1]> <chr [1]>
```

</td></tr><tr style="vertical-align:top"><td>

```r
with_df(df[[3]] <- df2[[1]])
#>    n c li.n li.c      li.li
#> 1  1 e    1    e          9
#> 2 NA f   NA    f     10, 11
#> 3  3 g    3    g 12, 13, 14
#> 4 NA h   NA    h       text
```

</td><td>

```r
with_tbl(tbl[[3]] <- tbl2[[1]])
#> # A tibble: 4 x 3
#>       n c      li$n $c    $li      
#>   <int> <chr> <int> <chr> <list>   
#> 1     1 e         1 e     <dbl [1]>
#> 2    NA f        NA f     <int [2]>
#> 3     3 g         3 g     <int [3]>
#> 4    NA h        NA h     <chr [1]>
```

</td></tr><tr style="vertical-align:top"><td>

```r
with_df2(df2[[1]] <- df2[[2]])
#>   tb.1 tb.2 tb.3 tb.4 m.1 m.2 m.3 m.4
#> 1    1    0    0    0   1   0   0   0
#> 2    0    1    0    0   0   1   0   0
#> 3    0    0    1    0   0   0   1   0
#> 4    0    0    0    1   0   0   0   1
```

</td><td>

```r
with_tbl2(tbl2[[1]] <- tbl2[[2]])
#> # A tibble: 4 x 2
#>   tb[,1]  [,2]  [,3]  [,4] m[,1]  [,2]
#>    <dbl> <dbl> <dbl> <dbl> <dbl> <dbl>
#> 1      1     0     0     0     1     0
#> 2      0     1     0     0     0     1
#> 3      0     0     1     0     0     0
#> 4      0     0     0     1     0     0
#> # ... with 1 more variable:
#> #   m[3:4] <dbl>
```

</td></tr><tr style="vertical-align:top"><td>

```r
with_df2(df2[[2]] <- df[[1]])
#>   tb.n tb.c      tb.li  m
#> 1    1    e          9  1
#> 2   NA    f     10, 11 NA
#> 3    3    g 12, 13, 14  3
#> 4   NA    h       text NA
```

</td><td>

```r
with_tbl2(tbl2[[2]] <- tbl[[1]])
#> # A tibble: 4 x 2
#>    tb$n $c    $li           m
#>   <int> <chr> <list>    <int>
#> 1     1 e     <dbl [1]>     1
#> 2    NA f     <int [2]>    NA
#> 3     3 g     <int [3]>     3
#> 4    NA h     <chr [1]>    NA
```

</td></tr></tbody></table>

`[[<-` supports removing a column by assigning `NULL` to it.

<table class="dftbl"><tbody><tr style="vertical-align:top"><td>

```r
with_df(df[[1]] <- NULL)
#>   c         li
#> 1 e          9
#> 2 f     10, 11
#> 3 g 12, 13, 14
#> 4 h       text
```

</td><td>

```r
with_tbl(tbl[[1]] <- NULL)
#> # A tibble: 4 x 2
#>   c     li       
#>   <chr> <list>   
#> 1 e     <dbl [1]>
#> 2 f     <int [2]>
#> 3 g     <int [3]>
#> 4 h     <chr [1]>
```

</td></tr><tr style="vertical-align:top"><td>

```r
with_df2(df2[[2]] <- NULL)
#>   tb.n tb.c      tb.li
#> 1    1    e          9
#> 2   NA    f     10, 11
#> 3    3    g 12, 13, 14
#> 4   NA    h       text
```

</td><td>

```r
with_tbl2(tbl2[[2]] <- NULL)
#> # A tibble: 4 x 1
#>    tb$n $c    $li      
#>   <int> <chr> <list>   
#> 1     1 e     <dbl [1]>
#> 2    NA f     <int [2]>
#> 3     3 g     <int [3]>
#> 4    NA h     <chr [1]>
```

</td></tr></tbody></table>

Removing a nonexistent column is a no-op.

<table class="dftbl"><tbody><tr style="vertical-align:top"><td>

```r
with_df(df[["q"]] <- NULL)
#>    n c         li
#> 1  1 e          9
#> 2 NA f     10, 11
#> 3  3 g 12, 13, 14
#> 4 NA h       text
```

</td><td>

```r
with_tbl(tbl[["q"]] <- NULL)
#> # A tibble: 4 x 3
#>       n c     li       
#>   <int> <chr> <list>   
#> 1     1 e     <dbl [1]>
#> 2    NA f     <int [2]>
#> 3     3 g     <int [3]>
#> 4    NA h     <chr [1]>
```

</td></tr></tbody></table>

### Definition of `x$name <- a`

`x$name <- a` and `x$"name" <- a` are equivalent to `x[["name"]] <- a`.[^column-assign-symmetry]

[^column-assign-symmetry]: `$` behaves almost completely symmetrically to `[[` when comparing subsetting and subassignment.

<table class="dftbl"><tbody><tr style="vertical-align:top"><td>

```r
with_df(df$n <- 0)
#>   n c         li
#> 1 0 e          9
#> 2 0 f     10, 11
#> 3 0 g 12, 13, 14
#> 4 0 h       text
```

</td><td>

```r
with_tbl(tbl$n <- 0)
#> # A tibble: 4 x 3
#>       n c     li       
#>   <dbl> <chr> <list>   
#> 1     0 e     <dbl [1]>
#> 2     0 f     <int [2]>
#> 3     0 g     <int [3]>
#> 4     0 h     <chr [1]>
```

</td></tr><tr style="vertical-align:top"><td>

```r
with_df(df[["n"]] <- 0)
#>   n c         li
#> 1 0 e          9
#> 2 0 f     10, 11
#> 3 0 g 12, 13, 14
#> 4 0 h       text
```

</td><td>

```r
with_tbl(tbl[["n"]] <- 0)
#> # A tibble: 4 x 3
#>       n c     li       
#>   <dbl> <chr> <list>   
#> 1     0 e     <dbl [1]>
#> 2     0 f     <int [2]>
#> 3     0 g     <int [3]>
#> 4     0 h     <chr [1]>
```

</td></tr></tbody></table>

<table class="dftbl"><tbody><tr style="vertical-align:top"><td>

```r
with_df(df$"n" <- 0)
#>   n c         li
#> 1 0 e          9
#> 2 0 f     10, 11
#> 3 0 g 12, 13, 14
#> 4 0 h       text
```

</td><td>

```r
with_tbl(tbl$"n" <- 0)
#> # A tibble: 4 x 3
#>       n c     li       
#>   <dbl> <chr> <list>   
#> 1     0 e     <dbl [1]>
#> 2     0 f     <int [2]>
#> 3     0 g     <int [3]>
#> 4     0 h     <chr [1]>
```

</td></tr></tbody></table>

`$<-` does not perform partial matching.

<table class="dftbl"><tbody><tr style="vertical-align:top"><td>

```r
with_df(df$l <- 0)
#>    n c         li l
#> 1  1 e          9 0
#> 2 NA f     10, 11 0
#> 3  3 g 12, 13, 14 0
#> 4 NA h       text 0
```

</td><td>

```r
with_tbl(tbl$l <- 0)
#> # A tibble: 4 x 4
#>       n c     li            l
#>   <int> <chr> <list>    <dbl>
#> 1     1 e     <dbl [1]>     0
#> 2    NA f     <int [2]>     0
#> 3     3 g     <int [3]>     0
#> 4    NA h     <chr [1]>     0
```

</td></tr><tr style="vertical-align:top"><td>

```r
with_df(df[["l"]] <- 0)
#>    n c         li l
#> 1  1 e          9 0
#> 2 NA f     10, 11 0
#> 3  3 g 12, 13, 14 0
#> 4 NA h       text 0
```

</td><td>

```r
with_tbl(tbl[["l"]] <- 0)
#> # A tibble: 4 x 4
#>       n c     li            l
#>   <int> <chr> <list>    <dbl>
#> 1     1 e     <dbl [1]>     0
#> 2    NA f     <int [2]>     0
#> 3     3 g     <int [3]>     0
#> 4    NA h     <chr [1]>     0
```

</td></tr></tbody></table>

## Column subassignment: `x[j] <- a`

* If `j` is missing, it's replaced with `seq_along(x)`
* If `j` is logical vector, it's converted to numeric with `seq_along(x)[j]`.

### `a` is a list or data frame

If `inherits(a, "list")` or `inherits(a, "data.frame")` is `TRUE`, then `x[j] <- a` is equivalent to `x[[j[[1]]] <- a[[1]]`, `x[[j[[2]]]] <- a[[2]]`, ...

<table class="dftbl"><tbody><tr style="vertical-align:top"><td>

```r
with_df(df[1:2] <- list("x", 4:1))
#>   n c         li
#> 1 x 4          9
#> 2 x 3     10, 11
#> 3 x 2 12, 13, 14
#> 4 x 1       text
```

</td><td>

```r
with_tbl(tbl[1:2] <- list("x", 4:1))
#> # A tibble: 4 x 3
#>   n         c li       
#>   <chr> <int> <list>   
#> 1 x         4 <dbl [1]>
#> 2 x         3 <int [2]>
#> 3 x         2 <int [3]>
#> 4 x         1 <chr [1]>
```

</td></tr><tr style="vertical-align:top"><td>

```r
with_df(df[c("li", "x", "c")] <- list("x", 4:1, NULL))
#>    n li x
#> 1  1  x 4
#> 2 NA  x 3
#> 3  3  x 2
#> 4 NA  x 1
```

</td><td>

```r
with_tbl(tbl[c("li", "x", "c")] <- list("x", 4:1, NULL))
#> # A tibble: 4 x 3
#>       n li        x
#>   <int> <chr> <int>
#> 1     1 x         4
#> 2    NA x         3
#> 3     3 x         2
#> 4    NA x         1
```

</td></tr></tbody></table>

If `length(a)` equals 1, then it is recycled to the same length as `j`.

<table class="dftbl"><tbody><tr style="vertical-align:top"><td>

```r
with_df(df[1:2] <- list(1))
#>   n c         li
#> 1 1 1          9
#> 2 1 1     10, 11
#> 3 1 1 12, 13, 14
#> 4 1 1       text
```

</td><td>

```r
with_tbl(tbl[1:2] <- list(1))
#> # A tibble: 4 x 3
#>       n     c li       
#>   <dbl> <dbl> <list>   
#> 1     1     1 <dbl [1]>
#> 2     1     1 <int [2]>
#> 3     1     1 <int [3]>
#> 4     1     1 <chr [1]>
```

</td></tr><tr style="vertical-align:top"><td>

```r
with_df(df[1:2] <- list(0, 0, 0))
```

<div class="warning">

```
#> Warning in `[<-.data.frame`(`*tmp*`,
#> 1:2, value = list(0, 0, 0)): provided 3
#> variables to replace 2 variables
```

</div>

```
#>   n c         li
#> 1 0 0          9
#> 2 0 0     10, 11
#> 3 0 0 12, 13, 14
#> 4 0 0       text
```

</td><td>

```r
with_tbl(tbl[1:2] <- list(0, 0, 0))
```

<div class="error">

```
#> Error in `vectbl_as_new_col_index()`:
#> ! Can't recycle `list(0, 0, 0)` (size 3)
#> to size 2.
```

</div></td></tr><tr style="vertical-align:top"><td>

```r
with_df(df[1:3] <- list(0, 0))
#>   n c li
#> 1 0 0  0
#> 2 0 0  0
#> 3 0 0  0
#> 4 0 0  0
```

</td><td>

```r
with_tbl(tbl[1:3] <- list(0, 0))
```

<div class="error">

```
#> Error in `vectbl_as_new_col_index()`:
#> ! Can't recycle `list(0, 0)` (size 2) to
#> size 3.
```

</div>

</td></tr></tbody></table>

An attempt to update the same column twice gives an error.

<table class="dftbl"><tbody><tr style="vertical-align:top"><td>

```r
with_df(df[c(1, 1)] <- list(1, 2))
```

<div class="error">

```
#> Error in `[<-.data.frame`(`*tmp*`, c(1,
#> 1), value = list(1, 2)): duplicate
#> subscripts for columns
```

</div></td><td>

```r
with_tbl(tbl[c(1, 1)] <- list(1, 2))
```

<div class="error">

```
#> Error:
#> ! Column index 1 is used more than once
#> for assignment.
```

</div>

</td></tr></tbody></table>

If `a` contains `NULL` values, the corresponding columns are removed *after* updating (i.e. position indexes refer to columns before any modifications).

<table class="dftbl"><tbody><tr style="vertical-align:top"><td>

```r
with_df(df[1:2] <- list(NULL, 4:1))
#>   c         li
#> 1 4          9
#> 2 3     10, 11
#> 3 2 12, 13, 14
#> 4 1       text
```

</td><td>

```r
with_tbl(tbl[1:2] <- list(NULL, 4:1))
#> # A tibble: 4 x 2
#>       c li       
#>   <int> <list>   
#> 1     4 <dbl [1]>
#> 2     3 <int [2]>
#> 3     2 <int [3]>
#> 4     1 <chr [1]>
```

</td></tr></tbody></table>

`NA` indexes are not supported.

<table class="dftbl"><tbody><tr style="vertical-align:top"><td>

```r
with_df(df[NA] <- list("x"))
```

<div class="error">

```
#> Error in `[<-.data.frame`(`*tmp*`, NA,
#> value = list("x")): missing values are
#> not allowed in subscripted assignments
#> of data frames
```

</div></td><td>

```r
with_tbl(tbl[NA] <- list("x"))
```

<div class="error">

```
#> Error:
#> ! Can't use NA as column index with `[`
#> at positions 1, 2, and 3.
```

</div></td></tr><tr style="vertical-align:top"><td>

```r
with_df(df[NA_integer_] <- list("x"))
```

<div class="error">

```
#> Error in `[<-.data.frame`(`*tmp*`,
#> NA_integer_, value = list("x")): missing
#> values are not allowed in subscripted
#> assignments of data frames
```

</div></td><td>

```r
with_tbl(tbl[NA_integer_] <- list("x"))
```

<div class="error">

```
#> Error:
#> ! Can't use NA as column index in a
#> tibble for assignment.
```

</div></td></tr><tr style="vertical-align:top"><td>

```r
with_df(df[NA_character_] <- list("x"))
```

<div class="error">

```
#> Error in `[<-.data.frame`(`*tmp*`,
#> NA_character_, value = list("x")):
#> missing values are not allowed in
#> subscripted assignments of data frames
```

</div></td><td>

```r
with_tbl(tbl[NA_character_] <- list("x"))
```

<div class="error">

```
#> Error:
#> ! Can't use NA as column index in a
#> tibble for assignment.
```

</div>

</td></tr></tbody></table>

Just like column updates, `[<-` supports changing the type of an existing column.

<table class="dftbl"><tbody><tr style="vertical-align:top"><td>

```r
with_df(df[1] <- df[2])
#>   n c         li
#> 1 e e          9
#> 2 f f     10, 11
#> 3 g g 12, 13, 14
#> 4 h h       text
```

</td><td>

```r
with_tbl(tbl[1] <- tbl[2])
#> # A tibble: 4 x 3
#>   n     c     li       
#>   <chr> <chr> <list>   
#> 1 e     e     <dbl [1]>
#> 2 f     f     <int [2]>
#> 3 g     g     <int [3]>
#> 4 h     h     <chr [1]>
```

</td></tr><tr style="vertical-align:top"><td>

```r
with_df(df[2] <- df[3])
#>    n          c         li
#> 1  1          9          9
#> 2 NA     10, 11     10, 11
#> 3  3 12, 13, 14 12, 13, 14
#> 4 NA       text       text
```

</td><td>

```r
with_tbl(tbl[2] <- tbl[3])
#> # A tibble: 4 x 3
#>       n c         li       
#>   <int> <list>    <list>   
#> 1     1 <dbl [1]> <dbl [1]>
#> 2    NA <int [2]> <int [2]>
#> 3     3 <int [3]> <int [3]>
#> 4    NA <chr [1]> <chr [1]>
```

</td></tr><tr style="vertical-align:top"><td>

```r
with_df(df[3] <- df2[1])
#>    n c li.n li.c      li.li
#> 1  1 e    1    e          9
#> 2 NA f   NA    f     10, 11
#> 3  3 g    3    g 12, 13, 14
#> 4 NA h   NA    h       text
```

</td><td>

```r
with_tbl(tbl[3] <- tbl2[1])
#> # A tibble: 4 x 3
#>       n c      li$n $c    $li      
#>   <int> <chr> <int> <chr> <list>   
#> 1     1 e         1 e     <dbl [1]>
#> 2    NA f        NA f     <int [2]>
#> 3     3 g         3 g     <int [3]>
#> 4    NA h        NA h     <chr [1]>
```

</td></tr><tr style="vertical-align:top"><td>

```r
with_df2(df2[1] <- df2[2])
#>   tb.1 tb.2 tb.3 tb.4 m.1 m.2 m.3 m.4
#> 1    1    0    0    0   1   0   0   0
#> 2    0    1    0    0   0   1   0   0
#> 3    0    0    1    0   0   0   1   0
#> 4    0    0    0    1   0   0   0   1
```

</td><td>

```r
with_tbl2(tbl2[1] <- tbl2[2])
#> # A tibble: 4 x 2
#>   tb[,1]  [,2]  [,3]  [,4] m[,1]  [,2]
#>    <dbl> <dbl> <dbl> <dbl> <dbl> <dbl>
#> 1      1     0     0     0     1     0
#> 2      0     1     0     0     0     1
#> 3      0     0     1     0     0     0
#> 4      0     0     0     1     0     0
#> # ... with 1 more variable:
#> #   m[3:4] <dbl>
```

</td></tr><tr style="vertical-align:top"><td>

```r
with_df2(df2[2] <- df[1])
#>   tb.n tb.c      tb.li  m
#> 1    1    e          9  1
#> 2   NA    f     10, 11 NA
#> 3    3    g 12, 13, 14  3
#> 4   NA    h       text NA
```

</td><td>

```r
with_tbl2(tbl2[2] <- tbl[1])
#> # A tibble: 4 x 2
#>    tb$n $c    $li           m
#>   <int> <chr> <list>    <int>
#> 1     1 e     <dbl [1]>     1
#> 2    NA f     <int [2]>    NA
#> 3     3 g     <int [3]>     3
#> 4    NA h     <chr [1]>    NA
```

</td></tr></tbody></table>

Appending columns at the end (without gaps) is supported.
The name of new columns is determined by the LHS, the RHS, or by name repair (in that order of precedence).

<table class="dftbl"><tbody><tr style="vertical-align:top"><td>

```r
with_df(df[c("x", "y")] <- tibble("x", x = 4:1))
#>    n c         li x y
#> 1  1 e          9 x 4
#> 2 NA f     10, 11 x 3
#> 3  3 g 12, 13, 14 x 2
#> 4 NA h       text x 1
```

</td><td>

```r
with_tbl(tbl[c("x", "y")] <- tibble("x", x = 4:1))
#> # A tibble: 4 x 5
#>       n c     li        x         y
#>   <int> <chr> <list>    <chr> <int>
#> 1     1 e     <dbl [1]> x         4
#> 2    NA f     <int [2]> x         3
#> 3     3 g     <int [3]> x         2
#> 4    NA h     <chr [1]> x         1
```

</td></tr><tr style="vertical-align:top"><td>

```r
with_df(df[3:4] <- list("x", x = 4:1))
#>    n c li x
#> 1  1 e  x 4
#> 2 NA f  x 3
#> 3  3 g  x 2
#> 4 NA h  x 1
```

</td><td>

```r
with_tbl(tbl[3:4] <- list("x", x = 4:1))
#> # A tibble: 4 x 4
#>       n c     li        x
#>   <int> <chr> <chr> <int>
#> 1     1 e     x         4
#> 2    NA f     x         3
#> 3     3 g     x         2
#> 4    NA h     x         1
```

</td></tr><tr style="vertical-align:top"><td>

```r
with_df(df[4] <- list(4:1))
#>    n c         li V4
#> 1  1 e          9  4
#> 2 NA f     10, 11  3
#> 3  3 g 12, 13, 14  2
#> 4 NA h       text  1
```

</td><td>

```r
with_tbl(tbl[4] <- list(4:1))
#> # A tibble: 4 x 4
#>       n c     li         ...4
#>   <int> <chr> <list>    <int>
#> 1     1 e     <dbl [1]>     4
#> 2    NA f     <int [2]>     3
#> 3     3 g     <int [3]>     2
#> 4    NA h     <chr [1]>     1
```

</td></tr><tr style="vertical-align:top"><td>

```r
with_df(df[5] <- list(4:1))
```

<div class="error">

```
#> Error in `[<-.data.frame`(`*tmp*`, 5,
#> value = list(4:1)): new columns would
#> leave holes after existing columns
```

</div></td><td>

```r
with_tbl(tbl[5] <- list(4:1))
```

<div class="error">

```
#> Error in
#> `numtbl_as_col_location_assign()`:
#> ! Can't assign to columns beyond the end
#> with non-consecutive locations.
#> i Input has size 3.
#> x Subscript `5` contains non-consecutive
#> location 5.
```

</div>

</td></tr></tbody></table>

Tibbles support indexing by a logical matrix, but only for a scalar RHS, and if all columns updated are compatible with the value assigned.

<table class="dftbl"><tbody><tr style="vertical-align:top"><td>

```r
with_df(df[is.na(df)] <- 4)
#>   n c         li
#> 1 1 e          9
#> 2 4 f     10, 11
#> 3 3 g 12, 13, 14
#> 4 4 h       text
```

</td><td>

```r
with_tbl(tbl[is.na(tbl)] <- 4)
#> # A tibble: 4 x 3
#>       n c     li       
#>   <int> <chr> <list>   
#> 1     1 e     <dbl [1]>
#> 2     4 f     <int [2]>
#> 3     3 g     <int [3]>
#> 4     4 h     <chr [1]>
```

</td></tr><tr style="vertical-align:top"><td>

```r
with_df(df[is.na(df)] <- 1:2)
#>   n c         li
#> 1 1 e          9
#> 2 1 f     10, 11
#> 3 3 g 12, 13, 14
#> 4 2 h       text
```

</td><td>

```r
with_tbl(tbl[is.na(tbl)] <- 1:2)
```

<div class="error">

```
#> Error:
#> ! Subscript `is.na(tbl)` is a matrix,
#> the data `1:2` must have size 1.
```

</div></td></tr><tr style="vertical-align:top"><td>

```r
with_df(df[matrix(c(rep(TRUE, 5), rep(FALSE, 7)), ncol = 3)] <- 4)
#>   n c         li
#> 1 4 4          9
#> 2 4 f     10, 11
#> 3 4 g 12, 13, 14
#> 4 4 h       text
```

</td><td>

```r
with_tbl(tbl[matrix(c(rep(TRUE, 5), rep(FALSE, 7)), ncol = 3)] <- 4)
```

<div class="error">

```
#> Error:
#> ! Assigned data `4` must be compatible
#> with existing data.
#> i Error occurred for column `c`.
#> x Can't convert <double> to <character>.
```

</div>

</td></tr></tbody></table>

### `a` is a matrix or array

If `is.matrix(a)`, then `a` is coerced to a data frame with `as.data.frame()` before assigning.
If rows are assigned, the matrix type must be compatible with all columns.
If `is.array(a)` and `any(dim(a)[-1:-2] != 1)`, an error is thrown.

<table class="dftbl"><tbody><tr style="vertical-align:top"><td>

```r
with_df(df[1:2] <- matrix(8:1, ncol = 2))
#>   n c         li
#> 1 8 4          9
#> 2 7 3     10, 11
#> 3 6 2 12, 13, 14
#> 4 5 1       text
```

</td><td>

```r
with_tbl(tbl[1:2] <- matrix(8:1, ncol = 2))
#> # A tibble: 4 x 3
#>       n     c li       
#>   <int> <int> <list>   
#> 1     8     4 <dbl [1]>
#> 2     7     3 <int [2]>
#> 3     6     2 <int [3]>
#> 4     5     1 <chr [1]>
```

</td></tr><tr style="vertical-align:top"><td>

```r
with_df(df[1:3, 1:2] <- matrix(6:1, ncol = 2))
#>    n c         li
#> 1  6 3          9
#> 2  5 2     10, 11
#> 3  4 1 12, 13, 14
#> 4 NA h       text
```

</td><td>

```r
with_tbl(tbl[1:3, 1:2] <- matrix(6:1, ncol = 2))
```

<div class="error">

```
#> Error:
#> ! Assigned data `matrix(6:1, ncol = 2)`
#> must be compatible with existing data.
#> i Error occurred for column `c`.
#> x Can't convert <integer> to
#> <character>.
```

</div></td></tr><tr style="vertical-align:top"><td>

```r
with_df(df[1:2] <- array(4:1, dim = c(4, 1, 1)))
#>   n c         li
#> 1 4 4          9
#> 2 3 3     10, 11
#> 3 2 2 12, 13, 14
#> 4 1 1       text
```

</td><td>

```r
with_tbl(tbl[1:2] <- array(4:1, dim = c(4, 1, 1)))
#> # A tibble: 4 x 3
#>       n     c li       
#>   <int> <int> <list>   
#> 1     4     4 <dbl [1]>
#> 2     3     3 <int [2]>
#> 3     2     2 <int [3]>
#> 4     1     1 <chr [1]>
```

</td></tr><tr style="vertical-align:top"><td>

```r
with_df(df[1:2] <- array(8:1, dim = c(4, 2, 1)))
#>   n c         li
#> 1 8 4          9
#> 2 7 3     10, 11
#> 3 6 2 12, 13, 14
#> 4 5 1       text
```

</td><td>

```r
with_tbl(tbl[1:2] <- array(8:1, dim = c(4, 2, 1)))
#> # A tibble: 4 x 3
#>       n     c li       
#>   <int> <int> <list>   
#> 1     8     4 <dbl [1]>
#> 2     7     3 <int [2]>
#> 3     6     2 <int [3]>
#> 4     5     1 <chr [1]>
```

</td></tr><tr style="vertical-align:top"><td>

```r
with_df(df[1:2] <- array(8:1, dim = c(2, 1, 4)))
#>   n c         li
#> 1 8 4          9
#> 2 7 3     10, 11
#> 3 6 2 12, 13, 14
#> 4 5 1       text
```

</td><td>

```r
with_tbl(tbl[1:2] <- array(8:1, dim = c(2, 1, 4)))
```

<div class="error">

```
#> Error:
#> ! `array(8:1, dim = c(2, 1, 4))` must be
#> a vector, a bare list, a data frame, a
#> matrix, or NULL.
```

</div></td></tr><tr style="vertical-align:top"><td>

```r
with_df(df[1:2] <- array(8:1, dim = c(4, 1, 2)))
#>   n c         li
#> 1 8 4          9
#> 2 7 3     10, 11
#> 3 6 2 12, 13, 14
#> 4 5 1       text
```

</td><td>

```r
with_tbl(tbl[1:2] <- array(8:1, dim = c(4, 1, 2)))
```

<div class="error">

```
#> Error:
#> ! `array(8:1, dim = c(4, 1, 2))` must be
#> a vector, a bare list, a data frame, a
#> matrix, or NULL.
```

</div>

</td></tr></tbody></table>

### `a` is another type of vector

If `vec_is(a)`, then `x[j] <- a` is equivalent to `x[j] <- list(a)`.
This is primarily provided for backward compatbility.

<table class="dftbl"><tbody><tr style="vertical-align:top"><td>

```r
with_df(df[1] <- 0)
#>   n c         li
#> 1 0 e          9
#> 2 0 f     10, 11
#> 3 0 g 12, 13, 14
#> 4 0 h       text
```

</td><td>

```r
with_tbl(tbl[1] <- 0)
#> # A tibble: 4 x 3
#>       n c     li       
#>   <dbl> <chr> <list>   
#> 1     0 e     <dbl [1]>
#> 2     0 f     <int [2]>
#> 3     0 g     <int [3]>
#> 4     0 h     <chr [1]>
```

</td></tr><tr style="vertical-align:top"><td>

```r
with_df(df[1] <- list(0))
#>   n c         li
#> 1 0 e          9
#> 2 0 f     10, 11
#> 3 0 g 12, 13, 14
#> 4 0 h       text
```

</td><td>

```r
with_tbl(tbl[1] <- list(0))
#> # A tibble: 4 x 3
#>       n c     li       
#>   <dbl> <chr> <list>   
#> 1     0 e     <dbl [1]>
#> 2     0 f     <int [2]>
#> 3     0 g     <int [3]>
#> 4     0 h     <chr [1]>
```

</td></tr></tbody></table>

Matrices must be wrapped in `list()` before assignment to create a matrix column.

<table class="dftbl"><tbody><tr style="vertical-align:top"><td>

```r
with_df(df[1] <- list(matrix(1:8, ncol = 2)))
#>   n.1 n.2 c         li
#> 1   1   5 e          9
#> 2   2   6 f     10, 11
#> 3   3   7 g 12, 13, 14
#> 4   4   8 h       text
```

</td><td>

```r
with_tbl(tbl[1] <- list(matrix(1:8, ncol = 2)))
#> # A tibble: 4 x 3
#>   n[,1]  [,2] c     li       
#>   <int> <int> <chr> <list>   
#> 1     1     5 e     <dbl [1]>
#> 2     2     6 f     <int [2]>
#> 3     3     7 g     <int [3]>
#> 4     4     8 h     <chr [1]>
```

</td></tr><tr style="vertical-align:top"><td>


</td><td>


</td></tr><tr style="vertical-align:top"><td>

```r
with_df(df[1:2] <- list(matrix(1:8, ncol = 2)))
#>   n.1 n.2 c.1 c.2         li
#> 1   1   5   1   5          9
#> 2   2   6   2   6     10, 11
#> 3   3   7   3   7 12, 13, 14
#> 4   4   8   4   8       text
```

</td><td>

```r
with_tbl(tbl[1:2] <- list(matrix(1:8, ncol = 2)))
#> # A tibble: 4 x 3
#>   n[,1]  [,2] c[,1]  [,2] li       
#>   <int> <int> <int> <int> <list>   
#> 1     1     5     1     5 <dbl [1]>
#> 2     2     6     2     6 <int [2]>
#> 3     3     7     3     7 <int [3]>
#> 4     4     8     4     8 <chr [1]>
```

</td></tr></tbody></table>

### `a` is `NULL`

Entire columns can be removed.
Specifying `i` is an error.

<table class="dftbl"><tbody><tr style="vertical-align:top"><td>

```r
with_df(df[1] <- NULL)
#>   c         li
#> 1 e          9
#> 2 f     10, 11
#> 3 g 12, 13, 14
#> 4 h       text
```

</td><td>

```r
with_tbl(tbl[1] <- NULL)
#> # A tibble: 4 x 2
#>   c     li       
#>   <chr> <list>   
#> 1 e     <dbl [1]>
#> 2 f     <int [2]>
#> 3 g     <int [3]>
#> 4 h     <chr [1]>
```

</td></tr><tr style="vertical-align:top"><td>

```r
with_df(df[, 2:3] <- NULL)
#>    n
#> 1  1
#> 2 NA
#> 3  3
#> 4 NA
```

</td><td>

```r
with_tbl(tbl[, 2:3] <- NULL)
#> # A tibble: 4 x 1
#>       n
#>   <int>
#> 1     1
#> 2    NA
#> 3     3
#> 4    NA
```

</td></tr><tr style="vertical-align:top"><td>

```r
with_df(df[1, 2:3] <- NULL)
```

<div class="error">

```
#> Error in x[[jj]][iseq] <- vjj:
#> replacement has length zero
```

</div></td><td>

```r
with_tbl(tbl[1, 2:3] <- NULL)
```

<div class="error">

```
#> Error:
#> ! `NULL` must be a vector, a bare list,
#> a data frame or a matrix.
```

</div>

</td></tr></tbody></table>

### `a` is not a vector

Any other type for `a` is an error.
Note that if `is.list(a)` is `TRUE`, but `inherits(a, "list")` is `FALSE`, then `a` is considered to be a scalar.
See `?vec_is` and `?vec_proxy` for details.

<table class="dftbl"><tbody><tr style="vertical-align:top"><td>

```r
with_df(df[1] <- mean)
```

<div class="error">

```
#> Error in rep(value, length.out = n):
#> attempt to replicate an object of type
#> 'closure'
```

</div></td><td>

```r
with_tbl(tbl[1] <- mean)
```

<div class="error">

```
#> Error:
#> ! `mean` must be a vector, a bare list,
#> a data frame, a matrix, or NULL.
```

</div></td></tr><tr style="vertical-align:top"><td>

```r
with_df(df[1] <- lm(mpg ~ wt, data = mtcars))
```

<div class="warning">

```
#> Warning in `[<-.data.frame`(`*tmp*`,
#> 1, value = structure(list(coefficients
#> = c(`(Intercept)` = 37.285126167342, :
#> replacement element 2 has 32 rows to
#> replace 4 rows
```

</div><div class="warning">

```
#> Warning in `[<-.data.frame`(`*tmp*`,
#> 1, value = structure(list(coefficients
#> = c(`(Intercept)` = 37.285126167342, :
#> replacement element 3 has 32 rows to
#> replace 4 rows
```

</div><div class="warning">

```
#> Warning in `[<-.data.frame`(`*tmp*`,
#> 1, value = structure(list(coefficients
#> = c(`(Intercept)` = 37.285126167342, :
#> replacement element 5 has 32 rows to
#> replace 4 rows
```

</div><div class="warning">

```
#> Warning in `[<-.data.frame`(`*tmp*`,
#> 1, value = structure(list(coefficients
#> = c(`(Intercept)` = 37.285126167342, :
#> replacement element 7 has 5 rows to
#> replace 4 rows
```

</div><div class="error">

```
#> Error in `[<-.data.frame`(`*tmp*`, 1,
#> value = structure(list(coefficients =
#> c(`(Intercept)` = 37.285126167342, :
#> replacement element 10 has 3 rows, need
#> 4
```

</div></td><td>

```r
with_tbl(tbl[1] <- lm(mpg ~ wt, data = mtcars))
```

<div class="error">

```
#> Error:
#> ! `lm(mpg ~ wt, data = mtcars)` must be
#> a vector, a bare list, a data frame, a
#> matrix, or NULL.
```

</div>

</td></tr></tbody></table>

<!-- HW: we need better error messages for these cases -->

## Row subassignment: `x[i, ] <- list(...)`

`x[i, ] <- a` is the same as `vec_slice(x[[j_1]], i) <- a[[1]]`,  `vec_slice(x[[j_2]], i) <- a[[2]]`, ... .[^row-assign-symmetry]

[^row-assign-symmetry]: `x[i, ]` is symmetrically for subset and subassignment.

<table class="dftbl"><tbody><tr style="vertical-align:top"><td>

```r
with_df(df[2:3, ] <- df[1, ])
#>    n c   li
#> 1  1 e    9
#> 2  1 e    9
#> 3  1 e    9
#> 4 NA h text
```

</td><td>

```r
with_tbl(tbl[2:3, ] <- tbl[1, ])
#> # A tibble: 4 x 3
#>       n c     li       
#>   <int> <chr> <list>   
#> 1     1 e     <dbl [1]>
#> 2     1 e     <dbl [1]>
#> 3     1 e     <dbl [1]>
#> 4    NA h     <chr [1]>
```

</td></tr><tr style="vertical-align:top"><td>

```r
with_df(df[c(FALSE, TRUE, TRUE, FALSE), ] <- df[1, ])
#>    n c   li
#> 1  1 e    9
#> 2  1 e    9
#> 3  1 e    9
#> 4 NA h text
```

</td><td>

```r
with_tbl(tbl[c(FALSE, TRUE, TRUE, FALSE), ] <- tbl[1, ])
#> # A tibble: 4 x 3
#>       n c     li       
#>   <int> <chr> <list>   
#> 1     1 e     <dbl [1]>
#> 2     1 e     <dbl [1]>
#> 3     1 e     <dbl [1]>
#> 4    NA h     <chr [1]>
```

</td></tr></tbody></table>

<table class="dftbl"><tbody><tr style="vertical-align:top"><td>

```r
with_df(df[0:2, ] <- df[1, ])
#>    n c         li
#> 1  1 e          9
#> 2  1 e          9
#> 3  3 g 12, 13, 14
#> 4 NA h       text
```

</td><td>

```r
with_tbl(tbl[0:2, ] <- tbl[1, ])
```

<div class="error">

```
#> Error in
#> `numtbl_as_row_location_assign()`:
#> ! Must assign to rows with a valid
#> subscript vector.
#> x Subscript `0:2` can't contain `0`
#> values.
#> i It has a `0` value at location 1.
```

</div></td></tr><tr style="vertical-align:top"><td>

```r
with_df(df[0, ] <- df[1, ])
#>    n c         li
#> 1  1 e          9
#> 2 NA f     10, 11
#> 3  3 g 12, 13, 14
#> 4 NA h       text
```

</td><td>

```r
with_tbl(tbl[0, ] <- tbl[1, ])
```

<div class="error">

```
#> Error in
#> `numtbl_as_row_location_assign()`:
#> ! Must assign to rows with a valid
#> subscript vector.
#> x Subscript `0` can't contain `0`
#> values.
#> i It has a `0` value at location 1.
```

</div></td></tr><tr style="vertical-align:top"><td>

```r
with_df(df[-2, ] <- df[1, ])
#>    n c     li
#> 1  1 e      9
#> 2 NA f 10, 11
#> 3  1 e      9
#> 4  1 e      9
```

</td><td>

```r
with_tbl(tbl[-2, ] <- tbl[1, ])
#> # A tibble: 4 x 3
#>       n c     li       
#>   <int> <chr> <list>   
#> 1     1 e     <dbl [1]>
#> 2    NA f     <int [2]>
#> 3     1 e     <dbl [1]>
#> 4     1 e     <dbl [1]>
```

</td></tr><tr style="vertical-align:top"><td>

```r
with_df(df[-1:2, ] <- df[1, ])
```

<div class="error">

```
#> Error in seq_len(nrows)[i]: only 0's may
#> be mixed with negative subscripts
```

</div></td><td>

```r
with_tbl(tbl[-1:2, ] <- tbl[1, ])
```

<div class="error">

```
#> Error in
#> `numtbl_as_row_location_assign()`:
#> ! Must assign to rows with a valid
#> subscript vector.
#> x Negative and positive locations can't
#> be mixed.
#> i Subscript `-1:2` has 2 positive values
#> at locations 3 and 4.
```

</div></td></tr><tr style="vertical-align:top"><td>

```r
with_df(df[NA_integer_, ] <- df[1, ])
```

<div class="error">

```
#> Error in `[<-.data.frame`(`*tmp*`,
#> NA_integer_, , value = structure(list(:
#> missing values are not allowed in
#> subscripted assignments of data frames
```

</div></td><td>

```r
with_tbl(tbl[NA_integer_, ] <- tbl[1, ])
```

<div class="error">

```
#> Error in
#> `numtbl_as_row_location_assign()`:
#> ! Must assign to rows with a valid
#> subscript vector.
#> x Subscript `NA_integer_` can't contain
#> missing values.
#> x It has a missing value at location 1.
```

</div></td></tr><tr style="vertical-align:top"><td>

```r
with_df2(df2[NA_integer_, ] <- df2[1, ])
```

<div class="error">

```
#> Error in `[<-.data.frame`(`*tmp*`,
#> NA_integer_, , value = structure(list(:
#> missing values are not allowed in
#> subscripted assignments of data frames
```

</div></td><td>

```r
with_tbl2(tbl2[NA_integer_, ] <- tbl2[1, ])
```

<div class="error">

```
#> Error in
#> `numtbl_as_row_location_assign()`:
#> ! Must assign to rows with a valid
#> subscript vector.
#> x Subscript `NA_integer_` can't contain
#> missing values.
#> x It has a missing value at location 1.
```

</div></td></tr><tr style="vertical-align:top"><td>

```r
with_df(df[TRUE, ] <- df[1, ])
#>   n c li
#> 1 1 e  9
#> 2 1 e  9
#> 3 1 e  9
#> 4 1 e  9
```

</td><td>

```r
with_tbl(tbl[TRUE, ] <- tbl[1, ])
#> # A tibble: 4 x 3
#>       n c     li       
#>   <int> <chr> <list>   
#> 1     1 e     <dbl [1]>
#> 2     1 e     <dbl [1]>
#> 3     1 e     <dbl [1]>
#> 4     1 e     <dbl [1]>
```

</td></tr><tr style="vertical-align:top"><td>

```r
with_df(df[FALSE, ] <- df[1, ])
#>    n c         li
#> 1  1 e          9
#> 2 NA f     10, 11
#> 3  3 g 12, 13, 14
#> 4 NA h       text
```

</td><td>

```r
with_tbl(tbl[FALSE, ] <- tbl[1, ])
#> # A tibble: 4 x 3
#>       n c     li       
#>   <int> <chr> <list>   
#> 1     1 e     <dbl [1]>
#> 2    NA f     <int [2]>
#> 3     3 g     <int [3]>
#> 4    NA h     <chr [1]>
```

</td></tr><tr style="vertical-align:top"><td>

```r
with_df(df[NA, ] <- df[1, ])
```

<div class="error">

```
#> Error in `[<-.data.frame`(`*tmp*`, NA, ,
#> value = structure(list(n = 1L, : missing
#> values are not allowed in subscripted
#> assignments of data frames
```

</div></td><td>

```r
with_tbl(tbl[NA, ] <- tbl[1, ])
```

<div class="error">

```
#> Error:
#> ! Can't use NA as row index in a tibble
#> for assignment.
```

</div>

</td></tr></tbody></table>

Only values of size one can be recycled.

<table class="dftbl"><tbody><tr style="vertical-align:top"><td>

```r
with_df(df[2:3, ] <- df[1, ])
#>    n c   li
#> 1  1 e    9
#> 2  1 e    9
#> 3  1 e    9
#> 4 NA h text
```

</td><td>

```r
with_tbl(tbl[2:3, ] <- tbl[1, ])
#> # A tibble: 4 x 3
#>       n c     li       
#>   <int> <chr> <list>   
#> 1     1 e     <dbl [1]>
#> 2     1 e     <dbl [1]>
#> 3     1 e     <dbl [1]>
#> 4    NA h     <chr [1]>
```

</td></tr><tr style="vertical-align:top"><td>

```r
with_df(df[2:3, ] <- list(df$n[1], df$c[1:2], df$li[1]))
#>    n c   li
#> 1  1 e    9
#> 2  1 e    9
#> 3  1 f    9
#> 4 NA h text
```

</td><td>

```r
with_tbl(tbl[2:3, ] <- list(tbl$n[1], tbl$c[1:2], tbl$li[1]))
#> # A tibble: 4 x 3
#>       n c     li       
#>   <int> <chr> <list>   
#> 1     1 e     <dbl [1]>
#> 2     1 e     <dbl [1]>
#> 3     1 f     <dbl [1]>
#> 4    NA h     <chr [1]>
```

</td></tr><tr style="vertical-align:top"><td>

```r
with_df(df[2:4, ] <- df[1:2, ])
```

<div class="error">

```
#> Error in `[<-.data.frame`(`*tmp*`, 2:4,
#> , value = structure(list(n = c(1L, :
#> replacement element 1 has 2 rows, need 3
```

</div></td><td>

```r
with_tbl(tbl[2:4, ] <- tbl[1:2, ])
```

<div class="error">

```
#> Error:
#> ! Assigned data `tbl[1:2, ]` must be
#> compatible with row subscript `2:4`.
#> x 3 rows must be assigned.
#> x Element 1 of assigned data has 2 rows.
#> i Only vectors of size 1 are recycled.
```

</div>

</td></tr></tbody></table>

<table class="dftbl"><tbody><tr style="vertical-align:top"><td>

```r
with_df2(df2[2:4, ] <- df2[1, ])
```

<div class="error">

```
#> Error in `[<-.data.frame`(`*tmp*`, 2:4,
#> , value = structure(list(tb =
#> structure(list(: replacement element 1
#> is a matrix/data frame of 1 row, need 3
```

</div></td><td>

```r
with_tbl2(tbl2[2:4, ] <- tbl2[1, ])
#> # A tibble: 4 x 2
#>    tb$n $c    $li       m[,1]  [,2]
#>   <int> <chr> <list>    <dbl> <dbl>
#> 1     1 e     <dbl [1]>     1     0
#> 2     1 e     <dbl [1]>     1     0
#> 3     1 e     <dbl [1]>     1     0
#> 4     1 e     <dbl [1]>     1     0
#> # ... with 1 more variable:
#> #   m[3:4] <dbl>
```

</td></tr><tr style="vertical-align:top"><td>

```r
with_df2(df2[2:4, ] <- df2[2:3, ])
```

<div class="error">

```
#> Error in `[<-.data.frame`(`*tmp*`, 2:4,
#> , value = structure(list(tb =
#> structure(list(: replacement element 1
#> is a matrix/data frame of 2 rows, need 3
```

</div></td><td>

```r
with_tbl2(tbl2[2:4, ] <- tbl2[2:3, ])
```

<div class="error">

```
#> Error:
#> ! Assigned data `tbl2[2:3, ]` must be
#> compatible with row subscript `2:4`.
#> x 3 rows must be assigned.
#> x Element 1 of assigned data has 2 rows.
#> i Only vectors of size 1 are recycled.
```

</div>

</td></tr></tbody></table>

For compatibility, only a warning is issued for indexing beyond the number of rows.
Appending rows right at the end of the existing data is supported, without warning.

<table class="dftbl"><tbody><tr style="vertical-align:top"><td>

```r
with_df(df[5, ] <- df[1, ])
#>    n c         li
#> 1  1 e          9
#> 2 NA f     10, 11
#> 3  3 g 12, 13, 14
#> 4 NA h       text
#> 5  1 e          9
```

</td><td>

```r
with_tbl(tbl[5, ] <- tbl[1, ])
#> # A tibble: 5 x 3
#>       n c     li       
#>   <int> <chr> <list>   
#> 1     1 e     <dbl [1]>
#> 2    NA f     <int [2]>
#> 3     3 g     <int [3]>
#> 4    NA h     <chr [1]>
#> 5     1 e     <dbl [1]>
```

</td></tr><tr style="vertical-align:top"><td>

```r
with_df(df[5:7, ] <- df[1, ])
#>    n c         li
#> 1  1 e          9
#> 2 NA f     10, 11
#> 3  3 g 12, 13, 14
#> 4 NA h       text
#> 5  1 e          9
#> 6  1 e          9
#> 7  1 e          9
```

</td><td>

```r
with_tbl(tbl[5:7, ] <- tbl[1, ])
#> # A tibble: 7 x 3
#>       n c     li       
#>   <int> <chr> <list>   
#> 1     1 e     <dbl [1]>
#> 2    NA f     <int [2]>
#> 3     3 g     <int [3]>
#> 4    NA h     <chr [1]>
#> 5     1 e     <dbl [1]>
#> 6     1 e     <dbl [1]>
#> 7     1 e     <dbl [1]>
```

</td></tr><tr style="vertical-align:top"><td>

```r
with_df(df[6, ] <- df[1, ])
#>    n    c         li
#> 1  1    e          9
#> 2 NA    f     10, 11
#> 3  3    g 12, 13, 14
#> 4 NA    h       text
#> 5 NA <NA>       NULL
#> 6  1    e          9
```

</td><td>

```r
with_tbl(tbl[6, ] <- tbl[1, ])
```

<div class="error">

```
#> Error in
#> `numtbl_as_row_location_assign()`:
#> ! Can't assign to rows beyond the end
#> with non-consecutive locations.
#> i Input has size 4.
#> x Subscript `6` contains non-consecutive
#> location 6.
```

</div></td></tr><tr style="vertical-align:top"><td>

```r
with_df(df[-5, ] <- df[1, ])
#>   n c li
#> 1 1 e  9
#> 2 1 e  9
#> 3 1 e  9
#> 4 1 e  9
```

</td><td>

```r
with_tbl(tbl[-5, ] <- tbl[1, ])
```

<div class="error">

```
#> Error in
#> `numtbl_as_row_location_assign()`:
#> ! Can't negate rows past the end.
#> i Location 5 doesn't exist.
#> i There are only 4 rows.
```

</div></td></tr><tr style="vertical-align:top"><td>

```r
with_df(df[-(5:7), ] <- df[1, ])
#>   n c li
#> 1 1 e  9
#> 2 1 e  9
#> 3 1 e  9
#> 4 1 e  9
```

</td><td>

```r
with_tbl(tbl[-(5:7), ] <- tbl[1, ])
```

<div class="error">

```
#> Error in
#> `numtbl_as_row_location_assign()`:
#> ! Can't negate rows past the end.
#> i Locations 5, 6, and 7 don't exist.
#> i There are only 4 rows.
```

</div></td></tr><tr style="vertical-align:top"><td>

```r
with_df(df[-6, ] <- df[1, ])
#>   n c li
#> 1 1 e  9
#> 2 1 e  9
#> 3 1 e  9
#> 4 1 e  9
```

</td><td>

```r
with_tbl(tbl[-6, ] <- tbl[1, ])
```

<div class="error">

```
#> Error in
#> `numtbl_as_row_location_assign()`:
#> ! Can't negate rows past the end.
#> i Location 6 doesn't exist.
#> i There are only 4 rows.
```

</div>

</td></tr></tbody></table>

For compatibility, `i` can also be a character vector containing positive numbers.

<table class="dftbl"><tbody><tr style="vertical-align:top"><td>

```r
with_df(df[as.character(1:3), ] <- df[1, ])
#>    n c   li
#> 1  1 e    9
#> 2  1 e    9
#> 3  1 e    9
#> 4 NA h text
```

</td><td>

```r
with_tbl(tbl[as.character(1:3), ] <- tbl[1, ])
#> # A tibble: 4 x 3
#>       n c     li       
#>   <int> <chr> <list>   
#> 1     1 e     <dbl [1]>
#> 2     1 e     <dbl [1]>
#> 3     1 e     <dbl [1]>
#> 4    NA h     <chr [1]>
```

</td></tr></tbody></table>

<table class="dftbl"><tbody><tr style="vertical-align:top"><td>

```r
with_df(df[as.character(-(1:3)), ] <- df[1, ])
#>     n c         li
#> 1   1 e          9
#> 2  NA f     10, 11
#> 3   3 g 12, 13, 14
#> 4  NA h       text
#> -1  1 e          9
#> -2  1 e          9
#> -3  1 e          9
```

</td><td>

```r
with_tbl(tbl[as.character(-(1:3)), ] <- tbl[1, ])
```

<div class="warning">

```
#> Warning: The `i` argument of `[.tbl_df`
#> must use valid row names as of tibble
#> 3.0.0.
#> Use `NA_integer_` as row index to obtain
#> a row full of `NA` values.
```

</div><div class="error">

```
#> Error:
#> ! Can't use NA as row index in a tibble
#> for assignment.
```

</div></td></tr><tr style="vertical-align:top"><td>

```r
with_df(df[as.character(3:5), ] <- df[1, ])
#>    n c     li
#> 1  1 e      9
#> 2 NA f 10, 11
#> 3  1 e      9
#> 4  1 e      9
#> 5  1 e      9
```

</td><td>

```r
with_tbl(tbl[as.character(3:5), ] <- tbl[1, ])
```

<div class="warning">

```
#> Warning: The `i` argument of `[.tbl_df`
#> must use valid row names as of tibble
#> 3.0.0.
#> Use `NA_integer_` as row index to obtain
#> a row full of `NA` values.
```

</div><div class="error">

```
#> Error:
#> ! Can't use NA as row index in a tibble
#> for assignment.
```

</div></td></tr><tr style="vertical-align:top"><td>

```r
with_df(df[as.character(-(3:5)), ] <- df[1, ])
#>     n c         li
#> 1   1 e          9
#> 2  NA f     10, 11
#> 3   3 g 12, 13, 14
#> 4  NA h       text
#> -3  1 e          9
#> -4  1 e          9
#> -5  1 e          9
```

</td><td>

```r
with_tbl(tbl[as.character(-(3:5)), ] <- tbl[1, ])
```

<div class="warning">

```
#> Warning: The `i` argument of `[.tbl_df`
#> must use valid row names as of tibble
#> 3.0.0.
#> Use `NA_integer_` as row index to obtain
#> a row full of `NA` values.
```

</div><div class="error">

```
#> Error:
#> ! Can't use NA as row index in a tibble
#> for assignment.
```

</div></td></tr><tr style="vertical-align:top"><td>

```r
with_df(df[NA_character_, ] <- df[1, ])
```

<div class="error">

```
#> Error in `[<-.data.frame`(`*tmp*`,
#> NA_character_, , value =
#> structure(list(: missing values are not
#> allowed in subscripted assignments of
#> data frames
```

</div></td><td>

```r
with_tbl(tbl[NA_character_, ] <- tbl[1, ])
```

<div class="error">

```
#> Error:
#> ! Can't use NA as row index in a tibble
#> for assignment.
```

</div>

</td></tr></tbody></table>

## Row and column subassignment

### Definition of `x[i, j] <- a`

`x[i, j] <- a` is equivalent to `x[i, ][j] <- a`.[^bracket-assign-flip]

[^bracket-assign-flip]: `x[i, j]` is symmetrically for subsetting and subassignment.
A more efficient implementation of `x[i, j] <- a` would forward to `x[j][i, ] <- a`.

Subassignment to `x[i, j]` is stricter for tibbles than for data frames.
`x[i, j] <- a` can't change the data type of existing columns.

<table class="dftbl"><tbody><tr style="vertical-align:top"><td>

```r
with_df(df[2:3, 1] <- df[1:2, 2])
#>      n c         li
#> 1    1 e          9
#> 2    e f     10, 11
#> 3    f g 12, 13, 14
#> 4 <NA> h       text
```

</td><td>

```r
with_tbl(tbl[2:3, 1] <- tbl[1:2, 2])
```

<div class="error">

```
#> Error:
#> ! Assigned data `tbl[1:2, 2]` must be
#> compatible with existing data.
#> i Error occurred for column `n`.
#> x Can't convert <character> to
#> <integer>.
```

</div></td></tr><tr style="vertical-align:top"><td>

```r
with_df(df[2:3, 2] <- df[1:2, 3])
```

<div class="warning">

```
#> Warning in `[<-.data.frame`(`*tmp*`,
#> 2:3, 2, value = list(9, 10:11)):
#> provided 2 variables to replace 1
#> variables
```

</div>

```
#>    n c         li
#> 1  1 e          9
#> 2 NA 9     10, 11
#> 3  3 9 12, 13, 14
#> 4 NA h       text
```

</td><td>

```r
with_tbl(tbl[2:3, 2] <- tbl[1:2, 3])
```

<div class="error">

```
#> Error:
#> ! Assigned data `tbl[1:2, 3]` must be
#> compatible with existing data.
#> i Error occurred for column `c`.
#> x Can't convert <list> to <character>.
```

</div></td></tr><tr style="vertical-align:top"><td>

```r
with_df(df[2:3, 3] <- df2[1:2, 1])
```

<div class="warning">

```
#> Warning in `[<-.data.frame`(`*tmp*`,
#> 2:3, 3, value = structure(list(n =
#> c(1L, : provided 3 variables to replace
#> 1 variables
```

</div>

```
#>    n c   li
#> 1  1 e    9
#> 2 NA f    1
#> 3  3 g   NA
#> 4 NA h text
```

</td><td>

```r
with_tbl(tbl[2:3, 3] <- tbl2[1:2, 1])
```

<div class="error">

```
#> Error in `df_cast_opts()`:
#> ! Data frame must have names.
#> i In file 'type-data-frame.c' at line
#> 683.
#> i This is an internal error in the rlang
#> package, please report it to the package
#> authors.
```

</div></td></tr><tr style="vertical-align:top"><td>

```r
with_df2(df2[2:3, 1] <- df2[1:2, 2])
```

<div class="warning">

```
#> Warning in matrix(value, n, p): data
#> length [8] is not a sub-multiple or
#> multiple of the number of columns [3]
```

</div>

```
#>   tb.n tb.c tb.li m.1 m.2 m.3 m.4
#> 1    1    e     9   1   0   0   0
#> 2    1    0     0   0   1   0   0
#> 3    0    1     0   0   0   1   0
#> 4   NA    h  text   0   0   0   1
```

</td><td>

```r
with_tbl2(tbl2[2:3, 1] <- tbl2[1:2, 2])
```

<div class="error">

```
#> Error:
#> ! Assigned data `tbl2[1:2, 2]` must be
#> compatible with existing data.
#> i Error occurred for column `tb`.
#> x Can't convert <double[,4]> to
#> <tbl_df>.
```

</div></td></tr><tr style="vertical-align:top"><td>

```r
with_df2(df2[2:3, 2] <- df[1:2, 1])
#>   tb.n tb.c      tb.li m.1 m.2 m.3 m.4
#> 1    1    e          9   1   0   0   0
#> 2   NA    f     10, 11   1   1   1   1
#> 3    3    g 12, 13, 14  NA  NA  NA  NA
#> 4   NA    h       text   0   0   0   1
```

</td><td>

```r
with_tbl2(tbl2[2:3, 2] <- tbl[1:2, 1])
#> # A tibble: 4 x 2
#>    tb$n $c    $li       m[,1]  [,2]
#>   <int> <chr> <list>    <dbl> <dbl>
#> 1     1 e     <dbl [1]>     1     0
#> 2    NA f     <int [2]>     1     1
#> 3     3 g     <int [3]>    NA    NA
#> 4    NA h     <chr [1]>     0     0
#> # ... with 1 more variable:
#> #   m[3:4] <dbl>
```

</td></tr></tbody></table>

A notable exception is the population of a column full of `NA` (which is of type `logical`), or the use of `NA` on the right-hand side of the assignment.

<table class="dftbl"><tbody><tr style="vertical-align:top"><td>

```r
with_df({df$x <- NA; df[2:3, "x"] <- 3:2})
#>    n c         li  x
#> 1  1 e          9 NA
#> 2 NA f     10, 11  3
#> 3  3 g 12, 13, 14  2
#> 4 NA h       text NA
```

</td><td>

```r
with_tbl({tbl$x <- NA; tbl[2:3, "x"] <- 3:2})
#> # A tibble: 4 x 4
#>       n c     li            x
#>   <int> <chr> <list>    <int>
#> 1     1 e     <dbl [1]>    NA
#> 2    NA f     <int [2]>     3
#> 3     3 g     <int [3]>     2
#> 4    NA h     <chr [1]>    NA
```

</td></tr><tr style="vertical-align:top"><td>

```r
with_df({df[2:3, 2:3] <- NA})
#>    n    c   li
#> 1  1    e    9
#> 2 NA <NA>   NA
#> 3  3 <NA>   NA
#> 4 NA    h text
```

</td><td>

```r
with_tbl({tbl[2:3, 2:3] <- NA})
#> # A tibble: 4 x 3
#>       n c     li       
#>   <int> <chr> <list>   
#> 1     1 e     <dbl [1]>
#> 2    NA <NA>  <NULL>   
#> 3     3 <NA>  <NULL>   
#> 4    NA h     <chr [1]>
```

</td></tr></tbody></table>

For programming, it is always safer (and faster) to use the correct type of `NA` to initialize columns.

<table class="dftbl"><tbody><tr style="vertical-align:top"><td>

```r
with_df({df$x <- NA_integer_; df[2:3, "x"] <- 3:2})
#>    n c         li  x
#> 1  1 e          9 NA
#> 2 NA f     10, 11  3
#> 3  3 g 12, 13, 14  2
#> 4 NA h       text NA
```

</td><td>

```r
with_tbl({tbl$x <- NA_integer_; tbl[2:3, "x"] <- 3:2})
#> # A tibble: 4 x 4
#>       n c     li            x
#>   <int> <chr> <list>    <int>
#> 1     1 e     <dbl [1]>    NA
#> 2    NA f     <int [2]>     3
#> 3     3 g     <int [3]>     2
#> 4    NA h     <chr [1]>    NA
```

</td></tr></tbody></table>


For new columns, `x[i, j] <- a` fills the unassigned rows with `NA`.

<table class="dftbl"><tbody><tr style="vertical-align:top"><td>

```r
with_df(df[2:3, "n"] <- 1)
#>    n c         li
#> 1  1 e          9
#> 2  1 f     10, 11
#> 3  1 g 12, 13, 14
#> 4 NA h       text
```

</td><td>

```r
with_tbl(tbl[2:3, "n"] <- 1)
#> # A tibble: 4 x 3
#>       n c     li       
#>   <int> <chr> <list>   
#> 1     1 e     <dbl [1]>
#> 2     1 f     <int [2]>
#> 3     1 g     <int [3]>
#> 4    NA h     <chr [1]>
```

</td></tr><tr style="vertical-align:top"><td>

```r
with_df(df[2:3, "x"] <- 1)
#>    n c         li  x
#> 1  1 e          9 NA
#> 2 NA f     10, 11  1
#> 3  3 g 12, 13, 14  1
#> 4 NA h       text NA
```

</td><td>

```r
with_tbl(tbl[2:3, "x"] <- 1)
#> # A tibble: 4 x 4
#>       n c     li            x
#>   <int> <chr> <list>    <dbl>
#> 1     1 e     <dbl [1]>    NA
#> 2    NA f     <int [2]>     1
#> 3     3 g     <int [3]>     1
#> 4    NA h     <chr [1]>    NA
```

</td></tr><tr style="vertical-align:top"><td>

```r
with_df(df[2:3, "n"] <- NULL)
```

<div class="error">

```
#> Error in x[[jj]][iseq] <- vjj:
#> replacement has length zero
```

</div></td><td>

```r
with_tbl(tbl[2:3, "n"] <- NULL)
```

<div class="error">

```
#> Error:
#> ! `NULL` must be a vector, a bare list,
#> a data frame or a matrix.
```

</div>

</td></tr></tbody></table>

Likewise, for new rows, `x[i, j] <- a` fills the unassigned columns with `NA`.

<table class="dftbl"><tbody><tr style="vertical-align:top"><td>

```r
with_df(df[5, "n"] <- list(0L))
#>    n    c         li
#> 1  1    e          9
#> 2 NA    f     10, 11
#> 3  3    g 12, 13, 14
#> 4 NA    h       text
#> 5  0 <NA>       NULL
```

</td><td>

```r
with_tbl(tbl[5, "n"] <- list(0L))
#> # A tibble: 5 x 3
#>       n c     li       
#>   <int> <chr> <list>   
#> 1     1 e     <dbl [1]>
#> 2    NA f     <int [2]>
#> 3     3 g     <int [3]>
#> 4    NA h     <chr [1]>
#> 5     0 <NA>  <NULL>
```

</td></tr></tbody></table>


### Definition of `x[[i, j]] <- a`

`i` must be a numeric vector of length 1.
`x[[i, j]] <- a` is equivalent to `x[i, ][[j]] <- a`.[^double-bracket-ij-symmetry]

[^double-bracket-ij-symmetry]: `x[[i, j]]` is symmetrically for subsetting and subassignment.
An efficient implementation would check that `i` and `j` are scalar and forward to `x[i, j][[1]] <- a`.


<table class="dftbl"><tbody><tr style="vertical-align:top"><td>

```r
with_df(df[[1, 1]] <- 0)
#>    n c         li
#> 1  0 e          9
#> 2 NA f     10, 11
#> 3  3 g 12, 13, 14
#> 4 NA h       text
```

</td><td>

```r
with_tbl(tbl[[1, 1]] <- 0)
#> # A tibble: 4 x 3
#>       n c     li       
#>   <int> <chr> <list>   
#> 1     0 e     <dbl [1]>
#> 2    NA f     <int [2]>
#> 3     3 g     <int [3]>
#> 4    NA h     <chr [1]>
```

</td></tr><tr style="vertical-align:top"><td>

```r
with_df(df[1, ][[1]] <- 0)
#>    n c         li
#> 1  0 e          9
#> 2 NA f     10, 11
#> 3  3 g 12, 13, 14
#> 4 NA h       text
```

</td><td>

```r
with_tbl(tbl[1, ][[1]] <- 0)
#> # A tibble: 4 x 3
#>       n c     li       
#>   <int> <chr> <list>   
#> 1     0 e     <dbl [1]>
#> 2    NA f     <int [2]>
#> 3     3 g     <int [3]>
#> 4    NA h     <chr [1]>
```

</td></tr><tr style="vertical-align:top"><td>

```r
with_df(df[[1, 3]] <- list(NULL))
#>    n c         li
#> 1  1 e       NULL
#> 2 NA f     10, 11
#> 3  3 g 12, 13, 14
#> 4 NA h       text
```

</td><td>

```r
with_tbl(tbl[[1, 3]] <- list(NULL))
#> # A tibble: 4 x 3
#>       n c     li       
#>   <int> <chr> <list>   
#> 1     1 e     <NULL>   
#> 2    NA f     <int [2]>
#> 3     3 g     <int [3]>
#> 4    NA h     <chr [1]>
```

</td></tr><tr style="vertical-align:top"><td>

```r
with_df(df[1, ][[3]] <- list(NULL))
#>    n c         li
#> 1  1 e       NULL
#> 2 NA f     10, 11
#> 3  3 g 12, 13, 14
#> 4 NA h       text
```

</td><td>

```r
with_tbl(tbl[1, ][[3]] <- list(NULL))
#> # A tibble: 4 x 3
#>       n c     li       
#>   <int> <chr> <list>   
#> 1     1 e     <NULL>   
#> 2    NA f     <int [2]>
#> 3     3 g     <int [3]>
#> 4    NA h     <chr [1]>
```

</td></tr><tr style="vertical-align:top"><td>

```r
with_df2(df2[[1, 1]] <- df[1, ])
```

<div class="error">

```
#> Error in `[[<-.data.frame`(`*tmp*`,
#> iseq, value = structure(list(n = 1L, :
#> replacement has 1 row, data has 4
```

</div></td><td>

```r
with_tbl2(tbl2[[1, 1]] <- tbl[1, ])
#> # A tibble: 4 x 2
#>    tb$n $c    $li       m[,1]  [,2]
#>   <int> <chr> <list>    <dbl> <dbl>
#> 1     1 e     <dbl [1]>     1     0
#> 2    NA f     <int [2]>     0     1
#> 3     3 g     <int [3]>     0     0
#> 4    NA h     <chr [1]>     0     0
#> # ... with 1 more variable:
#> #   m[3:4] <dbl>
```

</td></tr><tr style="vertical-align:top"><td>

```r
with_df2(df2[1, ][[1]] <- df[1, ])
#>   tb.n tb.c      tb.li m.1 m.2 m.3 m.4
#> 1    1    e          9   1   0   0   0
#> 2   NA    f     10, 11   0   1   0   0
#> 3    3    g 12, 13, 14   0   0   1   0
#> 4   NA    h       text   0   0   0   1
```

</td><td>

```r
with_tbl2(tbl2[1, ][[1]] <- tbl[1, ])
#> # A tibble: 4 x 2
#>    tb$n $c    $li       m[,1]  [,2]
#>   <int> <chr> <list>    <dbl> <dbl>
#> 1     1 e     <dbl [1]>     1     0
#> 2    NA f     <int [2]>     0     1
#> 3     3 g     <int [3]>     0     0
#> 4    NA h     <chr [1]>     0     0
#> # ... with 1 more variable:
#> #   m[3:4] <dbl>
```

</td></tr><tr style="vertical-align:top"><td>

```r
with_df2(df2[[1, 2]] <- t(1:4))
```

<div class="error">

```
#> Error in x[[jseq]][[iseq]] <- value:
#> more elements supplied than there are to
#> replace
```

</div></td><td>

```r
with_tbl2(tbl2[[1, 2]] <- t(1:4))
#> # A tibble: 4 x 2
#>    tb$n $c    $li       m[,1]  [,2]
#>   <int> <chr> <list>    <dbl> <dbl>
#> 1     1 e     <dbl [1]>     1     2
#> 2    NA f     <int [2]>     0     1
#> 3     3 g     <int [3]>     0     0
#> 4    NA h     <chr [1]>     0     0
#> # ... with 1 more variable:
#> #   m[3:4] <dbl>
```

</td></tr><tr style="vertical-align:top"><td>

```r
with_df2(df2[1, ][[2]] <- t(1:4))
#>   tb.n tb.c      tb.li m.1 m.2 m.3 m.4
#> 1    1    e          9   1   2   3   4
#> 2   NA    f     10, 11   0   1   0   0
#> 3    3    g 12, 13, 14   0   0   1   0
#> 4   NA    h       text   0   0   0   1
```

</td><td>

```r
with_tbl2(tbl2[1, ][[2]] <- t(1:4))
#> # A tibble: 4 x 2
#>    tb$n $c    $li       m[,1]  [,2]
#>   <int> <chr> <list>    <dbl> <dbl>
#> 1     1 e     <dbl [1]>     1     2
#> 2    NA f     <int [2]>     0     1
#> 3     3 g     <int [3]>     0     0
#> 4    NA h     <chr [1]>     0     0
#> # ... with 1 more variable:
#> #   m[3:4] <dbl>
```

</td></tr><tr style="vertical-align:top"><td>

```r
df[[1:2, 1]]
```

<div class="error">

```
#> Error in col[[i, exact = exact]]:
#> attempt to select more than one element
#> in vectorIndex
```

</div></td><td>

```r
tbl[[1:2, 1]]
```

<div class="error">

```
#> Error in `vectbl_as_row_location2()`:
#> ! Must extract row with a single valid
#> subscript.
#> x Subscript `1:2` has size 2 but must be
#> size 1.
```

</div></td></tr><tr style="vertical-align:top"><td>

```r
with_df(df[[1:2, 1]] <- 0)
```

<div class="error">

```
#> Error in `[[<-.data.frame`(`*tmp*`, 1:2,
#> 1, value = 0): only a single element
#> should be replaced
```

</div></td><td>

```r
with_tbl(tbl[[1:2, 1]] <- 0)
```

<div class="error">

```
#> Error in `vectbl_as_row_location2()`:
#> ! Must assign to row with a single valid
#> subscript.
#> x Subscript `1:2` has size 2 but must be
#> size 1.
```

</div>

</td></tr></tbody></table>

NB: `vec_size(a)` must equal 1.
Unlike `x[i, ] <-`, `x[[i, ]] <-` is not valid.


