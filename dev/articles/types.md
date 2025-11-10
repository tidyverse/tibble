# Column types

``` r
library(tibble)
```

## Overview

This vignette shows an overview of known data types and their
abbreviations, and their origin. For example, `<int>` in the header of a
column indicates an integer column, and `<chr>` denotes a character
column.

| Class                       | Data type            | Example                                              | Column header |
|:----------------------------|:---------------------|:-----------------------------------------------------|:--------------|
| Atomic                      | logical              | `TRUE`                                               | lgl           |
|                             | integer              | `1L`                                                 | int           |
|                             | double               | `1.5`                                                | dbl           |
|                             | character            | `"A"`                                                | chr           |
|                             | complex              | `0+1i`                                               | cpl           |
|                             | raw                  | `as.raw(1)`                                          | raw           |
|                             | list                 | `list(1)`                                            | list          |
|                             | named list           | `list(a = 1)`                                        | named list    |
| Built-in objects            | factor               | `factor("A")`                                        | fct           |
|                             | ordered              | `ordered("a")`                                       | ord           |
|                             | Date                 | [`Sys.Date()`](https://rdrr.io/r/base/Sys.time.html) | date          |
|                             | POSIXt               | [`Sys.time()`](https://rdrr.io/r/base/Sys.time.html) | dttm          |
|                             | difftime             | `vctrs::new_duration(1)`                             | drtn          |
| Objects from other packages | hms                  | `hms::hms(1)`                                        | time          |
|                             | integer64            | `bit64::as.integer64(1e+10)`                         | int64         |
|                             | blob                 | `blob::blob(raw(1))`                                 | blob          |
| Data frames                 | data.frame           | `data.frame(a = 1)`                                  | df\[,1\]      |
|                             | tbl_df               | `tibble(a = 1)`                                      | tibble\[,1\]  |
| Unchanged                   | AsIs                 | `I(1L)`                                              | I             |
| vctrs types                 | unspecified          | `vctrs::unspecified(1)`                              | ???           |
|                             | vctrs_list_of        | `vctrs::list_of(c(1L))`                              | list          |
|                             | vctrs_vctr           | `vctrs::new_vctr(1L)`                                | vctrs_vc      |
|                             | vctrs_partial_factor | `vctrs::partial_factor(letters)`                     | prtl_fctr     |
|                             | vctrs_partial_frame  | `vctrs::partial_frame(a = 1)`                        | prtl          |
| Language objects            | function             | `function() NULL`                                    | fn            |
|                             | symbol               | `quote(a)`                                           | sym           |
|                             | expression           | `parse(text = "a <- 1\nb<- 2")`                      | expression    |
|                             | quosures             | `rlang::quos(a = 1)`                                 | quos          |

## Example values

The following overview contains example values for each type:

    #> Rows: 1
    #> Columns: 23
    #> $ logical       <lgl> TRUE
    #> $ integer       <int> 1
    #> $ double        <dbl> 1.5
    #> $ character     <chr> "A"
    #> $ complex       <cpl> 0+1i
    #> $ raw           <raw> 01
    #> $ list          <list> 1
    #> $ `named list`  <named list> 1
    #> $ factor        <fct> A
    #> $ ordered       <ord> a
    #> $ Date          <date> 2025-11-10
    #> $ POSIXt        <dttm> 2025-11-10 14:09:33
    #> $ difftime      <drtn> 1 secs
    #> $ hms           <time> 00:00:01
    #> $ integer64     <int64> 10000000000
    #> $ blob          <blob> 00
    #> $ data.frame    <df[,1]> <data.frame[1 x 1]>
    #> $ tbl_df        <tibble[,1]> <tbl_df[1 x 1]>
    #> $ AsIs          <I<int>> 1
    #> $ unspecified   <???> NA
    #> $ vctrs_list_of <list<int>> 1
    #> $ vctrs_vctr    <vctrs_vc> 1
    #> $ quosures      <quos> <~1>

## Implementation

The column header is obtained by calling
[`pillar::type_sum()`](https://pillar.r-lib.org/reference/type_sum.html)
on the column. This is an S3 method that can be overridden, but most of
the time it is more useful to override
[`vctrs::vec_ptype_abbr()`](https://vctrs.r-lib.org/reference/vec_ptype_full.html):

``` r
pillar:::type_sum.default
#> function (x) 
#> {
#>     pillar_attr <- attr(x, "pillar", exact = TRUE)
#>     label <- pillar_attr$label
#>     if (!is.null(label)) {
#>         return(I(label))
#>     }
#>     if (is.object(x) || vec_is(x)) {
#>         return(vec_ptype_abbr(x))
#>     }
#>     switch(typeof(x), builtin = , special = , closure = "fn", 
#>         environment = "env", symbol = if (is_missing(x)) {
#>             "missing"
#>         } else {
#>             "sym"
#>         }, typeof(x))
#> }
#> <bytecode: 0x56214ef78970>
#> <environment: namespace:pillar>
```
