---
title: "Tibbles"
output: rmarkdown::html_vignette
vignette: >
  %\VignetteIndexEntry{Tibbles}
  %\VignetteEngine{knitr::rmarkdown}
  \usepackage[utf8]{inputenc}
---



Tibbles are a modern take on data frames.
They keep the features that have stood the test of time, and drop the features that used to be convenient but are now frustrating (i.e.
converting character vectors to factors).


```r
library(tibble)
```


## Creating

`tibble()` is a nice way to create data frames.
It encapsulates best practices for data frames:

  * It never changes an input's type (i.e., no more `stringsAsFactors = FALSE`!).

    
    ```r
    tibble(x = letters)
    ```
    
    <div class="sourceCode"><pre class="sourceCode"><code class="sourceCode"><span style='color: #555555;'>#&gt;</span> <span style='color: #555555;'># A tibble: 26 x 1</span>
    <span style='color: #555555;'>#&gt;</span>    <span style='font-weight: bold;'>x</span>    
    <span style='color: #555555;'>#&gt;</span>    <span style='color: #555555; font-style: italic;'>&lt;chr&gt;</span>
    <span style='color: #555555;'>#&gt;</span> <span style='color: #555555;'> 1</span> a    
    <span style='color: #555555;'>#&gt;</span> <span style='color: #555555;'> 2</span> b    
    <span style='color: #555555;'>#&gt;</span> <span style='color: #555555;'> 3</span> c    
    <span style='color: #555555;'>#&gt;</span> <span style='color: #555555;'> 4</span> d    
    <span style='color: #555555;'>#&gt;</span> <span style='color: #555555;'> 5</span> e    
    <span style='color: #555555;'>#&gt;</span> <span style='color: #555555;'> 6</span> f    
    <span style='color: #555555;'>#&gt;</span> <span style='color: #555555;'> 7</span> g    
    <span style='color: #555555;'>#&gt;</span> <span style='color: #555555;'> 8</span> h    
    <span style='color: #555555;'>#&gt;</span> <span style='color: #555555;'> 9</span> i    
    <span style='color: #555555;'>#&gt;</span> <span style='color: #555555;'>10</span> j    
    <span style='color: #555555;'>#&gt;</span> <span style='color: #555555;'># ... with 16 more rows</span>
    </code></pre></div>

    This makes it easier to use with list-columns:

    
    ```r
    tibble(x = 1:3, y = list(1:5, 1:10, 1:20))
    ```
    
    <div class="sourceCode"><pre class="sourceCode"><code class="sourceCode"><span style='color: #555555;'>#&gt;</span> <span style='color: #555555;'># A tibble: 3 x 2</span>
    <span style='color: #555555;'>#&gt;</span>       <span style='font-weight: bold;'>x</span> <span style='font-weight: bold;'>y</span>         
    <span style='color: #555555;'>#&gt;</span>   <span style='color: #555555; font-style: italic;'>&lt;int&gt;</span> <span style='color: #555555; font-style: italic;'>&lt;list&gt;</span>    
    <span style='color: #555555;'>#&gt;</span> <span style='color: #555555;'>1</span>     1 <span style='color: #555555;'>&lt;int [5]&gt;</span> 
    <span style='color: #555555;'>#&gt;</span> <span style='color: #555555;'>2</span>     2 <span style='color: #555555;'>&lt;int [10]&gt;</span>
    <span style='color: #555555;'>#&gt;</span> <span style='color: #555555;'>3</span>     3 <span style='color: #555555;'>&lt;int [20]&gt;</span>
    </code></pre></div>

    List-columns are often created by `tidyr::nest()`, but they can be useful to
    create by hand.

  * It never adjusts the names of variables:

    
    ```r
    names(data.frame(`crazy name` = 1))
    ```
    
    <div class="sourceCode"><pre class="sourceCode"><code class="sourceCode"><span style='color: #555555;'>#&gt;</span> [1] "crazy.name"
    </code></pre></div>
    
    ```r
    names(tibble(`crazy name` = 1))
    ```
    
    <div class="sourceCode"><pre class="sourceCode"><code class="sourceCode"><span style='color: #555555;'>#&gt;</span> [1] "crazy name"
    </code></pre></div>

  * It evaluates its arguments lazily and sequentially:

    
    ```r
    tibble(x = 1:5, y = x ^ 2)
    ```
    
    <div class="sourceCode"><pre class="sourceCode"><code class="sourceCode"><span style='color: #555555;'>#&gt;</span> <span style='color: #555555;'># A tibble: 5 x 2</span>
    <span style='color: #555555;'>#&gt;</span>       <span style='font-weight: bold;'>x</span>     <span style='font-weight: bold;'>y</span>
    <span style='color: #555555;'>#&gt;</span>   <span style='color: #555555; font-style: italic;'>&lt;int&gt;</span> <span style='color: #555555; font-style: italic;'>&lt;dbl&gt;</span>
    <span style='color: #555555;'>#&gt;</span> <span style='color: #555555;'>1</span>     1     1
    <span style='color: #555555;'>#&gt;</span> <span style='color: #555555;'>2</span>     2     4
    <span style='color: #555555;'>#&gt;</span> <span style='color: #555555;'>3</span>     3     9
    <span style='color: #555555;'>#&gt;</span> <span style='color: #555555;'>4</span>     4    16
    <span style='color: #555555;'>#&gt;</span> <span style='color: #555555;'>5</span>     5    25
    </code></pre></div>

  * It never uses `row.names()`.
    The whole point of tidy data is to store variables in a consistent way.
    So it never stores a variable as special attribute.

  * It only recycles vectors of length 1.
    This is because recycling vectors of greater lengths is a frequent source of bugs.

## Coercion

To complement `tibble()`, tibble provides `as_tibble()` to coerce objects into tibbles.
Generally, `as_tibble()` methods are much simpler than `as.data.frame()` methods.
The method for lists has been written with an eye for performance:


```r
l <- replicate(26, sample(100), simplify = FALSE)
names(l) <- letters

timing <- bench::mark(
  as_tibble(l),
  as.data.frame(l),
  check = FALSE
)

timing
```

<div class="sourceCode"><pre class="sourceCode"><code class="sourceCode"><span style='color: #555555;'>#&gt;</span> <span style='color: #555555;'># A tibble: 2 x 14</span>
<span style='color: #555555;'>#&gt;</span>   <span style='font-weight: bold;'>expression</span>       <span style='font-weight: bold;'>min</span>         <span style='font-weight: bold;'>mean</span>         <span style='font-weight: bold;'>median</span>      <span style='font-weight: bold;'>max</span>         <span style='font-weight: bold;'>`itr/sec`</span>
<span style='color: #555555;'>#&gt;</span>   <span style='color: #555555; font-style: italic;'>&lt;chr&gt;</span>            <span style='color: #555555; font-style: italic;'>&lt;bench_tm&gt;</span>  <span style='color: #555555; font-style: italic;'>&lt;bench_tm&gt;</span>   <span style='color: #555555; font-style: italic;'>&lt;bench_tm&gt;</span>  <span style='color: #555555; font-style: italic;'>&lt;bench_tm&gt;</span>      <span style='color: #555555; font-style: italic;'>&lt;dbl&gt;</span>
<span style='color: #555555;'>#&gt;</span> <span style='color: #555555;'>1</span> as_tibble(l)     0.000287696 0.0006251376 0.000327178 0.004508219     <span style='text-decoration: underline;'>1</span>600.
<span style='color: #555555;'>#&gt;</span> <span style='color: #555555;'>2</span> as.data.frame(l) 0.000791522 0.0016640039 0.001098172 0.007652914      601.
<span style='color: #555555;'>#&gt;</span> <span style='color: #555555;'># ... with 8 more variables: </span><span style='color: #555555; font-weight: bold;'>mem_alloc</span><span style='color: #555555;'> &lt;bnch_byt&gt;, </span><span style='color: #555555; font-weight: bold;'>n_gc</span><span style='color: #555555;'> &lt;dbl&gt;, </span><span style='color: #555555; font-weight: bold;'>n_itr</span><span style='color: #555555;'> &lt;int&gt;,</span>
<span style='color: #555555;'>#&gt;</span> <span style='color: #555555;'>#   </span><span style='color: #555555; font-weight: bold;'>total_time</span><span style='color: #555555;'> &lt;bench_tm&gt;, </span><span style='color: #555555; font-weight: bold;'>result</span><span style='color: #555555;'> &lt;list&gt;, </span><span style='color: #555555; font-weight: bold;'>memory</span><span style='color: #555555;'> &lt;list&gt;, </span><span style='color: #555555; font-weight: bold;'>time</span><span style='color: #555555;'> &lt;list&gt;, </span><span style='color: #555555; font-weight: bold;'>gc</span><span style='color: #555555;'> &lt;list&gt;</span>
</code></pre></div>

The speed of `as.data.frame()` is not usually a bottleneck when used interactively, but can be a problem when combining thousands of messy inputs into one tidy data frame.

## Tibbles vs data frames

There are three key differences between tibbles and data frames: printing, subsetting, and recycling rules.

### Printing

When you print a tibble, it only shows the first ten rows and all the columns that fit on one screen.
It also prints an abbreviated description of the column type, and uses font styles and color for highlighting:


```r
tibble(x = -5:1000)
```

<div class="sourceCode"><pre class="sourceCode"><code class="sourceCode"><span style='color: #555555;'>#&gt;</span> <span style='color: #555555;'># A tibble: 1,006 x 1</span>
<span style='color: #555555;'>#&gt;</span>        <span style='font-weight: bold;'>x</span>
<span style='color: #555555;'>#&gt;</span>    <span style='color: #555555; font-style: italic;'>&lt;int&gt;</span>
<span style='color: #555555;'>#&gt;</span> <span style='color: #555555;'> 1</span>    -<span style='color: #BB0000;'>5</span>
<span style='color: #555555;'>#&gt;</span> <span style='color: #555555;'> 2</span>    -<span style='color: #BB0000;'>4</span>
<span style='color: #555555;'>#&gt;</span> <span style='color: #555555;'> 3</span>    -<span style='color: #BB0000;'>3</span>
<span style='color: #555555;'>#&gt;</span> <span style='color: #555555;'> 4</span>    -<span style='color: #BB0000;'>2</span>
<span style='color: #555555;'>#&gt;</span> <span style='color: #555555;'> 5</span>    -<span style='color: #BB0000;'>1</span>
<span style='color: #555555;'>#&gt;</span> <span style='color: #555555;'> 6</span>     0
<span style='color: #555555;'>#&gt;</span> <span style='color: #555555;'> 7</span>     1
<span style='color: #555555;'>#&gt;</span> <span style='color: #555555;'> 8</span>     2
<span style='color: #555555;'>#&gt;</span> <span style='color: #555555;'> 9</span>     3
<span style='color: #555555;'>#&gt;</span> <span style='color: #555555;'>10</span>     4
<span style='color: #555555;'>#&gt;</span> <span style='color: #555555;'># ... with 996 more rows</span>
</code></pre></div>

You can control the default appearance with options:

* `options(tibble.print_max = n, tibble.print_min = m)`: if there are more than `n` rows, print only the first `m` rows.
  Use `options(tibble.print_max = Inf)` to always show all rows.

* `options(tibble.width = Inf)` will always print all columns, regardless of the width of the screen.

See `?"tibble-package"` for the available options, and `vignette("types")` for an overview of the type abbreviations.

### Subsetting

Tibbles are quite strict about subsetting.
`[` always returns another tibble.
Contrast this with a data frame: sometimes `[` returns a data frame and sometimes it just returns a vector:


```r
df1 <- data.frame(x = 1:3, y = 3:1)
class(df1[, 1:2])
```

<div class="sourceCode"><pre class="sourceCode"><code class="sourceCode"><span style='color: #555555;'>#&gt;</span> [1] "data.frame"
</code></pre></div>

```r
class(df1[, 1])
```

<div class="sourceCode"><pre class="sourceCode"><code class="sourceCode"><span style='color: #555555;'>#&gt;</span> [1] "integer"
</code></pre></div>

```r

df2 <- tibble(x = 1:3, y = 3:1)
class(df2[, 1:2])
```

<div class="sourceCode"><pre class="sourceCode"><code class="sourceCode"><span style='color: #555555;'>#&gt;</span> [1] "tbl_df"     "tbl"        "data.frame"
</code></pre></div>

```r
class(df2[, 1])
```

<div class="sourceCode"><pre class="sourceCode"><code class="sourceCode"><span style='color: #555555;'>#&gt;</span> [1] "tbl_df"     "tbl"        "data.frame"
</code></pre></div>

To extract a single column use `[[` or `$`:


```r
class(df2[[1]])
```

<div class="sourceCode"><pre class="sourceCode"><code class="sourceCode"><span style='color: #555555;'>#&gt;</span> [1] "integer"
</code></pre></div>

```r
class(df2$x)
```

<div class="sourceCode"><pre class="sourceCode"><code class="sourceCode"><span style='color: #555555;'>#&gt;</span> [1] "integer"
</code></pre></div>

Tibbles are also stricter with `$`.
Tibbles never do partial matching, and will throw a warning and return `NULL` if the column does not exist:


```r
df <- data.frame(abc = 1)
df$a
```

<div class="sourceCode"><pre class="sourceCode"><code class="sourceCode"><span style='color: #555555;'>#&gt;</span> [1] 1
</code></pre></div>

```r

df2 <- tibble(abc = 1)
df2$a
```

<div class="sourceCode"><pre class="sourceCode"><code class="sourceCode"><span style='color: #555555;'>#&gt;</span><span style='color: #BB0000;'> Warning: Unknown or uninitialised column: `a`.
</span></code></pre></div><div class="sourceCode"><pre class="sourceCode"><code class="sourceCode"><span style='color: #555555;'>#&gt;</span> NULL
</code></pre></div>

However, tibbles respect the `drop` argument if it is provided:


```r
data.frame(a = 1:3)[, "a", drop = TRUE]
```

<div class="sourceCode"><pre class="sourceCode"><code class="sourceCode"><span style='color: #555555;'>#&gt;</span> [1] 1 2 3
</code></pre></div>

```r
tibble(a = 1:3)[, "a", drop = TRUE]
```

<div class="sourceCode"><pre class="sourceCode"><code class="sourceCode"><span style='color: #555555;'>#&gt;</span> [1] 1 2 3
</code></pre></div>

Tibbles do not support row names.
They are removed when converting to a tibble or when subsetting:


```r
df <- data.frame(a = 1:3, row.names = letters[1:3])
rownames(df)
```

<div class="sourceCode"><pre class="sourceCode"><code class="sourceCode"><span style='color: #555555;'>#&gt;</span> [1] "a" "b" "c"
</code></pre></div>

```r
rownames(as_tibble(df))
```

<div class="sourceCode"><pre class="sourceCode"><code class="sourceCode"><span style='color: #555555;'>#&gt;</span> [1] "1" "2" "3"
</code></pre></div>

```r

tbl <- tibble(a = 1:3)
rownames(tbl) <- letters[1:3]
```

<div class="sourceCode"><pre class="sourceCode"><code class="sourceCode"><span style='color: #555555;'>#&gt;</span><span style='color: #BB0000;'> Warning: Setting row names on a tibble is deprecated.
</span></code></pre></div>

```r
rownames(tbl)
```

<div class="sourceCode"><pre class="sourceCode"><code class="sourceCode"><span style='color: #555555;'>#&gt;</span> [1] "a" "b" "c"
</code></pre></div>

```r
rownames(tbl[1, ])
```

<div class="sourceCode"><pre class="sourceCode"><code class="sourceCode"><span style='color: #555555;'>#&gt;</span> [1] "1"
</code></pre></div>

See `vignette("invariants")` for a detailed comparison between tibbles and data frames.


### Recycling

When constructing a tibble, only values of length 1 are recycled.
The first column with length different to one determines the number of rows in the tibble, conflicts lead to an error:


```r
tibble(a = 1, b = 1:3)
```

<div class="sourceCode"><pre class="sourceCode"><code class="sourceCode"><span style='color: #555555;'>#&gt;</span> <span style='color: #555555;'># A tibble: 3 x 2</span>
<span style='color: #555555;'>#&gt;</span>       <span style='font-weight: bold;'>a</span>     <span style='font-weight: bold;'>b</span>
<span style='color: #555555;'>#&gt;</span>   <span style='color: #555555; font-style: italic;'>&lt;dbl&gt;</span> <span style='color: #555555; font-style: italic;'>&lt;int&gt;</span>
<span style='color: #555555;'>#&gt;</span> <span style='color: #555555;'>1</span>     1     1
<span style='color: #555555;'>#&gt;</span> <span style='color: #555555;'>2</span>     1     2
<span style='color: #555555;'>#&gt;</span> <span style='color: #555555;'>3</span>     1     3
</code></pre></div>

```r
tibble(a = 1:3, b = 1)
```

<div class="sourceCode"><pre class="sourceCode"><code class="sourceCode"><span style='color: #555555;'>#&gt;</span> <span style='color: #555555;'># A tibble: 3 x 2</span>
<span style='color: #555555;'>#&gt;</span>       <span style='font-weight: bold;'>a</span>     <span style='font-weight: bold;'>b</span>
<span style='color: #555555;'>#&gt;</span>   <span style='color: #555555; font-style: italic;'>&lt;int&gt;</span> <span style='color: #555555; font-style: italic;'>&lt;dbl&gt;</span>
<span style='color: #555555;'>#&gt;</span> <span style='color: #555555;'>1</span>     1     1
<span style='color: #555555;'>#&gt;</span> <span style='color: #555555;'>2</span>     2     1
<span style='color: #555555;'>#&gt;</span> <span style='color: #555555;'>3</span>     3     1
</code></pre></div>

```r
tibble(a = 1:3, c = 1:2)
```

<div class="sourceCode"><pre class="sourceCode"><code class="sourceCode"><span style='color: #555555;'>#&gt;</span><span style='color: #BB0000;'> Error: Tibble columns must have compatible sizes.
</span><span style='color: #555555;'>#&gt;</span><span style='color: #BB0000;'> </span><span style='color: #00BBBB;'>*</span><span style='color: #BB0000;'> Size 3: Existing data.
</span><span style='color: #555555;'>#&gt;</span><span style='color: #BB0000;'> </span><span style='color: #00BBBB;'>*</span><span style='color: #BB0000;'> Size 2: Column `c`.
</span><span style='color: #555555;'>#&gt;</span><span style='color: #BB0000;'> </span><span style='color: #0000BB;'>i</span><span style='color: #BB0000;'> Only values of size one are recycled.
</span></code></pre></div>

This also extends to tibbles with *zero* rows, which is sometimes important for programming:


```r
tibble(a = 1, b = integer())
```

<div class="sourceCode"><pre class="sourceCode"><code class="sourceCode"><span style='color: #555555;'>#&gt;</span> <span style='color: #555555;'># A tibble: 0 x 2</span>
<span style='color: #555555;'>#&gt;</span> <span style='color: #555555;'># ... with 2 variables: </span><span style='color: #555555; font-weight: bold;'>a</span><span style='color: #555555;'> &lt;dbl&gt;, </span><span style='color: #555555; font-weight: bold;'>b</span><span style='color: #555555;'> &lt;int&gt;</span>
</code></pre></div>

```r
tibble(a = integer(), b = 1)
```

<div class="sourceCode"><pre class="sourceCode"><code class="sourceCode"><span style='color: #555555;'>#&gt;</span> <span style='color: #555555;'># A tibble: 0 x 2</span>
<span style='color: #555555;'>#&gt;</span> <span style='color: #555555;'># ... with 2 variables: </span><span style='color: #555555; font-weight: bold;'>a</span><span style='color: #555555;'> &lt;int&gt;, </span><span style='color: #555555; font-weight: bold;'>b</span><span style='color: #555555;'> &lt;dbl&gt;</span>
</code></pre></div>


### Arithmetic operations

Unlike data frames, tibbles don't support arithmetic operations on all columns.
The result is silently coerced to a data frame.
Do not rely on this behavior, it may become an error in a forthcoming version.


```r
tbl <- tibble(a = 1:3, b = 4:6)
tbl * 2
```

<div class="sourceCode"><pre class="sourceCode"><code class="sourceCode"><span style='color: #555555;'>#&gt;</span>   a  b
<span style='color: #555555;'>#&gt;</span> 1 2  8
<span style='color: #555555;'>#&gt;</span> 2 4 10
<span style='color: #555555;'>#&gt;</span> 3 6 12
</code></pre></div>
