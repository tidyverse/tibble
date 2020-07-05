library(tidyverse)

fog_res <- readRDS("fog_res.rds")

fog_res %>%
  arrange(-error, -fail, -warn, -note, !has_other_issues) %>%
  view()

fog <- readRDS("fog.rds")

checked_manually <- c("cdcfluview", "metan", "openair", "vip")

fog_recent <-
  fog %>%
  filter(!(package %in% checked_manually)) %>%
  mutate(version = package_version(version)) %>%
  group_by(package) %>%
  filter(version == max(version)) %>%
  ungroup() %>%
  mutate(result = ordered(result, levels = c("ERROR", "WARN", "NOTE"))) %>%
  group_by(package) %>%
  filter(result == min(result)) %>%
  ungroup() %>%
  mutate(
    check = case_when(
      str_detect(check, "^running tests for arch") ~ "tests",
      check == "re-building of vignette outputs" ~ "vignettes",
      TRUE ~ check
    )
  )

fog_recent %>%
  count(check, wt = n_flavors) %>%
  arrange(-n)

# RNeXML, fixed by tibble 3.0.1
fog_recent %>%
  filter(check == "whether the namespace can be unloaded cleanly")

# No failures
fog_recent %>%
  filter(check == "whether package can be installed") %>%
  filter(flavors != "r-release-windows-ix86+x86_64") %>%
  pull(package)

# Not us
fog_recent %>%
  filter(check == "package dependencies") %>%
  pull()

# Not us
fog_recent %>%
  filter(check == "dependencies in R code") %>%
  pull()

fog_recent %>%
  filter(check %in% c("tests", "examples", "vignettes")) %>%
  saveRDS("fog_recent.rds")
