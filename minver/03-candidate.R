library(tidyverse)

baseline <- readRDS("minver/baseline.rds")

baseline %>%
  select(package = 1) %>%
  pwalk(desc::desc_set_dep)

saveRDS(baseline, "minver/candidate-0001.rds")
