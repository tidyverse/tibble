# Check one shard of a revdep2 plan: many reverse dependencies, one job, one
# shared library.
#
# It runs in two phases, `install` and `check`, so that the workflow can put
# each in its own step and Actions can time them separately; `PHASE=all` runs
# both in one go, which is what a local invocation wants.
#
# The shard installs the union of its packages' dependencies once, then checks
# each of its packages against both versions of the package under test at the
# same time: two `R CMD check` runs side by side, against library stacks that
# differ in exactly that one package. Both halves always run -- a reusable
# baseline used to stand in for the old one, and comparing against another
# run's machine and CRAN snapshot is what made 76 of run 31879790285's 78
# `newly_broken` verdicts false. The two results are compared per package,
# revdepcheck-style.
#
# Failure is data here, never a job failure: a package that breaks, times out,
# or cannot even install its dependencies gets a manifest entry saying so, and
# the walk continues. The job goes red only when the driver itself is broken.
#
# The shard stops starting new checks when its deadline says the next one will
# not finish, and records the rest as deferred; a later run started with
# `retry-run` picks exactly those up. Results that exist by then -- including
# an old-version result whose new-version counterpart was cut off -- are still
# uploaded, so nothing decided is lost to the deadline.
#
# Before installing anything, the shard unpacks prebuilt dependencies (see
# util.R): this run's preflight library, and then the earlier runs the plan
# picked. pak only has to build what neither of them had.
#
# What each phase costs is recorded in timing.json next to the results: the
# collector folds it into the run's timings artifact, and the next plan sizes
# its shards from what this one measured rather than from CRAN's numbers and a
# guess.
#
# Environment variables:
#   SHARD                  - shard index from plan.json (required)
#   PLAN                   - plan file (default: plan.json)
#   PKG_DIR                - the revdep2-pkg artifact: meta.json, bin/ (required)
#   LIB_DIR                - the revdep2-lib artifact of *this* run: the
#                            preflight's library; may be missing or empty
#   BASELINE_DIR           - the revdep2-baseline artifact of the donor run;
#                            may be missing or empty, then everything is fresh
#   OUT_DIR                - results directory, uploaded as the shard artifact
#                            (default: results)
#   TIMEOUT_FACTOR         - per-check timeout as a multiple of the package's
#                            CRAN check time (default: 1.5)
#   TIMEOUT_MIN_MINUTES    - floor for that timeout; CRAN's machines are not
#                            these runners (default: 20 in the workflow)
#   DEADLINE_MINUTES       - stop starting new checks past this (default: 300)
#   PHASE                  - "install", "check", or "all" (default): which half
#                            of the shard this invocation runs

script_dir <- dirname(sub(
  "--file=",
  "",
  grep("^--file=", commandArgs(), value = TRUE)
))
source(file.path(script_dir, "util.R"))

script_started <- Sys.time()
elapsed <- function(from) {
  round(as.numeric(difftime(Sys.time(), from, units = "secs")), 1)
}

shard_index <- as.integer(env_chr("SHARD"))
stopifnot(!is.na(shard_index))
plan <- read_json(env_chr("PLAN", "plan.json"))
pkg_dir <- env_chr("PKG_DIR", "pkg")
baseline_dir <- env_chr("BASELINE_DIR", "baseline")
out_dir <- env_chr("OUT_DIR", "results")
timeout_factor <- env_num("TIMEOUT_FACTOR", 1.5)
timeout_min_sec <- env_num("TIMEOUT_MIN_MINUTES", 10) * 60
deadline <- Sys.time() + env_num("DEADLINE_MINUTES", 300) * 60

mine <- Filter(function(s) s$index == shard_index, plan$shards)
if (length(mine) == 0) {
  stop(
    "Plan has no shard ",
    shard_index,
    " (it has ",
    length(plan$shards),
    "); the plan and the matrix disagree",
    call. = FALSE
  )
}
shard <- mine[[1]]
members <- vapply(shard$packages, function(p) p$name, character(1))
meta <- read_json(file.path(pkg_dir, "meta.json"))
package <- plan$package

dir.create(file.path(out_dir, "pkgs"), recursive = TRUE, showWarnings = FALSE)
manifest_path <- file.path(out_dir, "manifest.ndjson")
work <- file.path(env_chr("RUNNER_TEMP", tempdir()), "revdep2-work")
dir.create(work, recursive = TRUE, showWarnings = FALSE)

# Which half of the shard this invocation runs. The workflow calls the driver
# twice so that Actions times the install and the checks separately; `all` is
# for running the whole shard in one process, which is what a local invocation
# wants. The install leaves `install-state.json` behind and the checks read it,
# so the split costs one small file and repeats nothing.
phase <- env_chr("PHASE", "all")
if (!phase %in% c("all", "install", "check")) {
  stop("PHASE must be one of \"all\", \"install\", \"check\"", call. = FALSE)
}
do_install <- phase %in% c("all", "install")
do_check <- phase %in% c("all", "check")
install_state <- file.path(work, "install-state.json")

# Which slice of the shard's packages this invocation checks, as `i/n`.
#
# The driver has always written its results as it goes -- one manifest line per
# package, appended -- so that a shard killed part way through still accounts
# for what it finished. That only helps if someone *uploads* them, and the
# upload was one step at the very end. Shard 16 of run 31951756102 got three
# minutes into a 196-minute check budget before its runner was reclaimed:
#
#   ##[error]The runner has received a shutdown signal.
#   ##[error]Process completed with exit code 143.
#
# `if: always()` cannot help there -- a reclaimed runner runs nothing further,
# so the upload was skipped and all 87 packages came back `missing`. Slicing
# the check phase into several steps, each followed by an upload, bounds that
# loss to one slice. The slices share `OUT_DIR`, and the artifact is overwritten
# under one name, so the last upload to survive carries everything before it.
check_slice <- local({
  raw <- trimws(env_chr("CHECK_SLICE"))
  if (!nzchar(raw)) {
    return(list(index = 1L, of = 1L))
  }
  parts <- suppressWarnings(as.integer(strsplit(raw, "/", fixed = TRUE)[[1]]))
  if (
    length(parts) != 2 ||
      anyNA(parts) ||
      parts[[1]] < 1 ||
      parts[[2]] < 1 ||
      parts[[1]] > parts[[2]]
  ) {
    stop("CHECK_SLICE must be `i/n` with 1 <= i <= n, not ", raw, call. = FALSE)
  }
  list(index = parts[[1]], of = parts[[2]])
})
last_slice <- check_slice$index == check_slice$of

inform(
  "Shard ",
  shard_index,
  ": ",
  length(members),
  " package(s), ",
  "estimated ~",
  shard$estimate_minutes,
  " min"
)

# The running state per package; every entry ends up as one manifest line.
state <- new.env(parent = emptyenv())
for (p in shard$packages) {
  assign(
    p$name,
    list(
      package = p$name,
      version = p$version,
      level = p$level %||% 0L,
      shard = shard_index,
      weight_minutes = p$weight_minutes,
      t_total = p$t_total %||% 0,
      dep_fingerprint = p$dep_fingerprint,
      baseline_planned = isTRUE(p$baseline),
      # Whether the old check reproduced the baseline this run was offered.
      # NA when there was none to compare against.
      baseline_agrees = NA,
      result = "deferred",
      status = "",
      status_old = "",
      status_new = "",
      new_issues = 0L,
      t_old = NA,
      t_new = NA,
      old_checked_at = NA,
      message = ""
    ),
    envir = state
  )
}
update <- function(name, ...) {
  entry <- get(name, envir = state)
  entry[names(list(...))] <- list(...)
  assign(name, entry, envir = state)
  entry
}

counts <- function(x) {
  if (!inherits(x, "rcmdcheck")) {
    return("?")
  }
  sprintf(
    "%dE %dW %dN",
    length(x$errors),
    length(x$warnings),
    length(x$notes)
  )
}

# ---------------------------------------------------------------- install ----

# The two versions cascade rather than replace each other.
#
# `R_LIBS` is a search path, so a check can name a library holding exactly one
# package -- the CRAN release, or the dev build -- in front of the shared
# library holding every dependency. Nothing is installed or uninstalled
# between the phases, which is what used to force them to run one after the
# other; now both can run at once against libraries that differ in exactly the
# package under test.
lib <- .libPaths()[[1]]
lib_old <- file.path(work, "lib-old")
lib_new <- file.path(work, "lib-new")

if (do_install) {
  install <- unlist(shard$install, use.names = FALSE)

  # What is already built, unpacked into the library pak installs into: this
  # run's own preflight library first -- it is the freshest there is, and
  # without it every shard would rebuild what the preflight compiled minutes
  # ago -- then the earlier runs the plan picked, for whatever the preflight
  # could not supply. pak still resolves the whole set afterwards; the point is
  # to skip *building* what has not changed, not to skip resolving it.
  restore_started <- Sys.time()
  restored <- c(
    restore_local_library(env_chr("LIB_DIR"), lib, install),
    restore_prebuilt(plan, lib, install)
  )
  restore_seconds <- elapsed(restore_started)
  inform(
    length(restored),
    " dependency binaries restored, ",
    length(install) - length(restored),
    " left to pak"
  )

  # With a restored library, `upgrade = FALSE` would freeze whatever version the
  # donor happened to hold; the plan's dependency fingerprints are computed from
  # CRAN *now*, so the library has to follow CRAN now.
  upgrade <- length(restored) > 0

  # The pak cache this shard restored was saved by the preflight, so a metadata
  # database broken there arrives here intact -- which is how run 31282820357
  # turned one bad preflight into sixty shards that installed nothing and
  # reported every one of their packages as a depfail. Asking pak what it can
  # see costs seconds, and a shard that cannot see CRAN is worth saying out loud
  # rather than working around.
  if (identical(ensure_metadata(sprintf("Shard %d", shard_index)), "broken")) {
    inform("pak cannot see CRAN here; every check will be a depfail")
  }

  # In dependency order, a hundred at a time, for the same reason the preflight
  # does it: one pak call for the whole set is one resolution of the whole set,
  # and that is the part that stops degrading gracefully as the set grows. A
  # shard's union is a fraction of the preflight's, but it is the same call.
  chunk_size <- env_num("REVDEP2_INSTALL_CHUNK", 400)
  chunks <- install_chunks(install, cran_db(), chunk_size)
  inform(
    "Installing ",
    length(install),
    " dependencies in ",
    length(chunks),
    " chunk(s) of at most ",
    chunk_size,
    ", dependencies first"
  )
  install_started <- Sys.time()
  # The install gets a slice of the shard's time, not all of it.
  #
  # It used to be handed the shard's whole deadline, on the reasoning that an
  # install running into it "leaves no time to check anything". That is true
  # and it is the wrong conclusion: a shard that spends its entire budget
  # installing reports *nothing at all*, where one that stops early reports a
  # depfail for the packages it could not install and a real verdict for the
  # rest. Shard 3 of run 31893156685 sat in this step for 2 h 33 m and had to
  # be cancelled; its 50 packages came back `missing`, which is the one result
  # that says nothing to anybody.
  #
  # 45 minutes, from the 39 shard installs the last two runs measured:
  # median 9.4, p90 13.7, worst 16.6. So the budget is 2.7x the worst install
  # anyone has actually seen, and 15% of the shard's deadline -- loose enough
  # that a healthy shard can never notice it, tight enough that shard 3's
  # 2 h 33 m would have been cut off more than three times sooner.
  #
  # Doubled where little was restored, because every one of those 39 had its
  # preflight library (95% of the union or better) and a cold install is
  # therefore unmeasured. A preflight that dies is survivable by design -- more
  # so since it became a `continue-on-error` step -- so cold shards will
  # happen, and the one thing worse than a slow install is depfailing 50
  # packages that would have installed given a few more minutes.
  install_budget <- env_num("REVDEP2_SHARD_INSTALL_MINUTES", 45)
  if (length(restored) < 0.5 * length(install)) {
    install_budget <- 2 * install_budget
    inform(sprintf(
      "Only %d of %d dependencies were restored; allowing %.0f min to install",
      length(restored),
      length(install),
      install_budget
    ))
  }
  install_deadline <- min(deadline, Sys.time() + install_budget * 60)
  bulk_ok <- install_in_chunks(
    chunks,
    lib = lib,
    upgrade = upgrade,
    deadline = install_deadline
  )
  if (!bulk_ok) {
    # Which packages are missing is a question about the filesystem, and
    # `missing_from()` answers it that way -- as the preflight already did.
    # Asking `requireNamespace()` instead *loads* each one: hundreds of
    # namespaces and their DLLs into the driver process, and past
    # `R_MAX_NUM_DLLS` (614) it starts returning FALSE for packages that are
    # installed, so the loop reinstalls them. And `next` on the deadline only
    # skipped the install, after the namespace had been loaded; it never
    # stopped.
    for (p in missing_from(lib, install)) {
      if (Sys.time() > install_deadline) {
        inform("Past the install deadline; the rest is left to depfail")
        break
      }
      run <- pak_install(
        p,
        lib = lib,
        upgrade = upgrade,
        timeout_seconds = install_timeout_seconds(),
        label = paste("installing", p)
      )
      if (!run$ok) {
        inform("Could not install ", p, ": ", run$message)
      }
    }
  }

  # After the installs and before the first check: pak has covered whatever it
  # installed itself, so what is left is exactly the restored packages -- this
  # run's preflight library and the plan's donors. A shard has no load test, so
  # an unmet system requirement here would surface as a check failure blamed on
  # the revdep.
  ensure_sysreqs(lib, sprintf("Shard %d", shard_index))

  # And the requirements of the packages this shard will *check*, which the
  # survey above cannot see: they are never installed into the library, `R CMD
  # check` builds each one from its tarball.
  ensure_check_sysreqs(members, sprintf("Shard %d", shard_index))

  install_seconds <- elapsed(install_started)
  inform(
    "Dependencies ready after ",
    round(install_seconds / 60, 1),
    " min (",
    round(restore_seconds / 60, 1),
    " min unpacking prebuilt)"
  )

  dir.create(lib_old, recursive = TRUE, showWarnings = FALSE)
  dir.create(lib_new, recursive = TRUE, showWarnings = FALSE)

  # The shared library must not hold the package under test at all, or it would
  # shadow neither and both checks would see whatever the resolver left there.
  unlink(file.path(lib, package), recursive = TRUE)

  inform(
    "Installing ",
    package,
    " ",
    plan$cran_version,
    " into the old library"
  )
  cran_install <- pak_install(
    package,
    lib = lib_old,
    upgrade = FALSE,
    timeout_seconds = install_timeout_seconds(),
    label = paste("installing", package)
  )
  if (!cran_install$ok) {
    stop("Installing the CRAN release of ", package, " failed", call. = FALSE)
  }
  our_cran_version <- as.character(utils::packageVersion(package, lib_old))
  if (!identical(our_cran_version, plan$cran_version)) {
    inform(
      "Note: old checks run against ",
      our_cran_version,
      " (the repositories lag CRAN, the plan expected ",
      plan$cran_version,
      ")"
    )
  }

  binary <- file.path(pkg_dir, meta$binary)
  inform("Installing dev binary ", basename(binary), " into the new library")
  if (
    system2(
      "R",
      c("CMD", "INSTALL", "-l", shQuote(lib_new), shQuote(binary))
    ) !=
      0
  ) {
    stop("Installing the prebuilt dev binary failed", call. = FALSE)
  }
  our_dev_version <- as.character(utils::packageVersion(package, lib_new))

  # What the check phase needs to know about this one, and what the timings at
  # the end report. Everything else it can work out for itself from the library
  # it finds on disk.
  write_json(
    list(
      install_packages = length(install),
      restored = length(restored),
      restore_seconds = restore_seconds,
      install_seconds = install_seconds,
      our_cran_version = our_cran_version,
      our_dev_version = our_dev_version,
      # When the shard's clock started, and what the install phase spent of it.
      # Both matter to the phase that follows: it has to finish inside the same
      # job, and its own `script_seconds` is no longer the whole driver.
      started_at = format(script_started, "%Y-%m-%dT%H:%M:%SZ", tz = "UTC"),
      phase_seconds = elapsed(script_started)
    ),
    install_state
  )
}

if (!do_check) {
  inform("Install phase complete; the check phase runs as its own step")
  quit(save = "no", status = 0)
}

# An install phase that never finished leaves no state, and there is nothing
# to check without the two one-package libraries it builds. But every package
# still has to be *accounted for*: `missing` -- which is what the collector
# reports for a shard that uploaded nothing -- says only that a job died, while
# a manifest full of `error` says which shard, and why, and is picked up by
# `retry-run` just the same. Shard 3 of run 31893156685 lost 50 packages to
# exactly this.
if (!file.exists(install_state)) {
  reason <- sprintf(
    "shard %d: the install phase did not finish, so nothing could be checked",
    shard_index
  )
  inform(reason)
  invisible(file.create(manifest_path))
  for (name in members) {
    update(name, result = "error", message = reason)
    entry <- get(name, envir = state)
    entry$our_cran_version <- plan$cran_version
    entry$our_dev_version <- plan$dev_version
    cat(
      jsonlite::toJSON(entry, auto_unbox = TRUE, null = "null"),
      "\n",
      sep = "",
      file = manifest_path,
      append = TRUE
    )
  }
  append_summary(c(
    if (check_slice$of > 1L) {
    sprintf("### Shard %d, slice %d/%d", shard_index, check_slice$index, check_slice$of)
  } else {
    sprintf("### Shard %d", shard_index)
  },
    "",
    sprintf("%d package(s) not checked: %s.", length(members), reason)
  ))
  quit(save = "no", status = 0)
}
installed_state <- read_json(install_state)
our_cran_version <- installed_state$our_cran_version
our_dev_version <- installed_state$our_dev_version

# The deadline belongs to the *shard*, not to this process.
#
# `deadline` was computed at the top of the script, so the check phase gave
# itself a fresh 300 minutes on top of whatever the install phase had already
# spent -- and the job's own `timeout-minutes: 350` covers their sum. A shard
# with a 50-minute install could then be killed mid-check by Actions instead of
# stopping itself and deferring, which is the one thing the deadline exists to
# prevent. Rebased on when the install phase started.
shard_started <- tryCatch(
  as.POSIXct(
    installed_state$started_at,
    format = "%Y-%m-%dT%H:%M:%SZ",
    tz = "UTC"
  ),
  error = function(e) NA
)
if (!is.na(shard_started)) {
  deadline <- shard_started + env_num("DEADLINE_MINUTES", 300) * 60
  inform(sprintf(
    "Install phase took %s; %s of the shard's deadline left for checks",
    format_duration(installed_state$phase_seconds %||% 0),
    format_duration(max(0, as.numeric(deadline - Sys.time(), units = "secs")))
  ))
}
invisible(file.create(manifest_path))

# What a check will be able to load, which is not the same as what is in the
# shared library: the package under test is deliberately *not* there. It is
# unlinked at the end of the install phase so that neither half's cascading
# library is shadowed by it, and it lives in `lib-old` and `lib-new` instead --
# neither of which is on this process's `.libPaths()`, because only
# `check-pair.sh` puts them on `R_LIBS`.
#
# Asking the bare `installed.packages()` therefore reports the package under
# test as missing, and `strong_missing()` below then reports it missing for
# every revdep that depends on it strongly -- which is every revdep, under
# `which: strong`. The whole shard would come back `depfail` having checked
# nothing. Before the install and check phases were split this line ran while
# the package was still in the shared library, so the question never arose.
installed <- rownames(utils::installed.packages(
  lib.loc = c(.libPaths(), lib_old)
))

# One manifest line, appended as soon as the package has one.
reported <- character()
write_manifest_line <- function(entry) {
  entry$our_cran_version <- our_cran_version
  entry$our_dev_version <- our_dev_version
  cat(
    jsonlite::toJSON(entry, auto_unbox = TRUE, null = "null"),
    "\n",
    sep = "",
    file = manifest_path,
    append = TRUE
  )
}
inform(sprintf(
  "Checking old (%s) and new (%s) concurrently, two at a time per package",
  our_cran_version,
  our_dev_version
))

# A package whose *strong* dependency closure is incomplete cannot produce a
# check result worth comparing; missing suggests are tolerable, the check runs
# with _R_CHECK_FORCE_SUGGESTS_=false, the way CRAN treats unavailable ones.
db <- cran_db()
strong_missing <- function(name) {
  strong <- tools::package_dependencies(
    name,
    db = db,
    which = "strong",
    recursive = TRUE
  )[[1]]
  setdiff(intersect(strong, rownames(db)), c(installed, base_packages()))
}
runnable <- character()
for (name in members) {
  missing <- tryCatch(strong_missing(name), error = function(e) character())
  if (length(missing) > 0) {
    update(
      name,
      result = "depfail",
      message = paste(
        "Dependencies not installed:",
        paste(missing, collapse = ", ")
      )
    )
    inform(
      name,
      ": dependencies missing (",
      paste(missing, collapse = ", "),
      ")"
    )
  } else {
    runnable <- c(runnable, name)
  }
}

# ---------------------------------------------------------------- sources ----

src_dir <- file.path(work, "src")
dir.create(src_dir, showWarnings = FALSE)
sources <- list()
for (name in runnable) {
  tarball <- tryCatch(
    {
      hit <- utils::download.packages(
        name,
        destdir = src_dir,
        repos = cran_repo(),
        type = "source",
        quiet = TRUE
      )
      hit[1, 2]
    },
    error = function(e) NULL
  )
  if (is.null(tarball)) {
    update(
      name,
      result = "error",
      message = "Source tarball could not be downloaded"
    )
    inform(name, ": source download failed")
  } else {
    sources[[name]] <- tarball
    actual <- sub(
      sprintf("^%s_(.*)[.]tar[.]gz$", name),
      "\\1",
      basename(tarball)
    )
    update(name, version = actual)
  }
}
runnable <- names(sources)

# Dealt round robin rather than in blocks. `runnable` is heaviest first, so a
# contiguous cut would put every long check in the first slice and leave the
# last one with nothing but the cheap ones -- and the deadline, which stops the
# shard when the next check will not fit, would then bite unevenly. Round robin
# gives every slice the same mix.
if (check_slice$of > 1L) {
  mine <- seq(check_slice$index, length(runnable), by = check_slice$of)
  inform(sprintf(
    "Slice %d/%d: %d of this shard's %d runnable package(s)",
    check_slice$index,
    check_slice$of,
    length(mine),
    length(runnable)
  ))
  runnable <- runnable[mine]
}

# ------------------------------------------------------------------ checks ---

# Stop before a check the trailing estimate says will not finish -- but always
# attempt the first check of a phase, or a mis-budgeted shard would make no
# progress at all and a retry would repeat the mistake.
checks_started <- 0L
check_seconds <- 0
out_of_time <- function(entry) {
  if (checks_started == 0L) {
    return(FALSE)
  }
  budget_sec <- max(entry$weight_minutes, 1) * 60 * 1.3
  Sys.time() + budget_sec > deadline
}

# One package, both versions, at once.
#
# check-pair.sh runs the two `R CMD check` invocations concurrently against the
# cascading libraries and writes each one's log and exit status; this reads
# them back. `rcmdcheck::parse_check()` turns a 00check.log into the same
# object `rcmdcheck()` used to return, so everything downstream -- the counts,
# `compare_checks()`, the manifest -- is unchanged.
#
# The timeout is coreutils' rather than rcmdcheck's, which is what makes the
# distinction reliable: exit 124 is the deadline, anything else is the check
# saying something.
# The check log with this run's incidentals taken out of it.
#
# Two things differ between the halves for reasons that have nothing to do with
# the package:
#
#   * the paths. The libraries cascade, so they differ by construction --
#     `.../lib-old/...` against `.../lib-new/...` -- and so do the two check
#     directories, which the log names in its first line and quotes in every
#     "see ... for details".
#   * the timings. `--as-cran` sets `_R_CHECK_TIMINGS_`, so every stage slower
#     than ten seconds prints its own `[user/elapsed]` pair, and two checks
#     racing each other for the same four cores never agree on those. A run of
#     rphylopic against the *same* igraph on both sides differed in exactly two
#     lines: the log directory, and `[14s/12s]` against `[13s/11s]`.
#
# Both matter twice. `compare_checks()` matches issues by their text, so a
# difference in the first line of an issue makes an issue both halves have look
# like a new one; and the diff between the halves is only worth printing if two
# identical results produce an empty one.
#
# Nothing else is touched: a difference anywhere but here is exactly what this
# workflow exists to find.
neutral_log <- function(path, name) {
  lines <- readLines(path, warn = FALSE)
  for (from in c(lib_old, lib_new, file.path(work, "check", name))) {
    lines <- gsub(from, "<lib>", lines, fixed = TRUE)
  }
  # The phase also names itself in the .Rcheck path under the work directory.
  lines <- gsub("<lib>/(old|new)", "<lib>", lines)
  # `[14s/12s]`, and the one-number form R uses where it has only one.
  gsub("\\[[0-9.]+s(/[0-9.]+s)?\\]", "[]", lines)
}

# How much of a package's diff goes into the job log before it is cut off.
diff_max_lines <- env_num("REVDEP2_DIFF_MAX_LINES", 200)

# How much of an installation or test transcript goes into the job summary.
# Both are read to find out why something broke, and 80 lines -- the default
# for the check log, which is a summary of stages -- cuts a compiler error or a
# testthat run off in the middle.
detail_max_lines <- env_num("REVDEP2_DETAIL_MAX_LINES", 300)

# The two halves' check logs, as a patch.
#
# Both sides are neutralised first, so the paths and the stage timings that
# differ in every pair are gone and what is left is the package: an empty diff
# means the dev version changed nothing about this check, however long the log.
check_diff <- function(name, old_log, new_log) {
  tmp <- file.path(tempdir(), c("old-00check.log", "new-00check.log"))
  writeLines(neutral_log(old_log, name), tmp[[1]])
  writeLines(neutral_log(new_log, name), tmp[[2]])
  on.exit(unlink(tmp), add = TRUE)
  suppressWarnings(system2(
    "diff",
    shQuote(c("-u", "--label", "old", tmp[[1]], "--label", "new", tmp[[2]])),
    stdout = TRUE,
    stderr = NULL
  ))
}

check_pair <- function(name) {
  checks_started <<- checks_started + 1L
  work_dir <- file.path(work, "check", name)
  unlink(work_dir, recursive = TRUE)
  dir.create(work_dir, recursive = TRUE, showWarnings = FALSE)
  # The timeout scales with what the check costs CRAN, floored because these
  # runners are slower than CRAN's machines and a tiny package must not be
  # killed over the difference.
  timeout_sec <- max(
    timeout_min_sec,
    timeout_factor * (get(name, envir = state)$t_total %||% 0)
  )
  started <- Sys.time()
  system2(
    file.path(script_dir, "check-pair.sh"),
    shQuote(c(
      sources[[name]],
      work_dir,
      lib_old,
      lib_new,
      lib,
      format(round(timeout_sec), scientific = FALSE)
    ))
  )
  duration <- round(as.numeric(Sys.time() - started, units = "secs"))
  # Both checks ran side by side, so the pair cost what the slower one cost,
  # and that -- not the sum of the two -- is what the shard's deadline spends
  # and what the cost model is fitted against.
  check_seconds <<- check_seconds + duration

  read_side <- function(phase) {
    dir <- file.path(work_dir, phase)
    # A pair that never wrote its status -- an unwritable work directory, a
    # full disk, `check-pair.sh` dying before its last line -- used to throw
    # "subscript out of bounds" out of the whole loop. It is one package's
    # problem, so it reads as one.
    status <- tryCatch(
      suppressWarnings(as.integer(readLines(
        file.path(dir, "status"),
        warn = FALSE
      )[[1]])),
      error = function(e) NA_integer_
    )
    log <- file.path(dir, paste0(name, ".Rcheck"), "00check.log")
    result <- if (identical(status, 124L)) {
      simpleError(sprintf(
        "%s check timed out after %ds",
        phase,
        round(timeout_sec)
      ))
    } else {
      tryCatch(
        {
          # Parsed twice, on purpose. `parse_check()` reads `00install.out`
          # and the test transcripts off the check directory it finds named in
          # the log's first line -- so parsing the *neutralised* text alone,
          # where that path has been replaced by a constant, silently leaves
          # `install_out` at "<00install.out file does not exist>" and
          # `test_fail` empty, and revdepcheck's failures.md loses exactly the
          # output a reader opens it for. So the real file gives the object,
          # and the neutralised text gives only the three fields that are
          # compared and diffed, where the paths and stage timings would
          # otherwise make two identical halves look different.
          res <- rcmdcheck::parse_check(log)
          neutral <- rcmdcheck::parse_check(text = neutral_log(log, name))
          res$errors <- neutral$errors
          res$warnings <- neutral$warnings
          res$notes <- neutral$notes
          # Who to tell about a broken package.
          #
          # revdepcheck's reports head each package with its own GitHub, its
          # maintainer's email and its CRAN mirror, and it reads all three out
          # of `$description` and `$cran` on the result. `rcmdcheck()` filled
          # those in because it had the package's source; `parse_check()`
          # cannot know them from a log, so every entry in problems.md came out
          # as "* : <UNKNOWN>" once the driver switched. The check directory has
          # the installed DESCRIPTION sitting in it, and every package here is
          # from CRAN by construction.
          described <- file.path(dirname(log), name, "DESCRIPTION")
          if (file.exists(described)) {
            res$description <- paste(
              readLines(described, warn = FALSE),
              collapse = "\n"
            )
          }
          res$cran <- TRUE
          res
        },
        error = function(e) {
          simpleError(sprintf(
            "%s check produced no readable result (exit %s): %s",
            phase,
            status,
            conditionMessage(e)
          ))
        }
      )
    }
    attr(result, "duration") <- duration
    attr(result, "timed_out") <- identical(status, 124L)
    # Where it was when the clock ran out. A check killed in `tests` is a
    # different animal from one killed while compiling, and the report used to
    # say only "timed out".
    attr(result, "last_step") <- if (file.exists(log)) {
      steps <- grep("^[*] ", readLines(log, warn = FALSE), value = TRUE)
      if (length(steps) > 0) utils::tail(steps, 1) else ""
    } else {
      ""
    }
    result
  }

  list(old = read_side("old"), new = read_side("new"))
}

# Record the half that did produce a result, when its partner did not.
#
# There is nothing to compare, so there is no verdict -- but the check ran, and
# what it found is the only thing anyone will have to go on when they come back
# to the package. Kept where the comparison path keeps it, so `retry-run` and a
# human reading the artifact find it in the usual place.
keep_side <- function(name, phase, result) {
  saveRDS(result, file.path(pkg_out(name), paste0(phase, ".rds")))
  if (identical(phase, "old")) {
    update(
      name,
      status_old = counts(result),
      t_old = attr(result, "duration"),
      old_checked_at = now_utc()
    )
  } else {
    update(
      name,
      status_new = counts(result),
      t_new = attr(result, "duration")
    )
  }
  copy_check_output(
    file.path(work, "check", name, phase, paste0(name, ".Rcheck")),
    file.path(out_dir, "pkgs", name, paste0(phase, "-check"))
  )
}

# The files worth carrying out of a check directory: what broke, and the
# complete transcripts of the two stages that explain why.
copy_check_output <- function(rcheck, keep) {
  dir.create(keep, recursive = TRUE, showWarnings = FALSE)
  for (f in c(
    "00check.log",
    "00install.out",
    list.files(
      rcheck,
      pattern = "[.]Rout[.]fail$|-Ex[.]Rout$",
      recursive = TRUE
    )
  )) {
    if (file.exists(file.path(rcheck, f))) {
      file.copy(
        file.path(rcheck, f),
        file.path(keep, basename(f)),
        overwrite = TRUE
      )
    }
  }
}

check_failure <- function(name, phase, result, progress) {
  if (isTRUE(attr(result, "timed_out"))) {
    # `timeout`, not `failed`. A check killed by the clock says nothing about
    # the package, and in the old phase it says nothing about our change
    # either -- the dev version is not even on that library path. Reporting it
    # as a failure put 60 packages into failures.md in run 31304411628 that
    # the run had learnt nothing about. `needs_recheck()` picks it up either
    # way, so `retry-run` still re-checks them.
    step <- attr(result, "last_step") %||% ""
    update(
      name,
      result = "timeout",
      message = sprintf(
        "%s check timed out after %ds%s",
        phase,
        attr(result, "duration"),
        if (nzchar(step)) paste0(", at: ", trimws(step)) else ""
      )
    )
    inform(
      name,
      ": ",
      phase,
      " check timed out (",
      attr(result, "duration"),
      "s)",
      if (nzchar(step)) paste0(" at ", trimws(step)) else "",
      ", ",
      progress
    )
  } else {
    update(name, result = "error", message = conditionMessage(result))
    inform(
      name,
      ": ",
      phase,
      " check errored: ",
      conditionMessage(result),
      ", ",
      progress
    )
  }
}

pkg_out <- function(name) {
  dir <- file.path(out_dir, "pkgs", name)
  dir.create(dir, recursive = TRUE, showWarnings = FALSE)
  dir
}

# The checks: one pass, both versions of every package at once.
#
# There used to be two passes -- every old check, then the dev binary
# installed over the CRAN one, then every new check -- because the library
# could only hold one version at a time. With the two cascading libraries it
# can hold both, so a package's pair runs together and the shard makes one
# pass. That halves a package's wall clock, and it means a package whose old
# check hangs still gets its new answer instead of the run learning nothing
# about it.
inform(sprintf(
  "Checking %d package(s), old and new side by side",
  length(runnable)
))
# How far along the shard is, on every line that reports a package.
#
# A shard runs for hours and its log is read while it runs, so "3/51" answers
# "is this nearly done?" without counting lines. The estimate answers the
# question actually being asked, which is when.
#
# The plan already priced every package; what it could not know is how this
# runner would compare. So the remaining packages are priced in the plan's own
# units and then rescaled by how its estimates have held up here so far --
# which absorbs both a slow runner and a systematically optimistic model,
# without either having to be known in advance. Before the first pair finishes
# there is nothing to rescale by and the plan's number stands.
planned_done <- 0
actual_done <- 0
planned_minutes <- function(name) {
  max(get(name, envir = state)$weight_minutes %||% 0, 0)
}
progress_note <- function(position) {
  left <- sum(vapply(
    utils::tail(runnable, length(runnable) - position),
    planned_minutes,
    numeric(1)
  ))
  scale <- if (planned_done > 0 && actual_done > 0) {
    actual_done / planned_done
  } else {
    1
  }
  sprintf(
    "%d/%d, %s",
    position,
    length(runnable),
    if (left > 0) {
      paste0("~", format_duration(left * scale * 60), " left")
    } else {
      "last one"
    }
  )
}

# One package: both halves, compared, recorded. Returns nothing; everything it
# learns goes into `state`, and the caller writes that out however this ends.
check_package <- function(name, position) {
  entry <- get(name, envir = state)

  if (out_of_time(entry)) {
    inform(name, ": deferred (deadline), ", progress_note(position))
    return(invisible(NULL))
  }

  # Both halves, always. A baseline used to stand in for the old check and
  # save it; with the pair running concurrently the old check costs no wall
  # clock at all, and reusing a result from another run means comparing
  # against a machine, a CRAN snapshot and a dependency tree that are not
  # this run's. The baseline is still read, but as a second opinion: if it
  # disagrees with what the old check just produced, that is drift worth
  # printing rather than a comparison worth trusting.
  pair <- check_pair(name)
  old <- pair$old
  new <- pair$new

  # What this one was priced at against what it cost, which is what prices the
  # rest. A timed-out check counts too: the clock really did spend it.
  planned_done <<- planned_done + planned_minutes(name)
  actual_done <<- actual_done + (attr(new, "duration") %||% 0) / 60
  progress <- progress_note(position)

  # A half that produced a result is kept even when its partner did not.
  #
  # Running the pair concurrently was supposed to mean that "a package whose
  # old check hangs still gets its new answer" -- but the old half's error used
  # to `next` straight past the code that saves the new one, so the answer was
  # produced and then thrown away, and the artifact held nothing at all for
  # that package. 19 packages in run 31879790285 lost a half this way.
  if (inherits(new, "error")) {
    if (!inherits(old, "error")) {
      keep_side(name, "old", old)
    }
    check_failure(name, "new", new, progress)
    return(invisible(NULL))
  }
  if (inherits(old, "error")) {
    keep_side(name, "new", new)
    check_failure(name, "old", old, progress)
    return(invisible(NULL))
  }
  saveRDS(old, file.path(pkg_out(name), "old.rds"))
  update(
    name,
    status_old = counts(old),
    t_old = attr(old, "duration"),
    old_checked_at = now_utc()
  )

  if (entry$baseline_planned) {
    rds <- file.path(baseline_dir, "old-rds", paste0(name, ".rds"))
    baseline <- tryCatch(readRDS(rds), error = function(e) NULL)
    if (!is.null(baseline)) {
      agrees <- identical(counts(baseline), counts(old))
      update(name, baseline_agrees = agrees)
      if (!agrees) {
        inform(sprintf(
          "%s: the baseline said %s, the old check now says %s",
          name,
          counts(baseline),
          counts(old)
        ))
      }
    }
  }
  saveRDS(new, file.path(pkg_out(name), "new.rds"))

  cmp <- tryCatch(
    rcmdcheck::compare_checks(old, new),
    error = function(e) NULL
  )
  if (is.null(cmp)) {
    update(
      name,
      result = "failed",
      status_new = counts(new),
      t_new = attr(new, "duration"),
      message = "both checks ran, but their results could not be compared"
    )
  } else if (aborted_on_dependencies(new) && aborted_on_dependencies(old)) {
    # Neither half ran. `compare_checks()` still says `+` -- the two agree, and
    # they agree on having done nothing -- so without this the package is
    # reported `ok`. It is not ok, it is unknown, and `needs_recheck()` picks
    # `depmissing` up so a retry with those repositories enabled re-checks it.
    absent <- missing_dependencies(new)
    update(
      name,
      result = "depmissing",
      status = cmp$status,
      status_new = counts(new),
      t_new = attr(new, "duration"),
      new_issues = 0L,
      message = paste0(
        "R CMD check stopped at `checking package dependencies` under both ",
        "versions; nothing was checked",
        if (length(absent) > 0) {
          paste0(" (not installed: ", paste(absent, collapse = ", "), ")")
        }
      )
    )
  } else {
    new_issues <- sum(cmp$cmp$change == 1)
    update(
      name,
      result = classify_status(cmp$status, new_issues),
      status = cmp$status,
      status_new = counts(new),
      # The pair's wall clock, charged to both halves: they ran side by side,
      # so neither one's own time is separable from the other's. It used to be
      # recorded only where the comparison failed, which left `t_new` null for
      # every package that compared -- that is, for all of them.
      t_new = attr(new, "duration"),
      new_issues = new_issues,
      # An install failure or a timeout leaves nothing to compare, so the
      # result is only "failed"; say which one it was.
      message = status_message(cmp$status)
    )
  }
  entry <- get(name, envir = state)
  inform(
    name,
    ": ",
    entry$result,
    " (old ",
    entry$status_old,
    ", new ",
    entry$status_new,
    ", ",
    attr(new, "duration"),
    "s for the pair, ",
    progress,
    ")"
  )

  # The parsed results carry everything the reports need; raw check output is
  # kept only where a human will want to dig, and then as the *difference*
  # between the two logs rather than the whole of the new one. The whole log
  # is thousands of lines that are identical in both, and what a reader wants
  # is the handful that are not.
  if (entry$result == "ok") {
    unlink(file.path(work, "check", name), recursive = TRUE)
  } else {
    keep <- file.path(out_dir, "pkgs", name, "new-check")
    rcheck <- function(phase) {
      file.path(work, "check", name, phase, paste0(name, ".Rcheck"))
    }
    copy_check_output(rcheck("new"), keep)
    old_log <- file.path(rcheck("old"), "00check.log")
    new_log <- file.path(rcheck("new"), "00check.log")
    if (file.exists(old_log) && file.exists(new_log)) {
      diff <- check_diff(name, old_log, new_log)
      writeLines(diff, file.path(keep, "00check.diff"))
      # And into the job log, where it is the one thing a reader of the run
      # actually wants: what the dev version changed about this package, in the
      # package's own words. Downloading an artifact to find out that a NOTE
      # gained a line is a poor trade. It is bounded because a package that
      # fails to install differs in thousands of lines and would bury the rest
      # of the shard; the whole diff is in the artifact either way.
      print_group(
        sprintf("%s: old vs new check log (%d line diff)", name, length(diff)),
        if (length(diff) == 0) {
          # Worth saying rather than leaving as an empty block. A package
          # called `newly_broken` whose two logs are identical once the paths
          # and the stage timings are out of them is not newly broken; it is
          # this harness getting it wrong, and this line is how a reader of the
          # run finds that out without downloading anything.
          "The two logs are identical apart from paths and stage timings."
        },
        head(diff, diff_max_lines),
        if (length(diff) > diff_max_lines) {
          sprintf(
            "[%d more lines; the whole diff is 00check.diff in the shard artifact]",
            length(diff) - diff_max_lines
          )
        }
      )
    }
    unlink(file.path(work, "check", name), recursive = TRUE)
  }
  invisible(NULL)
}

for (position in seq_along(runnable)) {
  name <- runnable[[position]]
  # A driver error is this package's problem, not the shard's. Before, an
  # unguarded `readLines(.../status)[[1]]` on a check-pair that never wrote its
  # status file -- a full disk, an unwritable work directory -- threw out of
  # the loop and took every remaining package with it.
  tryCatch(
    check_package(name, position),
    error = function(e) {
      update(
        name,
        result = "error",
        message = paste("driver error:", conditionMessage(e))
      )
      inform(name, ": driver error: ", conditionMessage(e))
    }
  )

  # This package's line, now rather than at the end of the shard.
  #
  # The file is newline-delimited JSON precisely so that it can be appended to,
  # but it used to be written in one pass after the loop -- so a shard killed
  # by the job timeout, or thrown out of the loop by an unhandled error, left
  # an *empty* manifest next to a full set of results, and `collect.R` skips a
  # directory whose manifest has no lines. Hours of finished checks were one
  # kill away from being reported as `missing`. Deferred and unreached packages
  # are appended at the end, and the collector reconciles the rest against the
  # plan.
  write_manifest_line(get(name, envir = state))
  reported <- c(reported, name)
}


# ---------------------------------------------------------------- manifest ---

# Whatever the loop never reached: deferred packages, and the ones a depfail or
# a missing source knocked out before it started.
#
# Under slicing this also covers the packages belonging to *later* slices, which
# is deliberate: an interim artifact that says `deferred` for them is the truth
# at that moment, and better than the `missing` the collector would otherwise
# reconcile them into. What it must not do is overwrite a result an *earlier*
# slice already wrote -- those packages are still `deferred` in this process's
# memory, and a later line wins in the collector. So the manifest is read back
# and anything already accounted for is left alone.
already <- if (file.exists(manifest_path)) {
  lines <- readLines(manifest_path, warn = FALSE)
  lines <- lines[nzchar(trimws(lines))]
  vapply(
    lines,
    function(line) jsonlite::fromJSON(line, simplifyVector = FALSE)$package,
    character(1),
    USE.NAMES = FALSE
  )
} else {
  character()
}
for (name in setdiff(members, c(reported, already))) {
  write_manifest_line(get(name, envir = state))
}
# The summary below is this slice's, not the shard's: the other slices' packages
# are still at their initial `deferred` in this process and would pad every
# table with rows that say nothing.
entries <- lapply(
  if (check_slice$of > 1L) reported else members,
  function(name) get(name, envir = state)
)

# ----------------------------------------------------------------- timings ---

# What this shard cost, next to what the plan thought it would: the collector
# pools these into the run's timings artifact, and the next plan calibrates its
# cost model from them. The job's own minutes -- the runner image, R, TinyTeX,
# the artifact downloads before this script even starts -- are not visible from
# here; the collector reads those off the API and adds them.
# Across slices, not per slice: the collector fits the cost model from these,
# and a `check_seconds` covering a third of the shard next to a `script_seconds`
# covering the job would make every shard look three times cheaper than it is.
earlier <- if (file.exists(file.path(out_dir, "timing.json"))) {
  tryCatch(read_json(file.path(out_dir, "timing.json")), error = function(e) {
    NULL
  })
} else {
  NULL
}
write_json(
  list(
    index = shard_index,
    packages = length(members),
    checks = checks_started + (earlier$checks %||% 0L),
    install_packages = installed_state$install_packages,
    restored = installed_state$restored,
    restore_seconds = installed_state$restore_seconds,
    install_seconds = installed_state$install_seconds,
    check_seconds = round(check_seconds + (earlier$check_seconds %||% 0), 1),
    # Both phases, because the collector fits `setup_minutes` as
    # `job_minutes - script_minutes` -- the minutes before the driver starts.
    # Reporting only this process would have charged the whole install phase to
    # "setup", which the plan then seeds every shard's load with *and* prices
    # again per dependency, and a setup of tens of minutes instead of six is
    # what tips a plan into extra waves.
    script_seconds = round(
      (installed_state$phase_seconds %||% 0) + elapsed(script_started),
      1
    ),
    started_at = installed_state$started_at %||%
      earlier$started_at %||%
      format(script_started, "%Y-%m-%dT%H:%M:%SZ", tz = "UTC"),
    finished_at = now_utc(),
    planned_minutes = shard$estimate_minutes,
    planned_check_minutes = shard$check_minutes
  ),
  file.path(out_dir, "timing.json")
)

# ------------------------------------------------------------------ summary --

results <- vapply(entries, function(e) e$result, character(1))
df <- data.frame(
  Package = vapply(entries, function(e) e$package, character(1)),
  Version = vapply(entries, function(e) e$version, character(1)),
  Result = results,
  Old = vapply(entries, function(e) e$status_old, character(1)),
  New = vapply(entries, function(e) e$status_new, character(1)),
  # `baseline_reused` stopped being set when both halves became mandatory, so
  # this column was empty in every row. What the baseline is still good for is
  # the drift check -- whether a result from an earlier run still reproduces --
  # and that is what it says now.
  Baseline = vapply(
    entries,
    function(e) {
      if (isTRUE(e$baseline_agrees)) {
        "agrees"
      } else if (isFALSE(e$baseline_agrees)) {
        "disagrees"
      } else {
        ""
      }
    },
    character(1)
  )
)
append_summary(c(
  sprintf("### Shard %d", shard_index),
  "",
  sprintf(
    "%d ok, %d newly broken, %d failed, %d timed out, %d depfail, %d depmissing, %d error, %d deferred.",
    sum(results == "ok"), sum(results == "newly_broken"), sum(results == "failed"),
    sum(results == "timeout"),
    sum(results == "depfail"), sum(results == "depmissing"),
    sum(results == "error"), sum(results == "deferred")
  ),
  "",
  md_table(df)
))
for (entry in entries) {
  if (entry$result %in% c("ok", "deferred")) {
    next
  }
  # The reason goes in the title, where `md_details()` cannot tail it away;
  # the body is the check log where there is one, because the reason alone
  # rarely says which check step broke.
  kept <- file.path(out_dir, "pkgs", entry$package, "new-check")
  log <- file.path(kept, "00check.log")
  reason <- gsub("\n", " ", entry$message %||% "")
  lines <- if (file.exists(log)) {
    readLines(log, warn = FALSE)
  } else if (nzchar(reason)) {
    strsplit(entry$message, "\n")[[1]]
  } else {
    "(no log captured)"
  }
  title <- sprintf(
    "<code>%s</code> &mdash; %s%s",
    entry$package,
    entry$result,
    if (nzchar(reason)) paste0(": ", md_escape_html(reason)) else ""
  )
  append_summary(md_details(title, lines))

  # The check log says what broke; these say why, and none of them fits in it.
  # `00install.out` is where a package that could not be installed explains
  # itself -- the check log only points at the file, which used to mean
  # downloading the artifact to read a compiler error. A `.Rout.fail` is a
  # failed test file's whole transcript and `-Ex.Rout` the examples', where the
  # check log carries a bounded excerpt. Each gets its own block and its own
  # budget rather than sharing one, or the tail of the set would be all anyone
  # saw.
  for (extra in list(
    list(file = "00install.out", what = "installation output"),
    list(
      file = list.files(kept, pattern = "[.]Rout[.]fail$"),
      what = "test output"
    ),
    list(
      file = list.files(kept, pattern = "-Ex[.]Rout$"),
      what = "example output"
    )
  )) {
    for (f in extra$file) {
      path <- file.path(kept, f)
      if (!file.exists(path)) {
        next
      }
      append_summary(md_details(
        sprintf(
          "<code>%s</code> &mdash; %s (<code>%s</code>)",
          entry$package,
          extra$what,
          f
        ),
        readLines(path, warn = FALSE),
        max_lines = detail_max_lines
      ))
    }
  }
}

inform(
  "Shard ",
  shard_index,
  " done: ",
  paste(names(table(results)), table(results), sep = "=", collapse = ", ")
)
