problem-sitrep.R
================
jenny
Thu Nov 15 22:22:47 2018

``` r
library(commonmark)
library(xml2)
library(tidyverse)
#> ── Attaching packages ─────────────────────────────────────────── tidyverse 1.2.1 ──
#> ✔ ggplot2 3.1.0           ✔ purrr   0.2.5      
#> ✔ tibble  1.4.99.9005     ✔ dplyr   0.7.8      
#> ✔ tidyr   0.8.2           ✔ stringr 1.3.1      
#> ✔ readr   1.1.1           ✔ forcats 0.3.0
#> ── Conflicts ────────────────────────────────────────────── tidyverse_conflicts() ──
#> ✖ dplyr::filter() masks stats::filter()
#> ✖ dplyr::lag()    masks stats::lag()

new_problems_path <- here::here("revdep/new-problems.md")
md <- readLines(new_problems_path)
xml <- markdown_xml(md)

## handy for inspection in the browser
writeLines(xml, here::here("revdep/new-problems.xml"))

xml <- xml %>% read_xml() %>% xml_ns_strip()
xml_length(xml)
#> [1] 283

nodes <- xml_contents(xml)
```

Assigning nodes to packages.

``` r
df <- tibble(
  node_name  = map_chr(nodes, xml_name),
  level_attr = map_chr(nodes, xml_attr, attr = "level"),
  pkg_id     = cumsum(level_attr %in% "1")
) %>%
  rowid_to_column()

df %>%
  count(level_attr)
#> # A tibble: 4 x 2
#>   level_attr     n
#>   <chr>      <int>
#> 1 1             67
#> 2 2             70
#> 3 3              6
#> 4 <NA>         140

pkg <- xml %>%
  xml_find_all("//heading[@level='1']") %>%
  map_chr(xml_text)
head(pkg)
#> [1] "anomalize"        "anomalyDetection" "atlantistools"   
#> [4] "bayesammi"        "BayesMallows"     "baystability"

node_pos <- df %>%
  filter(!level_attr %in% "1") %>%
  select(rowid, pkg_id) %>%
  split(.[["pkg_id"]]) %>%
  set_names(pkg) %>%
  map("rowid")
node_pos[1:3]
#> $anomalize
#> [1] 2 3 4
#> 
#> $anomalyDetection
#> [1] 6 7 8
#> 
#> $atlantistools
#> [1] 10 11 12

node_list <- node_pos %>%
  map(~ nodes[.x])

enrow <- function(x, nm) {
  tibble(
    pkg = nm,
    version = sub("Version: ", "", xml_text(x[[1]])),
    output = x %>% tail(n = -1) %>% map_chr(xml_text) %>% paste(collapse = "\n\n")
  )
}
problems <- imap_dfr(node_list, enrow)

names_regexes <- c(
  "must be named",
  "error_column_must_be_named",
  "[.]name_repair",
  "`names` must have length",
  "`names` must not be `NULL`",
  "names.*must not be duplicated",
  "error_names_must_have_length"
)
names_regex <- paste(names_regexes, collapse = "|")

problems %>%
  mutate(
    names = grepl(names_regex, output),
    nrow  = grepl("`nrow` argument", output),
    phylo = grepl("coerce.*phylo", output)
  ) %>%
  count(names, nrow, phylo) %>%
  arrange(desc(n)) %>%
  mutate(
    prop = n / sum(n),
    cum_prop = cumsum(prop)
  )
#> # A tibble: 4 x 6
#>   names nrow  phylo     n   prop cum_prop
#>   <lgl> <lgl> <lgl> <int>  <dbl>    <dbl>
#> 1 TRUE  FALSE FALSE    38 0.567     0.567
#> 2 FALSE FALSE FALSE    18 0.269     0.836
#> 3 FALSE FALSE TRUE      7 0.104     0.940
#> 4 FALSE TRUE  FALSE     4 0.0597    1

library(cranlogs)
dl <- cran_downloads(when = "last-week", packages = pkg)

dl %>%
  count(package, wt = count) %>%
  arrange(desc(n)) %>%
  mutate(
    prop = n / sum(n),
    cum_prop = cumsum(prop)
  ) %>%
  print(n = 20)
#> # A tibble: 67 x 4
#>    package         n    prop cum_prop
#>    <chr>       <dbl>   <dbl>    <dbl>
#>  1 readxl      80370 0.467      0.467
#>  2 broom       54435 0.317      0.784
#>  3 plotly      23299 0.136      0.920
#>  4 prophet      2581 0.0150     0.935
#>  5 rsample      1329 0.00773    0.942
#>  6 naniar        832 0.00484    0.947
#>  7 conStruct     780 0.00454    0.952
#>  8 corrr         654 0.00380    0.955
#>  9 ritis         607 0.00353    0.959
#> 10 tibbletime    566 0.00329    0.962
#> 11 tidygraph     535 0.00311    0.965
#> 12 anomalize     381 0.00222    0.968
#> 13 tidytree      377 0.00219    0.970
#> 14 ggsn          297 0.00173    0.972
#> 15 drake         262 0.00152    0.973
#> 16 ggspatial     249 0.00145    0.975
#> 17 rplos         214 0.00124    0.976
#> 18 dexter        202 0.00117    0.977
#> 19 tidypredict   196 0.00114    0.978
#> 20 scholar       181 0.00105    0.979
#> # … with 47 more rows
```
