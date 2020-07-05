library(tidyverse)

lib <- "minver/lib"
unlink(lib, recursive = TRUE, force = TRUE)
dir.create(lib, showWarnings = FALSE)

invisible(remotes::install_deps)
withr::with_libpaths(lib, remotes::install_deps(dependencies = TRUE))
withr::with_libpaths(lib, install.packages("memoise"))
