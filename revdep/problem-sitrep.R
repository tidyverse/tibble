#' ---
#' output: github_document
#' ---
#'
#+ setup, include = FALSE, cache = FALSE
knitr::opts_chunk$set(collapse = TRUE, comment = "#>", error = TRUE)

#+ body
library(commonmark)
library(xml2)
library(tidyverse)

new_problems_path <- here::here("revdep/new-problems.md")
md <- readLines(new_problems_path)
xml <- markdown_xml(md)

## handy for inspection in the browser
writeLines(xml, here::here("revdep/new-problems.xml"))

xml <- xml %>% read_xml() %>% xml_ns_strip()
xml_length(xml)

nodes <- xml_contents(xml)

#' Assigning nodes to packages.
df <- tibble(
  node_name  = map_chr(nodes, xml_name),
  level_attr = map_chr(nodes, xml_attr, attr = "level"),
  pkg_id     = cumsum(level_attr %in% "1")
) %>%
  rowid_to_column()

df %>%
  count(level_attr)

pkg <- xml %>%
  xml_find_all("//heading[@level='1']") %>%
  map_chr(xml_text)
head(pkg)

node_pos <- df %>%
  filter(!level_attr %in% "1") %>%
  select(rowid, pkg_id) %>%
  split(.[["pkg_id"]]) %>%
  set_names(pkg) %>%
  map("rowid")
node_pos[1:3]

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

