# FIXME: Dynamic lookup by parsing https://svn.r-project.org/R/tags/
get_deps <- function() {
  # Determine package dependencies
  if (!requireNamespace("desc", quietly = TRUE)) {
    install.packages("desc")
  }

  deps_df <- desc::desc_get_deps()
  deps_df_optional <- deps_df$package[deps_df$type %in% c("Suggests", "Enhances")]
  deps_df_hard <- deps_df$package[deps_df$type %in% c("Depends", "Imports", "LinkingTo")]
  deps_df_base <- unlist(tools::standard_package_names(), use.names = FALSE)

  packages <- sort(deps_df_optional)
  packages <- intersect(packages, rownames(available.packages()))

  # Too big to fail, or can't be avoided:
  off_limits <- c("testthat", "rmarkdown", "rcmdcheck", deps_df_hard, deps_df_base)
  off_limits_dep <- unlist(tools::package_dependencies(off_limits, recursive = TRUE, which = "strong"))
  setdiff(packages, c(off_limits, off_limits_dep))
}

if (Sys.getenv("GITHUB_BASE_REF") != "") {
  print(Sys.getenv("GITHUB_BASE_REF"))
  system("git fetch origin ${GITHUB_BASE_REF}")
  # Use .. to avoid having to fetch the entire history
  # https://github.com/krlmlr/actions-sync/issues/45
  has_diff <- (system("git diff origin/${GITHUB_BASE_REF}.. | egrep '^[+][^+]' | grep -q ::") == 0)
  if (has_diff) {
    system("git diff origin/${GITHUB_BASE_REF}.. | egrep '^[+][^+]' | grep -q ::")
    packages <- get_deps()
  } else {
    writeLines("No changes using :: found, not checking without suggested packages")
    packages <- character()
  }
} else {
  packages <- get_deps()
}

if (length(packages) > 0) {
  json <- paste0(
    '{"package":[',
    paste0('"', packages, '"', collapse = ","),
    ']}'
  )
  writeLines(paste0("matrix=", json), Sys.getenv("GITHUB_OUTPUT"))
  writeLines(json)
} else {
  writeLines("No suggested packages found.")
}
