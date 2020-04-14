library(tidyverse)
library(tidytext)


fog_recent <- readRDS("fog_recent.rds")


fog_dump <-
  fog_recent %>%
  group_by(package) %>%
  summarize(message = glue::glue_collapse(message, sep = "\n")) %>%
  ungroup()

# wide vector
fog_dump %>%
  filter(str_detect(message, fixed("1 row must be assigned")))

# array indexing
fog_dump %>%
  filter(str_detect(message, fixed("must have one dimension, not 2")))

fog_dump %>%
  filter(package == "naniar") %>%
  pull(message) %>%
  cli::cat_line()

# compare unnamed, perhaps ensure that names are not added to tibble
# if not intended?
fog_dump %>%
  count(str_detect(message, fixed("names for")))

# load sf prior to adding to tibble
fog_dump %>%
  count(str_detect(message, fixed("sfc")))

fog_dump %>%
  count(str_detect(message, fixed("Input must be a vector")))

fog_dump %>%
  count(str_detect(message, "Lossy cast from .* to .* <logical>"))
