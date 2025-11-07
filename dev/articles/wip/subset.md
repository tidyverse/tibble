# Subsetting

There are many, many ways to subset data frames and tibbles.

[![Alignment](alignment.png "Alignment chart")](https://twitter.com/skyetetra/status/1160012260456062977)

Drawing by [Jacqueline
Nolis](https://twitter.com/skyetetra/status/1160012260456062977)

This vignette is an attempt to provide a comprehensive overview over the
behavior of the subsetting operators `$`, `[[` and `[`, highlighting
where the tibble implementation differs from the data frame
implementation.

``` r
library(tibble)
new_df <- function() {
  df <- data.frame(a = 1:4)
  df$b <- letters[5:8]
  df$cd <- list(9, 10:11, 12:14, "text")
  df
}
new_tbl <- function() {
  as_tibble(new_df())
}
```

Results of the same code for data frames and tibbles are presented side
by side:

[TABLE]

In the following, if the results are identical (after converting to a
data frame if necessary), only the tibble result is shown, as in the
example below. This allows to spot differences easier.

[TABLE]

Subsetting operations are read-only. The same objects are reused in all
examples:

``` r
df <- new_df()
tbl <- new_tbl()
```

## \$

With `$` subsetting, accessing a missing column gives a warning. Inexact
matching is not supported:

[TABLE]

## \[\[

The `exact` argument is not supported by tibbles.

[TABLE]

With two indexes, a single element is returned. List columns are not
unpacked by tibbles, the `[[` only unpacks columns.

[TABLE]

Exotic variants like recursive indexing are deprecated for tibbles.

[TABLE]

## \[

With `[` subsetting, tibbles always return a tibble. The `drop` argument
is supported but has different defaults:

[TABLE]

The same examples are repeated for two-dimensional indexing when
omitting the row index:

[TABLE]

Multiple columns can be queried by passing a vector of column indexes
(names, positions, or even a logical vector). With the latter option,
tibbles are a tad stricter:

[TABLE]

The same examples are repeated for two-dimensional indexing when
omitting the row index:

[TABLE]

Row subsetting with integer indexes works almost identical.
Out-of-bounds subsetting is not recommended and may lead to an error in
future versions. Another special case is subsetting with
`[1, , drop = TRUE]` where the data frame implementation returns a list.

[TABLE]

Row subsetting with logical indexes also works almost identical, the
index vector must have length one or the number of rows with tibbles.

[TABLE]

Indexing both row and column works more or less the same, except for
`drop`:

[TABLE]

Indexes can be omitted altogether, no differences here:

[TABLE]
