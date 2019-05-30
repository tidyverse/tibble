library(tidyverse)

# pkgdep <- pkgdep::as_pkgdep(available.packages())
# gen <- pkgdep::get_all_deps("tibble", pkgdep)

my_package <- basename(getwd())

db <- cranly::clean_CRAN_db()
network <- cranly::build_network(db)
tree <- cranly::compute_dependence_tree(network, my_package)

deps <- desc::desc_get_deps()

tree %>%
  arrange(generation) %>%
  distinct(package, .keep_all = TRUE) %>%
  arrange(-generation) %>%
  inner_join(deps, by = "package") %>%
  filter(version != "*") %>%
  saveRDS("minver/gen.rds")
