problem-sitrep.R
================
jenny
Wed Nov 14 16:16:02 2018

``` r
library(commonmark)
library(xml2)
library(tidyverse)
#> ── Attaching packages ────────────────────────────────────────── tidyverse 1.2.1 ──
#> ✔ ggplot2 3.1.0           ✔ purrr   0.2.5      
#> ✔ tibble  1.4.99.9005     ✔ dplyr   0.7.8      
#> ✔ tidyr   0.8.2           ✔ stringr 1.3.1      
#> ✔ readr   1.1.1           ✔ forcats 0.3.0
#> ── Conflicts ───────────────────────────────────────────── tidyverse_conflicts() ──
#> ✖ dplyr::filter() masks stats::filter()
#> ✖ dplyr::lag()    masks stats::lag()

new_problems_path <- here::here("revdep/new-problems.md")
md <- readLines(new_problems_path)
xml <- markdown_xml(md)

## handy for inspection in the browser
writeLines(xml, here::here("revdep/new-problems.xml"))

xml <- xml %>% read_xml() %>% xml_ns_strip()
xml_length(xml)
#> [1] 418

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
#> 1 1             97
#> 2 2            103
#> 3 3             12
#> 4 <NA>         206

pkg <- xml %>%
  xml_find_all("//heading[@level='1']") %>%
  map_chr(xml_text)
head(pkg)
#> [1] "anomalize"      "atlantistools"  "bayesammi"      "baystability"  
#> [5] "beadplexr"      "breathtestcore"

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
#> $atlantistools
#> [1] 6 7 8
#> 
#> $bayesammi
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
  count(names, nrow, phylo)
#> # A tibble: 4 x 4
#>   names nrow  phylo     n
#>   <lgl> <lgl> <lgl> <int>
#> 1 FALSE FALSE FALSE    25
#> 2 FALSE FALSE TRUE      7
#> 3 FALSE TRUE  FALSE     4
#> 4 TRUE  FALSE FALSE    61

library(cranlogs)
dl <- cran_downloads(when = "last-week", packages = pkg)
## curl shouldn't be here
dl <- dl %>%
  filter(package != "curl")

dl %>%
  count(package, wt = count) %>%
  arrange(desc(n)) %>%
  mutate(
    prop = n / sum(n),
    cum_prop = cumsum(prop)
  ) %>%
  print(n = 20)
#> # A tibble: 96 x 4
#>    package         n    prop cum_prop
#>    <chr>       <dbl>   <dbl>    <dbl>
#>  1 readxl      79375 0.657      0.657
#>  2 xgboost      9159 0.0758     0.732
#>  3 DiagrammeR   5355 0.0443     0.777
#>  4 bsts         2764 0.0229     0.800
#>  5 prophet      2726 0.0226     0.822
#>  6 data.tree    2296 0.0190     0.841
#>  7 feather      2080 0.0172     0.858
#>  8 timetk       1838 0.0152     0.874
#>  9 janitor      1669 0.0138     0.887
#> 10 tidyquant    1434 0.0119     0.899
#> 11 fastDummies   727 0.00601    0.905
#> 12 naniar        708 0.00586    0.911
#> 13 corrr         634 0.00525    0.916
#> 14 purrrlyr      570 0.00472    0.921
#> 15 tibbletime    554 0.00458    0.926
#> 16 ritis         534 0.00442    0.930
#> 17 tidygraph     478 0.00395    0.934
#> 18 sweep         407 0.00337    0.937
#> 19 anomalize     374 0.00309    0.941
#> 20 tidytree      371 0.00307    0.944
#> # … with 76 more rows
```
