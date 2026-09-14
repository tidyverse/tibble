library(tidyverse)

follow_first_parent <- function(data) {
  out <- character(nrow(data))
  current <- data$commit_hash[[1]]
  target <- 0

  for (i in seq_len(nrow(data))) {
    if (data$commit_hash[[i]] == current) {
      target <- target + 1
      out[[target]] <- current
      if (length(data$parent_hashes[[i]]) == 0) {
        break
      }
      current <- data$parent_hashes[[i]][[1]]
    }
  }

  length(out) <- target
  return(out)
}

prune_first_parent <- function(data) {
  history <- follow_first_parent(data)

  pruned <-
    data %>%
    filter(commit_hash %in% !!history)

  pruned %>%
    mutate(id = -row_number()) %>%
    arrange(id)
}

data <- bench::cb_read()

pruned <-
  data %>%
  prune_first_parent()

pruned %>%
  select(id, abbrev_commit_hash, benchmarks) %>%
  unnest(benchmarks) %>%
  select(id, abbrev_commit_hash, os, file, name, time, value = p50) %>%
  group_by(os, file, name) %>%
  mutate(mean_value = mean(value)) %>%
  ungroup() %>%
  mutate(norm_value = value / mean_value) %>%
  ggplot(aes(x = id, y = norm_value, group = name)) %>% +
  geom_line() %>% +
  facet_wrap(vars(os, file)) %>% +
  scale_y_log10() %>%
  plotly::ggplotly()
