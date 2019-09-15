---
title: "Invariants for subsetting and subassignment"
#output: rmarkdown::word_document
output: rmarkdown::html_vignette
vignette: >
  %\VignetteIndexEntry{invariants}
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
This vignette defines invariants in the behavior of `$`, `[[` and `[`,
and their assignment counterparts `$<-`, `[[<-` and `[<-`, for tibbles,
and illustrates where these differ from data frames. The goal is to
determine a small set of invariants that consistently define how
behaviors interact. For each invariant an example is given. Currently,
the `vignette("subset")` and `vignette("subassign")` articles give a
more comprehensive overview, but will be merged into this article at
some point.

Some behaviors are defined using functions of the vctrs package, in
particular `vec_slice()`, `vec_recycle()` and `vec_as_index()`. In this
article, all behaviors are demonstrated using one example data frame and
its tibble equivalent.

    library(vctrs)
    library(tibble)
    new_df <- function() {
      df <- data.frame(n = 1:4)
      df$c <- letters[5:8]
      df$li <- list(9, 10:11, 12:14, "text")
      df
    }
    new_tbl <- function() {
      as_tibble(new_df())
    }

Results of the same code for data frames and tibbles are presented side
by side:

<table class="dftbl">
<tbody>
<tr style="vertical-align:top">
<td>
    new_df()
    #>   n c         li
    #> 1 1 e          9
    #> 2 2 f     10, 11
    #> 3 3 g 12, 13, 14
    #> 4 4 h       text

</td>
<td>
    new_tbl()
    #> # A tibble: 4 x 3
    #>       n c     li       
    #>   <int> <chr> <list>   
    #> 1     1 e     <dbl [1]>
    #> 2     2 f     <int [2]>
    #> 3     3 g     <int [3]>
    #> 4     4 h     <chr [1]>

</td>
</tr>
</tbody>
</table>
In the following, if the results are identical (after converting to a
data frame if necessary), only the tibble result is shown, as in the
example below. This makes it easier to spot differences.

<table class="dftbl">
<tbody>
<tr style="vertical-align:top">
<td>
</td>
<td>
    new_tbl()
    #> # A tibble: 4 x 3
    #>       n c     li       
    #>   <int> <chr> <list>   
    #> 1     1 e     <dbl [1]>
    #> 2     2 f     <int [2]>
    #> 3     3 g     <int [3]>
    #> 4     4 h     <chr [1]>

</td>
</tr>
</tbody>
</table>
Subsetting operations are read-only. The same objects are reused in all
examples:

    df <- new_df()
    tbl <- new_tbl()

Where needed, we also show examples with hierarchical columns containing
a data frame or a matrix:

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

<table class="dftbl">
<tbody>
<tr style="vertical-align:top">
<td>
</td>
<td>
    new_tbl()
    #> # A tibble: 4 x 3
    #>       n c     li       
    #>   <int> <chr> <list>   
    #> 1     1 e     <dbl [1]>
    #> 2     2 f     <int [2]>
    #> 3     3 g     <int [3]>
    #> 4     4 h     <chr [1]>

</td>
</tr>
</tbody>
</table>
For subset assignment (subassignment, for short), we need a fresh copy
of the data for each test. The `with_*()` functions (omitted here for
brevity) allow for a more concise notation. These functions take an
assignment expression, execute it on a fresh copy of the data, and
return the data for printing. The first example prints what’s really
executed, further examples omit this output.

<table class="dftbl">
<tbody>
<tr style="vertical-align:top">
<td>
    with_df(df$n <- rev(df$n), verbose = TRUE)
    #> {
    #>   df <- new_df()
    #>   df$n <- rev(df$n)
    #>   df
    #> }
    #>   n c         li
    #> 1 4 e          9
    #> 2 3 f     10, 11
    #> 3 2 g 12, 13, 14
    #> 4 1 h       text

</td>
<td>
    with_tbl(tbl$n <- rev(tbl$n), verbose = TRUE)
    #> {
    #>   tbl <- new_tbl()
    #>   tbl$n <- rev(tbl$n)
    #>   tbl
    #> }
    #> # A tibble: 4 x 3
    #>       n c     li       
    #>   <int> <chr> <list>   
    #> 1     4 e     <dbl [1]>
    #> 2     3 f     <int [2]>
    #> 3     2 g     <int [3]>
    #> 4     1 h     <chr [1]>

</td>
</tr>
</tbody>
</table>
Columns
=======

The subsetting and subassignment operators for data frames and tibbles
are particularly tricky, because they support both row and column
indexes, both of which are optionally missing. We resolve this by first
defining column-wise subsetting, then row-wise subsetting and the
composition of both, then missing indexes.

Definition of `x[[j]]`.
-----------------------

`x[[j]]` is equivalent to `.subset2(x, j)`.

<table class="dftbl">
<tbody>
<tr style="vertical-align:top">
<td>
</td>
<td>
    tbl[[1]]
    #> [1] 1 2 3 4

</td>
</tr>
<tr style="vertical-align:top">
<td>
</td>
<td>
    .subset2(tbl, 1)
    #> [1] 1 2 3 4

</td>
</tr>
<tr style="vertical-align:top">
<td>
</td>
<td>
    tbl[[3]]
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

</td>
</tr>
<tr style="vertical-align:top">
<td>
</td>
<td>
    .subset2(tbl, 3)
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

</td>
</tr>
<tr style="vertical-align:top">
<td>
</td>
<td>
    tbl2[[1]]
    #> # A tibble: 4 x 3
    #>       n c     li       
    #>   <int> <chr> <list>   
    #> 1     1 e     <dbl [1]>
    #> 2     2 f     <int [2]>
    #> 3     3 g     <int [3]>
    #> 4     4 h     <chr [1]>

</td>
</tr>
<tr style="vertical-align:top">
<td>
</td>
<td>
    .subset2(tbl2, 1)
    #> # A tibble: 4 x 3
    #>       n c     li       
    #>   <int> <chr> <list>   
    #> 1     1 e     <dbl [1]>
    #> 2     2 f     <int [2]>
    #> 3     3 g     <int [3]>
    #> 4     4 h     <chr [1]>

</td>
</tr>
<tr style="vertical-align:top">
<td>
</td>
<td>
    tbl2[[2]]
    #>      [,1] [,2] [,3] [,4]
    #> [1,]    1    0    0    0
    #> [2,]    0    1    0    0
    #> [3,]    0    0    1    0
    #> [4,]    0    0    0    1

</td>
</tr>
<tr style="vertical-align:top">
<td>
</td>
<td>
    .subset2(tbl2, 2)
    #>      [,1] [,2] [,3] [,4]
    #> [1,]    1    0    0    0
    #> [2,]    0    1    0    0
    #> [3,]    0    0    1    0
    #> [4,]    0    0    0    1

</td>
</tr>
</tbody>
</table>
### Corollary

Accessing `NA` or missing columns returns `NULL`. Out-of-bounds indexing
throws an error.

<table class="dftbl">
<tbody>
<tr style="vertical-align:top">
<td>
    df[[NA]]
    #> NULL

</td>
<td>
    tbl[[NA]]

    #> Warning: Unknown or uninitialised
    #> column: `NA`.

    #> NULL

</td>
</tr>
<tr style="vertical-align:top">
<td>
    df[[NA_integer_]]
    #> NULL

</td>
<td>
    tbl[[NA_integer_]]

    #> Warning: Unknown or uninitialised
    #> column: `NA`.

    #> NULL

</td>
</tr>
<tr style="vertical-align:top">
<td>
    df[[NA_character_]]
    #> NULL

</td>
<td>
    tbl[[NA_character_]]

    #> Warning: Unknown or uninitialised
    #> column: `NA`.

    #> NULL

</td>
</tr>
<tr style="vertical-align:top">
<td>
    df[["x"]]
    #> NULL

</td>
<td>
    tbl[["x"]]

    #> Warning: Unknown or uninitialised
    #> column: `x`.

    #> NULL

</td>
</tr>
<tr style="vertical-align:top">
<td>
    df[[4]]

    #> Error in .subset2(x, i, exact =
    #> exact): subscript out of bounds

</td>
<td>
    tbl[[4]]

    #> Error: Can't index beyond the end of
    #> a vector.
    #> The vector has length 3 and you've
    #> tried to subset element 4.

</td>
</tr>
</tbody>
</table>
`[[` requires scalar `vec_as_index(j)`.

<table class="dftbl">
<tbody>
<tr style="vertical-align:top">
<td>
</td>
<td>
    tbl[[1]]
    #> [1] 1 2 3 4

</td>
</tr>
<tr style="vertical-align:top">
<td>
    df[[1:2]]
    #> [1] 2

</td>
<td>
    tbl[[1:2]]

    #> Warning: Calling `[[` with a vector
    #> of length 2 (recursive subsetting)
    #> is deprecated and will eventually be
    #> converted to an error.

    #> [1] 2

</td>
</tr>
<tr style="vertical-align:top">
<td>
    df[[1:3]]

    #> Error in .subset2(x, i, exact =
    #> exact): recursive indexing failed at
    #> level 2

</td>
<td>
    tbl[[1:3]]

    #> Error in error_need_scalar(): could
    #> not find function
    #> "error_need_scalar"

</td>
</tr>
<tr style="vertical-align:top">
<td>
</td>
<td>
    tbl[["n"]]
    #> [1] 1 2 3 4

</td>
</tr>
<tr style="vertical-align:top">
<td>
    df[[c("n", "c")]]

    #> Error in .subset2(x, i, exact =
    #> exact): subscript out of bounds

</td>
<td>
    tbl[[c("n", "c")]]

    #> Error in error_need_scalar(): could
    #> not find function
    #> "error_need_scalar"

</td>
</tr>
<tr style="vertical-align:top">
<td>
    df[[TRUE]]
    #> [1] 1 2 3 4

</td>
<td>
    tbl[[TRUE]]

    #> Error in
    #> error_double_bracket_logical():
    #> could not find function
    #> "error_double_bracket_logical"

</td>
</tr>
<tr style="vertical-align:top">
<td>
    df[[FALSE]]

    #> Error in .subset2(x, i, exact =
    #> exact): attempt to select less than
    #> one element in integerOneIndex

</td>
<td>
    tbl[[FALSE]]

    #> Error in
    #> error_double_bracket_logical():
    #> could not find function
    #> "error_double_bracket_logical"

</td>
</tr>
</tbody>
</table>
`x[[j]]` always returns an object of size `nrow(x)` if the column
exists.

<table class="dftbl">
<tbody>
<tr style="vertical-align:top">
<td>
</td>
<td>
    vec_size(tbl[[1]])
    #> [1] 4

</td>
</tr>
<tr style="vertical-align:top">
<td>
</td>
<td>
    vec_size(tbl[[3]])
    #> [1] 4

</td>
</tr>
<tr style="vertical-align:top">
<td>
</td>
<td>
    vec_size(tbl2[[1]])
    #> [1] 4

</td>
</tr>
<tr style="vertical-align:top">
<td>
</td>
<td>
    vec_size(tbl2[[2]])
    #> [1] 4

</td>
</tr>
</tbody>
</table>
Definition of `x[[j]] <- a`.
----------------------------

`x[[j]] <- a` is equivalent to restoring to the original class after
assigning the (potentially recycled) value to `unclass(x)`:

    xl <- unclass(x)
    xl[[j]] <- vec_recycle(a, nrow(x))
    vec_restore(xl, x)

<table class="dftbl">
<tbody>
<tr style="vertical-align:top">
<td>
</td>
<td>
    with_tbl(tbl[[1]] <- 0)
    #> # A tibble: 4 x 3
    #>       n c     li       
    #>   <dbl> <chr> <list>   
    #> 1     0 e     <dbl [1]>
    #> 2     0 f     <int [2]>
    #> 3     0 g     <int [3]>
    #> 4     0 h     <chr [1]>

</td>
</tr>
<tr style="vertical-align:top">
<td>
</td>
<td>
    with_tbl(tbl[[3]] <- 4:1)
    #> # A tibble: 4 x 3
    #>       n c        li
    #>   <int> <chr> <int>
    #> 1     1 e         4
    #> 2     2 f         3
    #> 3     3 g         2
    #> 4     4 h         1

</td>
</tr>
<tr style="vertical-align:top">
<td>
</td>
<td>
    with_tbl2(tbl2[[1]] <- 0)
    #> # A tibble: 4 x 2
    #>      tb m[,1]  [,2]  [,3]  [,4]
    #>   <dbl> <dbl> <dbl> <dbl> <dbl>
    #> 1     0     1     0     0     0
    #> 2     0     0     1     0     0
    #> 3     0     0     0     1     0
    #> 4     0     0     0     0     1

</td>
</tr>
<tr style="vertical-align:top">
<td>
</td>
<td>
    with_tbl2(tbl2[[2]] <- 4:1)
    #> # A tibble: 4 x 2
    #>    tb$n $c    $li           m
    #>   <int> <chr> <list>    <int>
    #> 1     1 e     <dbl [1]>     4
    #> 2     2 f     <int [2]>     3
    #> 3     3 g     <int [3]>     2
    #> 4     4 h     <chr [1]>     1

</td>
</tr>
</tbody>
</table>
### Corollary

`[[<-` requires scalar `vec_as_index(j)` (with the exception of new
columns, see below).

<table class="dftbl">
<tbody>
<tr style="vertical-align:top">
<td>
</td>
<td>
    with_tbl(tbl[[1]] <- 0)
    #> # A tibble: 4 x 3
    #>       n c     li       
    #>   <dbl> <chr> <list>   
    #> 1     0 e     <dbl [1]>
    #> 2     0 f     <int [2]>
    #> 3     0 g     <int [3]>
    #> 4     0 h     <chr [1]>

</td>
</tr>
<tr style="vertical-align:top">
<td>
    with_df(df[[1:2]] <- 0)

    #> Error in x[[i]] <- value: more
    #> elements supplied than there are to
    #> replace

</td>
<td>
    with_tbl(tbl[[1:2]] <- 0)

    #> Error in error_need_scalar(): could
    #> not find function
    #> "error_need_scalar"

</td>
</tr>
<tr style="vertical-align:top">
<td>
    with_df(df[[1:3]] <- 0)

    #> Error in `[[<-`(`*tmp*`, i, value =
    #> value): recursive indexing failed at
    #> level 2

</td>
<td>
    with_tbl(tbl[[1:3]] <- 0)

    #> Error in error_need_scalar(): could
    #> not find function
    #> "error_need_scalar"

</td>
</tr>
<tr style="vertical-align:top">
<td>
</td>
<td>
    with_tbl(tbl[["n"]] <- 0)
    #> # A tibble: 4 x 3
    #>       n c     li       
    #>   <dbl> <chr> <list>   
    #> 1     0 e     <dbl [1]>
    #> 2     0 f     <int [2]>
    #> 3     0 g     <int [3]>
    #> 4     0 h     <chr [1]>

</td>
</tr>
<tr style="vertical-align:top">
<td>
    with_df(df[[c("n", "c")]] <- 0)

    #> Error in x[[i]] <- value: more
    #> elements supplied than there are to
    #> replace

</td>
<td>
    with_tbl(tbl[[c("n", "c")]] <- 0)

    #> Error in error_need_scalar(): could
    #> not find function
    #> "error_need_scalar"

</td>
</tr>
<tr style="vertical-align:top">
<td>
    with_df(df[[TRUE]] <- 0)
    #>   n c         li
    #> 1 0 e          9
    #> 2 0 f     10, 11
    #> 3 0 g 12, 13, 14
    #> 4 0 h       text

</td>
<td>
    with_tbl(tbl[[TRUE]] <- 0)

    #> Error in error_need_scalar(): could
    #> not find function
    #> "error_need_scalar"

</td>
</tr>
<tr style="vertical-align:top">
<td>
    with_df(df[[FALSE]] <- 0)

    #> Error in x[[i]] <- value: attempt to
    #> select less than one element in
    #> integerOneIndex

</td>
<td>
    with_tbl(tbl[[FALSE]] <- 0)

    #> Error in error_need_scalar(): could
    #> not find function
    #> "error_need_scalar"

</td>
</tr>
<tr style="vertical-align:top">
<td>
    with_df(df[[NA]] <- 0)

    #> Error in x[[i]] <- value: attempt to
    #> select more than one element in
    #> integerOneIndex

</td>
<td>
    with_tbl(tbl[[NA]] <- 0)

    #> Error in
    #> error_new_columns_non_na_only():
    #> could not find function
    #> "error_new_columns_non_na_only"

</td>
</tr>
<tr style="vertical-align:top">
<td>
    with_df(df[[NA_character_]] <- 0)

    #> Error in if (names(x)[nc] == "")
    #> names(x)[nc] <- paste0("V", nc):
    #> missing value where TRUE/FALSE
    #> needed

</td>
<td>
    with_tbl(tbl[[NA_character_]] <- 0)

    #> Error in
    #> error_new_columns_non_na_only():
    #> could not find function
    #> "error_new_columns_non_na_only"

</td>
</tr>
<tr style="vertical-align:top">
<td>
    with_df(df[[NA_integer_]] <- 0)

    #> Error in x[[i]] <- value: attempt to
    #> select more than one element in
    #> integerOneIndex

</td>
<td>
    with_tbl(tbl[[NA_integer_]] <- 0)

    #> Error in
    #> error_new_columns_non_na_only():
    #> could not find function
    #> "error_new_columns_non_na_only"

</td>
</tr>
</tbody>
</table>
`x[[j]] <- a` requires `vec_size(a) == nrow(x)` or `vec_size(a) == 1`.

<table class="dftbl">
<tbody>
<tr style="vertical-align:top">
<td>
</td>
<td>
    with_tbl(tbl[[1]] <- 1)
    #> # A tibble: 4 x 3
    #>       n c     li       
    #>   <dbl> <chr> <list>   
    #> 1     1 e     <dbl [1]>
    #> 2     1 f     <int [2]>
    #> 3     1 g     <int [3]>
    #> 4     1 h     <chr [1]>

</td>
</tr>
<tr style="vertical-align:top">
<td>
</td>
<td>
    with_tbl(tbl[[1]] <- 4:1)
    #> # A tibble: 4 x 3
    #>       n c     li       
    #>   <int> <chr> <list>   
    #> 1     4 e     <dbl [1]>
    #> 2     3 f     <int [2]>
    #> 3     2 g     <int [3]>
    #> 4     1 h     <chr [1]>

</td>
</tr>
<tr style="vertical-align:top">
<td>
    with_df(df[[1]] <- 3:1)

    #> Error in `[[<-.data.frame`(`*tmp*`,
    #> 1, value = 3:1): replacement has 3
    #> rows, data has 4

</td>
<td>
    with_tbl(tbl[[1]] <- 3:1)

    #> Vector of length 3 cannot be
    #> recycled to
    #> length 4. Only vectors of length one
    #> or
    #> of the same length can be recycled.

</td>
</tr>
<tr style="vertical-align:top">
<td>
    with_df(df[[1]] <- 2:1)
    #>   n c         li
    #> 1 2 e          9
    #> 2 1 f     10, 11
    #> 3 2 g 12, 13, 14
    #> 4 1 h       text

</td>
<td>
    with_tbl(tbl[[1]] <- 2:1)

    #> Vector of length 2 cannot be
    #> recycled to
    #> length 4. Only vectors of length one
    #> or
    #> of the same length can be recycled.

</td>
</tr>
</tbody>
</table>
`[[<-` supports appending a new column at the end.

<table class="dftbl">
<tbody>
<tr style="vertical-align:top">
<td>
    with_df(df[["x"]] <- 0)
    #>   n c         li x
    #> 1 1 e          9 0
    #> 2 2 f     10, 11 0
    #> 3 3 g 12, 13, 14 0
    #> 4 4 h       text 0

</td>
<td>
    with_tbl(tbl[["x"]] <- 0)

    #> Error in
    #> error_new_columns_non_na_only():
    #> could not find function
    #> "error_new_columns_non_na_only"

</td>
</tr>
<tr style="vertical-align:top">
<td>
    with_df(df[[4]] <- 0)
    #>   n c         li V4
    #> 1 1 e          9  0
    #> 2 2 f     10, 11  0
    #> 3 3 g 12, 13, 14  0
    #> 4 4 h       text  0

</td>
<td>
    with_tbl(tbl[[4]] <- 0)

    #> Error in
    #> error_new_columns_non_na_only():
    #> could not find function
    #> "error_new_columns_non_na_only"

</td>
</tr>
<tr style="vertical-align:top">
<td>
    with_df(df[[5]] <- 0)

    #> Warning in format.data.frame(if (omit)
    #> x[seq_len(n0), , drop = FALSE] else
    #> x, : corrupt data frame: columns will be
    #> truncated or padded with NAs

    #>   n c         li      V5
    #> 1 1 e          9 NULL  0
    #> 2 2 f     10, 11 <NA>  0
    #> 3 3 g 12, 13, 14 <NA>  0
    #> 4 4 h       text <NA>  0

</td>
<td>
    with_tbl(tbl[[5]] <- 0)

    #> Error in
    #> error_new_columns_at_end_only():
    #> could not find function
    #> "error_new_columns_at_end_only"

</td>
</tr>
</tbody>
</table>
`[[<-` supports changing the type of an existing column, also across the
principal column types:

-   atomic: `df[[1]]` and `df[[2]]`
-   list: `df[[3]]`
-   data frame: `df2[[1]]`
-   matrix: `df2[[2]]`

<table class="dftbl">
<tbody>
<tr style="vertical-align:top">
<td>
</td>
<td>
    with_tbl(tbl[[1]] <- tbl[[2]])
    #> # A tibble: 4 x 3
    #>   n     c     li       
    #>   <chr> <chr> <list>   
    #> 1 e     e     <dbl [1]>
    #> 2 f     f     <int [2]>
    #> 3 g     g     <int [3]>
    #> 4 h     h     <chr [1]>

</td>
</tr>
<tr style="vertical-align:top">
<td>
</td>
<td>
    with_tbl(tbl[[2]] <- tbl[[3]])
    #> # A tibble: 4 x 3
    #>       n c         li       
    #>   <int> <list>    <list>   
    #> 1     1 <dbl [1]> <dbl [1]>
    #> 2     2 <int [2]> <int [2]>
    #> 3     3 <int [3]> <int [3]>
    #> 4     4 <chr [1]> <chr [1]>

</td>
</tr>
<tr style="vertical-align:top">
<td>
</td>
<td>
    with_tbl(tbl[[3]] <- tbl2[[1]])
    #> # A tibble: 4 x 3
    #>       n c      li$n $c    $li      
    #>   <int> <chr> <int> <chr> <list>   
    #> 1     1 e         1 e     <dbl [1]>
    #> 2     2 f         2 f     <int [2]>
    #> 3     3 g         3 g     <int [3]>
    #> 4     4 h         4 h     <chr [1]>

</td>
</tr>
<tr style="vertical-align:top">
<td>
</td>
<td>
    with_tbl2(tbl2[[1]] <- tbl2[[2]])
    #> # A tibble: 4 x 2
    #>   tb[,1]  [,2]  [,3]  [,4] m[,1]  [,2]
    #>    <dbl> <dbl> <dbl> <dbl> <dbl> <dbl>
    #> 1      1     0     0     0     1     0
    #> 2      0     1     0     0     0     1
    #> 3      0     0     1     0     0     0
    #> 4      0     0     0     1     0     0
    #> # … with 2 more variables: [,3] <dbl>,
    #> #   [,4] <dbl>

</td>
</tr>
<tr style="vertical-align:top">
<td>
</td>
<td>
    with_tbl2(tbl2[[2]] <- tbl[[1]])
    #> # A tibble: 4 x 2
    #>    tb$n $c    $li           m
    #>   <int> <chr> <list>    <int>
    #> 1     1 e     <dbl [1]>     1
    #> 2     2 f     <int [2]>     2
    #> 3     3 g     <int [3]>     3
    #> 4     4 h     <chr [1]>     4

</td>
</tr>
</tbody>
</table>
`[[<-` supports removing a column by assigning `NULL` to it.

<table class="dftbl">
<tbody>
<tr style="vertical-align:top">
<td>
</td>
<td>
    with_tbl(tbl[[1]] <- NULL)
    #> # A tibble: 4 x 2
    #>   c     li       
    #>   <chr> <list>   
    #> 1 e     <dbl [1]>
    #> 2 f     <int [2]>
    #> 3 g     <int [3]>
    #> 4 h     <chr [1]>

</td>
</tr>
<tr style="vertical-align:top">
<td>
</td>
<td>
    with_tbl2(tbl2[[2]] <- NULL)
    #> # A tibble: 4 x 1
    #>    tb$n $c    $li      
    #>   <int> <chr> <list>   
    #> 1     1 e     <dbl [1]>
    #> 2     2 f     <int [2]>
    #> 3     3 g     <int [3]>
    #> 4     4 h     <chr [1]>

</td>
</tr>
</tbody>
</table>
Columns don’t have inner names.
-------------------------------

<table class="dftbl">
<tbody>
<tr style="vertical-align:top">
<td>
    with_df(df[["x"]] <- c(a = 4, b = 3, c = 2, d = 1))[["x"]]
    #> [1] 4 3 2 1

</td>
<td>
    with_tbl(tbl[["x"]] <- c(a = 4, b = 3, c = 2, d = 1))[["x"]]

    #> Error in
    #> error_new_columns_non_na_only():
    #> could not find function
    #> "error_new_columns_non_na_only"

</td>
</tr>
<tr style="vertical-align:top">
<td>
    with_df(df[["x"]] <- rlang::set_names(letters[4:1]))[["x"]]
    #> [1] "d" "c" "b" "a"

</td>
<td>
    with_tbl(tbl[["x"]] <- rlang::set_names(letters[4:1]))[["x"]]

    #> Error in
    #> error_new_columns_non_na_only():
    #> could not find function
    #> "error_new_columns_non_na_only"

</td>
</tr>
</tbody>
</table>
### Exception

List columns can have inner names:

<table class="dftbl">
<tbody>
<tr style="vertical-align:top">
<td>
    with_df(df[["x"]] <- list(a = 4, b = 3, c = 2, d = 1))[["x"]]
    #> $a
    #> [1] 4
    #> 
    #> $b
    #> [1] 3
    #> 
    #> $c
    #> [1] 2
    #> 
    #> $d
    #> [1] 1

</td>
<td>
    with_tbl(tbl[["x"]] <- list(a = 4, b = 3, c = 2, d = 1))[["x"]]

    #> Error in
    #> error_new_columns_non_na_only():
    #> could not find function
    #> "error_new_columns_non_na_only"

</td>
</tr>
</tbody>
</table>
Definition of `x$name`.
-----------------------

`x$name` is equivalent to `x[["name"]]`.

<table class="dftbl">
<tbody>
<tr style="vertical-align:top">
<td>
</td>
<td>
    tbl$n
    #> [1] 1 2 3 4

</td>
</tr>
<tr style="vertical-align:top">
<td>
</td>
<td>
    tbl[["n"]]
    #> [1] 1 2 3 4

</td>
</tr>
<tr style="vertical-align:top">
<td>
</td>
<td>
    tbl$li
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

</td>
</tr>
<tr style="vertical-align:top">
<td>
</td>
<td>
    tbl[["li"]]
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

</td>
</tr>
<tr style="vertical-align:top">
<td>
</td>
<td>
    with_tbl(tbl$n <- 0)
    #> # A tibble: 4 x 3
    #>       n c     li       
    #>   <dbl> <chr> <list>   
    #> 1     0 e     <dbl [1]>
    #> 2     0 f     <int [2]>
    #> 3     0 g     <int [3]>
    #> 4     0 h     <chr [1]>

</td>
</tr>
<tr style="vertical-align:top">
<td>
</td>
<td>
    with_tbl(tbl[["n"]] <- 0)
    #> # A tibble: 4 x 3
    #>       n c     li       
    #>   <dbl> <chr> <list>   
    #> 1     0 e     <dbl [1]>
    #> 2     0 f     <int [2]>
    #> 3     0 g     <int [3]>
    #> 4     0 h     <chr [1]>

</td>
</tr>
<tr style="vertical-align:top">
<td>
</td>
<td>
    tbl2$tb
    #> # A tibble: 4 x 3
    #>       n c     li       
    #>   <int> <chr> <list>   
    #> 1     1 e     <dbl [1]>
    #> 2     2 f     <int [2]>
    #> 3     3 g     <int [3]>
    #> 4     4 h     <chr [1]>

</td>
</tr>
<tr style="vertical-align:top">
<td>
</td>
<td>
    tbl2[["tb"]]
    #> # A tibble: 4 x 3
    #>       n c     li       
    #>   <int> <chr> <list>   
    #> 1     1 e     <dbl [1]>
    #> 2     2 f     <int [2]>
    #> 3     3 g     <int [3]>
    #> 4     4 h     <chr [1]>

</td>
</tr>
<tr style="vertical-align:top">
<td>
</td>
<td>
    tbl2$m
    #>      [,1] [,2] [,3] [,4]
    #> [1,]    1    0    0    0
    #> [2,]    0    1    0    0
    #> [3,]    0    0    1    0
    #> [4,]    0    0    0    1

</td>
</tr>
<tr style="vertical-align:top">
<td>
</td>
<td>
    tbl2[["m"]]
    #>      [,1] [,2] [,3] [,4]
    #> [1,]    1    0    0    0
    #> [2,]    0    1    0    0
    #> [3,]    0    0    1    0
    #> [4,]    0    0    0    1

</td>
</tr>
<tr style="vertical-align:top">
<td>
    with_df2(df2$df <- df[1, ])

    #> Error in `$<-.data.frame`(`*tmp*`,
    #> df, value = structure(list(n = 1L, :
    #> replacement has 1 row, data has 4

</td>
<td>
    with_tbl2(tbl2$tbl <- tbl[1, ])
    #> # A tibble: 4 x 3
    #>    tb$n $c    $li      m[,1]  [,2]  [,3]
    #>   <int> <chr> <list>   <dbl> <dbl> <dbl>
    #> 1     1 e     <dbl [1…     1     0     0
    #> 2     2 f     <int [2…     0     1     0
    #> 3     3 g     <int [3…     0     0     1
    #> 4     4 h     <chr [1…     0     0     0
    #> # … with 4 more variables: [,4] <dbl>,
    #> #   tbl$n <int>, $c <chr>, $li <list>

</td>
</tr>
<tr style="vertical-align:top">
<td>
    with_df2(df2[["df"]] <- df[1, ])

    #> Error in `[[<-.data.frame`(`*tmp*`,
    #> "df", value = structure(list(n = 1L,
    #> : replacement has 1 row, data has 4

</td>
<td>
    with_tbl2(tbl2[["tbl"]] <- tbl[1, ])

    #> Error in
    #> error_new_columns_non_na_only():
    #> could not find function
    #> "error_new_columns_non_na_only"

</td>
</tr>
<tr style="vertical-align:top">
<td>
    with_df2(df2$m <- df2$m[1, , drop = FALSE])

    #> Error in `$<-.data.frame`(`*tmp*`,
    #> m, value = structure(c(1, 0, 0, 0),
    #> .Dim = c(1L, : replacement has 1
    #> row, data has 4

</td>
<td>
    with_tbl2(tbl2$m <- tbl2$m[1, , drop = FALSE])
    #> # A tibble: 4 x 2
    #>    tb$n $c    $li      m[,1]  [,2]  [,3]
    #>   <int> <chr> <list>   <dbl> <dbl> <dbl>
    #> 1     1 e     <dbl [1…     1     0     0
    #> 2     2 f     <int [2…     1     0     0
    #> 3     3 g     <int [3…     1     0     0
    #> 4     4 h     <chr [1…     1     0     0
    #> # … with 1 more variable: [,4] <dbl>

</td>
</tr>
<tr style="vertical-align:top">
<td>
    with_df2(df2[["m"]] <- df2[["m"]][1, , drop = FALSE])

    #> Error in `[[<-.data.frame`(`*tmp*`,
    #> "m", value = structure(c(1, 0, 0, :
    #> replacement has 1 row, data has 4

</td>
<td>
    with_tbl2(tbl2[["m"]] <- tbl2[["m"]][1, , drop = FALSE])
    #> # A tibble: 4 x 2
    #>    tb$n $c    $li      m[,1]  [,2]  [,3]
    #>   <int> <chr> <list>   <dbl> <dbl> <dbl>
    #> 1     1 e     <dbl [1…     1     0     0
    #> 2     2 f     <int [2…     1     0     0
    #> 3     3 g     <int [3…     1     0     0
    #> 4     4 h     <chr [1…     1     0     0
    #> # … with 1 more variable: [,4] <dbl>

</td>
</tr>
</tbody>
</table>
### Corollary

`$` does not implement partial matching. For compatibility with code
that probes columns and compares with `NULL`, only a warning is raised.

<table class="dftbl">
<tbody>
<tr style="vertical-align:top">
<td>
    df$l

    #> Warning in df$l: partial match of 'l' to
    #> 'li'

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

</td>
<td>
    tbl$l

    #> Warning: Unknown or uninitialised
    #> column: `l`.

    #> NULL

</td>
</tr>
<tr style="vertical-align:top">
<td>
    df[["l"]]
    #> NULL

</td>
<td>
    tbl[["l"]]

    #> Warning: Unknown or uninitialised
    #> column: `l`.

    #> NULL

</td>
</tr>
<tr style="vertical-align:top">
<td>
</td>
<td>
    with_tbl(tbl$l <- 0)
    #> # A tibble: 4 x 4
    #>       n c     li            l
    #>   <int> <chr> <list>    <dbl>
    #> 1     1 e     <dbl [1]>     0
    #> 2     2 f     <int [2]>     0
    #> 3     3 g     <int [3]>     0
    #> 4     4 h     <chr [1]>     0

</td>
</tr>
<tr style="vertical-align:top">
<td>
    with_df(df[["l"]] <- 0)
    #>   n c         li l
    #> 1 1 e          9 0
    #> 2 2 f     10, 11 0
    #> 3 3 g 12, 13, 14 0
    #> 4 4 h       text 0

</td>
<td>
    with_tbl(tbl[["l"]] <- 0)

    #> Error in
    #> error_new_columns_non_na_only():
    #> could not find function
    #> "error_new_columns_non_na_only"

</td>
</tr>
</tbody>
</table>
Definition of `x[j]`.
---------------------

Equivalent to restoring `.subset(x, vec_as_index(j))` to the original
class.

<table class="dftbl">
<tbody>
<tr style="vertical-align:top">
<td>
</td>
<td>
    tbl[1:2]
    #> # A tibble: 4 x 2
    #>       n c    
    #>   <int> <chr>
    #> 1     1 e    
    #> 2     2 f    
    #> 3     3 g    
    #> 4     4 h

</td>
</tr>
<tr style="vertical-align:top">
<td>
</td>
<td>
    tbl[0:2]
    #> # A tibble: 4 x 2
    #>       n c    
    #>   <int> <chr>
    #> 1     1 e    
    #> 2     2 f    
    #> 3     3 g    
    #> 4     4 h

</td>
</tr>
<tr style="vertical-align:top">
<td>
</td>
<td>
    tbl[-2]
    #> # A tibble: 4 x 2
    #>       n li       
    #>   <int> <list>   
    #> 1     1 <dbl [1]>
    #> 2     2 <int [2]>
    #> 3     3 <int [3]>
    #> 4     4 <chr [1]>

</td>
</tr>
<tr style="vertical-align:top">
<td>
    df[-1:2]

    #> Error in `[.default`(df, -1:2): only
    #> 0's may be mixed with negative
    #> subscripts

</td>
<td>
    tbl[-1:2]

    #> Error: Can't subset with a mix of
    #> negative and positive indices

</td>
</tr>
<tr style="vertical-align:top">
<td>
</td>
<td>
    tbl["c"]
    #> # A tibble: 4 x 1
    #>   c    
    #>   <chr>
    #> 1 e    
    #> 2 f    
    #> 3 g    
    #> 4 h

</td>
</tr>
<tr style="vertical-align:top">
<td>
</td>
<td>
    tbl[c(TRUE, FALSE, TRUE)]
    #> # A tibble: 4 x 2
    #>       n li       
    #>   <int> <list>   
    #> 1     1 <dbl [1]>
    #> 2     2 <int [2]>
    #> 3     3 <int [3]>
    #> 4     4 <chr [1]>

</td>
</tr>
<tr style="vertical-align:top">
<td>
</td>
<td>
    tbl[TRUE]
    #> # A tibble: 4 x 3
    #>       n c     li       
    #>   <int> <chr> <list>   
    #> 1     1 e     <dbl [1]>
    #> 2     2 f     <int [2]>
    #> 3     3 g     <int [3]>
    #> 4     4 h     <chr [1]>

</td>
</tr>
</tbody>
</table>
### Corollaries

`NA` columns are not supported.

<table class="dftbl">
<tbody>
<tr style="vertical-align:top">
<td>
    df[NA]

    #> Error in `[.data.frame`(df, NA):
    #> undefined columns selected

</td>
<td>
    tbl[NA]

    #> Can't use numeric NA as column index
    #> with `[` at positions 1, 2, 3.

</td>
</tr>
<tr style="vertical-align:top">
<td>
    df[NA_integer_]

    #> Error in `[.data.frame`(df,
    #> NA_integer_): undefined columns
    #> selected

</td>
<td>
    tbl[NA_integer_]

    #> Can't use numeric NA as column index
    #> with `[` at position 1.

</td>
</tr>
<tr style="vertical-align:top">
<td>
    df[NA_character_]

    #> Error in `[.data.frame`(df,
    #> NA_character_): undefined columns
    #> selected

</td>
<td>
    tbl[NA_character_]

    #> Can't use numeric NA as column index
    #> with `[` at position 1.

</td>
</tr>
</tbody>
</table>
Out-of-bounds indexing (and recycling of logical vectors of size &gt; 1)
is not supported.

<table class="dftbl">
<tbody>
<tr style="vertical-align:top">
<td>
    df[4]

    #> Error in `[.data.frame`(df, 4):
    #> undefined columns selected

</td>
<td>
    tbl[4]

    #> Error: Can't index beyond the end of
    #> a vector.
    #> The vector has length 3 and you've
    #> tried to subset element 4.

</td>
</tr>
<tr style="vertical-align:top">
<td>
    df[-4]
    #>   n c         li
    #> 1 1 e          9
    #> 2 2 f     10, 11
    #> 3 3 g 12, 13, 14
    #> 4 4 h       text

</td>
<td>
    tbl[-4]

    #> Error: Can't index beyond the end of
    #> a vector.
    #> The vector has length 3 and you've
    #> tried to subset element 4.

</td>
</tr>
<tr style="vertical-align:top">
<td>
    df["x"]

    #> Error in `[.data.frame`(df, "x"):
    #> undefined columns selected

</td>
<td>
    tbl["x"]

    #> Error: Can't index non-existing
    #> elements.

</td>
</tr>
<tr style="vertical-align:top">
<td>
    df[c(TRUE, FALSE, TRUE, FALSE)]
    #>   n         li
    #> 1 1          9
    #> 2 2     10, 11
    #> 3 3 12, 13, 14
    #> 4 4       text

</td>
<td>
    tbl[c(TRUE, FALSE, TRUE, FALSE)]

    #> Error: Logical indices must have
    #> length 1 or be as long as the
    #> indexed vector.
    #> The vector has size 3 whereas the
    #> index has size 4.

</td>
</tr>
<tr style="vertical-align:top">
<td>
    df[c(TRUE, FALSE)]
    #>   n         li
    #> 1 1          9
    #> 2 2     10, 11
    #> 3 3 12, 13, 14
    #> 4 4       text

</td>
<td>
    tbl[c(TRUE, FALSE)]

    #> Error: Logical indices must have
    #> length 1 or be as long as the
    #> indexed vector.
    #> The vector has size 3 whereas the
    #> index has size 2.

</td>
</tr>
</tbody>
</table>
`x[j]` retains the number of rows in the input.

<table class="dftbl">
<tbody>
<tr style="vertical-align:top">
<td>
</td>
<td>
    nrow(tbl[])
    #> [1] 4

</td>
</tr>
<tr style="vertical-align:top">
<td>
</td>
<td>
    nrow(tbl[1])
    #> [1] 4

</td>
</tr>
<tr style="vertical-align:top">
<td>
</td>
<td>
    nrow(tbl[3])
    #> [1] 4

</td>
</tr>
<tr style="vertical-align:top">
<td>
</td>
<td>
    nrow(tbl2[1])
    #> [1] 4

</td>
</tr>
<tr style="vertical-align:top">
<td>
</td>
<td>
    nrow(tbl2[2])
    #> [1] 4

</td>
</tr>
</tbody>
</table>
Definition of `x[j] <- list(...)`.
----------------------------------

`x[j] <- a` is equivalent to converting `j` to column indexes or column
names and performing `x[[jj]] <- ...` in a loop.

For converting indexes, the following (internal) function is used.

    # With logic for defining names of new columns, see below
    j <- vec_as_new_col_index(j, x, a)

    # Existing columns
    tibble:::vec_as_new_col_index(2:3, df, list(2, 3))
    #>     
    #> 2 3
    tibble:::vec_as_new_col_index(-3, df, list(2, 3))
    #>     
    #> 1 2
    tibble:::vec_as_new_col_index(c(TRUE, FALSE, TRUE), df, list(2, 3))
    #> [1] 1 3
    #
    #
    # New columns
    tibble:::vec_as_new_col_index("x", df, list(y = 0))
    #>  x 
    #> NA
    tibble:::vec_as_new_col_index(4, df, list(y = 0))
    #>  y 
    #> NA
    tibble:::vec_as_new_col_index(4, df, list(0))
    #> ...4 
    #>   NA
    #
    #
    # Errors
    tibble:::vec_as_new_col_index(NA, df, list(0))

    #> Error in error_new_columns_non_na_only(): could not find function "error_new_columns_non_na_only"

    tibble:::vec_as_new_col_index(NA_integer_, df, list(0))

    #> Error in error_new_columns_non_na_only(): could not find function "error_new_columns_non_na_only"

    tibble:::vec_as_new_col_index(NA_character_, df, list(0))

    #> Error in error_new_columns_non_na_only(): could not find function "error_new_columns_non_na_only"

    tibble:::vec_as_new_col_index(5, df, list(0))

    #> Error in error_new_columns_at_end_only(): could not find function "error_new_columns_at_end_only"

For accessing the name or index of a target column, the following helper
is used:

    index_or_name <- function(j, ja) {
      index <- j[[ja]]
      if (!is.na(index)) index else names(j)[[ja]]
    }

Below is a simple version of the update loop:

    # Create, update or remove, indexed by position
    for (ja in seq_along(j)) {
      jx <- index_or_name(j, ja)
      x[[jx]] <- a[[ja]] # with implicit recycling
    }

Adding, updating and removing columns may occur in arbitrary order. A
robust implementation that avoids index mismatches might look more like
this:

    a_null <- map_lgl(a, is_null)

    # Create or update, indexed by position
    for (ja in which(!a_null)) {
      jx <- index_or_name(j, ja)
      x[[jx]] <- a[[ja]] # with implicit recycling
    }

    # Remove
    j_remove <- j[a_null]
    if (has_length(j_remove)) x <- x[-j_remove]

<table class="dftbl">
<tbody>
<tr style="vertical-align:top">
<td>
</td>
<td>
    with_tbl(tbl[1:2] <- list("x", 4:1))
    #> # A tibble: 4 x 3
    #>   n         c li       
    #>   <chr> <int> <list>   
    #> 1 x         4 <dbl [1]>
    #> 2 x         3 <int [2]>
    #> 3 x         2 <int [3]>
    #> 4 x         1 <chr [1]>

</td>
</tr>
<tr style="vertical-align:top">
<td>
</td>
<td>
    with_tbl(tbl[c("li", "x", "c")] <- list("x", 4:1, NULL))
    #> # A tibble: 4 x 3
    #>       n li        x
    #>   <int> <chr> <int>
    #> 1     1 x         4
    #> 2     2 x         3
    #> 3     3 x         2
    #> 4     4 x         1

</td>
</tr>
<tr style="vertical-align:top">
<td>
</td>
<td>
    with_tbl(tbl[1:2] <- list(NULL, 4:1))
    #> # A tibble: 4 x 2
    #>       c li       
    #>   <int> <list>   
    #> 1     4 <dbl [1]>
    #> 2     3 <int [2]>
    #> 3     2 <int [3]>
    #> 4     1 <chr [1]>

</td>
</tr>
</tbody>
</table>
### Corollaries

`NA` indexes are not supported.

<table class="dftbl">
<tbody>
<tr style="vertical-align:top">
<td>
    with_df(df[NA] <- list("x"))

    #> Error in `[<-.data.frame`(`*tmp*`,
    #> NA, value = list("x")): missing
    #> values are not allowed in
    #> subscripted assignments of data
    #> frames

</td>
<td>
    with_tbl(tbl[NA] <- list("x"))

    #> Error in
    #> error_new_columns_non_na_only():
    #> could not find function
    #> "error_new_columns_non_na_only"

</td>
</tr>
<tr style="vertical-align:top">
<td>
    with_df(df[NA_integer_] <- list("x"))

    #> Error in `[<-.data.frame`(`*tmp*`,
    #> NA_integer_, value = list("x")):
    #> missing values are not allowed in
    #> subscripted assignments of data
    #> frames

</td>
<td>
    with_tbl(tbl[NA_integer_] <- list("x"))

    #> Error in
    #> error_new_columns_non_na_only():
    #> could not find function
    #> "error_new_columns_non_na_only"

</td>
</tr>
<tr style="vertical-align:top">
<td>
    with_df(df[NA_character_] <- list("x"))

    #> Error in `[<-.data.frame`(`*tmp*`,
    #> NA_character_, value = list("x")):
    #> missing values are not allowed in
    #> subscripted assignments of data
    #> frames

</td>
<td>
    with_tbl(tbl[NA_character_] <- list("x"))

    #> Error in
    #> error_new_columns_non_na_only():
    #> could not find function
    #> "error_new_columns_non_na_only"

</td>
</tr>
</tbody>
</table>
`[<-` supports changing the type of an existing column, also across the
principal column types:

-   atomic: `df[[1]]` and `df[[2]]`
-   list: `df[[3]]`
-   data frame: `df2[[1]]`
-   matrix: `df2[[2]]`

<table class="dftbl">
<tbody>
<tr style="vertical-align:top">
<td>
</td>
<td>
    with_tbl(tbl[1] <- tbl[2])
    #> # A tibble: 4 x 3
    #>   n     c     li       
    #>   <chr> <chr> <list>   
    #> 1 e     e     <dbl [1]>
    #> 2 f     f     <int [2]>
    #> 3 g     g     <int [3]>
    #> 4 h     h     <chr [1]>

</td>
</tr>
<tr style="vertical-align:top">
<td>
</td>
<td>
    with_tbl(tbl[2] <- tbl[3])
    #> # A tibble: 4 x 3
    #>       n c         li       
    #>   <int> <list>    <list>   
    #> 1     1 <dbl [1]> <dbl [1]>
    #> 2     2 <int [2]> <int [2]>
    #> 3     3 <int [3]> <int [3]>
    #> 4     4 <chr [1]> <chr [1]>

</td>
</tr>
<tr style="vertical-align:top">
<td>
</td>
<td>
    with_tbl(tbl[3] <- tbl2[1])
    #> # A tibble: 4 x 3
    #>       n c      li$n $c    $li      
    #>   <int> <chr> <int> <chr> <list>   
    #> 1     1 e         1 e     <dbl [1]>
    #> 2     2 f         2 f     <int [2]>
    #> 3     3 g         3 g     <int [3]>
    #> 4     4 h         4 h     <chr [1]>

</td>
</tr>
<tr style="vertical-align:top">
<td>
</td>
<td>
    with_tbl2(tbl2[1] <- tbl2[2])
    #> # A tibble: 4 x 2
    #>   tb[,1]  [,2]  [,3]  [,4] m[,1]  [,2]
    #>    <dbl> <dbl> <dbl> <dbl> <dbl> <dbl>
    #> 1      1     0     0     0     1     0
    #> 2      0     1     0     0     0     1
    #> 3      0     0     1     0     0     0
    #> 4      0     0     0     1     0     0
    #> # … with 2 more variables: [,3] <dbl>,
    #> #   [,4] <dbl>

</td>
</tr>
<tr style="vertical-align:top">
<td>
</td>
<td>
    with_tbl2(tbl2[2] <- tbl[1])
    #> # A tibble: 4 x 2
    #>    tb$n $c    $li           m
    #>   <int> <chr> <list>    <int>
    #> 1     1 e     <dbl [1]>     1
    #> 2     2 f     <int [2]>     2
    #> 3     3 g     <int [3]>     3
    #> 4     4 h     <chr [1]>     4

</td>
</tr>
</tbody>
</table>
Appending columns at the end (without gaps) is supported. The name of
new columns is determined by the LHS, the RHS, or by name repair (in
that order of precedence).

<table class="dftbl">
<tbody>
<tr style="vertical-align:top">
<td>
</td>
<td>
    with_tbl(tbl[c("x", "y")] <- tibble("x", x = 4:1))
    #> # A tibble: 4 x 5
    #>       n c     li        x         y
    #>   <int> <chr> <list>    <chr> <int>
    #> 1     1 e     <dbl [1]> x         4
    #> 2     2 f     <int [2]> x         3
    #> 3     3 g     <int [3]> x         2
    #> 4     4 h     <chr [1]> x         1

</td>
</tr>
<tr style="vertical-align:top">
<td>
</td>
<td>
    with_tbl(tbl[3:4] <- list("x", x = 4:1))
    #> # A tibble: 4 x 4
    #>       n c     li        x
    #>   <int> <chr> <chr> <int>
    #> 1     1 e     x         4
    #> 2     2 f     x         3
    #> 3     3 g     x         2
    #> 4     4 h     x         1

</td>
</tr>
<tr style="vertical-align:top">
<td>
    with_df(df[4] <- list(4:1))
    #>   n c         li V4
    #> 1 1 e          9  4
    #> 2 2 f     10, 11  3
    #> 3 3 g 12, 13, 14  2
    #> 4 4 h       text  1

</td>
<td>
    with_tbl(tbl[4] <- list(4:1))
    #> # A tibble: 4 x 4
    #>       n c     li         ...4
    #>   <int> <chr> <list>    <int>
    #> 1     1 e     <dbl [1]>     4
    #> 2     2 f     <int [2]>     3
    #> 3     3 g     <int [3]>     2
    #> 4     4 h     <chr [1]>     1

</td>
</tr>
<tr style="vertical-align:top">
<td>
    with_df(df[5] <- list(4:1))

    #> Error in `[<-.data.frame`(`*tmp*`,
    #> 5, value = list(4:1)): new columns
    #> would leave holes after existing
    #> columns

</td>
<td>
    with_tbl(tbl[5] <- list(4:1))

    #> Error in
    #> error_new_columns_at_end_only():
    #> could not find function
    #> "error_new_columns_at_end_only"

</td>
</tr>
</tbody>
</table>
`x[j]` and `x[[j]]` can be used interchangeably on the LHS or RHS of an
assignment:

<table class="dftbl">
<tbody>
<tr style="vertical-align:top">
<td>
</td>
<td>
    with_tbl(tbl[[1]] <- tbl[[3]])
    #> # A tibble: 4 x 3
    #>   n         c     li       
    #>   <list>    <chr> <list>   
    #> 1 <dbl [1]> e     <dbl [1]>
    #> 2 <int [2]> f     <int [2]>
    #> 3 <int [3]> g     <int [3]>
    #> 4 <chr [1]> h     <chr [1]>

</td>
</tr>
<tr style="vertical-align:top">
<td>
</td>
<td>
    with_tbl(tbl[1] <- list(tbl[[3]]))
    #> # A tibble: 4 x 3
    #>   n         c     li       
    #>   <list>    <chr> <list>   
    #> 1 <dbl [1]> e     <dbl [1]>
    #> 2 <int [2]> f     <int [2]>
    #> 3 <int [3]> g     <int [3]>
    #> 4 <chr [1]> h     <chr [1]>

</td>
</tr>
<tr style="vertical-align:top">
<td>
</td>
<td>
    with_tbl(tbl[[3]] <- tbl[[1]])
    #> # A tibble: 4 x 3
    #>       n c        li
    #>   <int> <chr> <int>
    #> 1     1 e         1
    #> 2     2 f         2
    #> 3     3 g         3
    #> 4     4 h         4

</td>
</tr>
<tr style="vertical-align:top">
<td>
</td>
<td>
    with_tbl(tbl[3] <- list(tbl[[1]]))
    #> # A tibble: 4 x 3
    #>       n c        li
    #>   <int> <chr> <int>
    #> 1     1 e         1
    #> 2     2 f         2
    #> 3     3 g         3
    #> 4     4 h         4

</td>
</tr>
<tr style="vertical-align:top">
<td>
</td>
<td>
    with_tbl2(tbl2[[1]] <- tbl[[1]])
    #> # A tibble: 4 x 2
    #>      tb m[,1]  [,2]  [,3]  [,4]
    #>   <int> <dbl> <dbl> <dbl> <dbl>
    #> 1     1     1     0     0     0
    #> 2     2     0     1     0     0
    #> 3     3     0     0     1     0
    #> 4     4     0     0     0     1

</td>
</tr>
<tr style="vertical-align:top">
<td>
</td>
<td>
    with_tbl2(tbl2[1] <- list(tbl[[1]]))
    #> # A tibble: 4 x 2
    #>      tb m[,1]  [,2]  [,3]  [,4]
    #>   <int> <dbl> <dbl> <dbl> <dbl>
    #> 1     1     1     0     0     0
    #> 2     2     0     1     0     0
    #> 3     3     0     0     1     0
    #> 4     4     0     0     0     1

</td>
</tr>
<tr style="vertical-align:top">
<td>
</td>
<td>
    with_tbl2(tbl2[[2]] <- tbl[[3]])
    #> # A tibble: 4 x 2
    #>    tb$n $c    $li       m        
    #>   <int> <chr> <list>    <list>   
    #> 1     1 e     <dbl [1]> <dbl [1]>
    #> 2     2 f     <int [2]> <int [2]>
    #> 3     3 g     <int [3]> <int [3]>
    #> 4     4 h     <chr [1]> <chr [1]>

</td>
</tr>
<tr style="vertical-align:top">
<td>
</td>
<td>
    with_tbl2(tbl2[2] <- list(tbl[[3]]))
    #> # A tibble: 4 x 2
    #>    tb$n $c    $li       m        
    #>   <int> <chr> <list>    <list>   
    #> 1     1 e     <dbl [1]> <dbl [1]>
    #> 2     2 f     <int [2]> <int [2]>
    #> 3     3 g     <int [3]> <int [3]>
    #> 4     4 h     <chr [1]> <chr [1]>

</td>
</tr>
</tbody>
</table>
Definition of `x[j] <- list(a)`.
--------------------------------

`x[j] <- a` is equivalent to `x[j] <- rep_along(j, a)` if
`is_list(a, 1)`.

<table class="dftbl">
<tbody>
<tr style="vertical-align:top">
<td>
</td>
<td>
    with_tbl(tbl[1:2] <- list(0))
    #> # A tibble: 4 x 3
    #>       n     c li       
    #>   <dbl> <dbl> <list>   
    #> 1     0     0 <dbl [1]>
    #> 2     0     0 <int [2]>
    #> 3     0     0 <int [3]>
    #> 4     0     0 <chr [1]>

</td>
</tr>
<tr style="vertical-align:top">
<td>
</td>
<td>
    with_tbl(tbl[1:2] <- list(0, 0))
    #> # A tibble: 4 x 3
    #>       n     c li       
    #>   <dbl> <dbl> <list>   
    #> 1     0     0 <dbl [1]>
    #> 2     0     0 <int [2]>
    #> 3     0     0 <int [3]>
    #> 4     0     0 <chr [1]>

</td>
</tr>
<tr style="vertical-align:top">
<td>
</td>
<td>
    with_tbl(tbl[1:3] <- list(0))
    #> # A tibble: 4 x 3
    #>       n     c    li
    #>   <dbl> <dbl> <dbl>
    #> 1     0     0     0
    #> 2     0     0     0
    #> 3     0     0     0
    #> 4     0     0     0

</td>
</tr>
<tr style="vertical-align:top">
<td>
</td>
<td>
    with_tbl(tbl[1:3] <- list(0, 0, 0))
    #> # A tibble: 4 x 3
    #>       n     c    li
    #>   <dbl> <dbl> <dbl>
    #> 1     0     0     0
    #> 2     0     0     0
    #> 3     0     0     0
    #> 4     0     0     0

</td>
</tr>
</tbody>
</table>
### Corollary

Only lists of length one on the RHS are recycled.

<table class="dftbl">
<tbody>
<tr style="vertical-align:top">
<td>
    with_df(df[1:2] <- list(0, 0, 0))

    #> Warning in `[<-.data.frame`(`*tmp*`,
    #> 1:2, value = list(0, 0, 0)): provided 3
    #> variables to replace 2 variables

    #>   n c         li
    #> 1 0 0          9
    #> 2 0 0     10, 11
    #> 3 0 0 12, 13, 14
    #> 4 0 0       text

</td>
<td>
    with_tbl(tbl[1:2] <- list(0, 0, 0))

    #> Vector of length 3 cannot be
    #> recycled to
    #> length 2. Only vectors of length one
    #> or
    #> of the same length can be recycled.

</td>
</tr>
<tr style="vertical-align:top">
<td>
    with_df(df[1:3] <- list(0, 0))
    #>   n c li
    #> 1 0 0  0
    #> 2 0 0  0
    #> 3 0 0  0
    #> 4 0 0  0

</td>
<td>
    with_tbl(tbl[1:3] <- list(0, 0))

    #> Vector of length 2 cannot be
    #> recycled to
    #> length 3. Only vectors of length one
    #> or
    #> of the same length can be recycled.

</td>
</tr>
</tbody>
</table>
Definition of `x[j] <- a`.
--------------------------

`x[j] <- a` is equivalent to `x[j] <- list(a)` if `is_atomic(a)` or
`is_null(a)`.

<table class="dftbl">
<tbody>
<tr style="vertical-align:top">
<td>
</td>
<td>
    with_tbl(tbl[1] <- 0)
    #> # A tibble: 4 x 3
    #>       n c     li       
    #>   <dbl> <chr> <list>   
    #> 1     0 e     <dbl [1]>
    #> 2     0 f     <int [2]>
    #> 3     0 g     <int [3]>
    #> 4     0 h     <chr [1]>

</td>
</tr>
<tr style="vertical-align:top">
<td>
</td>
<td>
    with_tbl(tbl[1] <- list(0))
    #> # A tibble: 4 x 3
    #>       n c     li       
    #>   <dbl> <chr> <list>   
    #> 1     0 e     <dbl [1]>
    #> 2     0 f     <int [2]>
    #> 3     0 g     <int [3]>
    #> 4     0 h     <chr [1]>

</td>
</tr>
<tr style="vertical-align:top">
<td>
</td>
<td>
    with_tbl(tbl[1] <- 4:1)
    #> # A tibble: 4 x 3
    #>       n c     li       
    #>   <int> <chr> <list>   
    #> 1     4 e     <dbl [1]>
    #> 2     3 f     <int [2]>
    #> 3     2 g     <int [3]>
    #> 4     1 h     <chr [1]>

</td>
</tr>
<tr style="vertical-align:top">
<td>
</td>
<td>
    with_tbl(tbl[1] <- list(4:1))
    #> # A tibble: 4 x 3
    #>       n c     li       
    #>   <int> <chr> <list>   
    #> 1     4 e     <dbl [1]>
    #> 2     3 f     <int [2]>
    #> 3     2 g     <int [3]>
    #> 4     1 h     <chr [1]>

</td>
</tr>
<tr style="vertical-align:top">
<td>
</td>
<td>
    with_tbl(tbl[1] <- NULL)
    #> # A tibble: 4 x 2
    #>   c     li       
    #>   <chr> <list>   
    #> 1 e     <dbl [1]>
    #> 2 f     <int [2]>
    #> 3 g     <int [3]>
    #> 4 h     <chr [1]>

</td>
</tr>
<tr style="vertical-align:top">
<td>
</td>
<td>
    with_tbl(tbl[1] <- list(NULL))
    #> # A tibble: 4 x 2
    #>   c     li       
    #>   <chr> <list>   
    #> 1 e     <dbl [1]>
    #> 2 f     <int [2]>
    #> 3 g     <int [3]>
    #> 4 h     <chr [1]>

</td>
</tr>
</tbody>
</table>
Rows
====

Definition of `x[i, ]`.
-----------------------

Applies `vec_slice(, i)` to all columns, for both subsetting and
subassignment.

<table class="dftbl">
<tbody>
<tr style="vertical-align:top">
<td>
</td>
<td>
    tbl[2:3, ]
    #> # A tibble: 2 x 3
    #>       n c     li       
    #>   <int> <chr> <list>   
    #> 1     2 f     <int [2]>
    #> 2     3 g     <int [3]>

</td>
</tr>
<tr style="vertical-align:top">
<td>
</td>
<td>
    tbl[0:2, ]
    #> # A tibble: 2 x 3
    #>       n c     li       
    #>   <int> <chr> <list>   
    #> 1     1 e     <dbl [1]>
    #> 2     2 f     <int [2]>

</td>
</tr>
<tr style="vertical-align:top">
<td>
</td>
<td>
    tbl[0, ]
    #> # A tibble: 0 x 3
    #> # … with 3 variables: n <int>, c <chr>,
    #> #   li <list>

</td>
</tr>
<tr style="vertical-align:top">
<td>
</td>
<td>
    tbl[-2, ]
    #> # A tibble: 3 x 3
    #>       n c     li       
    #>   <int> <chr> <list>   
    #> 1     1 e     <dbl [1]>
    #> 2     3 g     <int [3]>
    #> 3     4 h     <chr [1]>

</td>
</tr>
<tr style="vertical-align:top">
<td>
    df[-1:2, ]

    #> Error in xj[i]: only 0's may be
    #> mixed with negative subscripts

</td>
<td>
    tbl[-1:2, ]

    #> Error: Can't subset with a mix of
    #> negative and positive indices

</td>
</tr>
<tr style="vertical-align:top">
<td>
</td>
<td>
    tbl[NA_integer_, ]
    #> # A tibble: 1 x 3
    #>       n c     li    
    #>   <int> <chr> <list>
    #> 1    NA <NA>  <NULL>

</td>
</tr>
<tr style="vertical-align:top">
<td>
</td>
<td>
    tbl2[NA_integer_, ]
    #> # A tibble: 1 x 2
    #>    tb$n $c    $li    m[,1]  [,2]  [,3]
    #>   <int> <chr> <list> <dbl> <dbl> <dbl>
    #> 1    NA <NA>  <NULL>    NA    NA    NA
    #> # … with 1 more variable: [,4] <dbl>

</td>
</tr>
<tr style="vertical-align:top">
<td>
</td>
<td>
    tbl[c(FALSE, TRUE, TRUE, FALSE), ]
    #> # A tibble: 2 x 3
    #>       n c     li       
    #>   <int> <chr> <list>   
    #> 1     2 f     <int [2]>
    #> 2     3 g     <int [3]>

</td>
</tr>
<tr style="vertical-align:top">
<td>
</td>
<td>
    tbl[TRUE, ]
    #> # A tibble: 4 x 3
    #>       n c     li       
    #>   <int> <chr> <list>   
    #> 1     1 e     <dbl [1]>
    #> 2     2 f     <int [2]>
    #> 3     3 g     <int [3]>
    #> 4     4 h     <chr [1]>

</td>
</tr>
<tr style="vertical-align:top">
<td>
</td>
<td>
    tbl[FALSE, ]
    #> # A tibble: 0 x 3
    #> # … with 3 variables: n <int>, c <chr>,
    #> #   li <list>

</td>
</tr>
<tr style="vertical-align:top">
<td>
</td>
<td>
    tbl[NA, ]
    #> # A tibble: 4 x 3
    #>       n c     li    
    #>   <int> <chr> <list>
    #> 1    NA <NA>  <NULL>
    #> 2    NA <NA>  <NULL>
    #> 3    NA <NA>  <NULL>
    #> 4    NA <NA>  <NULL>

</td>
</tr>
<tr style="vertical-align:top">
<td>
    with_df(df[2:3, ] <- df[1, ])
    #>   n c   li
    #> 1 1 e    9
    #> 2 1 e    9
    #> 3 1 e    9
    #> 4 4 h text

</td>
<td>
    with_tbl(tbl[2:3, ] <- tbl[1, ])

    #> Vector of length 3 cannot be
    #> recycled to
    #> length 2. Only vectors of length one
    #> or
    #> of the same length can be recycled.

</td>
</tr>
<tr style="vertical-align:top">
<td>
    with_df(df[0:2, ] <- df[1, ])
    #>   n c         li
    #> 1 1 e          9
    #> 2 1 e          9
    #> 3 3 g 12, 13, 14
    #> 4 4 h       text

</td>
<td>
    with_tbl(tbl[0:2, ] <- tbl[1, ])

    #> Vector of length 3 cannot be
    #> recycled to
    #> length 2. Only vectors of length one
    #> or
    #> of the same length can be recycled.

</td>
</tr>
<tr style="vertical-align:top">
<td>
    with_df(df[0, ] <- df[1, ])
    #>   n c         li
    #> 1 1 e          9
    #> 2 2 f     10, 11
    #> 3 3 g 12, 13, 14
    #> 4 4 h       text

</td>
<td>
    with_tbl(tbl[0, ] <- tbl[1, ])

    #> Vector of length 3 cannot be
    #> recycled to
    #> length 0. Only vectors of length one
    #> or
    #> of the same length can be recycled.

</td>
</tr>
<tr style="vertical-align:top">
<td>
</td>
<td>
    with_tbl(tbl[-2, ] <- tbl[1, ])
    #> # A tibble: 4 x 3
    #>       n c     li       
    #>   <int> <chr> <list>   
    #> 1     1 e     <dbl [1]>
    #> 2     2 f     <int [2]>
    #> 3     1 e     <dbl [1]>
    #> 4     1 e     <dbl [1]>

</td>
</tr>
<tr style="vertical-align:top">
<td>
    with_df(df[-1:2, ] <- df[1, ])

    #> Error in seq_len(nrows)[i]: only 0's
    #> may be mixed with negative
    #> subscripts

</td>
<td>
    with_tbl(tbl[-1:2, ] <- tbl[1, ])

    #> Error: Can't subset with a mix of
    #> negative and positive indices

</td>
</tr>
<tr style="vertical-align:top">
<td>
    with_df(df[NA_integer_, ] <- df[1, ])

    #> Error in `[<-.data.frame`(`*tmp*`,
    #> NA_integer_, , value =
    #> structure(list(: missing values are
    #> not allowed in subscripted
    #> assignments of data frames

</td>
<td>
    with_tbl(tbl[NA_integer_, ] <- tbl[1, ])

    #> Error in if (new_nrow != nrow) {:
    #> missing value where TRUE/FALSE
    #> needed

</td>
</tr>
<tr style="vertical-align:top">
<td>
    with_df2(df2[NA_integer_, ] <- df2[1, ])

    #> Error in `[<-.data.frame`(`*tmp*`,
    #> NA_integer_, , value =
    #> structure(list(: missing values are
    #> not allowed in subscripted
    #> assignments of data frames

</td>
<td>
    with_tbl2(tbl2[NA_integer_, ] <- tbl2[1, ])

    #> Error in if (new_nrow != nrow) {:
    #> missing value where TRUE/FALSE
    #> needed

</td>
</tr>
<tr style="vertical-align:top">
<td>
    with_df(df[c(FALSE, TRUE, TRUE, FALSE), ] <- df[1, ])
    #>   n c   li
    #> 1 1 e    9
    #> 2 1 e    9
    #> 3 1 e    9
    #> 4 4 h text

</td>
<td>
    with_tbl(tbl[c(FALSE, TRUE, TRUE, FALSE), ] <- tbl[1, ])

    #> Vector of length 3 cannot be
    #> recycled to
    #> length 2. Only vectors of length one
    #> or
    #> of the same length can be recycled.

</td>
</tr>
<tr style="vertical-align:top">
<td>
    with_df(df[TRUE, ] <- df[1, ])
    #>   n c li
    #> 1 1 e  9
    #> 2 1 e  9
    #> 3 1 e  9
    #> 4 1 e  9

</td>
<td>
    with_tbl(tbl[TRUE, ] <- tbl[1, ])

    #> Vector of length 3 cannot be
    #> recycled to
    #> length 4. Only vectors of length one
    #> or
    #> of the same length can be recycled.

</td>
</tr>
<tr style="vertical-align:top">
<td>
    with_df(df[FALSE, ] <- df[1, ])
    #>   n c         li
    #> 1 1 e          9
    #> 2 2 f     10, 11
    #> 3 3 g 12, 13, 14
    #> 4 4 h       text

</td>
<td>
    with_tbl(tbl[FALSE, ] <- tbl[1, ])

    #> Vector of length 3 cannot be
    #> recycled to
    #> length 0. Only vectors of length one
    #> or
    #> of the same length can be recycled.

</td>
</tr>
<tr style="vertical-align:top">
<td>
    with_df(df[NA, ] <- df[1, ])

    #> Error in `[<-.data.frame`(`*tmp*`,
    #> NA, , value = structure(list(n = 1L,
    #> : missing values are not allowed in
    #> subscripted assignments of data
    #> frames

</td>
<td>
    with_tbl(tbl[NA, ] <- tbl[1, ])

    #> Error in if (new_nrow != nrow) {:
    #> missing value where TRUE/FALSE
    #> needed

</td>
</tr>
</tbody>
</table>
### Corollary

For logical vectors, out-of-bounds indexing and recycling of size &gt; 1
are not supported. (Character and numeric vectors are exceptions that
are discussed below.)

<table class="dftbl">
<tbody>
<tr style="vertical-align:top">
<td>
    df[c(TRUE, FALSE), ]
    #>   n c         li
    #> 1 1 e          9
    #> 3 3 g 12, 13, 14

</td>
<td>
    tbl[c(TRUE, FALSE), ]

    #> Warning: Length of logical index must be
    #> 1 or 4, not 2

    #> # A tibble: 2 x 3
    #>       n c     li       
    #>   <int> <chr> <list>   
    #> 1     1 e     <dbl [1]>
    #> 2     3 g     <int [3]>

</td>
</tr>
<tr style="vertical-align:top">
<td>
    df[c(TRUE, FALSE, TRUE, FALSE, TRUE), ]
    #>     n    c         li
    #> 1   1    e          9
    #> 3   3    g 12, 13, 14
    #> NA NA <NA>       NULL

</td>
<td>
    tbl[c(TRUE, FALSE, TRUE, FALSE, TRUE), ]

    #> Warning: Length of logical index must be
    #> 1 or 4, not 5

    #> # A tibble: 3 x 3
    #>       n c     li       
    #>   <int> <chr> <list>   
    #> 1     1 e     <dbl [1]>
    #> 2     3 g     <int [3]>
    #> 3    NA <NA>  <NULL>

</td>
</tr>
<tr style="vertical-align:top">
<td>
    with_df(df[c(TRUE, FALSE), ] <- df[1, ])
    #>   n c     li
    #> 1 1 e      9
    #> 2 2 f 10, 11
    #> 3 1 e      9
    #> 4 4 h   text

</td>
<td>
    with_tbl(tbl[c(TRUE, FALSE), ] <- tbl[1, ])

    #> Error: Logical indices must have
    #> length 1 or be as long as the
    #> indexed vector.
    #> The vector has size 4 whereas the
    #> index has size 2.

</td>
</tr>
<tr style="vertical-align:top">
<td>
    with_df(df[c(TRUE, FALSE, TRUE, FALSE, TRUE), ] <- df[1, ])

    #> Error in `[<-.data.frame`(`*tmp*`,
    #> c(TRUE, FALSE, TRUE, FALSE, TRUE), :
    #> non-existent rows not allowed

</td>
<td>
    with_tbl(tbl[c(TRUE, FALSE, TRUE, FALSE, TRUE), ] <- tbl[1, ])

    #> Error: Logical indices must have
    #> length 1 or be as long as the
    #> indexed vector.
    #> The vector has size 4 whereas the
    #> index has size 5.

</td>
</tr>
</tbody>
</table>
### Subassignment corollary

Only values of size one can be recycled.

<table class="dftbl">
<tbody>
<tr style="vertical-align:top">
<td>
    with_df(df[2:3, ] <- df[1, ])
    #>   n c   li
    #> 1 1 e    9
    #> 2 1 e    9
    #> 3 1 e    9
    #> 4 4 h text

</td>
<td>
    with_tbl(tbl[2:3, ] <- tbl[1, ])

    #> Vector of length 3 cannot be
    #> recycled to
    #> length 2. Only vectors of length one
    #> or
    #> of the same length can be recycled.

</td>
</tr>
<tr style="vertical-align:top">
<td>
    with_df(df[2:3, ] <- df[1:2, ])
    #>   n c     li
    #> 1 1 e      9
    #> 2 1 e      9
    #> 3 2 f 10, 11
    #> 4 4 h   text

</td>
<td>
    with_tbl(tbl[2:3, ] <- tbl[1:2, ])

    #> Vector of length 2 cannot be
    #> recycled to
    #> length 3. Only vectors of length one
    #> or
    #> of the same length can be recycled.

</td>
</tr>
<tr style="vertical-align:top">
<td>
    with_df(df[2:4, ] <- df[1:2, ])

    #> Error in `[<-.data.frame`(`*tmp*`,
    #> 2:4, , value = structure(list(n =
    #> 1:2, : replacement element 1 has 2
    #> rows, need 3

</td>
<td>
    with_tbl(tbl[2:4, ] <- tbl[1:2, ])

    #> Vector of length 2 cannot be
    #> recycled to
    #> length 3. Only vectors of length one
    #> or
    #> of the same length can be recycled.

</td>
</tr>
<tr style="vertical-align:top">
<td>
    with_df2(df2[2:4, ] <- df2[1, ])

    #> Error in `[<-.data.frame`(`*tmp*`,
    #> 2:4, , value = structure(list(tb =
    #> structure(list(: replacement element
    #> 1 is a matrix/data frame of 1 row,
    #> need 3

</td>
<td>
    with_tbl2(tbl2[2:4, ] <- tbl2[1, ])

    #> Vector of length 2 cannot be
    #> recycled to
    #> length 3. Only vectors of length one
    #> or
    #> of the same length can be recycled.

</td>
</tr>
<tr style="vertical-align:top">
<td>
    with_df2(df2[2:4, ] <- df2[2:3, ])

    #> Error in `[<-.data.frame`(`*tmp*`,
    #> 2:4, , value = structure(list(tb =
    #> structure(list(: replacement element
    #> 1 is a matrix/data frame of 2 rows,
    #> need 3

</td>
<td>
    with_tbl2(tbl2[2:4, ] <- tbl2[2:3, ])

    #> Vector of length 2 cannot be
    #> recycled to
    #> length 3. Only vectors of length one
    #> or
    #> of the same length can be recycled.

</td>
</tr>
</tbody>
</table>
### Exception

For compatibility reasons only a warning is issued for indexing beyond
the number of rows. Appending rows right at the end of the existing data
is supported, without warning.

<table class="dftbl">
<tbody>
<tr style="vertical-align:top">
<td>
    df[5, ]
    #>     n    c   li
    #> NA NA <NA> NULL

</td>
<td>
    tbl[5, ]

    #> Warning: Row indexes must be between 0
    #> and the number of rows (4). Use `NA` as
    #> row index to obtain a row full of `NA`
    #> values.

    #> # A tibble: 1 x 3
    #>       n c     li    
    #>   <int> <chr> <list>
    #> 1    NA <NA>  <NULL>

</td>
</tr>
<tr style="vertical-align:top">
<td>
    df[5:7, ]
    #>       n    c   li
    #> NA   NA <NA> NULL
    #> NA.1 NA <NA> NULL
    #> NA.2 NA <NA> NULL

</td>
<td>
    tbl[5:7, ]

    #> Warning: Row indexes must be between 0
    #> and the number of rows (4). Use `NA` as
    #> row index to obtain a row full of `NA`
    #> values.

    #> # A tibble: 3 x 3
    #>       n c     li    
    #>   <int> <chr> <list>
    #> 1    NA <NA>  <NULL>
    #> 2    NA <NA>  <NULL>
    #> 3    NA <NA>  <NULL>

</td>
</tr>
<tr style="vertical-align:top">
<td>
    df[6, ]
    #>     n    c   li
    #> NA NA <NA> NULL

</td>
<td>
    tbl[6, ]

    #> Warning: Row indexes must be between 0
    #> and the number of rows (4). Use `NA` as
    #> row index to obtain a row full of `NA`
    #> values.

    #> # A tibble: 1 x 3
    #>       n c     li    
    #>   <int> <chr> <list>
    #> 1    NA <NA>  <NULL>

</td>
</tr>
<tr style="vertical-align:top">
<td>
    with_df(df[5, ] <- df[1, ])
    #>   n c         li
    #> 1 1 e          9
    #> 2 2 f     10, 11
    #> 3 3 g 12, 13, 14
    #> 4 4 h       text
    #> 5 1 e          9

</td>
<td>
    with_tbl(tbl[5, ] <- tbl[1, ])

    #> Vector of length 3 cannot be
    #> recycled to
    #> length 1. Only vectors of length one
    #> or
    #> of the same length can be recycled.

</td>
</tr>
<tr style="vertical-align:top">
<td>
</td>
<td>
    with_tbl(tbl[5:7, ] <- tbl[1, ])
    #> # A tibble: 7 x 3
    #>       n c     li       
    #>   <int> <chr> <list>   
    #> 1     1 e     <dbl [1]>
    #> 2     2 f     <int [2]>
    #> 3     3 g     <int [3]>
    #> 4     4 h     <chr [1]>
    #> 5     1 e     <dbl [1]>
    #> 6     1 e     <dbl [1]>
    #> 7     1 e     <dbl [1]>

</td>
</tr>
<tr style="vertical-align:top">
<td>
    with_df(df[6, ] <- df[1, ])
    #>    n    c         li
    #> 1  1    e          9
    #> 2  2    f     10, 11
    #> 3  3    g 12, 13, 14
    #> 4  4    h       text
    #> 5 NA <NA>       NULL
    #> 6  1    e          9

</td>
<td>
    with_tbl(tbl[6, ] <- tbl[1, ])

    #> Error in
    #> error_new_rows_at_end_only(): could
    #> not find function
    #> "error_new_rows_at_end_only"

</td>
</tr>
<tr style="vertical-align:top">
<td>
    df[-5, ]
    #>   n c         li
    #> 1 1 e          9
    #> 2 2 f     10, 11
    #> 3 3 g 12, 13, 14
    #> 4 4 h       text

</td>
<td>
    tbl[-5, ]

    #> Warning: Negative row indexes must be
    #> between 0 and the number of rows negated
    #> (-4). Use `NA` as row index to obtain a
    #> row full of `NA` values.

    #> # A tibble: 4 x 3
    #>       n c     li       
    #>   <int> <chr> <list>   
    #> 1     1 e     <dbl [1]>
    #> 2     2 f     <int [2]>
    #> 3     3 g     <int [3]>
    #> 4     4 h     <chr [1]>

</td>
</tr>
<tr style="vertical-align:top">
<td>
    df[-(5:7), ]
    #>   n c         li
    #> 1 1 e          9
    #> 2 2 f     10, 11
    #> 3 3 g 12, 13, 14
    #> 4 4 h       text

</td>
<td>
    tbl[-(5:7), ]

    #> Warning: Negative row indexes must be
    #> between 0 and the number of rows negated
    #> (-4). Use `NA` as row index to obtain a
    #> row full of `NA` values.

    #> # A tibble: 4 x 3
    #>       n c     li       
    #>   <int> <chr> <list>   
    #> 1     1 e     <dbl [1]>
    #> 2     2 f     <int [2]>
    #> 3     3 g     <int [3]>
    #> 4     4 h     <chr [1]>

</td>
</tr>
<tr style="vertical-align:top">
<td>
    df[-6, ]
    #>   n c         li
    #> 1 1 e          9
    #> 2 2 f     10, 11
    #> 3 3 g 12, 13, 14
    #> 4 4 h       text

</td>
<td>
    tbl[-6, ]

    #> Warning: Negative row indexes must be
    #> between 0 and the number of rows negated
    #> (-4). Use `NA` as row index to obtain a
    #> row full of `NA` values.

    #> # A tibble: 4 x 3
    #>       n c     li       
    #>   <int> <chr> <list>   
    #> 1     1 e     <dbl [1]>
    #> 2     2 f     <int [2]>
    #> 3     3 g     <int [3]>
    #> 4     4 h     <chr [1]>

</td>
</tr>
<tr style="vertical-align:top">
<td>
    with_df(df[-5, ] <- df[1, ])
    #>   n c li
    #> 1 1 e  9
    #> 2 1 e  9
    #> 3 1 e  9
    #> 4 1 e  9

</td>
<td>
    with_tbl(tbl[-5, ] <- tbl[1, ])

    #> Error: Can't index beyond the end of
    #> a vector.
    #> The vector has length 4 and you've
    #> tried to subset element 5.

</td>
</tr>
<tr style="vertical-align:top">
<td>
    with_df(df[-(5:7), ] <- df[1, ])
    #>   n c li
    #> 1 1 e  9
    #> 2 1 e  9
    #> 3 1 e  9
    #> 4 1 e  9

</td>
<td>
    with_tbl(tbl[-(5:7), ] <- tbl[1, ])

    #> Error: Can't index beyond the end of
    #> a vector.
    #> The vector has length 4 and you've
    #> tried to subset element 5.

</td>
</tr>
<tr style="vertical-align:top">
<td>
    with_df(df[-6, ] <- df[1, ])
    #>   n c li
    #> 1 1 e  9
    #> 2 1 e  9
    #> 3 1 e  9
    #> 4 1 e  9

</td>
<td>
    with_tbl(tbl[-6, ] <- tbl[1, ])

    #> Error: Can't index beyond the end of
    #> a vector.
    #> The vector has length 4 and you've
    #> tried to subset element 6.

</td>
</tr>
</tbody>
</table>
For compatibility reasons, character vectors that represent numbers are
supported.

<table class="dftbl">
<tbody>
<tr style="vertical-align:top">
<td>
</td>
<td>
    tbl[as.character(1:3), ]
    #> # A tibble: 3 x 3
    #>       n c     li       
    #>   <int> <chr> <list>   
    #> 1     1 e     <dbl [1]>
    #> 2     2 f     <int [2]>
    #> 3     3 g     <int [3]>

</td>
</tr>
<tr style="vertical-align:top">
<td>
    df[as.character(-(1:3)), ]
    #>       n    c   li
    #> NA   NA <NA> NULL
    #> NA.1 NA <NA> NULL
    #> NA.2 NA <NA> NULL

</td>
<td>
    tbl[as.character(-(1:3)), ]
    #> # A tibble: 1 x 3
    #>       n c     li       
    #>   <int> <chr> <list>   
    #> 1     4 h     <chr [1]>

</td>
</tr>
<tr style="vertical-align:top">
<td>
    df[as.character(3:5), ]
    #>     n    c         li
    #> 3   3    g 12, 13, 14
    #> 4   4    h       text
    #> NA NA <NA>       NULL

</td>
<td>
    tbl[as.character(3:5), ]

    #> Warning: Only valid row names can be
    #> used for indexing. Use `NA` as row index
    #> to obtain a row full of `NA` values.

    #> # A tibble: 3 x 3
    #>       n c     li       
    #>   <int> <chr> <list>   
    #> 1     3 g     <int [3]>
    #> 2     4 h     <chr [1]>
    #> 3    NA <NA>  <NULL>

</td>
</tr>
<tr style="vertical-align:top">
<td>
    df[as.character(-(3:5)), ]
    #>       n    c   li
    #> NA   NA <NA> NULL
    #> NA.1 NA <NA> NULL
    #> NA.2 NA <NA> NULL

</td>
<td>
    tbl[as.character(-(3:5)), ]

    #> Warning in is.na(i) & !is_na_orig:
    #> longer object length is not a multiple
    #> of shorter object length

    #> # A tibble: 2 x 3
    #>       n c     li       
    #>   <int> <chr> <list>   
    #> 1     1 e     <dbl [1]>
    #> 2     2 f     <int [2]>

</td>
</tr>
<tr style="vertical-align:top">
<td>
</td>
<td>
    tbl[NA_character_, ]
    #> # A tibble: 1 x 3
    #>       n c     li    
    #>   <int> <chr> <list>
    #> 1    NA <NA>  <NULL>

</td>
</tr>
<tr style="vertical-align:top">
<td>
</td>
<td>
    with_tbl(tbl[as.character(1:3), ] <- tbl[1, ])
    #> # A tibble: 4 x 3
    #>       n c     li       
    #>   <int> <chr> <list>   
    #> 1     1 e     <dbl [1]>
    #> 2     1 e     <dbl [1]>
    #> 3     1 e     <dbl [1]>
    #> 4     4 h     <chr [1]>

</td>
</tr>
<tr style="vertical-align:top">
<td>
    with_df(df[as.character(-(1:3)), ] <- df[1, ])
    #>    n c         li
    #> 1  1 e          9
    #> 2  2 f     10, 11
    #> 3  3 g 12, 13, 14
    #> 4  4 h       text
    #> -1 1 e          9
    #> -2 1 e          9
    #> -3 1 e          9

</td>
<td>
    with_tbl(tbl[as.character(-(1:3)), ] <- tbl[1, ])

    #> Vector of length 3 cannot be
    #> recycled to
    #> length 1. Only vectors of length one
    #> or
    #> of the same length can be recycled.

</td>
</tr>
<tr style="vertical-align:top">
<td>
    with_df(df[as.character(3:5), ] <- df[1, ])
    #>   n c     li
    #> 1 1 e      9
    #> 2 2 f 10, 11
    #> 3 1 e      9
    #> 4 1 e      9
    #> 5 1 e      9

</td>
<td>
    with_tbl(tbl[as.character(3:5), ] <- tbl[1, ])

    #> Warning: Only valid row names can be
    #> used for indexing. Use `NA` as row index
    #> to obtain a row full of `NA` values.

    #> Error in if (new_nrow != nrow) {:
    #> missing value where TRUE/FALSE
    #> needed

</td>
</tr>
<tr style="vertical-align:top">
<td>
    with_df(df[as.character(-(3:5)), ] <- df[1, ])
    #>    n c         li
    #> 1  1 e          9
    #> 2  2 f     10, 11
    #> 3  3 g 12, 13, 14
    #> 4  4 h       text
    #> -3 1 e          9
    #> -4 1 e          9
    #> -5 1 e          9

</td>
<td>
    with_tbl(tbl[as.character(-(3:5)), ] <- tbl[1, ])

    #> Warning in is.na(i) & !is_na_orig:
    #> longer object length is not a multiple
    #> of shorter object length

    #> Vector of length 3 cannot be
    #> recycled to
    #> length 2. Only vectors of length one
    #> or
    #> of the same length can be recycled.

</td>
</tr>
<tr style="vertical-align:top">
<td>
    with_df(df[NA_character_, ] <- df[1, ])

    #> Error in `[<-.data.frame`(`*tmp*`,
    #> NA_character_, , value =
    #> structure(list(: missing values are
    #> not allowed in subscripted
    #> assignments of data frames

</td>
<td>
    with_tbl(tbl[NA_character_, ] <- tbl[1, ])

    #> Error in if (new_nrow != nrow) {:
    #> missing value where TRUE/FALSE
    #> needed

</td>
</tr>
</tbody>
</table>
Definition of `x[i, j]`.
------------------------

`x[i, j]` is equivalent to `x[j][i, ]`.

<table class="dftbl">
<tbody>
<tr style="vertical-align:top">
<td>
    df[1, 1]
    #> [1] 1

</td>
<td>
    tbl[1, 1]
    #> # A tibble: 1 x 1
    #>       n
    #>   <int>
    #> 1     1

</td>
</tr>
<tr style="vertical-align:top">
<td>
    df[1][1, ]
    #> [1] 1

</td>
<td>
    tbl[1][1, ]
    #> # A tibble: 1 x 1
    #>       n
    #>   <int>
    #> 1     1

</td>
</tr>
<tr style="vertical-align:top">
<td>
</td>
<td>
    tbl[1, 2:3]
    #> # A tibble: 1 x 2
    #>   c     li       
    #>   <chr> <list>   
    #> 1 e     <dbl [1]>

</td>
</tr>
<tr style="vertical-align:top">
<td>
</td>
<td>
    tbl[2:3][1, ]
    #> # A tibble: 1 x 2
    #>   c     li       
    #>   <chr> <list>   
    #> 1 e     <dbl [1]>

</td>
</tr>
<tr style="vertical-align:top">
<td>
    df[2:3, 1]
    #> [1] 2 3

</td>
<td>
    tbl[2:3, 1]
    #> # A tibble: 2 x 1
    #>       n
    #>   <int>
    #> 1     2
    #> 2     3

</td>
</tr>
<tr style="vertical-align:top">
<td>
    df[1][2:3, ]
    #> [1] 2 3

</td>
<td>
    tbl[1][2:3, ]
    #> # A tibble: 2 x 1
    #>       n
    #>   <int>
    #> 1     2
    #> 2     3

</td>
</tr>
<tr style="vertical-align:top">
<td>
</td>
<td>
    tbl2[2:3, 1:2]
    #> # A tibble: 2 x 2
    #>    tb$n $c    $li      m[,1]  [,2]  [,3]
    #>   <int> <chr> <list>   <dbl> <dbl> <dbl>
    #> 1     2 f     <int [2…     0     1     0
    #> 2     3 g     <int [3…     0     0     1
    #> # … with 1 more variable: [,4] <dbl>

</td>
</tr>
<tr style="vertical-align:top">
<td>
</td>
<td>
    tbl2[1:2][2:3, ]
    #> # A tibble: 2 x 2
    #>    tb$n $c    $li      m[,1]  [,2]  [,3]
    #>   <int> <chr> <list>   <dbl> <dbl> <dbl>
    #> 1     2 f     <int [2…     0     1     0
    #> 2     3 g     <int [3…     0     0     1
    #> # … with 1 more variable: [,4] <dbl>

</td>
</tr>
</tbody>
</table>
### Corollaries

`x[i, j] <-` can update only existing columns, it cannot create or
remove columns.

<table class="dftbl">
<tbody>
<tr style="vertical-align:top">
<td>
    with_df(df[2:3, "n"] <- 1)
    #>   n c         li
    #> 1 1 e          9
    #> 2 1 f     10, 11
    #> 3 1 g 12, 13, 14
    #> 4 4 h       text

</td>
<td>
    with_tbl(tbl[2:3, "n"] <- 1)
    #> # A tibble: 4 x 3
    #>       n c     li       
    #>   <int> <chr> <list>   
    #> 1     1 e     <dbl [1]>
    #> 2     1 f     <int [2]>
    #> 3     1 g     <int [3]>
    #> 4     4 h     <chr [1]>

</td>
</tr>
<tr style="vertical-align:top">
<td>
    with_df(df[2:3, "x"] <- 1)
    #>   n c         li  x
    #> 1 1 e          9 NA
    #> 2 2 f     10, 11  1
    #> 3 3 g 12, 13, 14  1
    #> 4 4 h       text NA

</td>
<td>
    with_tbl(tbl[2:3, "x"] <- 1)

    #> Error: Can't index non-existing
    #> elements.

</td>
</tr>
<tr style="vertical-align:top">
<td>
    with_df(df[2:3, "n"] <- NULL)

    #> Error in x[[jj]][iseq] <- vjj:
    #> replacement has length zero

</td>
<td>
    with_tbl(tbl[2:3, "n"] <- NULL)

    #> `value` must be a vector, not NULL

</td>
</tr>
</tbody>
</table>
`x[i, j] <-` can’t change the data type of existing columns.

<table class="dftbl">
<tbody>
<tr style="vertical-align:top">
<td>
    with_df(df[2:3, 1] <- df[1:2, 2])
    #>   n c         li
    #> 1 1 e          9
    #> 2 e f     10, 11
    #> 3 f g 12, 13, 14
    #> 4 4 h       text

</td>
<td>
    with_tbl(tbl[2:3, 1] <- tbl[1:2, 2])

    #> No common type for `value`
    #> <character>
    #> and `x` <integer>.

</td>
</tr>
<tr style="vertical-align:top">
<td>
    with_df(df[2:3, 2] <- df[1:2, 3])

    #> Warning in `[<-.data.frame`(`*tmp*`,
    #> 2:3, 2, value = list(9, 10:11)):
    #> provided 2 variables to replace 1
    #> variables

    #>   n c         li
    #> 1 1 e          9
    #> 2 2 9     10, 11
    #> 3 3 9 12, 13, 14
    #> 4 4 h       text

</td>
<td>
    with_tbl(tbl[2:3, 2] <- tbl[1:2, 3])

    #> No common type for `value` <list>
    #> and
    #> `x` <character>.

</td>
</tr>
<tr style="vertical-align:top">
<td>
    with_df(df[2:3, 3] <- df2[1:2, 1])

    #> Warning in `[<-.data.frame`(`*tmp*`,
    #> 2:3, 3, value = structure(list(n =
    #> 1:2, : provided 3 variables to replace 1
    #> variables

    #>   n c   li
    #> 1 1 e    9
    #> 2 2 f    1
    #> 3 3 g    2
    #> 4 4 h text

</td>
<td>
    with_tbl(tbl[2:3, 3] <- tbl2[1:2, 1])

    #> No common type for `x` <tbl_df<
    #> n : integer
    #> c : character
    #> li: list
    #> >> and `y` <list>.

</td>
</tr>
<tr style="vertical-align:top">
<td>
    with_df2(df2[2:3, 1] <- df2[1:2, 2])

    #> Warning in matrix(value, n, p): data
    #> length [8] is not a sub-multiple or
    #> multiple of the number of columns [3]

    #>   tb.n tb.c tb.li m.1 m.2 m.3 m.4
    #> 1    1    e     9   1   0   0   0
    #> 2    1    0     0   0   1   0   0
    #> 3    0    1     0   0   0   1   0
    #> 4    4    h  text   0   0   0   1

</td>
<td>
    with_tbl2(tbl2[2:3, 1] <- tbl2[1:2, 2])

    #> No common type for `value`
    #> <double[,4]> and `x` <tbl_df<
    #> n : integer
    #> c : character
    #> li: list
    #> >>.

</td>
</tr>
<tr style="vertical-align:top">
<td>
</td>
<td>
    with_tbl2(tbl2[2:3, 2] <- tbl[1:2, 1])
    #> # A tibble: 4 x 2
    #>    tb$n $c    $li      m[,1]  [,2]  [,3]
    #>   <int> <chr> <list>   <dbl> <dbl> <dbl>
    #> 1     1 e     <dbl [1…     1     0     0
    #> 2     2 f     <int [2…     1     1     1
    #> 3     3 g     <int [3…     2     2     2
    #> 4     4 h     <chr [1…     0     0     0
    #> # … with 1 more variable: [,4] <dbl>

</td>
</tr>
</tbody>
</table>
`x[i, j] <-` can’t append rows.

<table class="dftbl">
<tbody>
<tr style="vertical-align:top">
<td>
    with_df(df[5, "n"] <- list(0))
    #>   n    c         li
    #> 1 1    e          9
    #> 2 2    f     10, 11
    #> 3 3    g 12, 13, 14
    #> 4 4    h       text
    #> 5 0 <NA>       NULL

</td>
<td>
    with_tbl(tbl[5, "n"] <- list(0))

    #> Vector of length 5 cannot be
    #> recycled to
    #> length 4. Only vectors of length one
    #> or
    #> of the same length can be recycled.

</td>
</tr>
</tbody>
</table>
Definition of `x[[i, j]]`.
--------------------------

`x[[i, j]]` is equivalent to `x[i, ][[j]]`.

<table class="dftbl">
<tbody>
<tr style="vertical-align:top">
<td>
</td>
<td>
    tbl[[1, 1]]
    #> [1] 1

</td>
</tr>
<tr style="vertical-align:top">
<td>
</td>
<td>
    tbl[1, ][[1]]
    #> [1] 1

</td>
</tr>
<tr style="vertical-align:top">
<td>
    df[[1, 3]]
    #> [1] 9

</td>
<td>
    tbl[[1, 3]]
    #> [[1]]
    #> [1] 9

</td>
</tr>
<tr style="vertical-align:top">
<td>
</td>
<td>
    tbl[1, ][[3]]
    #> [[1]]
    #> [1] 9

</td>
</tr>
<tr style="vertical-align:top">
<td>
    df2[[1, 1]]
    #> [1] 1 2 3 4

</td>
<td>
    tbl2[[1, 1]]
    #> # A tibble: 1 x 3
    #>       n c     li       
    #>   <int> <chr> <list>   
    #> 1     1 e     <dbl [1]>

</td>
</tr>
<tr style="vertical-align:top">
<td>
</td>
<td>
    tbl2[1, ][[1]]
    #> # A tibble: 1 x 3
    #>       n c     li       
    #>   <int> <chr> <list>   
    #> 1     1 e     <dbl [1]>

</td>
</tr>
<tr style="vertical-align:top">
<td>
    df2[[1, 2]]
    #> [1] 1

</td>
<td>
    tbl2[[1, 2]]
    #>      [,1] [,2] [,3] [,4]
    #> [1,]    1    0    0    0

</td>
</tr>
<tr style="vertical-align:top">
<td>
</td>
<td>
    tbl2[1, ][[2]]
    #>      [,1] [,2] [,3] [,4]
    #> [1,]    1    0    0    0

</td>
</tr>
<tr style="vertical-align:top">
<td>
    with_df(df[[1, 1]] <- 0)
    #>   n c         li
    #> 1 0 e          9
    #> 2 2 f     10, 11
    #> 3 3 g 12, 13, 14
    #> 4 4 h       text

</td>
<td>
    with_tbl(tbl[[1, 1]] <- 0)
    #> # A tibble: 4 x 3
    #>       n c     li       
    #>   <int> <chr> <list>   
    #> 1     0 e     <dbl [1]>
    #> 2     2 f     <int [2]>
    #> 3     3 g     <int [3]>
    #> 4     4 h     <chr [1]>

</td>
</tr>
<tr style="vertical-align:top">
<td>
    with_df(df[1, ][[1]] <- 0)
    #>   n c         li
    #> 1 0 e          9
    #> 2 2 f     10, 11
    #> 3 3 g 12, 13, 14
    #> 4 4 h       text

</td>
<td>
    with_tbl(tbl[1, ][[1]] <- 0)

    #> Vector of length 3 cannot be
    #> recycled to
    #> length 1. Only vectors of length one
    #> or
    #> of the same length can be recycled.

</td>
</tr>
<tr style="vertical-align:top">
<td>
    with_df(df[[1, 3]] <- list(NULL))
    #>   n c         li
    #> 1 1 e       NULL
    #> 2 2 f     10, 11
    #> 3 3 g 12, 13, 14
    #> 4 4 h       text

</td>
<td>
    with_tbl(tbl[[1, 3]] <- list(NULL))
    #> # A tibble: 4 x 3
    #>       n c     li       
    #>   <int> <chr> <list>   
    #> 1     1 e     <NULL>   
    #> 2     2 f     <int [2]>
    #> 3     3 g     <int [3]>
    #> 4     4 h     <chr [1]>

</td>
</tr>
<tr style="vertical-align:top">
<td>
    with_df(df[1, ][[3]] <- list(NULL))
    #>   n c         li
    #> 1 1 e       NULL
    #> 2 2 f     10, 11
    #> 3 3 g 12, 13, 14
    #> 4 4 h       text

</td>
<td>
    with_tbl(tbl[1, ][[3]] <- list(NULL))

    #> Vector of length 3 cannot be
    #> recycled to
    #> length 1. Only vectors of length one
    #> or
    #> of the same length can be recycled.

</td>
</tr>
<tr style="vertical-align:top">
<td>
    with_df2(df2[[1, 1]] <- df[1, ])

    #> Error in `[[<-.data.frame`(`*tmp*`,
    #> iseq, value = structure(list(n = 1L,
    #> : replacement has 1 row, data has 4

</td>
<td>
    with_tbl2(tbl2[[1, 1]] <- tbl[1, ])
    #> # A tibble: 4 x 2
    #>    tb$n $c    $li      m[,1]  [,2]  [,3]
    #>   <int> <chr> <list>   <dbl> <dbl> <dbl>
    #> 1     1 e     <dbl [1…     1     0     0
    #> 2     2 f     <int [2…     0     1     0
    #> 3     3 g     <int [3…     0     0     1
    #> 4     4 h     <chr [1…     0     0     0
    #> # … with 1 more variable: [,4] <dbl>

</td>
</tr>
<tr style="vertical-align:top">
<td>
    with_df2(df2[1, ][[1]] <- df[1, ])
    #>   tb.n tb.c      tb.li m.1 m.2 m.3 m.4
    #> 1    1    e          9   1   0   0   0
    #> 2    2    f     10, 11   0   1   0   0
    #> 3    3    g 12, 13, 14   0   0   1   0
    #> 4    4    h       text   0   0   0   1

</td>
<td>
    with_tbl2(tbl2[1, ][[1]] <- tbl[1, ])

    #> Vector of length 2 cannot be
    #> recycled to
    #> length 1. Only vectors of length one
    #> or
    #> of the same length can be recycled.

</td>
</tr>
<tr style="vertical-align:top">
<td>
    with_df2(df2[[1, 2]] <- t(1:4))

    #> Error in x[[jseq]][[iseq]] <- value:
    #> more elements supplied than there
    #> are to replace

</td>
<td>
    with_tbl2(tbl2[[1, 2]] <- t(1:4))
    #> # A tibble: 4 x 2
    #>    tb$n $c    $li      m[,1]  [,2]  [,3]
    #>   <int> <chr> <list>   <dbl> <dbl> <dbl>
    #> 1     1 e     <dbl [1…     1     2     3
    #> 2     2 f     <int [2…     0     1     0
    #> 3     3 g     <int [3…     0     0     1
    #> 4     4 h     <chr [1…     0     0     0
    #> # … with 1 more variable: [,4] <dbl>

</td>
</tr>
<tr style="vertical-align:top">
<td>
    with_df2(df2[1, ][[2]] <- t(1:4))
    #>   tb.n tb.c      tb.li m.1 m.2 m.3 m.4
    #> 1    1    e          9   1   2   3   4
    #> 2    2    f     10, 11   0   1   0   0
    #> 3    3    g 12, 13, 14   0   0   1   0
    #> 4    4    h       text   0   0   0   1

</td>
<td>
    with_tbl2(tbl2[1, ][[2]] <- t(1:4))

    #> Vector of length 2 cannot be
    #> recycled to
    #> length 1. Only vectors of length one
    #> or
    #> of the same length can be recycled.

</td>
</tr>
</tbody>
</table>
`vec_as_index(i)` must be scalar.

<table class="dftbl">
<tbody>
<tr style="vertical-align:top">
<td>
    df[[1:2, 1]]

    #> Error in col[[i, exact = exact]]:
    #> attempt to select more than one
    #> element in vectorIndex

</td>
<td>
    tbl[[1:2, 1]]

    #> Error in error_need_scalar(): could
    #> not find function
    #> "error_need_scalar"

</td>
</tr>
<tr style="vertical-align:top">
<td>
    with_df(df[[1:2, 1]] <- 0)

    #> Error in `[[<-.data.frame`(`*tmp*`,
    #> 1:2, 1, value = 0): only a single
    #> element should be replaced

</td>
<td>
    with_tbl(tbl[[1:2, 1]] <- 0)

    #> Error in error_need_scalar(): could
    #> not find function
    #> "error_need_scalar"

</td>
</tr>
</tbody>
</table>
### Corollaries

`x[[i, j]]` always returns an object of size 1.

<table class="dftbl">
<tbody>
<tr style="vertical-align:top">
<td>
</td>
<td>
    vec_size(tbl[[2, 1]])
    #> [1] 1

</td>
</tr>
<tr style="vertical-align:top">
<td>
    vec_size(df[[2, 3]])
    #> [1] 2

</td>
<td>
    vec_size(tbl[[2, 3]])
    #> [1] 1

</td>
</tr>
<tr style="vertical-align:top">
<td>
    vec_size(df2[[2, 1]])
    #> [1] 4

</td>
<td>
    vec_size(tbl2[[2, 1]])
    #> [1] 1

</td>
</tr>
<tr style="vertical-align:top">
<td>
</td>
<td>
    vec_size(tbl2[[2, 2]])
    #> [1] 1

</td>
</tr>
<tr style="vertical-align:top">
<td>
    vec_size(df[[NA, 1]])

    #> Error in col[[i, exact = exact]]:
    #> subscript out of bounds

</td>
<td>
    vec_size(tbl[[NA, 1]])

    #> Error in error_need_scalar(): could
    #> not find function
    #> "error_need_scalar"

</td>
</tr>
<tr style="vertical-align:top">
<td>
    vec_size(df[[NA, 3]])
    #> [1] 0

</td>
<td>
    vec_size(tbl[[NA, 3]])

    #> Error in error_need_scalar(): could
    #> not find function
    #> "error_need_scalar"

</td>
</tr>
<tr style="vertical-align:top">
<td>
    vec_size(df2[[NA, 1]])
    #> [1] 0

</td>
<td>
    vec_size(tbl2[[NA, 1]])

    #> Error in error_need_scalar(): could
    #> not find function
    #> "error_need_scalar"

</td>
</tr>
<tr style="vertical-align:top">
<td>
    vec_size(df2[[NA, 2]])

    #> Error in col[[i, exact = exact]]:
    #> subscript out of bounds

</td>
<td>
    vec_size(tbl2[[NA, 2]])

    #> Error in error_need_scalar(): could
    #> not find function
    #> "error_need_scalar"

</td>
</tr>
</tbody>
</table>
`x[[i, j]]` and `x[i, ][[j]]` can be used interchangeably on the LHS or
RHS of an assignment for the four principal column types:

-   atomic: `df[[1]]`
-   list: `df[[3]]`
-   data frame: `df2[[1]]`
-   matrix: `df2[[2]]`

<table class="dftbl">
<tbody>
<tr style="vertical-align:top">
<td>
</td>
<td>
    with_tbl(tbl[[1, 1]] <- tbl[2, ][[1]])
    #> # A tibble: 4 x 3
    #>       n c     li       
    #>   <int> <chr> <list>   
    #> 1     2 e     <dbl [1]>
    #> 2     2 f     <int [2]>
    #> 3     3 g     <int [3]>
    #> 4     4 h     <chr [1]>

</td>
</tr>
<tr style="vertical-align:top">
<td>
</td>
<td>
    with_tbl(tbl[1, 1] <- list(tbl[[2, 1]]))
    #> # A tibble: 4 x 3
    #>       n c     li       
    #>   <int> <chr> <list>   
    #> 1     2 e     <dbl [1]>
    #> 2     2 f     <int [2]>
    #> 3     3 g     <int [3]>
    #> 4     4 h     <chr [1]>

</td>
</tr>
<tr style="vertical-align:top">
<td>
    with_df(df[[1, 3]] <- df[2, ][[3]])
    #>   n c         li
    #> 1 1 e     10, 11
    #> 2 2 f     10, 11
    #> 3 3 g 12, 13, 14
    #> 4 4 h       text

</td>
<td>
    with_tbl(tbl[[1, 3]] <- tbl[2, ][[3]])
    #> # A tibble: 4 x 3
    #>       n c     li       
    #>   <int> <chr> <list>   
    #> 1     1 e     <int [2]>
    #> 2     2 f     <int [2]>
    #> 3     3 g     <int [3]>
    #> 4     4 h     <chr [1]>

</td>
</tr>
<tr style="vertical-align:top">
<td>
    with_df(df[1, 3] <- list(df[[2, 3]]))

    #> Warning in `[<-.data.frame`(`*tmp*`,
    #> 1, 3, value = list(10:11)): replacement
    #> element 1 has 2 rows to replace 1 rows

    #>   n c         li
    #> 1 1 e         10
    #> 2 2 f     10, 11
    #> 3 3 g 12, 13, 14
    #> 4 4 h       text

</td>
<td>
    with_tbl(tbl[1, 3] <- list(tbl[[2, 3]]))
    #> # A tibble: 4 x 3
    #>       n c     li       
    #>   <int> <chr> <list>   
    #> 1     1 e     <int [2]>
    #> 2     2 f     <int [2]>
    #> 3     3 g     <int [3]>
    #> 4     4 h     <chr [1]>

</td>
</tr>
<tr style="vertical-align:top">
<td>
    with_df2(df2[[1, 1]] <- df2[2, ][[1]])

    #> Error in `[[<-.data.frame`(`*tmp*`,
    #> iseq, value = structure(list(n = 2L,
    #> : replacement has 1 row, data has 4

</td>
<td>
    with_tbl2(tbl2[[1, 1]] <- tbl2[2, ][[1]])
    #> # A tibble: 4 x 2
    #>    tb$n $c    $li      m[,1]  [,2]  [,3]
    #>   <int> <chr> <list>   <dbl> <dbl> <dbl>
    #> 1     2 f     <int [2…     1     0     0
    #> 2     2 f     <int [2…     0     1     0
    #> 3     3 g     <int [3…     0     0     1
    #> 4     4 h     <chr [1…     0     0     0
    #> # … with 1 more variable: [,4] <dbl>

</td>
</tr>
<tr style="vertical-align:top">
<td>
    with_df2(df2[1, 1] <- list(df2[[2, 1]]))

    #> Warning in `[<-.data.frame`(`*tmp*`,
    #> 1, 1, value = list(c("e", "f", "g", :
    #> replacement element 1 has 4 rows to
    #> replace 1 rows

    #>   tb.n tb.c      tb.li m.1 m.2 m.3 m.4
    #> 1    e    e          e   1   0   0   0
    #> 2    2    f     10, 11   0   1   0   0
    #> 3    3    g 12, 13, 14   0   0   1   0
    #> 4    4    h       text   0   0   0   1

</td>
<td>
    with_tbl2(tbl2[1, 1] <- list(tbl2[[2, 1]]))
    #> # A tibble: 4 x 2
    #>    tb$n $c    $li      m[,1]  [,2]  [,3]
    #>   <int> <chr> <list>   <dbl> <dbl> <dbl>
    #> 1     2 f     <int [2…     1     0     0
    #> 2     2 f     <int [2…     0     1     0
    #> 3     3 g     <int [3…     0     0     1
    #> 4     4 h     <chr [1…     0     0     0
    #> # … with 1 more variable: [,4] <dbl>

</td>
</tr>
<tr style="vertical-align:top">
<td>
    with_df2(df2[[1, 2]] <- df2[2, ][[2]])

    #> Error in x[[jseq]][[iseq]] <- value:
    #> more elements supplied than there
    #> are to replace

</td>
<td>
    with_tbl2(tbl2[[1, 2]] <- tbl2[2, ][[2]])
    #> # A tibble: 4 x 2
    #>    tb$n $c    $li      m[,1]  [,2]  [,3]
    #>   <int> <chr> <list>   <dbl> <dbl> <dbl>
    #> 1     1 e     <dbl [1…     0     1     0
    #> 2     2 f     <int [2…     0     1     0
    #> 3     3 g     <int [3…     0     0     1
    #> 4     4 h     <chr [1…     0     0     0
    #> # … with 1 more variable: [,4] <dbl>

</td>
</tr>
<tr style="vertical-align:top">
<td>
    with_df2(df2[1, 2] <- list(df2[[2, 2]]))
    #>   tb.n tb.c      tb.li m.1 m.2 m.3 m.4
    #> 1    1    e          9   0   0   0   0
    #> 2    2    f     10, 11   0   1   0   0
    #> 3    3    g 12, 13, 14   0   0   1   0
    #> 4    4    h       text   0   0   0   1

</td>
<td>
    with_tbl2(tbl2[1, 2] <- list(tbl2[[2, 2]]))
    #> # A tibble: 4 x 2
    #>    tb$n $c    $li      m[,1]  [,2]  [,3]
    #>   <int> <chr> <list>   <dbl> <dbl> <dbl>
    #> 1     1 e     <dbl [1…     0     1     0
    #> 2     2 f     <int [2…     0     1     0
    #> 3     3 g     <int [3…     0     0     1
    #> 4     4 h     <chr [1…     0     0     0
    #> # … with 1 more variable: [,4] <dbl>

</td>
</tr>
</tbody>
</table>
`x[[i, j]]` is equivalent to `x[i, j][[1]]` with the additional
requirement `vec_as_index(i)` and `vec_as_index(j)` scalar.

<table class="dftbl">
<tbody>
<tr style="vertical-align:top">
<td>
</td>
<td>
    tbl[[1, 2]]
    #> [1] "e"

</td>
</tr>
<tr style="vertical-align:top">
<td>
</td>
<td>
    tbl[1, 2][[1]]
    #> [1] "e"

</td>
</tr>
<tr style="vertical-align:top">
<td>
</td>
<td>
    with_tbl(tbl[[1, 2]] <- "x")
    #> # A tibble: 4 x 3
    #>       n c     li       
    #>   <int> <chr> <list>   
    #> 1     1 x     <dbl [1]>
    #> 2     2 f     <int [2]>
    #> 3     3 g     <int [3]>
    #> 4     4 h     <chr [1]>

</td>
</tr>
<tr style="vertical-align:top">
<td>
</td>
<td>
    with_tbl(tbl[1, 2] <- list("x"))
    #> # A tibble: 4 x 3
    #>       n c     li       
    #>   <int> <chr> <list>   
    #> 1     1 x     <dbl [1]>
    #> 2     2 f     <int [2]>
    #> 3     3 g     <int [3]>
    #> 4     4 h     <chr [1]>

</td>
</tr>
</tbody>
</table>
`x[[i, ]]` is not supported.

<table class="dftbl">
<tbody>
<tr style="vertical-align:top">
<td>
    df[[1, ]]

    #> Error in `[[.data.frame`(df, 1, ):
    #> argument "..2" is missing, with no
    #> default

</td>
<td>
    tbl[[1, ]]
    #> [1] 1 2 3 4

</td>
</tr>
<tr style="vertical-align:top">
<td>
    with_df(df[[1, ]] <- 0)

    #> Error in `[[<-.data.frame`(`*tmp*`,
    #> 1, , value = 0): only valid calls
    #> are x[[j]] <- value or x[[i,j]] <-
    #> value

</td>
<td>
    with_tbl(tbl[[1, ]] <- 0)

    #> Error in vec_as_col_index(j, x):
    #> !is.null(j) is not TRUE

</td>
</tr>
</tbody>
</table>
Missing `j` indexes
===================

Definition of `x[]`.
--------------------

`x[]` is equivalent to `x[seq_len(ncol(x))]`.

<table class="dftbl">
<tbody>
<tr style="vertical-align:top">
<td>
</td>
<td>
    tbl[]
    #> # A tibble: 4 x 3
    #>       n c     li       
    #>   <int> <chr> <list>   
    #> 1     1 e     <dbl [1]>
    #> 2     2 f     <int [2]>
    #> 3     3 g     <int [3]>
    #> 4     4 h     <chr [1]>

</td>
</tr>
<tr style="vertical-align:top">
<td>
</td>
<td>
    with_tbl(tbl[] <- tbl)
    #> # A tibble: 4 x 3
    #>       n c     li       
    #>   <int> <chr> <list>   
    #> 1     1 e     <dbl [1]>
    #> 2     2 f     <int [2]>
    #> 3     3 g     <int [3]>
    #> 4     4 h     <chr [1]>

</td>
</tr>
<tr style="vertical-align:top">
<td>
</td>
<td>
    with_tbl(tbl[] <- tbl[1, ])
    #> # A tibble: 4 x 3
    #>       n c     li       
    #>   <int> <chr> <list>   
    #> 1     1 e     <dbl [1]>
    #> 2     1 e     <dbl [1]>
    #> 3     1 e     <dbl [1]>
    #> 4     1 e     <dbl [1]>

</td>
</tr>
<tr style="vertical-align:top">
<td>
    with_df(df[] <- df[1:2, ])
    #>   n c     li
    #> 1 1 e      9
    #> 2 2 f 10, 11
    #> 3 1 e      9
    #> 4 2 f 10, 11

</td>
<td>
    with_tbl(tbl[] <- tbl[1:2, ])

    #> Vector of length 2 cannot be
    #> recycled to
    #> length 4. Only vectors of length one
    #> or
    #> of the same length can be recycled.

</td>
</tr>
<tr style="vertical-align:top">
<td>
    with_df(df[] <- df2)
    #>   n.n n.c       n.li c.1 c.2 c.3 c.4
    #> 1   1   e          9   1   0   0   0
    #> 2   2   f     10, 11   0   1   0   0
    #> 3   3   g 12, 13, 14   0   0   1   0
    #> 4   4   h       text   0   0   0   1
    #>   li.n li.c      li.li
    #> 1    1    e          9
    #> 2    2    f     10, 11
    #> 3    3    g 12, 13, 14
    #> 4    4    h       text

</td>
<td>
    with_tbl(tbl[] <- tbl2)

    #> Vector of length 2 cannot be
    #> recycled to
    #> length 3. Only vectors of length one
    #> or
    #> of the same length can be recycled.

</td>
</tr>
<tr style="vertical-align:top">
<td>
</td>
<td>
    tbl2[]
    #> # A tibble: 4 x 2
    #>    tb$n $c    $li      m[,1]  [,2]  [,3]
    #>   <int> <chr> <list>   <dbl> <dbl> <dbl>
    #> 1     1 e     <dbl [1…     1     0     0
    #> 2     2 f     <int [2…     0     1     0
    #> 3     3 g     <int [3…     0     0     1
    #> 4     4 h     <chr [1…     0     0     0
    #> # … with 1 more variable: [,4] <dbl>

</td>
</tr>
<tr style="vertical-align:top">
<td>
</td>
<td>
    with_tbl2(tbl2[] <- tbl2)
    #> # A tibble: 4 x 2
    #>    tb$n $c    $li      m[,1]  [,2]  [,3]
    #>   <int> <chr> <list>   <dbl> <dbl> <dbl>
    #> 1     1 e     <dbl [1…     1     0     0
    #> 2     2 f     <int [2…     0     1     0
    #> 3     3 g     <int [3…     0     0     1
    #> 4     4 h     <chr [1…     0     0     0
    #> # … with 1 more variable: [,4] <dbl>

</td>
</tr>
<tr style="vertical-align:top">
<td>
    with_df2(df2[] <- df2[1, ])

    #> Error in `[<-.data.frame`(`*tmp*`, ,
    #> value = structure(list(tb =
    #> structure(list(: replacement element
    #> 1 is a matrix/data frame of 1 row,
    #> need 4

</td>
<td>
    with_tbl2(tbl2[] <- tbl2[1, ])
    #> # A tibble: 4 x 2
    #>    tb$n $c    $li      m[,1]  [,2]  [,3]
    #>   <int> <chr> <list>   <dbl> <dbl> <dbl>
    #> 1     1 e     <dbl [1…     1     0     0
    #> 2     1 e     <dbl [1…     1     0     0
    #> 3     1 e     <dbl [1…     1     0     0
    #> 4     1 e     <dbl [1…     1     0     0
    #> # … with 1 more variable: [,4] <dbl>

</td>
</tr>
<tr style="vertical-align:top">
<td>
    with_df2(df2[] <- df2[1:2, ])

    #> Error in `[<-.data.frame`(`*tmp*`, ,
    #> value = structure(list(tb =
    #> structure(list(: replacement element
    #> 1 is a matrix/data frame of 2 rows,
    #> need 4

</td>
<td>
    with_tbl2(tbl2[] <- tbl2[1:2, ])

    #> Vector of length 2 cannot be
    #> recycled to
    #> length 4. Only vectors of length one
    #> or
    #> of the same length can be recycled.

</td>
</tr>
<tr style="vertical-align:top">
<td>
    with_df2(df2[] <- df)

    #> Warning in `[<-.data.frame`(`*tmp*`, ,
    #> value = structure(list(n = 1:4, c =
    #> c("e", : provided 3 variables to replace
    #> 2 variables

    #>   tb m
    #> 1  1 e
    #> 2  2 f
    #> 3  3 g
    #> 4  4 h

</td>
<td>
    with_tbl2(tbl2[] <- tbl)

    #> Vector of length 3 cannot be
    #> recycled to
    #> length 2. Only vectors of length one
    #> or
    #> of the same length can be recycled.

</td>
</tr>
</tbody>
</table>
Definition of `x[, j]`.
-----------------------

`x[, j]` is equivalent to `x[j]`.

<table class="dftbl">
<tbody>
<tr style="vertical-align:top">
<td>
</td>
<td>
    tbl[, 2:3]
    #> # A tibble: 4 x 2
    #>   c     li       
    #>   <chr> <list>   
    #> 1 e     <dbl [1]>
    #> 2 f     <int [2]>
    #> 3 g     <int [3]>
    #> 4 h     <chr [1]>

</td>
</tr>
<tr style="vertical-align:top">
<td>
</td>
<td>
    tbl[2:3]
    #> # A tibble: 4 x 2
    #>   c     li       
    #>   <chr> <list>   
    #> 1 e     <dbl [1]>
    #> 2 f     <int [2]>
    #> 3 g     <int [3]>
    #> 4 h     <chr [1]>

</td>
</tr>
<tr style="vertical-align:top">
<td>
</td>
<td>
    tbl2[, 1:2]
    #> # A tibble: 4 x 2
    #>    tb$n $c    $li      m[,1]  [,2]  [,3]
    #>   <int> <chr> <list>   <dbl> <dbl> <dbl>
    #> 1     1 e     <dbl [1…     1     0     0
    #> 2     2 f     <int [2…     0     1     0
    #> 3     3 g     <int [3…     0     0     1
    #> 4     4 h     <chr [1…     0     0     0
    #> # … with 1 more variable: [,4] <dbl>

</td>
</tr>
<tr style="vertical-align:top">
<td>
</td>
<td>
    tbl2[1:2]
    #> # A tibble: 4 x 2
    #>    tb$n $c    $li      m[,1]  [,2]  [,3]
    #>   <int> <chr> <list>   <dbl> <dbl> <dbl>
    #> 1     1 e     <dbl [1…     1     0     0
    #> 2     2 f     <int [2…     0     1     0
    #> 3     3 g     <int [3…     0     0     1
    #> 4     4 h     <chr [1…     0     0     0
    #> # … with 1 more variable: [,4] <dbl>

</td>
</tr>
<tr style="vertical-align:top">
<td>
</td>
<td>
    with_tbl(tbl[, 2:3] <- tbl[1:2])
    #> # A tibble: 4 x 3
    #>       n     c li   
    #>   <int> <int> <chr>
    #> 1     1     1 e    
    #> 2     2     2 f    
    #> 3     3     3 g    
    #> 4     4     4 h

</td>
</tr>
<tr style="vertical-align:top">
<td>
</td>
<td>
    with_tbl(tbl[2:3] <- tbl[1:2])
    #> # A tibble: 4 x 3
    #>       n     c li   
    #>   <int> <int> <chr>
    #> 1     1     1 e    
    #> 2     2     2 f    
    #> 3     3     3 g    
    #> 4     4     4 h

</td>
</tr>
<tr style="vertical-align:top">
<td>
</td>
<td>
    with_tbl2(tbl2[, 1:2] <- tbl2[2:1])
    #> # A tibble: 4 x 2
    #>   tb[,1]  [,2]  [,3]  [,4]   m$n $c   
    #>    <dbl> <dbl> <dbl> <dbl> <int> <chr>
    #> 1      1     0     0     0     1 e    
    #> 2      0     1     0     0     2 f    
    #> 3      0     0     1     0     3 g    
    #> 4      0     0     0     1     4 h    
    #> # … with 1 more variable: $li <list>

</td>
</tr>
<tr style="vertical-align:top">
<td>
</td>
<td>
    with_tbl2(tbl2[1:2] <- tbl2[2:1])
    #> # A tibble: 4 x 2
    #>   tb[,1]  [,2]  [,3]  [,4]   m$n $c   
    #>    <dbl> <dbl> <dbl> <dbl> <int> <chr>
    #> 1      1     0     0     0     1 e    
    #> 2      0     1     0     0     2 f    
    #> 3      0     0     1     0     3 g    
    #> 4      0     0     0     1     4 h    
    #> # … with 1 more variable: $li <list>

</td>
</tr>
</tbody>
</table>
### Corollaries

`[` always returns a tibble.

<table class="dftbl">
<tbody>
<tr style="vertical-align:top">
<td>
    df[, 1]
    #> [1] 1 2 3 4

</td>
<td>
    tbl[, 1]
    #> # A tibble: 4 x 1
    #>       n
    #>   <int>
    #> 1     1
    #> 2     2
    #> 3     3
    #> 4     4

</td>
</tr>
<tr style="vertical-align:top">
<td>
</td>
<td>
    tbl[1]
    #> # A tibble: 4 x 1
    #>       n
    #>   <int>
    #> 1     1
    #> 2     2
    #> 3     3
    #> 4     4

</td>
</tr>
<tr style="vertical-align:top">
<td>
</td>
<td>
    tbl[, 1, drop = FALSE]
    #> # A tibble: 4 x 1
    #>       n
    #>   <int>
    #> 1     1
    #> 2     2
    #> 3     3
    #> 4     4

</td>
</tr>
<tr style="vertical-align:top">
<td>
    df[1, drop = FALSE]

    #> Warning in `[.data.frame`(df, 1, drop =
    #> FALSE): 'drop' argument will be ignored

    #>   n
    #> 1 1
    #> 2 2
    #> 3 3
    #> 4 4

</td>
<td>
    tbl[1, drop = FALSE]

    #> Warning: `drop` ignored

    #> # A tibble: 4 x 1
    #>       n
    #>   <int>
    #> 1     1
    #> 2     2
    #> 3     3
    #> 4     4

</td>
</tr>
</tbody>
</table>
`x[,]` is equivalent to `x[]`.

<table class="dftbl">
<tbody>
<tr style="vertical-align:top">
<td>
</td>
<td>
    tbl[,]
    #> # A tibble: 4 x 3
    #>       n c     li       
    #>   <int> <chr> <list>   
    #> 1     1 e     <dbl [1]>
    #> 2     2 f     <int [2]>
    #> 3     3 g     <int [3]>
    #> 4     4 h     <chr [1]>

</td>
</tr>
<tr style="vertical-align:top">
<td>
</td>
<td>
    with_tbl(tbl[,] <- tbl)
    #> # A tibble: 4 x 3
    #>       n c     li       
    #>   <int> <chr> <list>   
    #> 1     1 e     <dbl [1]>
    #> 2     2 f     <int [2]>
    #> 3     3 g     <int [3]>
    #> 4     4 h     <chr [1]>

</td>
</tr>
<tr style="vertical-align:top">
<td>
</td>
<td>
    with_tbl(tbl[,] <- tbl[1, ])
    #> # A tibble: 4 x 3
    #>       n c     li       
    #>   <int> <chr> <list>   
    #> 1     1 e     <dbl [1]>
    #> 2     1 e     <dbl [1]>
    #> 3     1 e     <dbl [1]>
    #> 4     1 e     <dbl [1]>

</td>
</tr>
<tr style="vertical-align:top">
<td>
    with_df(df[,] <- df[1:2, ])
    #>   n c     li
    #> 1 1 e      9
    #> 2 2 f 10, 11
    #> 3 1 e      9
    #> 4 2 f 10, 11

</td>
<td>
    with_tbl(tbl[,] <- tbl[1:2, ])

    #> Vector of length 2 cannot be
    #> recycled to
    #> length 4. Only vectors of length one
    #> or
    #> of the same length can be recycled.

</td>
</tr>
<tr style="vertical-align:top">
<td>
    with_df(df[,] <- df2)
    #>   n.n n.c       n.li c.1 c.2 c.3 c.4
    #> 1   1   e          9   1   0   0   0
    #> 2   2   f     10, 11   0   1   0   0
    #> 3   3   g 12, 13, 14   0   0   1   0
    #> 4   4   h       text   0   0   0   1
    #>   li.n li.c      li.li
    #> 1    1    e          9
    #> 2    2    f     10, 11
    #> 3    3    g 12, 13, 14
    #> 4    4    h       text

</td>
<td>
    with_tbl(tbl[,] <- tbl2)

    #> Vector of length 2 cannot be
    #> recycled to
    #> length 3. Only vectors of length one
    #> or
    #> of the same length can be recycled.

</td>
</tr>
<tr style="vertical-align:top">
<td>
</td>
<td>
    tbl2[,]
    #> # A tibble: 4 x 2
    #>    tb$n $c    $li      m[,1]  [,2]  [,3]
    #>   <int> <chr> <list>   <dbl> <dbl> <dbl>
    #> 1     1 e     <dbl [1…     1     0     0
    #> 2     2 f     <int [2…     0     1     0
    #> 3     3 g     <int [3…     0     0     1
    #> 4     4 h     <chr [1…     0     0     0
    #> # … with 1 more variable: [,4] <dbl>

</td>
</tr>
<tr style="vertical-align:top">
<td>
</td>
<td>
    with_tbl2(tbl2[,] <- tbl2)
    #> # A tibble: 4 x 2
    #>    tb$n $c    $li      m[,1]  [,2]  [,3]
    #>   <int> <chr> <list>   <dbl> <dbl> <dbl>
    #> 1     1 e     <dbl [1…     1     0     0
    #> 2     2 f     <int [2…     0     1     0
    #> 3     3 g     <int [3…     0     0     1
    #> 4     4 h     <chr [1…     0     0     0
    #> # … with 1 more variable: [,4] <dbl>

</td>
</tr>
<tr style="vertical-align:top">
<td>
    with_df2(df2[,] <- df2[1, ])

    #> Error in `[<-.data.frame`(`*tmp*`, ,
    #> , value = structure(list(tb =
    #> structure(list(: replacement element
    #> 1 is a matrix/data frame of 1 row,
    #> need 4

</td>
<td>
    with_tbl2(tbl2[,] <- tbl2[1, ])
    #> # A tibble: 4 x 2
    #>    tb$n $c    $li      m[,1]  [,2]  [,3]
    #>   <int> <chr> <list>   <dbl> <dbl> <dbl>
    #> 1     1 e     <dbl [1…     1     0     0
    #> 2     1 e     <dbl [1…     1     0     0
    #> 3     1 e     <dbl [1…     1     0     0
    #> 4     1 e     <dbl [1…     1     0     0
    #> # … with 1 more variable: [,4] <dbl>

</td>
</tr>
<tr style="vertical-align:top">
<td>
    with_df2(df2[,] <- df2[1:2, ])

    #> Error in `[<-.data.frame`(`*tmp*`, ,
    #> , value = structure(list(tb =
    #> structure(list(: replacement element
    #> 1 is a matrix/data frame of 2 rows,
    #> need 4

</td>
<td>
    with_tbl2(tbl2[,] <- tbl2[1:2, ])

    #> Vector of length 2 cannot be
    #> recycled to
    #> length 4. Only vectors of length one
    #> or
    #> of the same length can be recycled.

</td>
</tr>
<tr style="vertical-align:top">
<td>
    with_df2(df2[,] <- df)

    #> Warning in `[<-.data.frame`(`*tmp*`, , ,
    #> value = structure(list(n = 1:4, :
    #> provided 3 variables to replace 2
    #> variables

    #>   tb m
    #> 1  1 e
    #> 2  2 f
    #> 3  3 g
    #> 4  4 h

</td>
<td>
    with_tbl2(tbl2[,] <- tbl)

    #> Vector of length 3 cannot be
    #> recycled to
    #> length 2. Only vectors of length one
    #> or
    #> of the same length can be recycled.

</td>
</tr>
</tbody>
</table>
### Exception

`drop = TRUE` returns a vector when subsetting a single column with
`x[, j]`, this is for backward compatibility with code that uses an
explicit `drop = TRUE` to access columns as vectors.

<table class="dftbl">
<tbody>
<tr style="vertical-align:top">
<td>
</td>
<td>
    tbl[, 1, drop = TRUE]
    #> [1] 1 2 3 4

</td>
</tr>
<tr style="vertical-align:top">
<td>
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

</td>
<td>
    tbl[1, , drop = TRUE]
    #> # A tibble: 1 x 3
    #>       n c     li       
    #>   <int> <chr> <list>   
    #> 1     1 e     <dbl [1]>

</td>
</tr>
</tbody>
</table>
<table class="dftbl">
<tbody>
<tr style="vertical-align:top">
<td>
</td>
<td>
    stopifnot(identical(tbl, new_tbl()))

</td>
</tr>
</tbody>
</table>
