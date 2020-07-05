library(tidyverse)

bisect_first_min_version <- function(version) {
  na_versions <- which(map_int(version, length) > 1)
  if (length(na_versions) == 0) stop("All versions determined, move to next script.", call. = FALSE)
  first_na_version <- na_versions[[1]]

  version_candidates <- version[[first_na_version]]

  version_idx <- quantile(seq_along(version_candidates), 0.5, type = 1)

  min_version <- rep(NA_character_, length(version))

  pinned <- seq_len(first_na_version - 1)
  min_version[pinned] <- unlist(version[pinned])
  min_version[[first_na_version]] <- version_candidates[[version_idx]]
  min_version
}

update_bisect_result <- function(version, next_min_version, failure) {
  first_na_version <- which(map_int(version, length) > 1)[[1]]

  version_candidates <- package_version(version[[first_na_version]])
  pivot <- package_version(next_min_version[[first_na_version]])

  if (failure) {
    version_candidates <- version_candidates[ version_candidates > pivot ]
  } else {
    version_candidates <- version_candidates[ version_candidates <= pivot ]
  }

  version[[first_na_version]] <- as.character(version_candidates)
  version
}

candidate_files <- dir("minver", pattern = "candidate-....[.]rds")

candidate_file <- tail(candidate_files, 1)[[1]]

candidate <-
  readRDS(file.path("minver", candidate_file)) %>%
  mutate(next_min_version = bisect_first_min_version(version)) %>%
  mutate(dep = if_else(is.na(next_min_version), "*", paste0(">= ", next_min_version)))

print(candidate)

pinned <-
  candidate %>%
  filter(!is.na(next_min_version)) %>%
  select(package = 1, version = next_min_version) %>%
  arrange(-row_number())

print(pinned)

libpath <- tempfile("lib")
dir.create(libpath)

existing <- setdiff(dir("minver/lib"), pinned$package)

stopifnot(all(file.symlink(normalizePath(file.path("minver/lib", existing)), libpath)))

invisible(remotes::install_version)
invisible(rcmdcheck::rcmdcheck)

Sys.setenv(NOT_CRAN = "true")

result <- safely(
  ~ withr::with_libpaths(
    libpath,
    {
      pwalk(pinned, remotes::install_version, dependencies = character(), upgrade = "never")
      rcmdcheck::rcmdcheck(error_on = "note")
    }
  )
)()

failure <- is.null(result$result)
failure

n <- length(candidate_files) + 1

new_candidate <-
  candidate %>%
  mutate(version = update_bisect_result(version, next_min_version, failure)) %>%
  select(-next_min_version, -dep)

new_candidate %>%
  saveRDS(sprintf("minver/candidate-%.4d.rds", n))

new_candidate
