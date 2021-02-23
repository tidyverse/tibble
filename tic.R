do_package_checks(error_on = if (getRversion() >= "3.3") "note" else "error")

if (ci_has_env("DEV_VERSIONS")) {
  get_stage("install") %>%
    add_step(step_install_github(c("r-lib/rlang", "r-lib/cli", "r-lib/crayon", "r-lib/pillar", "r-lib/pkgconfig")))
}

# Build only for master or release branches
if (ci_has_env("BUILD_PKGDOWN") && grepl("^master$|^r-|^docs$", ci_get_branch())) {
  get_stage("install") %>%
    add_step(step_install_github("tidyverse/tidytemplate")) %>%
    add_step(step_install_github("r-lib/pkgdown#1236"))

  do_pkgdown(deploy = ci_can_push())
}
