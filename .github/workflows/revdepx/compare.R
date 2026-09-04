# The comparison layer: from two `R CMD check` halves to one manifest line.
#
# Extracted from revdep2's shard.R. The queue engine (revdep4) sources it
# into compare-one.R, one short-lived process per package, run by a worker the
# moment that package's halves are done. Everything here is a plain function
# of its arguments -- no shard state, no globals -- and what a function learns
# comes back as a named list of manifest-field updates for the caller to apply
# its own way: the shard driver folds them into its per-package state,
# compare-one.R into the one entry it is about to write.
#
# Sourced after util.R, which provides `%||%`, `inform`, `now_utc` and the
# result-label helpers. Base R plus jsonlite; rcmdcheck is reached lazily.

# The one-line "0E 0W 0N" summary of an rcmdcheck object -- what the manifest
# columns, the baseline drift check and the depmissing guard all compare.
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

# The check log with this run's incidentals taken out of it.
#
# Under revdep2 the two halves ran on the host against libraries and check
# directories whose paths differed by construction, and neutralising those
# paths was load-bearing. Inside the containers neither differs: both halves
# see the half library at /revdepx/lib-half, the baked dependency library at
# /opt/revdepx/lib, and the check directory at /revdepx/out -- literally
# identical strings on both sides, by construction. Replacing them anyway is
# belt and braces: three fixed-string substitutions keep a log that leaks one
# of them some other way (a package printing its own `.libPaths()`, say) from
# ever fabricating a difference.
#
# The timings still earn their keep. `--as-cran` sets `_R_CHECK_TIMINGS_`, so
# every stage slower than ten seconds prints its own `[user/elapsed]` pair,
# and no two checks ever agree on those -- under revdep2 a run of rphylopic
# against the *same* igraph on both sides differed in exactly two lines: the
# log directory, and `[14s/12s]` against `[13s/11s]`. The workflow suppresses
# the stamps at the source (`_R_CHECK_TIMINGS_=""`); blanking them here is the
# second line of defence.
#
# Both matter twice. `compare_checks()` matches issues by their text, so a
# difference in the first line of an issue makes an issue both halves have
# look like a new one; and the diff between the halves is only worth printing
# if two identical results produce an empty one. Nothing else is touched: a
# difference anywhere but here is exactly what this workflow exists to find.
neutral_log <- function(path) {
  lines <- readLines(path, warn = FALSE)
  for (from in c("/revdepx/out", "/revdepx/lib-half", "/opt/revdepx/lib")) {
    lines <- gsub(from, "<lib>", lines, fixed = TRUE)
  }
  # `[14s/12s]`, and the one-number form R uses where it has only one.
  gsub("\\[[0-9.]+s(/[0-9.]+s)?\\]", "[]", lines)
}

# The two halves' check logs, as a patch.
#
# Both sides are neutralised first, so the stage timings (and any leaked
# paths) are gone and what is left is the package: an empty diff means the dev
# version changed nothing about this check, however long the log. The scratch
# files live in the package's own work directory rather than `tempdir()`,
# which keeps them apart under either engine.
check_diff <- function(name, old_log, new_log, work_dir) {
  tmp <- file.path(
    work_dir,
    paste0(name, c("-old-00check.log", "-new-00check.log"))
  )
  writeLines(neutral_log(old_log), tmp[[1]])
  writeLines(neutral_log(new_log), tmp[[2]])
  on.exit(unlink(tmp), add = TRUE)
  suppressWarnings(system2(
    "diff",
    shQuote(c("-u", "--label", "old", tmp[[1]], "--label", "new", tmp[[2]])),
    stdout = TRUE,
    stderr = NULL
  ))
}

# One half's result, read off the files its check container left behind.
#
# `rcmdcheck::parse_check()` turns a 00check.log into the same object
# `rcmdcheck()` used to return, so everything downstream -- the counts,
# `compare_checks()`, the manifest -- is unchanged. The timeout is coreutils',
# inside the container, which is what makes the distinction reliable: exit 124
# is the deadline, anything else is the check saying something.
#
# `duration` is this half's own clock in seconds: the queue runs the two
# halves one after the other, so each is a real measurement. (Rows written by
# the retired pair engine carried the pair's shared wall clock instead.)
read_side <- function(work_dir, phase, name, timeout_sec, duration) {
  dir <- file.path(work_dir, phase)
  # A half that never wrote its status -- an unwritable work directory, a
  # full disk, the check script dying before its last line -- used to throw
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
  # check-half.sh leaves an `oom` marker when docker reports the container
  # was OOM-killed. "Timed out" and "produced no readable result" both read
  # very differently when the real story is the memory limit, so the marker
  # goes into the message where a reader will meet it.
  oom <- if (file.exists(file.path(dir, "oom"))) {
    " (container hit its memory limit)"
  } else {
    ""
  }
  result <- if (identical(status, 124L)) {
    simpleError(sprintf(
      "%s check timed out after %ds%s",
      phase,
      round(timeout_sec),
      oom
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
        neutral <- rcmdcheck::parse_check(text = neutral_log(log))
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
        # `parse_check()` looks for 00install.out under the path in the log's
        # first line -- the *container's* path, which no host filesystem has
        # -- so `install_out` came out as "<00install.out file does not
        # exist>" for every install failure, and failures.md showed a reader
        # everything except the compiler error they opened it for. The real
        # file sits next to the log; the tail is kept, because that is where
        # a compile error ends up and whole Stan build transcripts run to
        # thousands of lines.
        install_log <- file.path(dirname(log), "00install.out")
        if (file.exists(install_log)) {
          lines <- readLines(install_log, warn = FALSE)
          keep <- 200L
          if (length(lines) > keep) {
            lines <- c(
              sprintf(
                "[... %d earlier lines omitted; the full 00install.out is in the check artifact ...]",
                length(lines) - keep
              ),
              utils::tail(lines, keep)
            )
          }
          res$install_out <- paste(lines, collapse = "\n")
        }
        res
      },
      error = function(e) {
        simpleError(sprintf(
          "%s check produced no readable result (exit %s): %s%s",
          phase,
          status,
          conditionMessage(e),
          oom
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
  # The kernel killing one compiler inside the container kills neither the
  # container (docker reports no OOM -- the `oom` marker stays absent) nor
  # the check, which completes and reports "installation failed". Run
  # 32158907637's dmesg watch caught two cc1plus processes killed at the
  # per-check cap exactly this way, while the manifest said only "fails to
  # install". The giveaway lines land in 00install.out, so they become an
  # attribute the comparison can put into the message.
  install_log <- file.path(dir, paste0(name, ".Rcheck"), "00install.out")
  attr(result, "compiler_killed") <- tryCatch(
    file.exists(install_log) &&
      any(grepl(
        paste0(
          "Killed signal terminated program",
          "|internal compiler error: Killed",
          "|virtual memory exhausted",
          "|signal: 9, SIGKILL",
          "|Cannot allocate memory"
        ),
        readLines(install_log, warn = FALSE),
        useBytes = TRUE
      )),
    error = function(e) FALSE
  )
  result
}

# This package's directory in the results artifact, created on first use.
pkg_out <- function(pkgs_dir, name) {
  dir <- file.path(pkgs_dir, name)
  dir.create(dir, recursive = TRUE, showWarnings = FALSE)
  dir
}

# The files worth carrying out of a check directory: what broke, and the
# complete transcripts of the two stages that explain why. The half's
# `driver.log` and `status` ride along from next to the .Rcheck directory:
# the driver log is the per-stage timing record -- check-half.sh stamps
# every line with elapsed seconds, precisely because `_R_CHECK_TIMINGS_`
# stays off to keep the compared check logs stable -- and before this it
# died with the runner's work directory, which made the yaml's "nothing is
# lost" claim quietly false.
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
  for (f in c("driver.log", "status")) {
    if (file.exists(file.path(dirname(rcheck), f))) {
      file.copy(
        file.path(dirname(rcheck), f),
        file.path(keep, f),
        overwrite = TRUE
      )
    }
  }
}

# Salvage a half that produced no readable result -- a timeout, an OOM kill,
# a container that never started. What survives varies: a killed check
# leaves a partial .Rcheck whose 00check.log lists every stage it finished,
# a container that never ran leaves only the driver log -- and
# copy_check_output() copies whatever of that exists, including the stamped
# driver log, so the post-mortem of exactly these packages stops depending
# on a work directory that dies with the runner. Run 33777134786's
# both-halves timeouts (ctmm, E2E, PortfolioTesteR) salvaged nothing at
# all; "where did the 1800 seconds go" had no answer in any artifact.
salvage_side <- function(work_dir, pkgs_dir, name, phase) {
  copy_check_output(
    file.path(work_dir, phase, paste0(name, ".Rcheck")),
    file.path(pkg_out(pkgs_dir, name), paste0(phase, "-check"))
  )
}

# Record the half that did produce a result, when its partner did not.
#
# There is nothing to compare, so there is no verdict -- but the check ran,
# and what it found is the only thing anyone will have to go on when they come
# back to the package. Kept where the comparison path keeps it, so `retry-run`
# and a human reading the artifact find it in the usual place. Returns the
# manifest fields it learnt, like everything here, for the caller to apply.
keep_side <- function(work_dir, pkgs_dir, name, phase, result) {
  saveRDS(result, file.path(pkg_out(pkgs_dir, name), paste0(phase, ".rds")))
  copy_check_output(
    file.path(work_dir, phase, paste0(name, ".Rcheck")),
    file.path(pkgs_dir, name, paste0(phase, "-check"))
  )
  if (identical(phase, "old")) {
    list(
      status_old = counts(result),
      t_old = attr(result, "duration"),
      old_checked_at = now_utc()
    )
  } else {
    list(
      status_new = counts(result),
      t_new = attr(result, "duration")
    )
  }
}

# A half that errored or timed out, turned into this package's verdict.
# Returns the manifest-field updates; the log line is printed here so every
# caller says it the same way (`progress` is an optional position note).
check_failure <- function(name, phase, result, progress = "") {
  note <- if (nzchar(progress)) paste0(", ", progress) else ""
  if (isTRUE(attr(result, "timed_out"))) {
    # `timeout`, not `failed`. A check killed by the clock says nothing about
    # the package, and in the old phase it says nothing about our change
    # either -- the dev version is not even on that library path. Reporting it
    # as a failure put 60 packages into failures.md in run 31304411628 that
    # the run had learnt nothing about. `needs_recheck()` picks it up either
    # way, so `retry-run` still re-checks them.
    step <- attr(result, "last_step") %||% ""
    inform(
      name,
      ": ",
      phase,
      " check timed out (",
      attr(result, "duration"),
      "s)",
      if (nzchar(step)) paste0(" at ", trimws(step)) else "",
      note
    )
    list(
      result = "timeout",
      message = sprintf(
        "%s check timed out after %ds%s",
        phase,
        attr(result, "duration"),
        if (nzchar(step)) paste0(", at: ", trimws(step)) else ""
      )
    )
  } else {
    inform(
      name,
      ": ",
      phase,
      " check errored: ",
      conditionMessage(result),
      note
    )
    list(result = "error", message = conditionMessage(result))
  }
}

# Two parsed halves into one verdict: the tail of revdep2's per-package flow,
# as a plain function.
#
# Both halves are always fresh checks. Where the plan certified a stored old
# result as comparable (`baseline_planned`), it is read back purely as a
# *second opinion*: `baseline_agrees` records whether the fresh old check
# reproduced it, and a disagreement is printed as drift. It never substitutes
# for the check itself -- revdep2 tried that once, and 76 of run
# 31879790285's 78 `newly_broken` verdicts were false; the identical
# container platform would make substitution far safer now, but a fresh old
# is the only result whose provenance this run fully controls, so the stored
# one is kept in the advisory seat. Returns the manifest-field updates --
# result, status, status_old, status_new, new_issues, t_old, t_new,
# old_checked_at, message, baseline_agrees -- whichever of them this
# package's comparison decided.
compare_halves <- function(
  name,
  old,
  new,
  pkgs_dir,
  baseline_dir = NULL,
  baseline_planned = FALSE
) {
  updates <- list()

  saveRDS(old, file.path(pkg_out(pkgs_dir, name), "old.rds"))
  updates$status_old <- counts(old)
  updates$t_old <- attr(old, "duration")
  updates$old_checked_at <- now_utc()

  # The second opinion: if the stored result disagrees with what the old
  # check just produced under identical conditions -- same base image, same
  # dependency fingerprint, or the plan would not have offered it -- that is
  # drift worth recording and printing, wherever it comes from (a flaky test,
  # a moved system library, this harness).
  if (isTRUE(baseline_planned) && !is.null(baseline_dir)) {
    rds <- file.path(baseline_dir, "old-rds", paste0(name, ".rds"))
    baseline <- tryCatch(readRDS(rds), error = function(e) NULL)
    if (!is.null(baseline)) {
      agrees <- identical(counts(baseline), counts(old))
      updates$baseline_agrees <- agrees
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

  saveRDS(new, file.path(pkg_out(pkgs_dir, name), "new.rds"))

  cmp <- tryCatch(
    rcmdcheck::compare_checks(old, new),
    error = function(e) NULL
  )
  if (is.null(cmp)) {
    updates$result <- "failed"
    updates$status_new <- counts(new)
    updates$t_new <- attr(new, "duration")
    updates$message <-
      "both checks ran, but their results could not be compared"
  } else if (aborted_on_dependencies(new) && aborted_on_dependencies(old)) {
    # Neither half ran. `compare_checks()` still says `+` -- the two agree,
    # and they agree on having done nothing -- so without this the package is
    # reported `ok`. It is not ok, it is unknown, and `needs_recheck()` picks
    # `depmissing` up so a retry with those repositories enabled re-checks
    # it. 55 of run 31930350338's `ok` results were this.
    absent <- missing_dependencies(new)
    updates$result <- "depmissing"
    updates$status <- cmp$status
    updates$status_new <- counts(new)
    updates$t_new <- attr(new, "duration")
    updates$new_issues <- 0L
    updates$message <- paste0(
      "R CMD check stopped at `checking package dependencies` under both ",
      "versions; nothing was checked",
      if (length(absent) > 0) {
        paste0(" (not installed: ", paste(absent, collapse = ", "), ")")
      }
    )
  } else {
    new_issues <- sum(cmp$cmp$change == 1)
    updates$result <- classify_status(cmp$status, new_issues)
    updates$status <- cmp$status
    updates$status_new <- counts(new)
    # This half's measured seconds -- each half's true clock under the
    # queue. It used to be recorded only where the comparison failed, which
    # left `t_new` null for every package that compared -- that is, for all
    # of them.
    updates$t_new <- attr(new, "duration")
    updates$new_issues <- new_issues
    # An install failure or a timeout leaves nothing to compare, so the
    # result is only "failed"; say which one it was.
    updates$message <- status_message(cmp$status)
    # "Fails to install" reads as the package's fault; a compiler the kernel
    # OOM-killed under the per-check cap is this harness's. Name it, so the
    # reader reaches for REVDEPX_MEMORY_PER_CHECK instead of the maintainer.
    if (
      startsWith(cmp$status, "i") &&
        (isTRUE(attr(new, "compiler_killed")) ||
          isTRUE(attr(old, "compiler_killed")))
    ) {
      updates$message <- paste0(
        updates$message,
        "; the compiler was killed inside the container -- ",
        "likely the per-check memory cap (REVDEPX_MEMORY_PER_CHECK)"
      )
    }
  }
  updates
}

# The template for one package's manifest line: every field, initialised to
# the truthful defaults -- `deferred` until something better is known. The
# shard driver keeps one of these per package and mutates it as results
# arrive; the queue engine's compare-one.R builds one, applies the updates
# `compare_halves()` (or `keep_side()`/`check_failure()`) returned, and
# writes the line, all in one short-lived process.
manifest_entry_defaults <- function(name, plan_pkg, shard_index) {
  list(
    package = name,
    version = plan_pkg$version,
    level = plan_pkg$level %||% 0L,
    shard = shard_index,
    weight_minutes = plan_pkg$weight_minutes,
    t_total = plan_pkg$t_total %||% 0,
    dep_fingerprint = plan_pkg$dep_fingerprint,
    baseline_planned = isTRUE(plan_pkg$baseline),
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
  )
}

# One manifest line, appended as soon as the package has one.
#
# The versions are stamped at write time, so even a line written on an error
# path names the versions it would have compared. Appended under `flock` when
# there is one: the queue has many writers, every worker's compare-one.R
# appending its package's line the moment it is done and the driver
# appending the deferred tail after the queue drains. One
# short O_APPEND write per line would probably never tear; the lock costs
# nothing and turns probably into does not. Where flock does not exist (it is
# util-linux, so everywhere this runs in CI, but a local macOS invocation
# counts) the plain append is what there is.
write_manifest_line <- function(
  entry,
  path,
  our_cran_version,
  our_dev_version
) {
  entry$our_cran_version <- our_cran_version
  entry$our_dev_version <- our_dev_version
  line <- as.character(jsonlite::toJSON(
    entry,
    auto_unbox = TRUE,
    null = "null"
  ))
  if (nzchar(Sys.which("flock"))) {
    system2(
      "flock",
      c(
        shQuote(paste0(path, ".lock")),
        "-c",
        shQuote(paste0("cat >> ", shQuote(path)))
      ),
      input = line
    )
  } else {
    cat(line, "\n", sep = "", file = path, append = TRUE)
  }
  invisible(entry)
}
