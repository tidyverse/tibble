---
title: "Invariants for subsetting and subassignment"
#output: rmarkdown::word_document
output: rmarkdown::html_vignette
# devtools::load_all(); rmarkdown::render("vignettes/invariants.Rmd", output_format = rmarkdown::md_document(preserve_yaml = TRUE)); system("pandoc vignettes/invariants.md -o vignettes/invariants.html")
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
This vignette defines invariants for subsetting and subset-assignment
for tibbles, and illustrates where their behaviour differs from data
frames. The goal is to define a small set of invariants that
consistently define how behaviors interact. Some behaviors are defined
using functions of the vctrs package, e.g. `vctrs::vec_slice()`,
`vctrs::vec_recycle()` and `vctrs::vec_as_index()`. Refer to their
documentation for more details about the invariants that they follow.

The subsetting and subassignment operators for data frames and tibbles
are particularly tricky, because they support both row and column
indexes, both of which are optionally missing. We resolve this by first
defining column access with `[[` and `$`, then column-wise subsetting
with `[`, then row-wise subsetting, then the composition of both.

Conventions
-----------

In this article, all behaviors are demonstrated using one example data
frame and its tibble equivalent:

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
If the results are identical (after converting to a data frame if
necessary), only the tibble result is shown.

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
Column extraction
-----------------

### Definition of `x[[j]]`

`x[[j]]` is equal to `.subset2(x, j)`.

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
    identical(tbl[[3]], .subset2(tbl, 3))
    #> [1] TRUE

</td>
</tr>
<tr style="vertical-align:top">
<td>
</td>
<td>
    identical(tbl2[["tbl"]], .subset2(tbl2, "tbl"))
    #> [1] TRUE

</td>
</tr>
</tbody>
</table>
NB: `x[[j]]` always returns an object of size `nrow(x)` if the column
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
`j` must be a single number or a string, as enforced by
`.subset2(x, j)`.

<table class="dftbl">
<tbody>
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
    df[[mean]]

    #> Error in .subset2(x, i, exact =
    #> exact): invalid subscript type
    #> 'closure'

</td>
<td>
    tbl[[mean]]

    #> Error in .subset2(x, j): invalid
    #> subscript type 'closure'

</td>
</tr>
</tbody>
</table>
`NA` indexes, numeric out-of-bounds (OOB) values, and non-integers throw
an error:

<table class="dftbl">
<tbody>
<tr style="vertical-align:top">
<td>
</td>
<td>
    tbl[[NA]]
    #> NULL

</td>
</tr>
<tr style="vertical-align:top">
<td>
</td>
<td>
    tbl[[NA_character_]] # FIXME
    #> NULL

</td>
</tr>
<tr style="vertical-align:top">
<td>
</td>
<td>
    tbl[[NA_integer_]] # FIXME
    #> NULL

</td>
</tr>
<tr style="vertical-align:top">
<td>
    df[[-1]]

    #> Error in .subset2(x, i, exact =
    #> exact): attempt to select more than
    #> one element in get1index <real>

</td>
<td>
    tbl[[-1]]

    #> Error in error_need_scalar(): could
    #> not find function
    #> "error_need_scalar"

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
<tr style="vertical-align:top">
<td>
    df[[1.5]]
    #> [1] 1 2 3 4

</td>
<td>
    tbl[[1.5]]

    #> Lossy cast from <double> to
    #> <integer>.
    #> Locations: 1

</td>
</tr>
<tr style="vertical-align:top">
<td>
    df[[Inf]]
    #> NULL

</td>
<td>
    tbl[[Inf]]

    #> Lossy cast from <double> to
    #> <integer>.
    #> Locations: 1

</td>
</tr>
</tbody>
</table>
Character OOB access is silent because a common package idiom is to
check for the absence of a column with `is.null(df[[var]])`.

<table class="dftbl">
<tbody>
<tr style="vertical-align:top">
<td>
</td>
<td>
    tbl[["x"]]
    #> NULL

</td>
</tr>
</tbody>
</table>
### Definition of `x$name`

`x$name` and `x$"name"` are equal to `x[["name"]]`.

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
    tbl$"n"
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
</tbody>
</table>
<table class="dftbl">
<tbody>
<tr style="vertical-align:top">
<td>
</td>
<td>
    identical(tbl$li, tbl[["li"]])
    #> [1] TRUE

</td>
</tr>
<tr style="vertical-align:top">
<td>
</td>
<td>
    identical(tbl2$tb, tbl2[["tb"]])
    #> [1] TRUE

</td>
</tr>
<tr style="vertical-align:top">
<td>
</td>
<td>
    identical(tbl2$m, tbl2[["m"]])
    #> [1] TRUE

</td>
</tr>
</tbody>
</table>
Unlike data frames, tibbles do not partially match names.

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
</tbody>
</table>
Because `df$x` is rarely used in packages, it can raise a warning:

<table class="dftbl">
<tbody>
<tr style="vertical-align:top">
<td>
    df$not_present
    #> NULL

</td>
<td>
    tbl$not_present

    #> Warning: Unknown or uninitialised
    #> column: `not_present`.

    #> NULL

</td>
</tr>
</tbody>
</table>
Column subsetting
-----------------

### Definition of `x[j]`.

`j` is converted to an integer vector by
`vctrs::vec_as_index(j, ncol(x), names = names(x))`. Then
`x[c(j_1, j_2, ..., j_n)]` is equivalent to
`tibble(x[[j_1]], x[[j_2]], ..., x[[j_3]])`, keeping the corresponding
column names. This implies that `j` must be a numeric or character
vector, or a logical vector with length 1 or `ncol(x)`.[1]

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
</tbody>
</table>
When subsetting repeated indexes, the resulting column names are
undefined, do not rely on them.

<table class="dftbl">
<tbody>
<tr style="vertical-align:top">
<td>
    df[c(1, 1)]
    #>   n n.1
    #> 1 1   1
    #> 2 2   2
    #> 3 3   3
    #> 4 4   4

</td>
<td>
    tbl[c(1, 1)]
    #> # A tibble: 4 x 2
    #>       n     n
    #>   <int> <int>
    #> 1     1     1
    #> 2     2     2
    #> 3     3     3
    #> 4     4     4

</td>
</tr>
</tbody>
</table>
For tibbles with repeated column names, subsetting by name uses the
first matching column.

`nrow(df[j])` equals `nrow(df)`.

<table class="dftbl">
<tbody>
<tr style="vertical-align:top">
<td>
</td>
<td>
    tbl[integer()]
    #> # A tibble: 4 x 0

</td>
</tr>
</tbody>
</table>
### Definition of `x[, j]`

`x[, j]` is equal to `x[j]`. Tibbles do not perform column extraction if
`x[j]` would yield a single column.

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
    tbl[, 1:2]
    #> # A tibble: 4 x 2
    #>       n c    
    #>   <int> <chr>
    #> 1     1 e    
    #> 2     2 f    
    #> 3     3 g    
    #> 4     4 h

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
    identical(tbl[, 2:3], tbl[2:3])
    #> [1] TRUE

</td>
</tr>
<tr style="vertical-align:top">
<td>
</td>
<td>
    identical(tbl2[, 1:2], tbl2[1:2])
    #> [1] TRUE

</td>
</tr>
</tbody>
</table>
### Definition of `x[, j, drop = TRUE]`

For backward compatiblity, `x[, j, drop = TRUE]` performs column
**extraction**, returning `x[j][[1]]` when `ncol(x[j])` is 1.

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
</tbody>
</table>
<table class="dftbl">
<tbody>
<tr style="vertical-align:top">
<td>
</td>
<td>
    identical(tbl[, 3, drop = TRUE], tbl[[3]])
    #> [1] TRUE

</td>
</tr>
<tr style="vertical-align:top">
<td>
</td>
<td>
    identical(tbl2[, 1, drop = TRUE], tbl2[[1]])
    #> [1] TRUE

</td>
</tr>
<tr style="vertical-align:top">
<td>
</td>
<td>
    identical(tbl2[, 2, drop = TRUE], tbl2[[2]])
    #> [1] TRUE

</td>
</tr>
</tbody>
</table>
Row subsetting
--------------

### Definition of `x[i, ]`

`x[i, ]` is equal to
`tibble(vec_slice(x[[1]], i), vec_slice(x[[2]], i), ...)`.[2]

<table class="dftbl">
<tbody>
<tr style="vertical-align:top">
<td>
</td>
<td>
    tbl[3, ]
    #> # A tibble: 1 x 3
    #>       n c     li       
    #>   <int> <chr> <list>   
    #> 1     3 g     <int [3]>

</td>
</tr>
</tbody>
</table>
This means that `i` must be a numeric vector, or a logical vector of
length `nrow(x)` or 1. For compatibility, `i` can also be a character
vector containing positive numbers.

<table class="dftbl">
<tbody>
<tr style="vertical-align:top">
<td>
    df[mean, ]

    #> Error in xj[i]: invalid subscript
    #> type 'closure'

</td>
<td>
    tbl[mean, ]

    #> Error: `i` must be an integer,
    #> character, or logical vector, not a
    #> closure.

</td>
</tr>
<tr style="vertical-align:top">
<td>
    df[list(1), ]

    #> Error in xj[i]: invalid subscript
    #> type 'list'

</td>
<td>
    tbl[list(1), ]

    #> Error: `i` must be an integer,
    #> character, or logical vector, not a
    #> list.

</td>
</tr>
<tr style="vertical-align:top">
<td>
</td>
<td>
    tbl["1", ]
    #> # A tibble: 1 x 3
    #>       n c     li       
    #>   <int> <chr> <list>   
    #> 1     1 e     <dbl [1]>

</td>
</tr>
</tbody>
</table>
Exception: OOB values generate warnings instead of errors:

<table class="dftbl">
<tbody>
<tr style="vertical-align:top">
<td>
    df[10, ]
    #>     n    c   li
    #> NA NA <NA> NULL

</td>
<td>
    tbl[10, ]

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
    df["x", ]
    #>     n    c   li
    #> NA NA <NA> NULL

</td>
<td>
    tbl["x", ]

    #> Warning: Only valid row names can be
    #> used for indexing. Use `NA` as row index
    #> to obtain a row full of `NA` values.

    #> # A tibble: 1 x 3
    #>       n c     li    
    #>   <int> <chr> <list>
    #> 1    NA <NA>  <NULL>

</td>
</tr>
</tbody>
</table>
Unlike data frames, only logical vectors of length 1 are recycled.
<!-- TODO: should this be an error? #648 -->

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
</tbody>
</table>
NB: scalar logicals are recycled, but scalar numerics are not. That
makes the `x[NA, ]` and `x[NA_integer_, ]` return different results.

<table class="dftbl">
<tbody>
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
</td>
<td>
    tbl[NA_integer_, ]
    #> # A tibble: 1 x 3
    #>       n c     li    
    #>   <int> <chr> <list>
    #> 1    NA <NA>  <NULL>

</td>
</tr>
</tbody>
</table>
### Definition of `x[i, , drop = TRUE]`

`drop = TRUE` has no effect when not selecting a single row:

<table class="dftbl">
<tbody>
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
<!-- TODO: soft-deprecate -->
Row and column subsetting
-------------------------

### Definition of `x[]` and `x[,]`

`x[]` and `x[,]` are equivalent to `x`.[3]

### Definition of `x[i, j]`

`x[i, j]` is equal to `x[i, ][j]`.[4]

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
</td>
<td>
    tbl[1, ][1]
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
    identical(tbl[1, 2:3], tbl[2:3][1, ])
    #> [1] TRUE

</td>
</tr>
<tr style="vertical-align:top">
<td>
</td>
<td>
    identical(tbl[2:3, 1], tbl[1][2:3, ])
    #> [1] TRUE

</td>
</tr>
<tr style="vertical-align:top">
<td>
</td>
<td>
    identical(tbl2[2:3, 1:2], tbl2[1:2][2:3, ])
    #> [1] TRUE

</td>
</tr>
</tbody>
</table>
### Definition of `x[[i, j]]`

`i` must be a numeric vector of length 1. `x[[i, j]]` is equal to
`x[i, ][[j]]`.[5]

This implies that `j` must be a numeric or character vector of length 1.

NB: `vctrs::vec_size(x[[i, j]])` always equals 1. Unlike `x[i, ]`,
`x[[i, ]]` is not valid.

Column update
-------------

### Definition of `x[[j]] <- a`.

`x[[j]] <- a` corresponds to
`x <- tibble(x[[j_1]], x[[j_2]], ..., a, ..., x[[j_n]])`.

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
For this, `j` must be a scalar numeric or a string, and cannot be `NA`.

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
    with_tbl(tbl[["c"]] <- 0)
    #> # A tibble: 4 x 3
    #>       n     c li       
    #>   <int> <dbl> <list>   
    #> 1     1     0 <dbl [1]>
    #> 2     2     0 <int [2]>
    #> 3     3     0 <int [3]>
    #> 4     4     0 <chr [1]>

</td>
</tr>
</tbody>
</table>
<table class="dftbl">
<tbody>
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
</tbody>
</table>
`vec_size(a)` must be `nrow(x)` or 1. Recycling also works for list,
data frame, and matrix columns.

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
<table class="dftbl">
<tbody>
<tr style="vertical-align:top">
<td>
</td>
<td>
    with_tbl(tbl[["li"]] <- list(0))
    #> # A tibble: 4 x 3
    #>       n c     li       
    #>   <int> <chr> <list>   
    #> 1     1 e     <dbl [1]>
    #> 2     2 f     <dbl [1]>
    #> 3     3 g     <dbl [1]>
    #> 4     4 h     <dbl [1]>

</td>
</tr>
<tr style="vertical-align:top">
<td>
    with_df2(df2[["tb"]] <- df[1, ])

    #> Error in `[[<-.data.frame`(`*tmp*`,
    #> "tb", value = structure(list(n = 1L,
    #> : replacement has 1 row, data has 4

</td>
<td>
    with_tbl2(tbl2[["tb"]] <- tbl[1, ])
    #> # A tibble: 4 x 2
    #>    tb$n $c    $li      m[,1]  [,2]  [,3]
    #>   <int> <chr> <list>   <dbl> <dbl> <dbl>
    #> 1     1 e     <dbl [1…     1     0     0
    #> 2     1 e     <dbl [1…     0     1     0
    #> 3     1 e     <dbl [1…     0     0     1
    #> 4     1 e     <dbl [1…     0     0     0
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
New columns are appended at the end, with name repair if needed.

<table class="dftbl">
<tbody>
<tr style="vertical-align:top">
<td>
</td>
<td>
    with_tbl(tbl[["x"]] <- 0)
    #> # A tibble: 4 x 4
    #>       n c     li            x
    #>   <int> <chr> <list>    <dbl>
    #> 1     1 e     <dbl [1]>     0
    #> 2     2 f     <int [2]>     0
    #> 3     3 g     <int [3]>     0
    #> 4     4 h     <chr [1]>     0

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
    #> # A tibble: 4 x 4
    #>       n c     li         ...4
    #>   <int> <chr> <list>    <dbl>
    #> 1     1 e     <dbl [1]>     0
    #> 2     2 f     <int [2]>     0
    #> 3     3 g     <int [3]>     0
    #> 4     4 h     <chr [1]>     0

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
The type of an existing column can be changed, also across the principal
column types:

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
### Definition of `x$name <- a`.

`x$name <- a` and `x$"name" <- a` are equivalent to
`x[["name"]] <- a`.[6]

<table class="dftbl">
<tbody>
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
    with_tbl(tbl$"n" <- 0)
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
</tbody>
</table>
`$` does not implement partial matching but creates a new column.

<table class="dftbl">
<tbody>
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
</td>
<td>
    with_tbl(tbl[["l"]] <- 0)
    #> # A tibble: 4 x 4
    #>       n c     li            l
    #>   <int> <chr> <list>    <dbl>
    #> 1     1 e     <dbl [1]>     0
    #> 2     2 f     <int [2]>     0
    #> 3     3 g     <int [3]>     0
    #> 4     4 h     <chr [1]>     0

</td>
</tr>
</tbody>
</table>
### Definition of `x[j] <- list(...)`.

`x[j] <- a` is equivalent to performing `x[[j_1]] <- a[[1]]`,
`x[[j_2]] <- a[[2]]` etc. If `a` contains `NULL` values, the
corresponding columns are removed after updating.
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
Just like column updates, `[<-` supports changing the type of an
existing column, also across the principal column types:

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
### Definition of `x[j] <- list(a)`.

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
This means that only lists of length one on the RHS are recycled.

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
### Definition of `x[j] <- a`.

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
    with_tbl(tbl[1] <- list(list(0)))
    #> # A tibble: 4 x 3
    #>   n         c     li       
    #>   <list>    <chr> <list>   
    #> 1 <dbl [1]> e     <dbl [1]>
    #> 2 <dbl [1]> f     <int [2]>
    #> 3 <dbl [1]> g     <int [3]>
    #> 4 <dbl [1]> h     <chr [1]>

</td>
</tr>
</tbody>
</table>
### Definition of `x[] <- ...`.

`x[] <- ...` is equivalent to `x[seq_len(ncol(x))] <- ...`.

<table class="dftbl">
<tbody>
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
Row subassignment
-----------------

### Definition of `x[i, ] <- list(...)`.

`x[i, ] <- a` is the same as `vec_slice(x[[j_1]], i) <- a[[1]]`,
`vec_slice(x[[j_2]], i) <- a[[2]]`, … .[7]

<table class="dftbl">
<tbody>
<tr style="vertical-align:top">
<td>
</td>
<td>
    with_tbl(tbl[2:3, ] <- tbl[1, ])
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
</td>
<td>
    with_tbl(tbl[c(FALSE, TRUE, TRUE, FALSE), ] <- tbl[1, ])
    #> # A tibble: 4 x 3
    #>       n c     li       
    #>   <int> <chr> <list>   
    #> 1     1 e     <dbl [1]>
    #> 2     1 e     <dbl [1]>
    #> 3     1 e     <dbl [1]>
    #> 4     4 h     <chr [1]>

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
    with_tbl(tbl[0:2, ] <- tbl[1, ])
    #> # A tibble: 4 x 3
    #>       n c     li       
    #>   <int> <chr> <list>   
    #> 1     1 e     <dbl [1]>
    #> 2     1 e     <dbl [1]>
    #> 3     3 g     <int [3]>
    #> 4     4 h     <chr [1]>

</td>
</tr>
<tr style="vertical-align:top">
<td>
</td>
<td>
    with_tbl(tbl[0, ] <- tbl[1, ])
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

    #> Error in error_na_new_row(): could
    #> not find function "error_na_new_row"

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

    #> Error in error_na_new_row(): could
    #> not find function "error_na_new_row"

</td>
</tr>
<tr style="vertical-align:top">
<td>
</td>
<td>
    with_tbl(tbl[TRUE, ] <- tbl[1, ])
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
</td>
<td>
    with_tbl(tbl[FALSE, ] <- tbl[1, ])
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
    with_df(df[NA, ] <- df[1, ])

    #> Error in `[<-.data.frame`(`*tmp*`,
    #> NA, , value = structure(list(n = 1L,
    #> : missing values are not allowed in
    #> subscripted assignments of data
    #> frames

</td>
<td>
    with_tbl(tbl[NA, ] <- tbl[1, ])

    #> Error in error_na_new_row(): could
    #> not find function "error_na_new_row"

</td>
</tr>
</tbody>
</table>
Only values of size one can be recycled.

<table class="dftbl">
<tbody>
<tr style="vertical-align:top">
<td>

    with_tbl(tbl[2:3, ] <- tbl[1, ])
    with_df(df[2:3, ] <- list(df$n[1], df$c[1:2], df$li[1])
    with_tbl(tbl[2:3, ] <- list(tbl$n[1], tbl$c[1:2], tbl$li[1])
    with_df(df[2:4, ] <- df[1:2, ])
    with_tbl(tbl[2:4, ] <- tbl[1:2, ])

    #> Error: <text>:4:1: unexpected symbol
    #> 3: with_df(df[2:3, ] <-
    #> list(df$n[1], df$c[1:2], df$li[1])
    #> 4: with_tbl
    #> ^

</td>
</tr>
</tbody>
</table>
<table class="dftbl">
<tbody>
<tr>
<td>
</td>
<td>
    with_df2(df2[2:4, ] <- df2[1, ])

    #> Error in `[<-.data.frame`(`*tmp*`,
    #> 2:4, , value = structure(list(tb =
    #> structure(list(: replacement element
    #> 1 is a matrix/data frame of 1 row,
    #> need 3

</td>
</tr>
<tr style="vertical-align:top">
<td>
    with_tbl2(tbl2[2:4, ] <- tbl2[1, ])
    #> # A tibble: 4 x 2
    #>    tb$n $c    $li      m[,1]  [,2]  [,3]
    #>   <int> <chr> <list>   <dbl> <dbl> <dbl>
    #> 1     1 e     <dbl [1…     1     0     0
    #> 2     1 e     <dbl [1…     1     0     0
    #> 3     1 e     <dbl [1…     1     0     0
    #> 4     1 e     <dbl [1…     1     0     0
    #> # … with 1 more variable: [,4] <dbl>

</td>
<td>
    with_df2(df2[2:4, ] <- df2[2:3, ])

    #> Error in `[<-.data.frame`(`*tmp*`,
    #> 2:4, , value = structure(list(tb =
    #> structure(list(: replacement element
    #> 1 is a matrix/data frame of 2 rows,
    #> need 3

</td>
</tr>
<tr style="vertical-align:top">
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
For compatibility reasons only a warning is issued for indexing beyond
the number of rows. Appending rows right at the end of the existing data
is supported, without warning.

<table class="dftbl">
<tbody>
<tr>
<td>
</td>
<td>
</td>
</tr>
<tr style="vertical-align:top">
<td>
    with_tbl(tbl[5, ] <- tbl[1, ])
    #> # A tibble: 5 x 3
    #>       n c     li       
    #>   <int> <chr> <list>   
    #> 1     1 e     <dbl [1]>
    #> 2     2 f     <int [2]>
    #> 3     3 g     <int [3]>
    #> 4     4 h     <chr [1]>
    #> 5     1 e     <dbl [1]>

</td>
<td>
</td>
</tr>
<tr style="vertical-align:top">
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
</tr>
<tr style="vertical-align:top">
<td>
    with_tbl(tbl[6, ] <- tbl[1, ])

    #> Error in
    #> error_new_rows_at_end_only(): could
    #> not find function
    #> "error_new_rows_at_end_only"

</td>
<td>
    with_df(df[-5, ] <- df[1, ])
    #>   n c li
    #> 1 1 e  9
    #> 2 1 e  9
    #> 3 1 e  9
    #> 4 1 e  9

</td>
</tr>
<tr style="vertical-align:top">
<td>
    with_tbl(tbl[-5, ] <- tbl[1, ])

    #> Error: Can't index beyond the end of
    #> a vector.
    #> The vector has length 4 and you've
    #> tried to subset element 5.

</td>
<td>
    with_df(df[-(5:7), ] <- df[1, ])
    #>   n c li
    #> 1 1 e  9
    #> 2 1 e  9
    #> 3 1 e  9
    #> 4 1 e  9

</td>
</tr>
<tr style="vertical-align:top">
<td>
    with_tbl(tbl[-(5:7), ] <- tbl[1, ])

    #> Error: Can't index beyond the end of
    #> a vector.
    #> The vector has length 4 and you've
    #> tried to subset element 5.

</td>
<td>
    with_df(df[-6, ] <- df[1, ])
    #>   n c li
    #> 1 1 e  9
    #> 2 1 e  9
    #> 3 1 e  9
    #> 4 1 e  9

</td>
</tr>
<tr style="vertical-align:top">
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
For compatibility, `i` can also be a character vector containing
positive numbers.

<table class="dftbl">
<tbody>
<tr>
<td>
</td>
<td>
</td>
</tr>
<tr style="vertical-align:top">
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
</tbody>
</table>
<table class="dftbl">
<tbody>
<tr>
<td>
</td>
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
</tr>
<tr style="vertical-align:top">
<td>
    with_tbl(tbl[as.character(-(1:3)), ] <- tbl[1, ])

    #> Warning: Only valid row names can be
    #> used for indexing. Use `NA` as row index
    #> to obtain a row full of `NA` values.

    #> Error in error_na_new_row(): could
    #> not find function "error_na_new_row"

</td>
<td>
    with_df(df[as.character(3:5), ] <- df[1, ])
    #>   n c     li
    #> 1 1 e      9
    #> 2 2 f 10, 11
    #> 3 1 e      9
    #> 4 1 e      9
    #> 5 1 e      9

</td>
</tr>
<tr style="vertical-align:top">
<td>
    with_tbl(tbl[as.character(3:5), ] <- tbl[1, ])

    #> Warning: Only valid row names can be
    #> used for indexing. Use `NA` as row index
    #> to obtain a row full of `NA` values.

    #> Error in error_na_new_row(): could
    #> not find function "error_na_new_row"

</td>
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
</tr>
<tr style="vertical-align:top">
<td>
    with_tbl(tbl[as.character(-(3:5)), ] <- tbl[1, ])

    #> Warning: Only valid row names can be
    #> used for indexing. Use `NA` as row index
    #> to obtain a row full of `NA` values.

    #> Error in error_na_new_row(): could
    #> not find function "error_na_new_row"

</td>
<td>
    with_df(df[NA_character_, ] <- df[1, ])

    #> Error in `[<-.data.frame`(`*tmp*`,
    #> NA_character_, , value =
    #> structure(list(: missing values are
    #> not allowed in subscripted
    #> assignments of data frames

</td>
</tr>
<tr style="vertical-align:top">
<td>
    with_tbl(tbl[NA_character_, ] <- tbl[1, ])

    #> Error in error_na_new_row(): could
    #> not find function "error_na_new_row"

</td>
</tr>
</tbody>
</table>
Row and column subassignment
----------------------------

### Definition of `x[i, j] <- a`.

`x[i, j] <- a` is equivalent to `x[i, ][j] <- a`.[8]

Subassignment to `x[i, j]` is much stricter for tibbles than for data
frames. `x[i, j] <- a` can update only existing columns, it cannot
create or remove columns.

<table class="dftbl">
<tbody>
<tr>
<td>
</td>
<td>
    with_df(df[2:3, "n"] <- 1)
    #>   n c         li
    #> 1 1 e          9
    #> 2 1 f     10, 11
    #> 3 1 g 12, 13, 14
    #> 4 4 h       text

</td>
</tr>
<tr style="vertical-align:top">
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
<td>
    with_df(df[2:3, "x"] <- 1)
    #>   n c         li  x
    #> 1 1 e          9 NA
    #> 2 2 f     10, 11  1
    #> 3 3 g 12, 13, 14  1
    #> 4 4 h       text NA

</td>
</tr>
<tr style="vertical-align:top">
<td>
    with_tbl(tbl[2:3, "x"] <- 1)

    #> Error: Can't index non-existing
    #> elements.

</td>
<td>
    with_df(df[2:3, "n"] <- NULL)

    #> Error in x[[jj]][iseq] <- vjj:
    #> replacement has length zero

</td>
</tr>
<tr style="vertical-align:top">
<td>
    with_tbl(tbl[2:3, "n"] <- NULL)

    #> `value` must be a vector, not NULL

</td>
</tr>
</tbody>
</table>
`x[i, j] <- a` can’t change the data type of existing columns.

<table class="dftbl">
<tbody>
<tr>
<td>
</td>
<td>
    with_df(df[2:3, 1] <- df[1:2, 2])
    #>   n c         li
    #> 1 1 e          9
    #> 2 e f     10, 11
    #> 3 f g 12, 13, 14
    #> 4 4 h       text

</td>
</tr>
<tr style="vertical-align:top">
<td>
    with_tbl(tbl[2:3, 1] <- tbl[1:2, 2])

    #> No common type for `value`
    #> <character>
    #> and `x` <integer>.

</td>
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
</tr>
<tr style="vertical-align:top">
<td>
    with_tbl(tbl[2:3, 2] <- tbl[1:2, 3])

    #> No common type for `value` <list>
    #> and
    #> `x` <character>.

</td>
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
</tr>
<tr style="vertical-align:top">
<td>
    with_tbl(tbl[2:3, 3] <- tbl2[1:2, 1])

    #> No common type for `x` <tbl_df<
    #> n : integer
    #> c : character
    #> li: list
    #> >> and `y` <list>.

</td>
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
</tr>
<tr style="vertical-align:top">
<td>
    with_tbl2(tbl2[2:3, 1] <- tbl2[1:2, 2])

    #> No common type for `value`
    #> <double[,4]> and `x` <tbl_df<
    #> n : integer
    #> c : character
    #> li: list
    #> >>.

</td>
<td>
</td>
</tr>
<tr style="vertical-align:top">
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
<tr>
<td>
</td>
<td>
    with_df(df[5, "n"] <- list(0))
    #>   n    c         li
    #> 1 1    e          9
    #> 2 2    f     10, 11
    #> 3 3    g 12, 13, 14
    #> 4 4    h       text
    #> 5 0 <NA>       NULL

</td>
</tr>
<tr style="vertical-align:top">
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
### Definition of `x[[i, j]] <- a`.

`i` must be a numeric vector of length 1. `x[[i, j]] <- a` is equivalent
to `x[i, ][[j]] <- a`.[9]

<table class="dftbl">
<tbody>
<tr>
<td>
</td>
<td>
    with_df(df[[1, 1]] <- 0)
    #>   n c         li
    #> 1 0 e          9
    #> 2 2 f     10, 11
    #> 3 3 g 12, 13, 14
    #> 4 4 h       text

</td>
</tr>
<tr style="vertical-align:top">
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
<td>
    with_df(df[1, ][[1]] <- 0)
    #>   n c         li
    #> 1 0 e          9
    #> 2 2 f     10, 11
    #> 3 3 g 12, 13, 14
    #> 4 4 h       text

</td>
</tr>
<tr style="vertical-align:top">
<td>
    with_tbl(tbl[1, ][[1]] <- 0)
    #> # A tibble: 4 x 3
    #>       n c     li       
    #>   <int> <chr> <list>   
    #> 1     0 e     <dbl [1]>
    #> 2     2 f     <int [2]>
    #> 3     3 g     <int [3]>
    #> 4     4 h     <chr [1]>

</td>
<td>
    with_df(df[[1, 3]] <- list(NULL))
    #>   n c         li
    #> 1 1 e       NULL
    #> 2 2 f     10, 11
    #> 3 3 g 12, 13, 14
    #> 4 4 h       text

</td>
</tr>
<tr style="vertical-align:top">
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
<td>
</td>
</tr>
<tr style="vertical-align:top">
<td>
    with_tbl(tbl[1, ][[3]] <- list(NULL))
    #> # A tibble: 4 x 3
    #>       n c     li       
    #>   <int> <chr> <list>   
    #> 1     1 e     <NULL>   
    #> 2     2 f     <int [2]>
    #> 3     3 g     <int [3]>
    #> 4     4 h     <chr [1]>

</td>
<td>
    with_df2(df2[[1, 1]] <- df[1, ])

    #> Error in `[[<-.data.frame`(`*tmp*`,
    #> iseq, value = structure(list(n = 1L,
    #> : replacement has 1 row, data has 4

</td>
</tr>
<tr style="vertical-align:top">
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
<td>
</td>
</tr>
<tr style="vertical-align:top">
<td>
    with_tbl2(tbl2[1, ][[1]] <- tbl[1, ])
    #> # A tibble: 4 x 2
    #>    tb$n $c    $li      m[,1]  [,2]  [,3]
    #>   <int> <chr> <list>   <dbl> <dbl> <dbl>
    #> 1     1 e     <dbl [1…     1     0     0
    #> 2     2 f     <int [2…     0     1     0
    #> 3     3 g     <int [3…     0     0     1
    #> 4     4 h     <chr [1…     0     0     0
    #> # … with 1 more variable: [,4] <dbl>

</td>
<td>
    with_df2(df2[[1, 2]] <- t(1:4))

    #> Error in x[[jseq]][[iseq]] <- value:
    #> more elements supplied than there
    #> are to replace

</td>
</tr>
<tr style="vertical-align:top">
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
<td>
</td>
</tr>
<tr style="vertical-align:top">
<td>
    with_tbl2(tbl2[1, ][[2]] <- t(1:4))
    #> # A tibble: 4 x 2
    #>    tb$n $c    $li      m[,1]  [,2]  [,3]
    #>   <int> <chr> <list>   <dbl> <dbl> <dbl>
    #> 1     1 e     <dbl [1…     1     2     3
    #> 2     2 f     <int [2…     0     1     0
    #> 3     3 g     <int [3…     0     0     1
    #> 4     4 h     <chr [1…     0     0     0
    #> # … with 1 more variable: [,4] <dbl>

</td>
<td>
    df[[1:2, 1]]

    #> Error in col[[i, exact = exact]]:
    #> attempt to select more than one
    #> element in vectorIndex

</td>
</tr>
<tr style="vertical-align:top">
<td>
    tbl[[1:2, 1]]

    #> Error in error_need_scalar(): could
    #> not find function
    #> "error_need_scalar"

</td>
<td>
    with_df(df[[1:2, 1]] <- 0)

    #> Error in `[[<-.data.frame`(`*tmp*`,
    #> 1:2, 1, value = 0): only a single
    #> element should be replaced

</td>
</tr>
<tr style="vertical-align:top">
<td>
    with_tbl(tbl[[1:2, 1]] <- 0)

    #> Error in error_need_scalar(): could
    #> not find function
    #> "error_need_scalar"

</td>
</tr>
</tbody>
</table>
NB: `vctrs::vec_size(a)` must equal 1. Unlike `x[i, ] <-`, `x[[i, ]] <-`
is not valid.

<table class="dftbl">
<tbody>
<tr>
<td>
</td>
<td>
</td>
</tr>
<tr style="vertical-align:top">
<td>
    stopifnot(identical(tbl, new_tbl()))

</td>
</tr>
</tbody>
</table>

[1] NB: `x[j][[jj]]` is equal to `x[[ j[[jj]] ]]`, in particular
`x[j][[1]]` is equal to `x[[j]]` for scalar numeric or integer `j`.

[2] Row subsetting `x[i, ]` is not defined in terms of `x[[j]][i]`
because that definition does not generalise to matrix and data frame
columns. For efficiency and backward compatibility, `i` is converted to
an integer vector by `vctrs::vec_as_index(i, nrow(x))` first.

[3] `x[,]` is equivalent to `x[]` because `x[, j]` is equivalent to
`x[j]`.

[4] A more efficient implementation of `x[i, j]` would forward to
`x[j][i, ]`.

[5] Cell subsetting `x[[i, j]]` is not defined in terms of `x[[j]][[i]]`
because that definition does not generalise to list, matrix and data
frame columns. A more efficient implementation of `x[[i, j]]` would
check that `j` is a scalar and forward to `x[i, j][[1]]`.

[6] `$` behaves almost completely symmetrical to `[[` when comparing
subsetting and subassignment.

[7] `x[i, ]` are symmetrical for subset and subassignment.

[8] `x[i, j]` is symmetrical for subsetting and subassignment. A more
efficient implementation of `x[i, j] <- a` would forward to
`x[j][i, ] <- a`.

[9] `x[[i, j]]` is symmetrical for subsetting and subassignment. An
efficient implementation would check that `i` and `j` are scalar and
forward to `x[i, j][[1]] <- a`.
