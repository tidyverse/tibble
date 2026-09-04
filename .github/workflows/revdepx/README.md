# revdepx: the core of the revdep4 workflow

This directory is the core of the reverse-dependency-check workflow
`revdep4.yaml` (the *queue* engine):
a package's CRAN half and dev half run **sequentially**,
each in its own Docker container,
and a bash work queue checks several packages at once.

It exists because of a diagnosis:
revdep2 ran the two halves as two simultaneous `R CMD check` processes
on one host,
and simultaneously checking the same package against two libraries
is not a supported mode of operation for the packages being checked.
The PSOCK port collision that needed the `R_PARALLEL_PORT` split
was one member of an open-ended class —
shared TMPDIR, shared caches, shared locks,
any singleton a check believes it owns.
revdep4 dissolves the class by never being simultaneous,
and by containers.
(A sibling *pair* engine, revdep3,
dissolved it by isolation alone —
both halves concurrently, one container each;
it was validated live and retired with its unmerged PR,
and its runs remain valid history.)
Everything that was *not* about that flaw —
the planner, the cost model, the baseline lineage,
the manifest and report machinery,
the hard-won robustness patterns —
lives here, shared.

The history of most design decisions in these scripts
is documented in `../revdep2/README.md`;
comments citing concrete run ids refer to revdep2 runs.
This file documents what changed and why,
and the contract that keeps the two workflows interchangeable.

## Why the two workflows can pull each other's results

Every reuse channel is keyed so that
"a run of the other workflow" is indistinguishable
from "an earlier run of this one":

- **Artifacts** share one family:
  `revdepx-plan`, `revdepx-pkg`, `revdepx-baseline`,
  `revdepx-timings`, `revdepx-report`,
  `revdepx-results-<shard>-<attempt>`,
  `revdepx-universe-report`.
  `plan.R` walks the completed runs of the files in `REVDEPX_WORKFLOWS`,
  youngest first across the union.
- **Baselines** (old-version check results) are valid across runs
  because every run checks inside the *same* container platform:
  a baseline row records the revdep's version,
  our CRAN version, the container R series,
  the base-image tag, the dependency fingerprint,
  and the date of the actual old check.
  `plan.R` offers a row as a second opinion
  only when all of them still match;
  the old half runs fresh regardless,
  and `baseline_agrees` records whether it reproduced the stored result.
  The base-image condition is also the firewall
  against revdep2-era baselines,
  which were measured on the runner's own toolchain
  and carry no tag.
- **Timings** record one canonical per-package number:
  `seconds` = the mean of the per-half durations that exist —
  what one half costs, which the plan doubles into a package's bill.
  (Retired pair-engine rows carry the pair's shared wall clock
  in both fields; the unit still holds.)
  Shard-level rows (setup, install minutes) are engine-tagged,
  so `calibration()` takes them only from queue runs;
  the per-package pool is shared.
- **Reports and `retry-run`**: `manifest.json` and the report files
  have one schema and one result vocabulary,
  so `retry-run: <id>` accepts any earlier revdepx run
  and carries its good results into the new report.
- **The universe image** on GHCR is one lineage (`revdepx-universe`),
  updated by whichever workflow ran last
  and consumed by whichever runs next.
- **Serialization**: both workflows share one concurrency group
  per checked ref (`revdepx-<ref>`),
  because they also share the committed `revdep/` report
  and the baseline lineage;
  interleaving them would race both.

## The image lifecycle

- **Base image** (`revdepx-base:r-<version>-<hash12>`):
  rocker/r-ver at the resolved R version (input `r-version`,
  default `oldrel` — a deliberately still target)
  plus the check toolchain (qpdf, ghostscript, pandoc, TeX, pak).
  The tag hashes `base-image.sh` itself,
  so the image is immutable until the recipe or the R version changes,
  and `plan.R` can *name* the tag without docker —
  which is how baseline rows are keyed to the platform.
- **Universe image** (`revdepx-universe:latest` and `:run-<id>`):
  the base plus the whole dependency universe
  and every system requirement,
  built by `image.R` *inside* a container and committed.
  Dependencies resolve against CRAN *and* Bioconductor
  (`dep_db()` in `util.R`):
  the checked packages are CRAN reverse dependencies,
  but what they depend on may live in either repository —
  run 32158907637 reported 121 packages `depmissing`
  because the planner intersected dependency lists
  with CRAN metadata alone.
  A fresh-enough `:latest` standing on the same base tag
  is used as the starting layer,
  so a quiet CRAN week costs a delta install, not a rebuild;
  past `REVDEPX_IMAGE_MAX_AGE_DAYS` (default 14)
  the build starts from the base again,
  so accreted layers and stale system packages age out.
  igraph itself is evicted from the image's library:
  the two halves mount their own single-package libraries
  (CRAN release and dev binary) in front of it.
- **Fallbacks**, in order:
  a universe job that cannot *push* ships the image
  as a `revdepx-universe-image` artifact and shards `docker load` it;
  a universe job that failed entirely leaves the shards
  to build a shard-local image from the base
  (`shard-prep.sh`), using the shard's own install union —
  revdep2's per-shard install, demoted to disaster recovery.

## What checking looks like

One half = one container (`check-half.sh`):
the tarball, the half's library and the work directory bind-mounted,
`R_LIBS=<half lib>:<universe lib>`,
`timeout` inside the container,
the same `_R_CHECK_*` environment the workflow forwards,
a per-container `/tmp` on the big disk,
a memory cap so a hungry check kills its container
and not the runner,
and the container's exit status preserved
(124 = timeout, with an OOM marker when the kernel killed it).
The `.Rcheck` directory, the stamped `driver.log`
and the `status` file land in the same relative layout
revdep2 produced,
so parsing, comparison, salvage and reporting
carry over unchanged (`compare.R`).
The driver log doubles as the per-stage timing record
(`_R_CHECK_TIMINGS_` stays off
to keep the compared check logs free of timing noise):
the salvage copies it into the results artifact
for every half that failed —
including a killed half's partial `.Rcheck`,
whose check log lists every stage it completed —
and `check-half.sh` prints a failed half's stage timeline
into the job log.

The queue runs two such containers back to back per package,
several packages at once (`../revdep4/queue.sh`).
Both halves are always fresh checks.

## Dropped from revdep2, deliberately

- The `R_PARALLEL_PORT` split and every per-mechanism
  interference patch — the isolation is categorical now.
- The preflight job, the `revdep2-lib`/`revdep2-lib-index` artifacts,
  the donor-run walk and the tar pack/unpack machinery —
  the universe image is the library artifact,
  and a registry pull is the restore.
- Per-shard host installs of the dependency union
  (kept only as the fallback above).
- Host TinyTeX, pandoc, qpdf and apt setup on every shard —
  in the image, once.
- The preflight-union arithmetic
  (which packages ≥ 2 shards need):
  with one shared image every package is installed exactly once
  whatever the shard layout.

## Knobs

Workflow inputs are documented in the two yamls.
Repository variables (`vars.*`) shared by both:
`REVDEPX_SHARD_BUDGET_MINUTES`, `REVDEPX_MAX_PARALLEL`,
`REVDEPX_SHARD_CAPACITY_MINUTES`, `REVDEPX_BASELINE_MAX_AGE_DAYS`,
`REVDEPX_IMAGE_MAX_AGE_DAYS`, `REVDEPX_TIMEOUT_FACTOR`,
`REVDEPX_TIMEOUT_MIN_MINUTES`
(the per-check timeout floor, default 30 min:
a saturated shard runs each check at roughly half speed,
so a floor sized for uncontended times kills healthy checks),
`REVDEPX_DEADLINE_MINUTES`,
`REVDEPX_COMMIT_REPORT`,
`REVDEPX_MEMORY_PER_CHECK` (per-check container memory cap, default 6g;
a machine-sized cap is derived when it is cleared),
`REVDEPX_CHECK_FLAGS` (compiler flags appended for the check's own compile
of the package under test, default `-g0` — template-heavy Stan/TMB
translation units spend most of their compiler memory on debug info;
set `-g` to restore CRAN's own flags),
`REVDEPX_CHECK_MAKEFLAGS` (MAKEFLAGS inside the check container,
default `-j1`: the memory cap is sized for one compiler process).
Check containers also run with `_R_CHECK_LIMIT_CORES_=TRUE`
(overridable through the environment),
the value CRAN's own machines use:
a test suite sizing itself from `parallel::detectCores()`
would otherwise fan out one worker per runner core,
and four such checks side by side
drove 4-core shards to load 5–13 —
the direct cause of the floor timeouts in run 32574134229;
queue engine only: `REVDEPX_WORKERS`.
Script-level environment variables are documented
in the header of each script.

## Backlog

Measured ideas, not yet implemented; numbers from the `most`/depth-2 pair
(runs 32158907637 and 32196879628, 3435 packages, 40 shards, 20 lanes).

- **Universe membership threshold.**
  The universe image bakes the whole install union
  (4675 packages, ~14.4 GB container delta over the ~1.9 GB base),
  but membership is extremely long-tailed:
  1696 of the 4675 are needed by exactly one shard,
  and only 309 by all 40.
  Limiting the image to packages needed by ≥ a fraction of shards
  and installing the rest per shard on arrival would give,
  at ≥ 1/4 of shards: an image of ~1151 packages (24%),
  with a per-shard delta install of ~218 packages (max 303);
  at ≥ 1/8: ~1725 packages baked, ~125 per shard.
  What it buys: a much shorter universe job
  (the critical path every shard waits on),
  ~10 GB less registry churn per build
  (the committed layer re-uploads whole every time),
  and smaller pulls.
  What it costs: ~5–15 min of per-shard delta install (parallel, off the
  critical path), duplicated installs for packages under the threshold
  (~2.5× for the tail at 1/4, roughly +2 runner-hours per full run),
  and the delta must be committed shard-locally because apt-level
  sysreqs of tail packages cannot ride a bind mount —
  the rung-3 fallback machinery in `shard-prep.sh` already does exactly
  this from the base image and would start from the pulled universe
  instead.
- **Shard-count layers.**
  Simulation over the measured shard durations
  (mean 2.57 h, cv 0.11 at ~86 packages/shard;
  noise decomposed into a systemic runner-speed part
  and a package-mix part that averages out by the CLT)
  says full waves win:
  at two layers, 40 shards beat 38 (+8 min) and 35 (+28 min) in
  expected makespan; at three layers, 60 beats 55 (+13 min) and
  50 (+43 min), with 57–60 within noise of each other.
  Slack below a full wave only pays when per-shard variance is far
  larger than measured — the planner's `max(heaviest, sum/workers)`
  bound already guards the giant-package case — so the planner keeps
  its existing rule (beyond one wave, whole waves:
  `lanes × ceiling(by_capacity / lanes)`), and the one genuinely bad
  region, a small overflow layer (41 shards ≈ +1.7 h over 40),
  is exactly what that rule already avoids.
  The live pathology that motivated the question —
  the last shard of run 32196879628 waiting 1.4 h for a runner —
  was org-pool contention from unrelated workflows,
  which no shard arithmetic removes.
- **Further compile-memory switches**, if `-g0` + `-j1` + 6g still
  leave OOM-killed compilers: GCC garbage-collector tuning
  (`--param ggc-min-expand=10 --param ggc-min-heapsize=32768`) trades
  compile time for peak memory; `-Wl,--no-keep-memory` does the same
  for the final link; `-O1` would cut further but changes generated
  code enough to distort check timings. Rust builds (`caugi`,
  `zoomerjoin`, `RPesto`) ignore all of these — cargo's memory story
  is its own.
- **Report the memory verdicts**: count OOM markers and
  compiler-kill detections per run in the README summary, so a
  cap regression is visible without opening `failures.md`.

## Operational notes

- First run on a repository: the GHCR packages
  (`revdepx-base`, `revdepx-universe`) are created on first push
  and must be allowed for `GITHUB_TOKEN` writes
  (they are, by default, for images pushed from the owning repo).
  If the organization forbids it,
  every run still works through the artifact fallback,
  at the price of re-building the universe each run.
- Image housekeeping: `:run-<id>` tags accumulate one per run;
  an org-level GHCR retention policy (or an occasional manual sweep)
  keeps the package list tidy.
  Nothing consumes a `:run-` tag after its run's shards finished.
- revdep2-era baselines and timings are never consumed:
  baselines fail the base-image condition,
  and timings live on `revdep2.yaml` runs the history walk
  does not visit.
  The first revdepx run therefore checks everything fresh
  and calibrates from CRAN times alone — by design,
  since its checks run on a different platform (pinned oldrel
  containers) than revdep2's ever did.
