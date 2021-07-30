---
title: "Column data types"
output: rmarkdown::html_vignette
vignette: >
  %\VignetteIndexEntry{Column data types}
  %\VignetteEngine{knitr::rmarkdown}
  %\VignetteEncoding{UTF-8}
---

    library(tibble)

## Overview

This vignette shows an overview of known data types and their
abbreviations, and their origin. For example, `<int>` in the header of a
column indicates an integer column, and `<chr>` denotes a character
column.

<table>
<thead>
<tr class="header">
<th style="text-align: left;">Class</th>
<th style="text-align: left;">Data type</th>
<th style="text-align: left;">Example</th>
<th style="text-align: left;">Column header</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: left;">Atomic</td>
<td style="text-align: left;">logical</td>
<td style="text-align: left;"><code>TRUE</code></td>
<td style="text-align: left;">lgl</td>
</tr>
<tr class="even">
<td style="text-align: left;"></td>
<td style="text-align: left;">integer</td>
<td style="text-align: left;"><code>1L</code></td>
<td style="text-align: left;">int</td>
</tr>
<tr class="odd">
<td style="text-align: left;"></td>
<td style="text-align: left;">double</td>
<td style="text-align: left;"><code>1.5</code></td>
<td style="text-align: left;">dbl</td>
</tr>
<tr class="even">
<td style="text-align: left;"></td>
<td style="text-align: left;">character</td>
<td style="text-align: left;"><code>"A"</code></td>
<td style="text-align: left;">chr</td>
</tr>
<tr class="odd">
<td style="text-align: left;"></td>
<td style="text-align: left;">complex</td>
<td style="text-align: left;"><code>0+1i</code></td>
<td style="text-align: left;">cpl</td>
</tr>
<tr class="even">
<td style="text-align: left;"></td>
<td style="text-align: left;">raw</td>
<td style="text-align: left;"><code>as.raw(1)</code></td>
<td style="text-align: left;">raw</td>
</tr>
<tr class="odd">
<td style="text-align: left;"></td>
<td style="text-align: left;">list</td>
<td style="text-align: left;"><code>list(1)</code></td>
<td style="text-align: left;">list</td>
</tr>
<tr class="even">
<td style="text-align: left;"></td>
<td style="text-align: left;">named list</td>
<td style="text-align: left;"><code>list(a = 1)</code></td>
<td style="text-align: left;">named list</td>
</tr>
<tr class="odd">
<td style="text-align: left;">Built-in objects</td>
<td style="text-align: left;">factor</td>
<td style="text-align: left;"><code>factor("A")</code></td>
<td style="text-align: left;">fct</td>
</tr>
<tr class="even">
<td style="text-align: left;"></td>
<td style="text-align: left;">ordered</td>
<td style="text-align: left;"><code>ordered("a")</code></td>
<td style="text-align: left;">ord</td>
</tr>
<tr class="odd">
<td style="text-align: left;"></td>
<td style="text-align: left;">Date</td>
<td style="text-align: left;"><code>Sys.Date()</code></td>
<td style="text-align: left;">date</td>
</tr>
<tr class="even">
<td style="text-align: left;"></td>
<td style="text-align: left;">POSIXt</td>
<td style="text-align: left;"><code>Sys.time()</code></td>
<td style="text-align: left;">dttm</td>
</tr>
<tr class="odd">
<td style="text-align: left;"></td>
<td style="text-align: left;">difftime</td>
<td style="text-align: left;"><code>vctrs::new_duration(1)</code></td>
<td style="text-align: left;">drtn</td>
</tr>
<tr class="even">
<td style="text-align: left;">Objects from other packages</td>
<td style="text-align: left;">hms</td>
<td style="text-align: left;"><code>hms::hms(1)</code></td>
<td style="text-align: left;">time</td>
</tr>
<tr class="odd">
<td style="text-align: left;"></td>
<td style="text-align: left;">integer64</td>
<td style="text-align: left;"><code>bit64::as.integer64(1e+10)</code></td>
<td style="text-align: left;">int64</td>
</tr>
<tr class="even">
<td style="text-align: left;"></td>
<td style="text-align: left;">blob</td>
<td style="text-align: left;"><code>blob::blob(raw(1))</code></td>
<td style="text-align: left;">blob</td>
</tr>
<tr class="odd">
<td style="text-align: left;">Data frames</td>
<td style="text-align: left;">data.frame</td>
<td style="text-align: left;"><code>data.frame(a = 1)</code></td>
<td style="text-align: left;">df[,1]</td>
</tr>
<tr class="even">
<td style="text-align: left;"></td>
<td style="text-align: left;">tbl_df</td>
<td style="text-align: left;"><code>tibble(a = 1)</code></td>
<td style="text-align: left;">tibble[,1]</td>
</tr>
<tr class="odd">
<td style="text-align: left;">Unchanged</td>
<td style="text-align: left;">AsIs</td>
<td style="text-align: left;"><code>I(1L)</code></td>
<td style="text-align: left;">I<int></td>
</tr>
<tr class="even">
<td style="text-align: left;">vctrs types</td>
<td style="text-align: left;">unspecified</td>
<td style="text-align: left;"><code>vctrs::unspecified(1)</code></td>
<td style="text-align: left;">???</td>
</tr>
<tr class="odd">
<td style="text-align: left;"></td>
<td style="text-align: left;">vctrs_list_of</td>
<td style="text-align: left;"><code>vctrs::list_of(c(1L))</code></td>
<td style="text-align: left;">list<int></td>
</tr>
<tr class="even">
<td style="text-align: left;"></td>
<td style="text-align: left;">vctrs_vctr</td>
<td style="text-align: left;"><code>vctrs::new_vctr(1L)</code></td>
<td style="text-align: left;">vctrs_vc</td>
</tr>
<tr class="odd">
<td style="text-align: left;"></td>
<td style="text-align: left;">vctrs_partial_factor</td>
<td style="text-align: left;"><code>vctrs::partial_factor(letters)</code></td>
<td style="text-align: left;">prtl_fctr</td>
</tr>
<tr class="even">
<td style="text-align: left;"></td>
<td style="text-align: left;">vctrs_partial_frame</td>
<td style="text-align: left;"><code>vctrs::partial_frame(a = 1)</code></td>
<td style="text-align: left;">prtl</td>
</tr>
<tr class="odd">
<td style="text-align: left;">Language objects</td>
<td style="text-align: left;">function</td>
<td style="text-align: left;"><code>function() NULL</code></td>
<td style="text-align: left;">fn</td>
</tr>
<tr class="even">
<td style="text-align: left;"></td>
<td style="text-align: left;">symbol</td>
<td style="text-align: left;"><code>quote(a)</code></td>
<td style="text-align: left;">sym</td>
</tr>
<tr class="odd">
<td style="text-align: left;"></td>
<td style="text-align: left;">expression</td>
<td style="text-align: left;"><code>parse(text = "a &lt;- 1\nb&lt;- 2")</code></td>
<td style="text-align: left;">expression</td>
</tr>
<tr class="even">
<td style="text-align: left;"></td>
<td style="text-align: left;">quosures</td>
<td style="text-align: left;"><code>rlang::quos(a = 1)</code></td>
<td style="text-align: left;">quos</td>
</tr>
</tbody>
</table>

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
    #> $ Date          <date> 2021-07-30
    #> $ POSIXt        <dttm> 2021-07-30 06:11:25
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

The column header is obtained by calling `pillar::type_sum()` on the
column. This is an S3 method that can be overridden, but most of the
time it is more useful to override `vctrs::vec_ptype_abbr()`:

    pillar:::type_sum.default
    #> function (x) 
    #> {
    #>     pillar_attr <- attr(x, "pillar", exact = TRUE)
    #>     label <- pillar_attr$label
    #>     if (!is.null(label)) {
    #>         return(I(label))
    #>     }
    #>     if (is.object(x) || vctrs::vec_is(x)) {
    #>         return(vec_ptype_abbr(x))
    #>     }
    #>     switch(typeof(x), builtin = , special = , closure = "fn", 
    #>         environment = "env", symbol = if (is_missing(x)) {
    #>             "missing"
    #>         } else {
    #>             "sym"
    #>         }, typeof(x))
    #> }
    #> <bytecode: 0x1ee4c0de>
    #> <environment: namespace:pillar>
