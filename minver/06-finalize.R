library(tidyverse)

candidate_files <- dir("minver", pattern = "candidate-....[.]rds")

candidate_file <- tail(candidate_files, 1)[[1]]

final <-
  readRDS(file.path("minver", candidate_file)) %>%
  unnest() %>%
  mutate(cond = if_else(version == first_version, "*", paste0(">= ", version))) %>%
  select(package, version = cond)

pwalk(final, desc::desc_set_dep)
