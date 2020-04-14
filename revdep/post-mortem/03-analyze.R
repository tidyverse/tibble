library(tidyverse)
library(tidytext)


fog_recent <- readRDS("fog_recent.rds")

fog_words <-
  fog_recent %>%
  select(package, flavors, n = n_flavors, message) %>%
  rowid_to_column() %>%
  mutate(message = str_replace_all(message, "[0-9]", "")) %>%
  unnest_tokens(token, message, "words", stopwords = c("s", "in", "re", "x", "i", "tibble", "be"))

fog_words %>%
  count(token, rowid, wt = n) %>%
  bind_tf_idf(token, rowid, n) %>%
  group_by(rowid) %>%
  filter(row_number(-tf_idf) %in% 1:3) %>%
  ungroup() %>%
  count(token, sort = TRUE)

fog_ngrams <-
  fog_recent %>%
  select(package, flavors, n = n_flavors, message) %>%
  rowid_to_column() %>%
  mutate(message = str_replace_all(message, "[0-9]", "")) %>%
  unnest_tokens(token, message, "ngrams", n = 2, stopwords = c("s", "in", "re", "x", "i", "tibble", "be"))

fog_ngrams_tf_idf <-
  fog_ngrams %>%
  count(token, rowid, wt = n) %>%
  bind_tf_idf(token, rowid, n)

fog_ngrams_tf_idf %>%
  filter(between(percent_rank(tf_idf), 0.25, 0.75))

