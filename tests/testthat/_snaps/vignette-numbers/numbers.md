---
title: "Controlling display of numbers"
output: html_vignette
vignette: >
  %\VignetteIndexEntry{Controlling display of numbers}
  %\VignetteEngine{knitr::rmarkdown}
  %\VignetteEncoding{UTF-8}
---



Tibbles print numbers with three significant digits by default, switching to scientific notation if the available space is too small.
Underlines are used to highlight groups of three digits.
The display differs from the default display for data frames, see `vignette("digits")` for an overview over the differences.
This display works for many, but not for all use cases.


```r
library(tibble)
```

## Options

The easiest way to customize the display of numbers and other data in a tibble is to define options.
See `?pillar::pillar_options` for a comprehensive overview.


```r
tibble(x = 123.4567)
#> # A tibble: 1 x 1
#>       x
#>   <dbl>
#> 1  123.
old <- options(pillar.sigfig = 7)
tibble(x = 123.4567)
#> # A tibble: 1 x 1
#>          x
#>      <dbl>
#> 1 123.4567
# Restore old options, see also rlang::local_options() for a more elegant way
options(old)
```

This changes the display of all columns.
Read on to see how too specify display options on a column-by-column basis.


## Per-column number formatting

The new `num()` constructor allows creating vectors that behave like numbers but allow customizing their display.
Below a few examples are shown, see `?num` for a comprehensive overview.
Similarly, `char()` allows customizing the display of character columns.


```r
num(-1:3, notation = "sci")
#> <pillar_num(sci)[5]>
#> [1] -1e0  0    1e0  2e0  3e0
tibble(
  x4 = num(8:12 * 100 + 0.5, digits = 4),
  x1 = num(8:12 * 100 + 0.5, digits = -1),
  usd = num(8:12 * 100 + 0.5, digits = 2, label = "USD"),
  percent = num(8:12 / 100 + 0.0005, label = "%", scale = 100),
  eng = num(10^(-3:1), notation = "eng", fixed_exponent = -Inf),
  si = num(10^(-3:1) * 123, notation = "si"),
  char = char(paste(LETTERS, collapse = " "), shorten = "mid")
)
#> # A tibble: 5 x 7
#>          x4       x1     usd percent      eng      si char                      
#>   <num:.4!> <num:.1>     USD       %    <eng>    <si> <char>                    
#> 1  800.5000    800.5  800.50    8.05     1e-3 123   m A B C D E F ~T U V W X Y Z
#> 2  900.5000    900.5  900.50    9.05    10e-3   1.23  A B C D E F ~T U V W X Y Z
#> 3 1000.5000   1000.5 1000.50   10.0    100e-3  12.3   A B C D E F ~T U V W X Y Z
#> 4 1100.5000   1100.5 1100.50   11.0   1000e-3 123     A B C D E F ~T U V W X Y Z
#> 5 1200.5000   1200.5 1200.50   12.0  10000e-3   1.23k A B C D E F ~T U V W X Y Z
```

The pillar package that is responsible for the display of tibbles tries hard to get the number display right, however it is impossible to accommodate all use cases.
Whenever the default formatting does not suit the application, `num()` or `char()` allow redefining the formatting for individual columns.
The formatting survives most data transformations.


## Computing on `num`

Formatting numbers is useful for presentation of results.
If defined early on in the analysis, the formatting options survive most operations.
It is worth defining output options that suit your data once early on in the process, to benefit from the formatting throughout the analysis.
We are working on seamlessly applying this formatting to the final presentation (plots, tables, ...).


### Arithmetics

When applying arithmetic operations on numbers created by `num()`, the result inherits the formatting of the first `num` object.


```r
num(1) + 2
#> <pillar_num[1]>
#> [1] 3
1 + num(2)
#> <pillar_num[1]>
#> [1] 3
1L + num(2)
#> <pillar_num[1]>
#> [1] 3
num(3.23456, sigfig = 4) - num(2)
#> <pillar_num:4[1]>
#> [1] 1.235
num(4, sigfig = 2) * num(3, digits = 2)
#> <pillar_num:2[1]>
#> [1] 12
num(3, digits = 2) * num(4, sigfig = 2)
#> <pillar_num:.2![1]>
#> [1] 12.00
-num(2)
#> <pillar_num[1]>
#> [1] -2
```

### Mathematics

Similarly, for mathematical operations, the formatting is inherited.


```r
min(num(1:3, label = "$"))
#> <pillar_num{$}[1]>
#> [1] 1
mean(num(1:3, notation = "eng"))
#> <pillar_num(eng)[1]>
#> [1] 2e0
sin(num(1:3, label = "%", scale = 100))
#> <pillar_num{%}*100[3]>
#> [1] 84.1 90.9 14.1
```


### Override

In some cases, the ideal formatting changes after a transformation.
`num()` can be applied repeatedly, the last setting wins.


```r
num(1:3 + 0.125, digits = 4)
#> <pillar_num:.4![3]>
#> [1] 1.1250 2.1250 3.1250
transf <- 10 ^ num(1:3 + 0.125, digits = 4)
transf
#> <pillar_num:.4![3]>
#> [1]   13.3352  133.3521 1333.5214
num(transf, sigfig = 3)
#> <pillar_num:3[3]>
#> [1]   13.3  133.  1334.
```

### Recovery

The `var()` function is one of the examples where the formatting is lost:


```r
x <- num(c(1, 2, 4), notation = "eng")
var(x)
#> [1] 2.333333
```

One way to recover is to apply `num()` to the result:


```r
num(var(x), notation = "eng")
#> <pillar_num(eng)[1]>
#> [1] 2.33e0
```

For automatic recovery, we can also define our version of `var()`, or even overwrite the base implementation.
Note that this pattern is still experimental and may be subject to change:


```r
var_ <- function(x, ...) {
  out <- var(vctrs::vec_proxy(x), ...)
  vctrs::vec_restore(out, x)
}
var_(x)
#> <pillar_num(eng)[1]>
#> [1] 2.33e0
```

This pattern can be applied to all functions that lose the formatting.
The `make_restore()` function defined below is a function factory that consumes a function and returns a derived function:


```r
make_restore <- function(fun) {
  force(fun)
  function(x, ...) {
    out <- fun(vctrs::vec_proxy(x), ...)
    vctrs::vec_restore(out, x)
  }
}

var_ <- make_restore(var)
sd_ <- make_restore(sd)

var_(x)
#> <pillar_num(eng)[1]>
#> [1] 2.33e0
sd_(x)
#> <pillar_num(eng)[1]>
#> [1] 1.53e0
```
