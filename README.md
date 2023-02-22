<!-- README.md is generated from README.Rmd. Please edit that file -->

# tibble <img src="man/figures/logo.png" align="right" />

<!-- badges: start -->

[![R-CMD-check](https://github.com/tidyverse/tibble/workflows/R-CMD-check/badge.svg)](https://github.com/tidyverse/tibble/actions) [![Codecov test coverage](https://codecov.io/gh/tidyverse/tibble/branch/main/graph/badge.svg)](https://app.codecov.io/gh/tidyverse/tibble?branch=main) [![CRAN_Status_Badge](https://www.r-pkg.org/badges/version/tibble)](https://cran.r-project.org/package=tibble) [![Life cycle](https://img.shields.io/badge/lifecycle-stable-brightgreen.svg)](https://lifecycle.r-lib.org/articles/stages.html)

<!-- badges: end -->

## Overview

A **tibble**, or `tbl_df`, is a modern reimagining of the data.frame, keeping what time has proven to be effective, and throwing out what is not. Tibbles are data.frames that are lazy and surly: they do less (i.e. they don’t change variable names or types, and don’t do partial matching) and complain more (e.g. when a variable does not exist). This forces you to confront problems earlier, typically leading to cleaner, more expressive code. Tibbles also have an enhanced [`print()`](https://rdrr.io/r/base/print.html) method which makes them easier to use with large datasets containing complex objects.

If you are new to tibbles, the best place to start is the [tibbles chapter](https://r4ds.had.co.nz/tibbles.html) in *R for data science*.

## Installation

<pre class='chroma'>
<span><span class='c'># The easiest way to get tibble is to install the whole tidyverse:</span></span>
<span><span class='nf'><a href='https://rdrr.io/r/utils/install.packages.html'>install.packages</a></span><span class='o'>(</span><span class='s'>"tidyverse"</span><span class='o'>)</span></span>
<span></span>
<span><span class='c'># Alternatively, install just tibble:</span></span>
<span><span class='nf'><a href='https://rdrr.io/r/utils/install.packages.html'>install.packages</a></span><span class='o'>(</span><span class='s'>"tibble"</span><span class='o'>)</span></span>
<span></span>
<span><span class='c'># Or the the development version from GitHub:</span></span>
<span><span class='c'># install.packages("devtools")</span></span>
<span><span class='nf'>devtools</span><span class='nf'>::</span><span class='nf'><a href='https://remotes.r-lib.org/reference/install_github.html'>install_github</a></span><span class='o'>(</span><span class='s'>"tidyverse/tibble"</span><span class='o'>)</span></span></pre>

## Usage

<pre class='chroma'>
<span><span class='kr'><a href='https://rdrr.io/r/base/library.html'>library</a></span><span class='o'>(</span><span class='nv'><a href='https://tibble.tidyverse.org/'>tibble</a></span><span class='o'>)</span></span></pre>

Create a tibble from an existing object with [`as_tibble()`](https://tibble.tidyverse.org/reference/as_tibble.html):

<pre class='chroma'>
<span><span class='nv'>data</span> <span class='o'>&lt;-</span> <span class='nf'><a href='https://rdrr.io/r/base/data.frame.html'>data.frame</a></span><span class='o'>(</span>a <span class='o'>=</span> <span class='m'>1</span><span class='o'>:</span><span class='m'>3</span>, b <span class='o'>=</span> <span class='nv'>letters</span><span class='o'>[</span><span class='m'>1</span><span class='o'>:</span><span class='m'>3</span><span class='o'>]</span>, c <span class='o'>=</span> <span class='nf'><a href='https://rdrr.io/r/base/Sys.time.html'>Sys.Date</a></span><span class='o'>(</span><span class='o'>)</span> <span class='o'>-</span> <span class='m'>1</span><span class='o'>:</span><span class='m'>3</span><span class='o'>)</span></span>
<span><span class='nv'>data</span></span>
<span><span class='c'>#&gt;   a b          c</span></span>
<span><span class='c'>#&gt; 1 1 a 2023-02-21</span></span>
<span><span class='c'>#&gt; 2 2 b 2023-02-20</span></span>
<span><span class='c'>#&gt; 3 3 c 2023-02-19</span></span>
<span></span>
<span><span class='nf'><a href='https://tibble.tidyverse.org/reference/as_tibble.html'>as_tibble</a></span><span class='o'>(</span><span class='nv'>data</span><span class='o'>)</span></span>
<span><span class='c'>#&gt; <span style='color: #555555;'># A tibble: 3 × 3</span></span></span>
<span><span class='c'>#&gt;       <span style='font-weight: bold;'>a</span> <span style='font-weight: bold;'>b</span>     <span style='font-weight: bold;'>c</span>         </span></span>
<span><span class='c'>#&gt;   <span style='color: #555555; font-style: italic;'>&lt;int&gt;</span> <span style='color: #555555; font-style: italic;'>&lt;chr&gt;</span> <span style='color: #555555; font-style: italic;'>&lt;date&gt;</span>    </span></span>
<span><span class='c'>#&gt; <span style='color: #555555;'>1</span>     1 a     2023-02-21</span></span>
<span><span class='c'>#&gt; <span style='color: #555555;'>2</span>     2 b     2023-02-20</span></span>
<span><span class='c'>#&gt; <span style='color: #555555;'>3</span>     3 c     2023-02-19</span></span></pre>

This will work for reasonable inputs that are already data.frames, lists, matrices, or tables.

You can also create a new tibble from column vectors with [`tibble()`](https://tibble.tidyverse.org/reference/tibble.html):

<pre class='chroma'>
<span><span class='nf'><a href='https://tibble.tidyverse.org/reference/tibble.html'>tibble</a></span><span class='o'>(</span>x <span class='o'>=</span> <span class='m'>1</span><span class='o'>:</span><span class='m'>5</span>, y <span class='o'>=</span> <span class='m'>1</span>, z <span class='o'>=</span> <span class='nv'>x</span><span class='o'>^</span><span class='m'>2</span> <span class='o'>+</span> <span class='nv'>y</span><span class='o'>)</span></span>
<span><span class='c'>#&gt; <span style='color: #555555;'># A tibble: 5 × 3</span></span></span>
<span><span class='c'>#&gt;       <span style='font-weight: bold;'>x</span>     <span style='font-weight: bold;'>y</span>     <span style='font-weight: bold;'>z</span></span></span>
<span><span class='c'>#&gt;   <span style='color: #555555; font-style: italic;'>&lt;int&gt;</span> <span style='color: #555555; font-style: italic;'>&lt;dbl&gt;</span> <span style='color: #555555; font-style: italic;'>&lt;dbl&gt;</span></span></span>
<span><span class='c'>#&gt; <span style='color: #555555;'>1</span>     1     1     2</span></span>
<span><span class='c'>#&gt; <span style='color: #555555;'>2</span>     2     1     5</span></span>
<span><span class='c'>#&gt; <span style='color: #555555;'>3</span>     3     1    10</span></span>
<span><span class='c'>#&gt; <span style='color: #555555;'>4</span>     4     1    17</span></span>
<span><span class='c'>#&gt; <span style='color: #555555;'>5</span>     5     1    26</span></span></pre>

[`tibble()`](https://tibble.tidyverse.org/reference/tibble.html) does much less than [`data.frame()`](https://rdrr.io/r/base/data.frame.html): it never changes the type of the inputs (e.g. it never converts strings to factors!), it never changes the names of variables, it only recycles inputs of length 1, and it never creates [`row.names()`](https://rdrr.io/r/base/row.names.html). You can read more about these features in [`vignette("tibble")`](https://tibble.tidyverse.org/articles/tibble.html).

You can define a tibble row-by-row with [`tribble()`](https://tibble.tidyverse.org/reference/tribble.html):

<pre class='chroma'>
<span><span class='nf'><a href='https://tibble.tidyverse.org/reference/tribble.html'>tribble</a></span><span class='o'>(</span></span>
<span>  <span class='o'>~</span><span class='nv'>x</span>, <span class='o'>~</span><span class='nv'>y</span>,  <span class='o'>~</span><span class='nv'>z</span>,</span>
<span>  <span class='s'>"a"</span>, <span class='m'>2</span>,  <span class='m'>3.6</span>,</span>
<span>  <span class='s'>"b"</span>, <span class='m'>1</span>,  <span class='m'>8.5</span></span>
<span><span class='o'>)</span></span>
<span><span class='c'>#&gt; <span style='color: #555555;'># A tibble: 2 × 3</span></span></span>
<span><span class='c'>#&gt;   <span style='font-weight: bold;'>x</span>         <span style='font-weight: bold;'>y</span>     <span style='font-weight: bold;'>z</span></span></span>
<span><span class='c'>#&gt;   <span style='color: #555555; font-style: italic;'>&lt;chr&gt;</span> <span style='color: #555555; font-style: italic;'>&lt;dbl&gt;</span> <span style='color: #555555; font-style: italic;'>&lt;dbl&gt;</span></span></span>
<span><span class='c'>#&gt; <span style='color: #555555;'>1</span> a         2   3.6</span></span>
<span><span class='c'>#&gt; <span style='color: #555555;'>2</span> b         1   8.5</span></span></pre>

## Related work

The tibble print method draws inspiration from [data.table](https://rdatatable.gitlab.io/data.table), and [frame](https://github.com/patperry/r-frame). Like [`data.table::data.table()`](https://Rdatatable.gitlab.io/data.table/reference/data.table.html), [`tibble()`](https://tibble.tidyverse.org/reference/tibble.html) doesn’t coerce strings to factors by default, doesn’t change column names, and doesn’t use rownames.

------------------------------------------------------------------------

## Code of Conduct

Please note that the tibble project is released with a [Contributor Code of Conduct](https://tibble.tidyverse.org/CODE_OF_CONDUCT.html). By contributing to this project, you agree to abide by its terms.
