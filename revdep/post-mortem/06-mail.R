library(tidyverse)

fog <- readRDS("fog.rds")

fog_pkg <-
  fog %>%
  count(package) %>%
  pull(package)

maint <- tools:::CRAN_package_maintainers_db()

maint %>%
  filter(Package %in% !!fog_pkg) %>%
  count(Maintainer) %>%
  pull(Maintainer) %>%
  clipr::write_clip()
