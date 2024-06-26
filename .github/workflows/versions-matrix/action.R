# FIXME: Dynamic lookup by parsing https://svn.r-project.org/R/tags/
r_versions <- c("devel", paste0("4.", 4:0))
macos <- data.frame(os = "macos-latest", r = r_versions[2:3])
windows <- data.frame(os = "windows-latest", r = r_versions[1:3])
linux_devel <- data.frame(os = "ubuntu-22.04", r = r_versions[1], `http-user-agent` = "release", check.names = FALSE)
linux <- data.frame(os = "ubuntu-22.04", r = r_versions[-1])
covr <- data.frame(os = "ubuntu-22.04", r = r_versions[2], covr = "true", desc = "with covr")

include_list <- list(macos, windows, linux_devel, linux, covr)

if (file.exists(".github/versions-matrix.R")) {
  custom <- source(".github/versions-matrix.R")$value
  include_list <- c(include_list, list(custom))
}

print(include_list)

filter <- read.dcf("DESCRIPTION")[1,]["Config/gha/filter"]
if (!is.na(filter)) {
  filter_expr <- parse(text = filter)[[1]]
  subset_fun_expr <- bquote(function(x) subset(x, .(filter_expr)))
  subset_fun <- eval(subset_fun_expr)
  include_list <- lapply(include_list, subset_fun)
  print(include_list)
}

to_json <- function(x) {
  if (nrow(x) == 0) return(character())
  parallel <- vector("list", length(x))
  for (i in seq_along(x)) {
    parallel[[i]] <- paste0('"', names(x)[[i]], '":"', x[[i]], '"')
  }
  paste0("{", do.call(paste, c(parallel, sep = ",")), "}")
}

configs <- unlist(lapply(include_list, to_json))
json <- paste0('{"include":[', paste(configs, collapse = ","), ']}')

writeLines(json, ".github/versions-matrix.json")
writeLines(json)
