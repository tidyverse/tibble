library(magrittr)

redo <- readLines("revdep/new-problems.md") %>%
  grep("^# ", ., value = TRUE) %>%
  gsub("# ", "", .) %>%
  paste0("c_", ., "_new")

drake::clean(!!!redo, "new_lib")
