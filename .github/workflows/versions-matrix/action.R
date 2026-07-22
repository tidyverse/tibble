# Determine active versions of R to test against
tags <- xml2::read_html("https://svn.r-project.org/R/tags/")

bullets <-
  tags |>
  xml2::xml_find_all("//li") |>
  xml2::xml_text()

version_bullets <- grep("^R-([0-9]+-[0-9]+-[0-9]+)/$", bullets, value = TRUE)
versions <- unique(gsub("^R-([0-9]+)-([0-9]+)-[0-9]+/$", "\\1.\\2", version_bullets))

r_release <- head(sort(as.package_version(versions), decreasing = TRUE), 5)

deps <- desc::desc_get_deps()
r_crit <- deps$version[deps$package == "R"]
if (length(r_crit) == 1) {
  min_r <- as.package_version(gsub("^>= ([0-9]+[.][0-9]+)(?:.*)$", "\\1", r_crit))
  r_release <- r_release[r_release >= min_r]
}

r_versions <- c("devel", as.character(r_release))

macos <- data.frame(os = "macos-latest", r = r_versions[2:3])
windows <- data.frame(os = "windows-latest", r = r_versions[1:3])

# Linux amd64 (ubuntu-26.04) carries the full historical sweep: R-devel plus
# every supported release down to the oldest. amd64 has the most mature
# toolchain and the broadest CRAN binary coverage on Posit Package Manager, so
# it is where the deep back-compatibility testing lives.
linux_devel <- data.frame(os = "ubuntu-26.04", r = r_versions[1], `http-user-agent` = "release", check.names = FALSE)
linux <- data.frame(os = "ubuntu-26.04", r = r_versions[-1])
covr <- data.frame(os = "ubuntu-26.04", r = r_versions[2], covr = "true", desc = "with covr")

# Linux arm64 (ubuntu-26.04-arm) is intentionally ragged: only the two newest R
# versions, R-devel and R-release. These are the versions actually deployed to
# arm64 today (Apple Silicon, AWS Graviton, ...) and the ones with dependable
# arm64 R builds; re-running the full historical range on a second architecture
# would add cost without adding meaningful coverage. R-release (and R-devel)
# overlap with amd64, so at least one R version is exercised on both arches.
# PPM note: r-lib/actions/setup-r historically disabled Posit Package Manager on
# aarch64 Linux (r-lib/actions NEWS v2.11.2, 2025-02-19) because PPM shipped no
# arm64 binaries and would have served x86_64 ones. setup-r v2.12.0 (2026-04-29)
# re-enabled it, and PPM has published resolute (26.04) aarch64 CRAN binaries
# since PPM 2026.05.0, so arm64 jobs on @v2 now install binaries, not source.
linux_arm64 <- data.frame(os = "ubuntu-26.04-arm", r = r_versions[1:2])

include_list <- list(macos, windows, linux_devel, linux, covr, linux_arm64)

if (file.exists(".github/versions-matrix.R")) {
  custom <- source(".github/versions-matrix.R")$value
  if (is.data.frame(custom)) {
    custom <- list(custom)
  }
  include_list <- c(include_list, custom)
}

print(include_list)

filter <- read.dcf("DESCRIPTION")[1, ]["Config/gha/filter"]
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
json <- paste0('{"include":[', paste(configs, collapse = ","), "]}")

if (Sys.getenv("GITHUB_OUTPUT") != "") {
  writeLines(paste0("matrix=", json), Sys.getenv("GITHUB_OUTPUT"))
}
writeLines(json)
