dir.create("vignettes", showWarnings = FALSE)
file.copy(dir("../../vignettes", pattern = "[.]Rmd$", full.names = TRUE), "vignettes", overwrite = TRUE)
