# `revdep4` — the sequential-halves queue engine

`.github/workflows/revdep4.yaml` is built on the core in
[`../revdepx/`](../revdepx/README.md).
It checks every reverse dependency of igraph twice —
once against the CRAN release, once against the dev version —
inside a prebuilt universe image,
running a package's two halves one after the other
and winning the lost parallelism back *across* packages
with a bash work queue.
(A sibling *pair* engine, `revdep3`,
ran the halves simultaneously, one container each;
it was retired with its unmerged PR,
and its runs remain valid baseline and timing history.)
The shared core is documented in `../revdepx/README.md`;
this file covers only what `REVDEPX_ENGINE=queue` changes.

## Why sequential halves

`revdep2` ran a package's old and new checks
as two processes on the same host at the same moment.
They run the same code at the same time,
so every per-machine singleton is a collision waiting to happen —
and one collision actually happened:
both halves drew the same PSOCK port
(seeded RNG plus simultaneous start),
and two packages were reported newly broken with nothing wrong with them.
The `R_PARALLEL_PORT` fix was per-mechanism:
it repaired the one collision that had already produced false verdicts,
and left the shared `TMPDIR`, shared caches, shared locks —
everything else that is one-per-machine — to be discovered the same way.
Checking two instances of the same package at once
is simply not a mode anything in the R toolchain promises to support.

This engine removes the class instead of its members:
at no moment do two checks of the same package coexist.
The old half runs, finishes, and then the new half runs.
What simultaneity bought — parallel hardware use — is bought back one level up:
with `W` workers, `W` *different* packages are in flight at once,
which no shared assumption anywhere touches.

## Two containers per package, sequentially

Each half still runs in a container of its own (`check-half.sh`),
so different packages are isolated from each other
exactly as thoroughly as the two halves of one package are:
own network namespace, own PID space, own `/tmp`,
own memory cap, identical in-container paths.
That is strictly stronger than `revdep2`,
which only ever separated the two halves' ports —
cross-*package* interference on one host was never addressed at all.
It also makes the two halves' logs trivially comparable:
inside the container the paths are the same for both,
so the log diff no longer needs path neutralisation to be honest.

## The queue

`shard.R` writes one line per runnable package —
name, tarball, timeout, weight —
sorted heaviest first, and hands the file to `queue.sh`.
The list is consumed from both ends:

- worker 1, the *heavy lane*, claims from the top —
  the heaviest package still unclaimed;
- workers 2..W, the *light lanes*, claim from the bottom —
  lightest first;
- claims move two cursors in a state file under an `flock`,
  and the queue is empty when the cursors cross.

The rationale is the classic LPT observation.
The heaviest checks decide when the shard finishes:
discovered last, one of them runs alone
after everything else has drained,
and the shard's wall clock is everything-else *plus* the straggler.
Started first, the straggler runs for its hour
while the swarm of cheap packages drains in parallel from the other end,
and the two ends meet in the middle.
One heavy lane is enough:
a second one only helps
when the two heaviest packages together outlast the rest of the shard combined,
and the plan's shard balancing already makes that configuration unlikely.
The light lanes' high turnover is itself useful —
progress lines keep coming,
and a deadline that arrives mid-shard
cuts cheap packages, not expensive ones.

Every claim is recorded in `claimed.log`
(epoch, worker, lane, line number, package),
and `queue-state.json` summarises the run
(claims, completed, fallback lines, deferred-at-exit)
for `shard.R`'s accounting.
A claimed package can never vanish silently:
`compare-one.R` writes the manifest line;
if it crashes it is re-run in `--error` mode;
if that fails too, `queue.sh` appends a hardcoded JSON error line;
and a worker that dies outright is caught by a final sweep
that reconciles `claimed.log` against the manifest.

## What "heavy" means

The queue's order key is **expected check seconds** —
measured on this infrastructure in prior `revdepx` runs
(youngest first),
else CRAN's reported `T_total` scaled by the self-calibrating factor
the collector fits from measured runs,
else the cohort median.
Package size and the number or size of dependencies
are deliberately *not* in the key:
those are install-time costs,
and installation is amortised into the shared universe image,
where it costs a package's check nothing.
Dependency *count* enters only the depfail screen
(a package whose strong closure is incomplete is never queued),
and dealing affinity is moot under a shared image.
For shard sizing, the plan prices a queue package
at both halves' seconds — twice the per-half estimate.

## The stored old result: always a second opinion, never a substitute

Both halves always run fresh.
Sequential halves would make skipping the old check tempting —
it costs real wall clock —
and the pinned container platform would even make the substitution
far safer than when `revdep2` tried and abandoned it
(76 of one run's 78 `newly_broken` verdicts were false,
compared across different machines, paths and CRAN snapshots).
The temptation is declined on purpose:
a fresh old check is the only result
whose provenance this run fully controls.

What the stored result does instead is stand *beside* the fresh one.
Where the plan certifies an earlier run's old result as comparable —
same revdep version, our CRAN version, container R series,
`base_image` tag and dependency fingerprint, within the age cap —
`compare-one.R` records whether the fresh old check reproduced it
(`baseline_agrees` on the manifest line)
and prints any disagreement as drift.
A disagreement under pinned conditions is a signal worth reading:
a flaky test, a moved system library, or this harness getting it wrong.
Old `revdep2` baselines lack the `base_image` field
and are never offered — a deliberate firewall,
since their checks ran on a different platform entirely.

## Workers, memory, deadline

- `REVDEPX_WORKERS` (default: `nproc`) sets the lane count.
- Each check container gets a memory cap:
  `REVDEPX_MEMORY_PER_CHECK` (6g by default —
  a deliberate overcommit of the 15.6 GiB runner across 4 workers,
  because checks rarely peak together
  and the derived cap OOM-killed compilers during Stan/TMB installs),
  falling back to `(MemTotal − 2 GiB) / workers`, floored at 2 GiB,
  when cleared;
  exported to `check-half.sh` as `REVDEPX_MEMORY`.
  A hungry check OOM-kills its own container, not the runner,
  and the 2 GiB headroom keeps docker and the runner agent responsive —
  the sequential engine has no need for revdep2's `nice`.
- Before claiming, a worker prices the candidate
  at `weight_minutes × 60 × 1.3`
  (the plan's estimate plus the shard driver's usual trailing margin)
  and stops claiming once that no longer fits before the deadline.
  The lanes stop independently:
  the heavy lane prices the heaviest remaining package and may stop early,
  while the light lanes keep draining the cheap end.
  The very first claim across all workers is always attempted,
  so a mis-budgeted shard still makes progress
  instead of repeating its mistake on every retry.
  Unclaimed lines are the deferred tail;
  `shard.R` writes their `deferred` manifest lines
  when the queue returns, dedup'd against what earlier slices reported.

## Files

- `queue.sh` — the two-ended work queue described above.
  Test seams: `REVDEPX_CHECK_HALF` and `REVDEPX_COMPARE_ONE`
  override the collaborators' paths,
  so the queue mechanics run against stubs.
- `compare-one.R` — per-package driver:
  reads both halves back (`read_side`),
  keeps a surviving half when its partner failed (`keep_side`),
  compares (`compare_halves`), salvages check output and the log diff,
  and appends the manifest line under the manifest lock.
  All shared logic comes from `../revdepx/util.R` and `../revdepx/compare.R`.

## Continuity with the retired `revdep3`

The retired pair engine shared everything but the engine:
the `revdepx-*` artifact family and names,
`plan.json`, manifest and `timings.json` schemas
(the queue's `t_old`/`t_new` are true per-half seconds,
where the pair engine recorded the pair's shared wall clock —
`timings.json` carries an `engine` field
so calibration never mixes the two setups' overheads),
the baseline artifact,
the universe image on GHCR and the base image under it,
the comparison code,
and the report committed to the `revdep` directory.
`REVDEPX_WORKFLOWS` says whose histories the plan scans,
so old `revdep3` runs still feed baselines and timings
while they remain within the age bounds.
