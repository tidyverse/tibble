---
title: "Invariants for subsetting and subassignment"
#output: rmarkdown::word_document
output: rmarkdown::html_vignette
# devtools::load_all(); eval_details <- TRUE; rmarkdown::render("vignettes/invariants.Rmd", output_format = rmarkdown::md_document(preserve_yaml = TRUE)); system("pandoc vignettes/invariants.md -o vignettes/invariants.html")
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
using functions of the vctrs package, e.g. `vec_slice()`,
`vec_recycle()` and `vec_as_index()`. Refer to their documentation for
more details about the invariants that they follow.

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
      df <- data.frame(n = c(1L, NA, 3L, NA))
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
    #>    n c         li
    #> 1  1 e          9
    #> 2 NA f     10, 11
    #> 3  3 g 12, 13, 14
    #> 4 NA h       text

</td>
<td>
    new_tbl()
    #> # A tibble: 4 x 3
    #>       n c     li       
    #>   <int> <chr> <list>   
    #> 1     1 e     <dbl [1]>
    #> 2    NA f     <int [2]>
    #> 3     3 g     <int [3]>
    #> 4    NA h     <chr [1]>

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
    #> 2    NA f     <int [2]>
    #> 3     3 g     <int [3]>
    #> 4    NA h     <chr [1]>

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
    #>    n c         li
    #> 1 NA e          9
    #> 2  3 f     10, 11
    #> 3 NA g 12, 13, 14
    #> 4  1 h       text

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
    #> 1    NA e     <dbl [1]>
    #> 2     3 f     <int [2]>
    #> 3    NA g     <int [3]>
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
    #> [1]  1 NA  3 NA

</td>
</tr>
<tr style="vertical-align:top">
<td>
</td>
<td>
    .subset2(tbl, 1)
    #> [1]  1 NA  3 NA

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
    #> [1] NA

</td>
<td>
    tbl[[1:2]]

    #> Warning: The `j` argument of
    #> ``[[.tbl_df`()` can't be a vector of
    #> length 2 as of lifecycle 3.0.0.
    #> Recursive subsetting is deprecated for
    #> tibbles.

    #> [1] NA

</td>
</tr>
<tr style="vertical-align:top">
<td>
    df[[c("n", "c")]]

    #> Error in .subset2(x, i, exact = exact):
    #> subscript out of bounds

</td>
<td>
    tbl[[c("n", "c")]]

    #> Error: Must use a scalar in `[[`.

</td>
</tr>
<tr style="vertical-align:top">
<td>
    df[[TRUE]]
    #> [1]  1 NA  3 NA

</td>
<td>
    tbl[[TRUE]]

    #> Error: Must extract column with a single
    #> valid subscript.
    #> [31mx[39m The subscript `j` has the wrong type
    #> `logical`.
    #> [34mℹ[39m It must be numeric or character.

</td>
</tr>
<tr style="vertical-align:top">
<td>
    df[[mean]]

    #> Error in .subset2(x, i, exact = exact):
    #> invalid subscript type 'closure'

</td>
<td>
    tbl[[mean]]

    #> Error: Must extract column with a single
    #> valid subscript.
    #> [31mx[39m The subscript `j` has the wrong type
    #> `closure`.
    #> [34mℹ[39m It must be numeric or character.

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
    df[[NA]]
    #> NULL

</td>
<td>
    tbl[[NA]]

    #> Error: Must extract column with a single
    #> valid subscript.
    #> [31mx[39m The subscript `NA` can't be `NA`.

</td>
</tr>
<tr style="vertical-align:top">
<td>
    df[[NA_character_]]
    #> NULL

</td>
<td>
    tbl[[NA_character_]]

    #> Error: Must extract column with a single
    #> valid subscript.
    #> [31mx[39m The subscript `NA_character_` can't be
    #> `NA`.

</td>
</tr>
<tr style="vertical-align:top">
<td>
    df[[NA_integer_]]
    #> NULL

</td>
<td>
    tbl[[NA_integer_]]

    #> Error: Must extract column with a single
    #> valid subscript.
    #> [31mx[39m The subscript `NA_integer_` can't be
    #> `NA`.

</td>
</tr>
<tr style="vertical-align:top">
<td>
    df[[-1]]

    #> Error in .subset2(x, i, exact = exact):
    #> attempt to select more than one element
    #> in get1index <real>

</td>
<td>
    tbl[[-1]]

    #> Error: Must extract column with a single
    #> valid subscript.
    #> [31mx[39m The subscript `-1` has value -1 but
    #> must be a positive location.

</td>
</tr>
<tr style="vertical-align:top">
<td>
    df[[4]]

    #> Error in .subset2(x, i, exact = exact):
    #> subscript out of bounds

</td>
<td>
    tbl[[4]]

    #> Error: Can't subset columns that don't
    #> exist.
    #> [31mx[39m The location 4 doesn't exist.
    #> [34mℹ[39m There are only 3 columns.

</td>
</tr>
<tr style="vertical-align:top">
<td>
    df[[1.5]]
    #> [1]  1 NA  3 NA

</td>
<td>
    tbl[[1.5]]

    #> Error: Must extract column with a single
    #> valid subscript.
    #> [31mx[39m Lossy cast from `j` <double> to
    #> <integer>.

</td>
</tr>
<tr style="vertical-align:top">
<td>
    df[[Inf]]
    #> NULL

</td>
<td>
    tbl[[Inf]]

    #> Error: Must extract column with a single
    #> valid subscript.
    #> [31mx[39m Lossy cast from `j` <double> to
    #> <integer>.

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
    #> [1]  1 NA  3 NA

</td>
</tr>
<tr style="vertical-align:top">
<td>
</td>
<td>
    tbl$"n"
    #> [1]  1 NA  3 NA

</td>
</tr>
<tr style="vertical-align:top">
<td>
</td>
<td>
    tbl[["n"]]
    #> [1]  1 NA  3 NA

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
Unlike data frames, tibbles do not partially match names. Because `df$x`
is rarely used in packages, it can raise a warning:

<table class="dftbl">
<tbody>
<tr style="vertical-align:top">
<td>
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

### Definition of `x[j]`

`j` is converted to an integer vector by
`vec_as_index(j, ncol(x), names = names(x))`. Then
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
    #> 2    NA f    
    #> 3     3 g    
    #> 4    NA h

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
    #>    n n.1
    #> 1  1   1
    #> 2 NA  NA
    #> 3  3   3
    #> 4 NA  NA

</td>
<td>
    tbl[c(1, 1)]
    #> # A tibble: 4 x 2
    #>       n     n
    #>   <int> <int>
    #> 1     1     1
    #> 2    NA    NA
    #> 3     3     3
    #> 4    NA    NA

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
Tibbles support indexing by a logical matrix, but only if all values in
the returned vector are compatible.

<table class="dftbl">
<tbody>
<tr style="vertical-align:top">
<td>
    df[is.na(df)]
    #> [[1]]
    #> [1] NA
    #> 
    #> [[2]]
    #> [1] NA

</td>
<td>
    tbl[is.na(tbl)]
    #> [1] NA NA

</td>
</tr>
<tr style="vertical-align:top">
<td>
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

</td>
<td>
    tbl[!is.na(tbl)]

    #> Error: No common type for `n` <integer>
    #> and `c` <character>.

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
    #> [1]  1 NA  3 NA

</td>
<td>
    tbl[, 1]
    #> # A tibble: 4 x 1
    #>       n
    #>   <int>
    #> 1     1
    #> 2    NA
    #> 3     3
    #> 4    NA

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
    #> 2    NA f    
    #> 3     3 g    
    #> 4    NA h

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
    #> [1]  1 NA  3 NA

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

    #> Error in xj[i]: invalid subscript type
    #> 'closure'

</td>
<td>
    tbl[mean, ]

    #> Error: Must subset elements with a valid
    #> subscript vector.
    #> [31mx[39m The subscript has the wrong type
    #> `closure`.
    #> [34mℹ[39m It must be logical, numeric, or
    #> character.

</td>
</tr>
<tr style="vertical-align:top">
<td>
    df[list(1), ]

    #> Error in xj[i]: invalid subscript type
    #> 'list'

</td>
<td>
    tbl[list(1), ]

    #> Error: Must subset elements with a valid
    #> subscript vector.
    #> [31mx[39m The subscript has the wrong type
    #> `list`.
    #> [34mℹ[39m It must be logical, numeric, or
    #> character.

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

    #> Warning: The `i` argument of
    #> ``[.tbl_df`()` if integer must be
    #> between 0 and the number of rows as of
    #> tibble 3.0.0.
    #> Use `NA` as row index to obtain a row
    #> full of `NA` values.

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

    #> Warning: The `i` argument of
    #> ``[.tbl_df`()` must use valid row names
    #> as of tibble 3.0.0.
    #> Use `NA` as row index to obtain a row
    #> full of `NA` values.

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

    #> Error: Must subset elements with a valid
    #> subscript vector.
    #> [34mℹ[39m Logical subscripts must match the size
    #> of the indexed input.
    #> [31mx[39m The input has size 4 but the subscript
    #> has size 2.

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

NB: `vec_size(x[[i, j]])` always equals 1. Unlike `x[i, ]`, `x[[i, ]]`
is not valid.

Column update
-------------

### Definition of `x[[j]] <- a`

If `a` is a vector then `x[[j]] <- a` replaces the `j`th column with
value `a`.

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
    #> 2    NA f         3
    #> 3     3 g         2
    #> 4    NA h         1

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
    #> 2    NA f     <int [2]>     3
    #> 3     3 g     <int [3]>     2
    #> 4    NA h     <chr [1]>     1

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
    #> 2    NA     0 <int [2]>
    #> 3     3     0 <int [3]>
    #> 4    NA     0 <chr [1]>

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

    #> Error: Must use a scalar in `[[`.

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

    #> Error: Must use a scalar in `[[`.

</td>
</tr>
<tr style="vertical-align:top">
<td>
    with_df(df[[c("n", "c")]] <- 0)

    #> Error in x[[i]] <- value: more elements
    #> supplied than there are to replace

</td>
<td>
    with_tbl(tbl[[c("n", "c")]] <- 0)

    #> Error: Must use a scalar in `[[`.

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

    #> Error: Must use a scalar in `[[`.

</td>
</tr>
<tr style="vertical-align:top">
<td>
    with_df(df[[1:2]] <- 0)

    #> Error in x[[i]] <- value: more elements
    #> supplied than there are to replace

</td>
<td>
    with_tbl(tbl[[1:2]] <- 0)

    #> Error: Must use a scalar in `[[`.

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

    #> Error: Can't use NA as column index in a
    #> tibble for assignment.

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

    #> Error: Can't use NA as column index in a
    #> tibble for assignment.

</td>
</tr>
<tr style="vertical-align:top">
<td>
    with_df(df[[NA_character_]] <- 0)

    #> Error in if (names(x)[nc] == "")
    #> names(x)[nc] <- paste0("V", nc): missing
    #> value where TRUE/FALSE needed

</td>
<td>
    with_tbl(tbl[[NA_character_]] <- 0)

    #> Error: Can't use NA as column index in a
    #> tibble for assignment.

</td>
</tr>
</tbody>
</table>
`a` is recycled to the same size as `x` so must have size `nrow(x)` or
1. (The only exception is when `a` is `NULL`, as described below.)
Recycling also works for list, data frame, and matrix columns.

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
    #> 2    NA f     <dbl [1]>
    #> 3     3 g     <dbl [1]>
    #> 4    NA h     <dbl [1]>

</td>
</tr>
<tr style="vertical-align:top">
<td>
    with_df2(df2[["tb"]] <- df[1, ])

    #> Error in `[[<-.data.frame`(`*tmp*`,
    #> "tb", value = structure(list(n = 1L, :
    #> replacement has 1 row, data has 4

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

    #> Error in `[[<-.data.frame`(`*tmp*`, "m",
    #> value = structure(c(1, 0, 0, :
    #> replacement has 1 row, data has 4

</td>
<td>
    with_tbl2(tbl2[["m"]] <- tbl2[["m"]][1, , drop = FALSE])
    #> # A tibble: 4 x 2
    #>    tb$n $c    $li      m[,1]  [,2]  [,3]
    #>   <int> <chr> <list>   <dbl> <dbl> <dbl>
    #> 1     1 e     <dbl [1…     1     0     0
    #> 2    NA f     <int [2…     1     0     0
    #> 3     3 g     <int [3…     1     0     0
    #> 4    NA h     <chr [1…     1     0     0
    #> # … with 1 more variable: [,4] <dbl>

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

    #> Error in `[[<-.data.frame`(`*tmp*`, 1,
    #> value = 3:1): replacement has 3 rows,
    #> data has 4

</td>
<td>
    with_tbl(tbl[[1]] <- 3:1)

    #> Error: Tibble columns must have
    #> consistent sizes, only values of size
    #> one are recycled:
    #> * Size 4: Existing data
    #> * Size 3: Column `n`

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

    #> Error: Tibble columns must have
    #> consistent sizes, only values of size
    #> one are recycled:
    #> * Size 4: Existing data
    #> * Size 2: Column `n`

</td>
</tr>
</tbody>
</table>
`j` must be a scalar numeric or a string, and cannot be `NA`. If `j` is
OOB, a new column is added on the right hand side, with name repair if
needed.

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
    #> 2    NA f     <int [2]>     0
    #> 3     3 g     <int [3]>     0
    #> 4    NA h     <chr [1]>     0

</td>
</tr>
<tr style="vertical-align:top">
<td>
    with_df(df[[4]] <- 0)
    #>    n c         li V4
    #> 1  1 e          9  0
    #> 2 NA f     10, 11  0
    #> 3  3 g 12, 13, 14  0
    #> 4 NA h       text  0

</td>
<td>
    with_tbl(tbl[[4]] <- 0)
    #> # A tibble: 4 x 4
    #>       n c     li         ...4
    #>   <int> <chr> <list>    <dbl>
    #> 1     1 e     <dbl [1]>     0
    #> 2    NA f     <int [2]>     0
    #> 3     3 g     <int [3]>     0
    #> 4    NA h     <chr [1]>     0

</td>
</tr>
<tr style="vertical-align:top">
<td>
    with_df(df[[5]] <- 0)

    #> Warning in format.data.frame(if (omit)
    #> x[seq_len(n0), , drop = FALSE] else
    #> x, : corrupt data frame: columns will be
    #> truncated or padded with NAs

    #>    n c         li      V5
    #> 1  1 e          9 NULL  0
    #> 2 NA f     10, 11 <NA>  0
    #> 3  3 g 12, 13, 14 <NA>  0
    #> 4 NA h       text <NA>  0

</td>
<td>
    with_tbl(tbl[[5]] <- 0)

    #> Error: Can't assign column 5 in a tibble
    #> with 3 columns.

</td>
</tr>
</tbody>
</table>
<!-- HW: should we permitted oob assignment with numeric j? It's a bit weird to create a column with unknonw column -->
`df[[j]] <- a` replaces the complete column so can change the type.

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
    #> 2    NA <int [2]> <int [2]>
    #> 3     3 <int [3]> <int [3]>
    #> 4    NA <chr [1]> <chr [1]>

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
    #> 2    NA f        NA f     <int [2]>
    #> 3     3 g         3 g     <int [3]>
    #> 4    NA h        NA h     <chr [1]>

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
    #> 2    NA f     <int [2]>    NA
    #> 3     3 g     <int [3]>     3
    #> 4    NA h     <chr [1]>    NA

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
    #> 2    NA f     <int [2]>
    #> 3     3 g     <int [3]>
    #> 4    NA h     <chr [1]>

</td>
</tr>
</tbody>
</table>
Removing a nonexistent column is a no-op.

<table class="dftbl">
<tbody>
<tr style="vertical-align:top">
<td>
</td>
<td>
    with_tbl(tbl[["q"]] <- NULL)
    #> # A tibble: 4 x 3
    #>       n c     li       
    #>   <int> <chr> <list>   
    #> 1     1 e     <dbl [1]>
    #> 2    NA f     <int [2]>
    #> 3     3 g     <int [3]>
    #> 4    NA h     <chr [1]>

</td>
</tr>
</tbody>
</table>
### Definition of `x$name <- a`

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
<table class="dftbl">
<tbody>
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
</tbody>
</table>
`$<-` does not perform partial matching.

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
    #> 2    NA f     <int [2]>     0
    #> 3     3 g     <int [3]>     0
    #> 4    NA h     <chr [1]>     0

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
    #> 2    NA f     <int [2]>     0
    #> 3     3 g     <int [3]>     0
    #> 4    NA h     <chr [1]>     0

</td>
</tr>
</tbody>
</table>
Column subassignment: `x[j] <- a`
---------------------------------

-   If `j` is missing, it’s replaced with `seq_along(x)`
-   If `j` is logical vector, it’s converted to numeric with
    `seq_along(x)[j]`.

### `a` is a list or data frame

If `inherits(a, "list")` or `inherits(a, "data.frame")` is `TRUE`, then
`x[j] <- a` is equivalent to `x[[j[[1]]] <- a[[1]]`,
`x[[j[[2]]]] <- a[[2]]`, …

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
    #> 2    NA x         3
    #> 3     3 x         2
    #> 4    NA x         1

</td>
</tr>
</tbody>
</table>
If `length(a)` equals 1, then it is recycled to the same length as `j`.

<table class="dftbl">
<tbody>
<tr style="vertical-align:top">
<td>
</td>
<td>
    with_tbl(tbl[1:2] <- list(1))
    #> # A tibble: 4 x 3
    #>       n     c li       
    #>   <dbl> <dbl> <list>   
    #> 1     1     1 <dbl [1]>
    #> 2     1     1 <int [2]>
    #> 3     1     1 <int [3]>
    #> 4     1     1 <chr [1]>

</td>
</tr>
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

    #> Error: `x` can't be recycled to size 2.
    #> [31mx[39m It must be size 2 or 1, not 3.

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

    #> Error: `x` can't be recycled to size 3.
    #> [31mx[39m It must be size 3 or 1, not 2.

</td>
</tr>
</tbody>
</table>
An attempt to update the same column twice gives an error.

<table class="dftbl">
<tbody>
<tr style="vertical-align:top">
<td>
    with_df(df[c(1, 1)] <- list(1, 2))

    #> Error in `[<-.data.frame`(`*tmp*`, c(1,
    #> 1), value = list(1, 2)): duplicate
    #> subscripts for columns

</td>
<td>
    with_tbl(tbl[c(1, 1)] <- list(1, 2))

    #> Error: Column index 1 is used more than
    #> once for assignment.

</td>
</tr>
</tbody>
</table>
If `a` contains `NULL` values, the corresponding columns are removed
*after* updating (i.e. position indexes refer to columns before any
modifications).

<table class="dftbl">
<tbody>
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

    #> Error in `[<-.data.frame`(`*tmp*`, NA,
    #> value = list("x")): missing values are
    #> not allowed in subscripted assignments
    #> of data frames

</td>
<td>
    with_tbl(tbl[NA] <- list("x"))

    #> Error: Can't use NA as column index in a
    #> tibble for assignment.

</td>
</tr>
<tr style="vertical-align:top">
<td>
    with_df(df[NA_integer_] <- list("x"))

    #> Error in `[<-.data.frame`(`*tmp*`,
    #> NA_integer_, value = list("x")): missing
    #> values are not allowed in subscripted
    #> assignments of data frames

</td>
<td>
    with_tbl(tbl[NA_integer_] <- list("x"))

    #> Error: Can't use NA as column index in a
    #> tibble for assignment.

</td>
</tr>
<tr style="vertical-align:top">
<td>
    with_df(df[NA_character_] <- list("x"))

    #> Error in `[<-.data.frame`(`*tmp*`,
    #> NA_character_, value = list("x")):
    #> missing values are not allowed in
    #> subscripted assignments of data frames

</td>
<td>
    with_tbl(tbl[NA_character_] <- list("x"))

    #> Error: Can't use NA as column index in a
    #> tibble for assignment.

</td>
</tr>
</tbody>
</table>
Just like column updates, `[<-` supports changing the type of an
existing column.

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
    #> 2    NA <int [2]> <int [2]>
    #> 3     3 <int [3]> <int [3]>
    #> 4    NA <chr [1]> <chr [1]>

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
    #> 2    NA f        NA f     <int [2]>
    #> 3     3 g         3 g     <int [3]>
    #> 4    NA h        NA h     <chr [1]>

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
    #> 2    NA f     <int [2]>    NA
    #> 3     3 g     <int [3]>     3
    #> 4    NA h     <chr [1]>    NA

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
    #> 2    NA f     <int [2]> x         3
    #> 3     3 g     <int [3]> x         2
    #> 4    NA h     <chr [1]> x         1

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
    #> 2    NA f     x         3
    #> 3     3 g     x         2
    #> 4    NA h     x         1

</td>
</tr>
<tr style="vertical-align:top">
<td>
    with_df(df[4] <- list(4:1))
    #>    n c         li V4
    #> 1  1 e          9  4
    #> 2 NA f     10, 11  3
    #> 3  3 g 12, 13, 14  2
    #> 4 NA h       text  1

</td>
<td>
    with_tbl(tbl[4] <- list(4:1))
    #> # A tibble: 4 x 4
    #>       n c     li         ...4
    #>   <int> <chr> <list>    <int>
    #> 1     1 e     <dbl [1]>     4
    #> 2    NA f     <int [2]>     3
    #> 3     3 g     <int [3]>     2
    #> 4    NA h     <chr [1]>     1

</td>
</tr>
<tr style="vertical-align:top">
<td>
    with_df(df[5] <- list(4:1))

    #> Error in `[<-.data.frame`(`*tmp*`, 5,
    #> value = list(4:1)): new columns would
    #> leave holes after existing columns

</td>
<td>
    with_tbl(tbl[5] <- list(4:1))

    #> Error: Can't assign column 5 in a tibble
    #> with 3 columns.

</td>
</tr>
</tbody>
</table>
Tibbles support indexing by a logical matrix, but only for a scalar RHS,
and if all columns updated are compatible with the value assigned.

<table class="dftbl">
<tbody>
<tr style="vertical-align:top">
<td>
    with_df(df[is.na(df)] <- 4)
    #>   n c         li
    #> 1 1 e          9
    #> 2 4 f     10, 11
    #> 3 3 g 12, 13, 14
    #> 4 4 h       text

</td>
<td>
    with_tbl(tbl[is.na(tbl)] <- 4)
    #> # A tibble: 4 x 3
    #>       n c     li       
    #>   <int> <chr> <list>   
    #> 1     1 e     <dbl [1]>
    #> 2     4 f     <int [2]>
    #> 3     3 g     <int [3]>
    #> 4     4 h     <chr [1]>

</td>
</tr>
<tr style="vertical-align:top">
<td>
    with_df(df[is.na(df)] <- 1:2)
    #>   n c         li
    #> 1 1 e          9
    #> 2 1 f     10, 11
    #> 3 3 g 12, 13, 14
    #> 4 2 h       text

</td>
<td>
    with_tbl(tbl[is.na(tbl)] <- 1:2)

    #> Error in tbl_subassign_matrix(x, j,
    #> value): vec_size(value) == 1 is not TRUE

</td>
</tr>
<tr style="vertical-align:top">
<td>
    with_df(df[matrix(c(rep(TRUE, 5), rep(FALSE, 7)), ncol = 3)] <- 4)
    #>   n c         li
    #> 1 4 4          9
    #> 2 4 f     10, 11
    #> 3 4 g 12, 13, 14
    #> 4 4 h       text

</td>
<td>
    with_tbl(tbl[matrix(c(rep(TRUE, 5), rep(FALSE, 7)), ncol = 3)] <- 4)

    #> Error: No common type for `value`
    #> <double> and `x` <character>.

</td>
</tr>
</tbody>
</table>
### `a` is another type of vector

If `vec_is(a)`, then `x[j] <- a` is equivalent to `x[j] <- list(a)`.
This is primarily provided for backward compatbility.

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
</tbody>
</table>
Matrices are vectors, so they are also wrapped in `list()` before
assignment. This consistently creates matrix columns, unlike data
frames, which creates matrix columns when assigning to one column, but
treats the matrix like a data frame when assigning to more than one
column.

<table class="dftbl">
<tbody>
<tr style="vertical-align:top">
<td>
</td>
<td>
    with_tbl(tbl[1] <- matrix(1:8, ncol = 2))
    #> # A tibble: 4 x 3
    #>   n[,1]  [,2] c     li       
    #>   <int> <int> <chr> <list>   
    #> 1     1     5 e     <dbl [1]>
    #> 2     2     6 f     <int [2]>
    #> 3     3     7 g     <int [3]>
    #> 4     4     8 h     <chr [1]>

</td>
</tr>
<tr style="vertical-align:top">
<td>
</td>
<td>
</td>
</tr>
<tr style="vertical-align:top">
<td>
    with_df(df[c(1, 2)] <- matrix(1:8, ncol = 2))
    #>   n c         li
    #> 1 1 5          9
    #> 2 2 6     10, 11
    #> 3 3 7 12, 13, 14
    #> 4 4 8       text

</td>
<td>
    with_tbl(tbl[c(1, 2)] <- matrix(1:8, ncol = 2))
    #> # A tibble: 4 x 3
    #>   n[,1]  [,2] c[,1]  [,2] li       
    #>   <int> <int> <int> <int> <list>   
    #> 1     1     5     1     5 <dbl [1]>
    #> 2     2     6     2     6 <int [2]>
    #> 3     3     7     3     7 <int [3]>
    #> 4     4     8     4     8 <chr [1]>

</td>
</tr>
</tbody>
</table>
### `a` is not a vector

Any other type for `a` is an error. Note that if `is.list(a)` is `TRUE`,
but `inherits(a, "list")` is `FALSE`, then `a` is considered to be a
scalar. See `?vec_is` and `?vec_proxy` for details.

<table class="dftbl">
<tbody>
<tr style="vertical-align:top">
<td>
    with_df(df[1] <- mean)

    #> Error in rep(value, length.out = n):
    #> attempt to replicate an object of type
    #> 'closure'

</td>
<td>
    with_tbl(tbl[1] <- mean)

    #> Error in tbl_subassign(x, i, j, value):
    #> is_bare_list(value) is not TRUE

</td>
</tr>
<tr style="vertical-align:top">
<td>
    with_df(df[1] <- lm(mpg ~ wt, data = mtcars))

    #> Warning in `[<-.data.frame`(`*tmp*`,
    #> 1, value = structure(list(coefficients
    #> = c(`(Intercept)` = 37.285126167342, :
    #> replacement element 2 has 32 rows to
    #> replace 4 rows

    #> Warning in `[<-.data.frame`(`*tmp*`,
    #> 1, value = structure(list(coefficients
    #> = c(`(Intercept)` = 37.285126167342, :
    #> replacement element 3 has 32 rows to
    #> replace 4 rows

    #> Warning in `[<-.data.frame`(`*tmp*`,
    #> 1, value = structure(list(coefficients
    #> = c(`(Intercept)` = 37.285126167342, :
    #> replacement element 5 has 32 rows to
    #> replace 4 rows

    #> Warning in `[<-.data.frame`(`*tmp*`,
    #> 1, value = structure(list(coefficients
    #> = c(`(Intercept)` = 37.285126167342, :
    #> replacement element 7 has 5 rows to
    #> replace 4 rows

    #> Error in `[<-.data.frame`(`*tmp*`, 1,
    #> value = structure(list(coefficients =
    #> c(`(Intercept)` = 37.285126167342, :
    #> replacement element 10 has 3 rows, need
    #> 4

</td>
<td>
    with_tbl(tbl[1] <- lm(mpg ~ wt, data = mtcars))

    #> Error: `x` can't be recycled to size 1.
    #> [31mx[39m It must be size 1, not 12.

</td>
</tr>
</tbody>
</table>
<!-- HW: we need better error messages for these cases -->
Row subassignment: `x[i, ] <- list(...)`
----------------------------------------

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
    #> 4    NA h     <chr [1]>

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
    #> 4    NA h     <chr [1]>

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
    #> 4    NA h     <chr [1]>

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
    #> 2    NA f     <int [2]>
    #> 3     3 g     <int [3]>
    #> 4    NA h     <chr [1]>

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
    #> 2    NA f     <int [2]>
    #> 3     1 e     <dbl [1]>
    #> 4     1 e     <dbl [1]>

</td>
</tr>
<tr style="vertical-align:top">
<td>
    with_df(df[-1:2, ] <- df[1, ])

    #> Error in seq_len(nrows)[i]: only 0's may
    #> be mixed with negative subscripts

</td>
<td>
    with_tbl(tbl[-1:2, ] <- tbl[1, ])

    #> Error: Must subset elements with a valid
    #> subscript vector.
    #> [31mx[39m Negative locations can't be mixed with
    #> positive locations.
    #> [34mℹ[39m The subscript has 2 positive values at
    #> locations 3 and 4.

</td>
</tr>
<tr style="vertical-align:top">
<td>
    with_df(df[NA_integer_, ] <- df[1, ])

    #> Error in `[<-.data.frame`(`*tmp*`,
    #> NA_integer_, , value = structure(list(:
    #> missing values are not allowed in
    #> subscripted assignments of data frames

</td>
<td>
    with_tbl(tbl[NA_integer_, ] <- tbl[1, ])

    #> Error: Can't use NA as row index in a
    #> tibble for assignment.

</td>
</tr>
<tr style="vertical-align:top">
<td>
    with_df2(df2[NA_integer_, ] <- df2[1, ])

    #> Error in `[<-.data.frame`(`*tmp*`,
    #> NA_integer_, , value = structure(list(:
    #> missing values are not allowed in
    #> subscripted assignments of data frames

</td>
<td>
    with_tbl2(tbl2[NA_integer_, ] <- tbl2[1, ])

    #> Error: Can't use NA as row index in a
    #> tibble for assignment.

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
    #> 2    NA f     <int [2]>
    #> 3     3 g     <int [3]>
    #> 4    NA h     <chr [1]>

</td>
</tr>
<tr style="vertical-align:top">
<td>
    with_df(df[NA, ] <- df[1, ])

    #> Error in `[<-.data.frame`(`*tmp*`, NA, ,
    #> value = structure(list(n = 1L, : missing
    #> values are not allowed in subscripted
    #> assignments of data frames

</td>
<td>
    with_tbl(tbl[NA, ] <- tbl[1, ])

    #> Error: Can't use NA as row index in a
    #> tibble for assignment.

</td>
</tr>
</tbody>
</table>
Only values of size one can be recycled.

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
    #> 4    NA h     <chr [1]>

</td>
</tr>
<tr style="vertical-align:top">
<td>
</td>
<td>
    with_tbl(tbl[2:3, ] <- list(tbl$n[1], tbl$c[1:2], tbl$li[1]))
    #> # A tibble: 4 x 3
    #>       n c     li       
    #>   <int> <chr> <list>   
    #> 1     1 e     <dbl [1]>
    #> 2     1 e     <dbl [1]>
    #> 3     1 f     <dbl [1]>
    #> 4    NA h     <chr [1]>

</td>
</tr>
<tr style="vertical-align:top">
<td>
    with_df(df[2:4, ] <- df[1:2, ])

    #> Error in `[<-.data.frame`(`*tmp*`, 2:4,
    #> , value = structure(list(n = c(1L, :
    #> replacement element 1 has 2 rows, need 3

</td>
<td>
    with_tbl(tbl[2:4, ] <- tbl[1:2, ])

    #> Error: `value` can't be recycled to size
    #> 3.
    #> [31mx[39m It must be size 3 or 1, not 2.

</td>
</tr>
</tbody>
</table>
<table class="dftbl">
<tbody>
<tr style="vertical-align:top">
<td>
    with_df2(df2[2:4, ] <- df2[1, ])

    #> Error in `[<-.data.frame`(`*tmp*`, 2:4,
    #> , value = structure(list(tb =
    #> structure(list(: replacement element 1
    #> is a matrix/data frame of 1 row, need 3

</td>
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
</tr>
<tr style="vertical-align:top">
<td>
    with_df2(df2[2:4, ] <- df2[2:3, ])

    #> Error in `[<-.data.frame`(`*tmp*`, 2:4,
    #> , value = structure(list(tb =
    #> structure(list(: replacement element 1
    #> is a matrix/data frame of 2 rows, need 3

</td>
<td>
    with_tbl2(tbl2[2:4, ] <- tbl2[2:3, ])

    #> Error: `value` can't be recycled to size
    #> 3.
    #> [31mx[39m It must be size 3 or 1, not 2.

</td>
</tr>
</tbody>
</table>
For compatibility, only a warning is issued for indexing beyond the
number of rows. Appending rows right at the end of the existing data is
supported, without warning.

<table class="dftbl">
<tbody>
<tr style="vertical-align:top">
<td>
</td>
<td>
    with_tbl(tbl[5, ] <- tbl[1, ])
    #> # A tibble: 5 x 3
    #>       n c     li       
    #>   <int> <chr> <list>   
    #> 1     1 e     <dbl [1]>
    #> 2    NA f     <int [2]>
    #> 3     3 g     <int [3]>
    #> 4    NA h     <chr [1]>
    #> 5     1 e     <dbl [1]>

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
    #> 2    NA f     <int [2]>
    #> 3     3 g     <int [3]>
    #> 4    NA h     <chr [1]>
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
    #> 2 NA    f     10, 11
    #> 3  3    g 12, 13, 14
    #> 4 NA    h       text
    #> 5 NA <NA>       NULL
    #> 6  1    e          9

</td>
<td>
    with_tbl(tbl[6, ] <- tbl[1, ])

    #> Error: Can't assign row 6 in a tibble
    #> with 4 rows.

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

    #> Error: Can't negate elements that don't
    #> exist.
    #> [31mx[39m The location 5 doesn't exist.
    #> [34mℹ[39m There are only 4 elements.

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

    #> Error: Can't negate elements that don't
    #> exist.
    #> [31mx[39m The locations 5, 6, and 7 don't exist.
    #> [34mℹ[39m There are only 4 elements.

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

    #> Error: Can't negate elements that don't
    #> exist.
    #> [31mx[39m The location 6 doesn't exist.
    #> [34mℹ[39m There are only 4 elements.

</td>
</tr>
</tbody>
</table>
For compatibility, `i` can also be a character vector containing
positive numbers.

<table class="dftbl">
<tbody>
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
    #> 4    NA h     <chr [1]>

</td>
</tr>
</tbody>
</table>
<table class="dftbl">
<tbody>
<tr style="vertical-align:top">
<td>
    with_df(df[as.character(-(1:3)), ] <- df[1, ])
    #>     n c         li
    #> 1   1 e          9
    #> 2  NA f     10, 11
    #> 3   3 g 12, 13, 14
    #> 4  NA h       text
    #> -1  1 e          9
    #> -2  1 e          9
    #> -3  1 e          9

</td>
<td>
    with_tbl(tbl[as.character(-(1:3)), ] <- tbl[1, ])

    #> Warning: The `i` argument of
    #> ``[.tbl_df`()` must use valid row names
    #> as of tibble 3.0.0.
    #> Use `NA` as row index to obtain a row
    #> full of `NA` values.

    #> Error: Can't use NA as row index in a
    #> tibble for assignment.

</td>
</tr>
<tr style="vertical-align:top">
<td>
    with_df(df[as.character(3:5), ] <- df[1, ])
    #>    n c     li
    #> 1  1 e      9
    #> 2 NA f 10, 11
    #> 3  1 e      9
    #> 4  1 e      9
    #> 5  1 e      9

</td>
<td>
    with_tbl(tbl[as.character(3:5), ] <- tbl[1, ])

    #> Warning: The `i` argument of
    #> ``[.tbl_df`()` must use valid row names
    #> as of tibble 3.0.0.
    #> Use `NA` as row index to obtain a row
    #> full of `NA` values.

    #> Error: Can't use NA as row index in a
    #> tibble for assignment.

</td>
</tr>
<tr style="vertical-align:top">
<td>
    with_df(df[as.character(-(3:5)), ] <- df[1, ])
    #>     n c         li
    #> 1   1 e          9
    #> 2  NA f     10, 11
    #> 3   3 g 12, 13, 14
    #> 4  NA h       text
    #> -3  1 e          9
    #> -4  1 e          9
    #> -5  1 e          9

</td>
<td>
    with_tbl(tbl[as.character(-(3:5)), ] <- tbl[1, ])

    #> Warning: The `i` argument of
    #> ``[.tbl_df`()` must use valid row names
    #> as of tibble 3.0.0.
    #> Use `NA` as row index to obtain a row
    #> full of `NA` values.

    #> Error: Can't use NA as row index in a
    #> tibble for assignment.

</td>
</tr>
<tr style="vertical-align:top">
<td>
    with_df(df[NA_character_, ] <- df[1, ])

    #> Error in `[<-.data.frame`(`*tmp*`,
    #> NA_character_, , value =
    #> structure(list(: missing values are not
    #> allowed in subscripted assignments of
    #> data frames

</td>
<td>
    with_tbl(tbl[NA_character_, ] <- tbl[1, ])

    #> Error: Can't use NA as row index in a
    #> tibble for assignment.

</td>
</tr>
</tbody>
</table>
Row and column subassignment
----------------------------

### Definition of `x[i, j] <- a`

`x[i, j] <- a` is equivalent to `x[i, ][j] <- a`.[8]

Subassignment to `x[i, j]` is stricter for tibbles than for data frames.
`x[i, j] <- a` can’t change the data type of existing columns.

<table class="dftbl">
<tbody>
<tr style="vertical-align:top">
<td>
    with_df(df[2:3, 1] <- df[1:2, 2])
    #>      n c         li
    #> 1    1 e          9
    #> 2    e f     10, 11
    #> 3    f g 12, 13, 14
    #> 4 <NA> h       text

</td>
<td>
    with_tbl(tbl[2:3, 1] <- tbl[1:2, 2])

    #> Error: No common type for `value`
    #> <character> and `x` <integer>.

</td>
</tr>
<tr style="vertical-align:top">
<td>
    with_df(df[2:3, 2] <- df[1:2, 3])

    #> Warning in `[<-.data.frame`(`*tmp*`,
    #> 2:3, 2, value = list(9, 10:11)):
    #> provided 2 variables to replace 1
    #> variables

    #>    n c         li
    #> 1  1 e          9
    #> 2 NA 9     10, 11
    #> 3  3 9 12, 13, 14
    #> 4 NA h       text

</td>
<td>
    with_tbl(tbl[2:3, 2] <- tbl[1:2, 3])

    #> Error: No common type for `value` <list>
    #> and `x` <character>.

</td>
</tr>
<tr style="vertical-align:top">
<td>
    with_df(df[2:3, 3] <- df2[1:2, 1])

    #> Warning in `[<-.data.frame`(`*tmp*`,
    #> 2:3, 3, value = structure(list(n =
    #> c(1L, : provided 3 variables to replace
    #> 1 variables

    #>    n c   li
    #> 1  1 e    9
    #> 2 NA f    1
    #> 3  3 g   NA
    #> 4 NA h text

</td>
<td>
    with_tbl(tbl[2:3, 3] <- tbl2[1:2, 1])

    #> Error: No common type for `value`
    #> <tbl_df<
    #> n : integer
    #> c : character
    #> li: list
    #> >> and `x` <list>.

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
    #> 4   NA    h  text   0   0   0   1

</td>
<td>
    with_tbl2(tbl2[2:3, 1] <- tbl2[1:2, 2])

    #> Error: No common type for `value`
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
    #> 2    NA f     <int [2…     1     1     1
    #> 3     3 g     <int [3…    NA    NA    NA
    #> 4    NA h     <chr [1…     0     0     0
    #> # … with 1 more variable: [,4] <dbl>

</td>
</tr>
</tbody>
</table>
This means that columns initialized with `NA` (which is a logical)
cannot be later filled with values of a different type. Use the correct
type of `NA` to initialize columns.

<table class="dftbl">
<tbody>
<tr style="vertical-align:top">
<td>
    with_df({df$x <- NA; df[2:3, "x"] <- 3:2})
    #>    n c         li  x
    #> 1  1 e          9 NA
    #> 2 NA f     10, 11  3
    #> 3  3 g 12, 13, 14  2
    #> 4 NA h       text NA

</td>
<td>
    with_tbl({tbl$x <- NA; tbl[2:3, "x"] <- 3:2})

    #> Error: Lossy cast from `value` <integer>
    #> to `x` <logical>.
    #> * Locations: 1, 2

</td>
</tr>
<tr style="vertical-align:top">
<td>
</td>
<td>
    with_tbl({tbl$x <- NA_integer_; tbl[2:3, "x"] <- 3:2})
    #> # A tibble: 4 x 4
    #>       n c     li            x
    #>   <int> <chr> <list>    <int>
    #> 1     1 e     <dbl [1]>    NA
    #> 2    NA f     <int [2]>     3
    #> 3     3 g     <int [3]>     2
    #> 4    NA h     <chr [1]>    NA

</td>
</tr>
</tbody>
</table>
For new columns, `x[i, j] <- a` fills the unassigned rows with `NA`.

<table class="dftbl">
<tbody>
<tr style="vertical-align:top">
<td>
    with_df(df[2:3, "n"] <- 1)
    #>    n c         li
    #> 1  1 e          9
    #> 2  1 f     10, 11
    #> 3  1 g 12, 13, 14
    #> 4 NA h       text

</td>
<td>
    with_tbl(tbl[2:3, "n"] <- 1)
    #> # A tibble: 4 x 3
    #>       n c     li       
    #>   <int> <chr> <list>   
    #> 1     1 e     <dbl [1]>
    #> 2     1 f     <int [2]>
    #> 3     1 g     <int [3]>
    #> 4    NA h     <chr [1]>

</td>
</tr>
<tr style="vertical-align:top">
<td>
</td>
<td>
    with_tbl(tbl[2:3, "x"] <- 1)
    #> # A tibble: 4 x 4
    #>       n c     li            x
    #>   <int> <chr> <list>    <dbl>
    #> 1     1 e     <dbl [1]>    NA
    #> 2    NA f     <int [2]>     1
    #> 3     3 g     <int [3]>     1
    #> 4    NA h     <chr [1]>    NA

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

    #> Error: `value` must be a vector, not
    #> NULL.

</td>
</tr>
</tbody>
</table>
Likewise, for new rows, `x[i, j] <- a` fills the unassigned columns with
`NA`.

<table class="dftbl">
<tbody>
<tr style="vertical-align:top">
<td>
</td>
<td>
    with_tbl(tbl[5, "n"] <- list(0L))
    #> # A tibble: 5 x 3
    #>       n c     li       
    #>   <int> <chr> <list>   
    #> 1     1 e     <dbl [1]>
    #> 2    NA f     <int [2]>
    #> 3     3 g     <int [3]>
    #> 4    NA h     <chr [1]>
    #> 5     0 <NA>  <NULL>

</td>
</tr>
</tbody>
</table>
### Definition of `x[[i, j]] <- a`

`i` must be a numeric vector of length 1. `x[[i, j]] <- a` is equivalent
to `x[i, ][[j]] <- a`.[9]

<table class="dftbl">
<tbody>
<tr style="vertical-align:top">
<td>
    with_df(df[[1, 1]] <- 0)
    #>    n c         li
    #> 1  0 e          9
    #> 2 NA f     10, 11
    #> 3  3 g 12, 13, 14
    #> 4 NA h       text

</td>
<td>
    with_tbl(tbl[[1, 1]] <- 0)
    #> # A tibble: 4 x 3
    #>       n c     li       
    #>   <int> <chr> <list>   
    #> 1     0 e     <dbl [1]>
    #> 2    NA f     <int [2]>
    #> 3     3 g     <int [3]>
    #> 4    NA h     <chr [1]>

</td>
</tr>
<tr style="vertical-align:top">
<td>
    with_df(df[1, ][[1]] <- 0)
    #>    n c         li
    #> 1  0 e          9
    #> 2 NA f     10, 11
    #> 3  3 g 12, 13, 14
    #> 4 NA h       text

</td>
<td>
    with_tbl(tbl[1, ][[1]] <- 0)
    #> # A tibble: 4 x 3
    #>       n c     li       
    #>   <int> <chr> <list>   
    #> 1     0 e     <dbl [1]>
    #> 2    NA f     <int [2]>
    #> 3     3 g     <int [3]>
    #> 4    NA h     <chr [1]>

</td>
</tr>
<tr style="vertical-align:top">
<td>
    with_df(df[[1, 3]] <- list(NULL))
    #>    n c         li
    #> 1  1 e       NULL
    #> 2 NA f     10, 11
    #> 3  3 g 12, 13, 14
    #> 4 NA h       text

</td>
<td>
    with_tbl(tbl[[1, 3]] <- list(NULL))
    #> # A tibble: 4 x 3
    #>       n c     li       
    #>   <int> <chr> <list>   
    #> 1     1 e     <NULL>   
    #> 2    NA f     <int [2]>
    #> 3     3 g     <int [3]>
    #> 4    NA h     <chr [1]>

</td>
</tr>
<tr style="vertical-align:top">
<td>
</td>
<td>
    with_tbl(tbl[1, ][[3]] <- list(NULL))
    #> # A tibble: 4 x 3
    #>       n c     li       
    #>   <int> <chr> <list>   
    #> 1     1 e     <NULL>   
    #> 2    NA f     <int [2]>
    #> 3     3 g     <int [3]>
    #> 4    NA h     <chr [1]>

</td>
</tr>
<tr style="vertical-align:top">
<td>
    with_df2(df2[[1, 1]] <- df[1, ])

    #> Error in `[[<-.data.frame`(`*tmp*`,
    #> iseq, value = structure(list(n = 1L, :
    #> replacement has 1 row, data has 4

</td>
<td>
    with_tbl2(tbl2[[1, 1]] <- tbl[1, ])
    #> # A tibble: 4 x 2
    #>    tb$n $c    $li      m[,1]  [,2]  [,3]
    #>   <int> <chr> <list>   <dbl> <dbl> <dbl>
    #> 1     1 e     <dbl [1…     1     0     0
    #> 2    NA f     <int [2…     0     1     0
    #> 3     3 g     <int [3…     0     0     1
    #> 4    NA h     <chr [1…     0     0     0
    #> # … with 1 more variable: [,4] <dbl>

</td>
</tr>
<tr style="vertical-align:top">
<td>
</td>
<td>
    with_tbl2(tbl2[1, ][[1]] <- tbl[1, ])
    #> # A tibble: 4 x 2
    #>    tb$n $c    $li      m[,1]  [,2]  [,3]
    #>   <int> <chr> <list>   <dbl> <dbl> <dbl>
    #> 1     1 e     <dbl [1…     1     0     0
    #> 2    NA f     <int [2…     0     1     0
    #> 3     3 g     <int [3…     0     0     1
    #> 4    NA h     <chr [1…     0     0     0
    #> # … with 1 more variable: [,4] <dbl>

</td>
</tr>
<tr style="vertical-align:top">
<td>
    with_df2(df2[[1, 2]] <- t(1:4))

    #> Error in x[[jseq]][[iseq]] <- value:
    #> more elements supplied than there are to
    #> replace

</td>
<td>
    with_tbl2(tbl2[[1, 2]] <- t(1:4))
    #> # A tibble: 4 x 2
    #>    tb$n $c    $li      m[,1]  [,2]  [,3]
    #>   <int> <chr> <list>   <dbl> <dbl> <dbl>
    #> 1     1 e     <dbl [1…     1     2     3
    #> 2    NA f     <int [2…     0     1     0
    #> 3     3 g     <int [3…     0     0     1
    #> 4    NA h     <chr [1…     0     0     0
    #> # … with 1 more variable: [,4] <dbl>

</td>
</tr>
<tr style="vertical-align:top">
<td>
</td>
<td>
    with_tbl2(tbl2[1, ][[2]] <- t(1:4))
    #> # A tibble: 4 x 2
    #>    tb$n $c    $li      m[,1]  [,2]  [,3]
    #>   <int> <chr> <list>   <dbl> <dbl> <dbl>
    #> 1     1 e     <dbl [1…     1     2     3
    #> 2    NA f     <int [2…     0     1     0
    #> 3     3 g     <int [3…     0     0     1
    #> 4    NA h     <chr [1…     0     0     0
    #> # … with 1 more variable: [,4] <dbl>

</td>
</tr>
<tr style="vertical-align:top">
<td>
    df[[1:2, 1]]

    #> Error in col[[i, exact = exact]]:
    #> attempt to select more than one element
    #> in vectorIndex

</td>
<td>
    tbl[[1:2, 1]]

    #> Error: Must extract column with a single
    #> valid subscript.
    #> [31mx[39m The subscript `1` has size 2 but must
    #> be size 1.

</td>
</tr>
<tr style="vertical-align:top">
<td>
    with_df(df[[1:2, 1]] <- 0)

    #> Error in `[[<-.data.frame`(`*tmp*`, 1:2,
    #> 1, value = 0): only a single element
    #> should be replaced

</td>
<td>
    with_tbl(tbl[[1:2, 1]] <- 0)

    #> Error: Must extract element with a
    #> single valid subscript.
    #> [31mx[39m The subscript has size 2 but must be
    #> size 1.

</td>
</tr>
</tbody>
</table>
NB: `vec_size(a)` must equal 1. Unlike `x[i, ] <-`, `x[[i, ]] <-` is not
valid.

[1] `x[j][[jj]]` is equal to `x[[ j[[jj]] ]]`, in particular `x[j][[1]]`
is equal to `x[[j]]` for scalar numeric or integer `j`.

[2] Row subsetting `x[i, ]` is not defined in terms of `x[[j]][i]`
because that definition does not generalise to matrix and data frame
columns. For efficiency and backward compatibility, `i` is converted to
an integer vector by `vec_as_index(i, nrow(x))` first.

[3] `x[,]` is equivalent to `x[]` because `x[, j]` is equivalent to
`x[j]`.

[4] A more efficient implementation of `x[i, j]` would forward to
`x[j][i, ]`.

[5] Cell subsetting `x[[i, j]]` is not defined in terms of `x[[j]][[i]]`
because that definition does not generalise to list, matrix and data
frame columns. A more efficient implementation of `x[[i, j]]` would
check that `j` is a scalar and forward to `x[i, j][[1]]`.

[6] `$` behaves almost completely symmetrically to `[[` when comparing
subsetting and subassignment.

[7] `x[i, ]` is symmetrically for subset and subassignment.

[8] `x[i, j]` is symmetrically for subsetting and subassignment. A more
efficient implementation of `x[i, j] <- a` would forward to
`x[j][i, ] <- a`.

[9] `x[[i, j]]` is symmetrically for subsetting and subassignment. An
efficient implementation would check that `i` and `j` are scalar and
forward to `x[i, j][[1]] <- a`.
