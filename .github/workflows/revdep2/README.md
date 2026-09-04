# `revdep2` — sharded reverse-dependency checking

`.github/workflows/revdep2.yaml` checks every CRAN reverse dependency of the
package twice — once against the CRAN version, once against the checked-out
dev version — and reports the difference,
the way [revdepcheck](https://github.com/r-lib/revdepcheck) does,
but spread over as many GitHub Actions jobs as can actually run at once.
The trade is deliberate:
runner minutes are spent (duplicate setup, duplicate dependency installs)
to buy wall clock —
but only while a free lane makes that a trade at all,
which is why the shard count follows `max-parallel` rather than the budget.
The older `revdep.yaml` spends one job per package,
and `revdepcheck::revdep_check()` spends one machine for everything.

## Topology

```
plan      (1 job, ~30 min)             build  (1 job, parallel to plan)
  ├─ enumerate revdeps to `depth`,       └─ R CMD build
  │    or take the retry/explicit list        + R CMD INSTALL --build
  ├─ weigh each by what its check cost           → revdep2-pkg artifact
  │    here last time, else by CRAN's
  │    time scaled to this machine
  ├─ walk earlier runs youngest first:
  │    the baseline donor, the prebuilt
  │    libraries, the measured timings
  ├─ decide per package what is reusable
  ├─ partition into as many shards as
  │    one wave can run, in whole waves
  │    → plan.json (artifact) + matrix (job output)
  └─ then, in the same job, the preflight
       (skipped by a dry run; continue-on-error,
        so it cannot take the matrix with it)
       ├─ unpack the prebuilt packages the plan found
       ├─ install + load every dependency more than one shard needs
       └─ pack the library for the next run
            → depfail.json, revdep2-lib(-index),
              warm pak cache (saved under the plan hash)

test      (one job per shard, max-parallel throttled, fail-fast: false)
  ├─ "Install packages" step (PHASE=install)
  │    ├─ unpack this run's preflight library, then the plan's donors
  │    ├─ install the shard's dependency union (pak, sysreqs on, warm cache)
  │    ├─ install the system requirements of what was unpacked, not installed
  │    └─ build two one-package libraries: CRAN release, dev binary
  └─ "Check the shard" step (PHASE=check)
       ├─ per package, both checks at once against those cascading libraries
       └─ results + manifest.ndjson → revdep2-results-<shard>-<attempt>

collect   (1 job, if: always() past plan/build/test)
  ├─ merge all shard attempts (+ carried results of a retried run)
  ├─ reports via revdepcheck: README.md, cran.md, problems{,.md}/, failures{,.md}/
  ├─ pool what every check and every shard cost, job durations included
  └─ manifest.json, job summary, revdep2-report + revdep2-baseline
       + revdep2-timings artifacts
```

The workflow is dispatch-only — nothing runs on push —
and `dry-run: true` stops after planning,
which is how a plan is inspected for free.
The `ref` input checks any branch, tag or commit SHA:
the dispatch itself can only target a branch or tag,
so arbitrary SHAs travel through the input,
with the one constraint that the tree must contain these scripts.

Planning and the preflight share a job. They were two, and the second did
nothing the first had not already paid for: a runner, a checkout, `setup-r`, a
pak install — and then downloaded the plan artifact the first had just
uploaded, to read it back. That is about two minutes of a three-hour run,
which is not really the point; the point is that planning is twenty seconds of
work wearing a whole job's overhead, and it sits on the critical path, because
the preflight cannot start until it ends and every shard waits on the
preflight.

Merging them costs one thing, and it has to be bought back explicitly.
A preflight failure used to be survivable
because the plan's outputs — the shard matrix among them —
were already safe in a job that had succeeded.
In one job a failing preflight step would take the matrix with it,
and the run would have nothing left to check.
So the plan's outputs are set and its artifact uploaded
*before* the preflight step runs,
and that step is `continue-on-error`:
it shows as failed, the summary says what it could not install,
and the shards go ahead and install those packages themselves.
Which is what the preflight has always been — an optimization, never a gate.

The shard's two steps are one driver called twice, `PHASE=install` and
`PHASE=check` (`PHASE=all` runs both in one process, which is what a local
invocation wants).
Splitting them is a reporting change and nothing else:
the install is minutes to an hour, the checks are hours,
and as one step the run page could only report their sum —
so "shard 14 took five hours" said nothing about
whether it spent them unpacking dependencies or checking packages,
and the install times turn out to vary a lot between shards.
The phases share the job environment and the work directory;
the install leaves the libraries and an `install-state.json`
of what it cost behind, and the check phase picks both up.
Nothing is done twice.

A failing check never fails anything:
`fail-fast: false` isolates shard-level accidents,
the shard driver records per-package failure as data,
the collector runs on `always()` past its prerequisites,
and check results never turn the run red —
the job summary and the `revdep2-report` artifact are the deliverable.
A red job means broken infrastructure, not a broken revdep.

## Weighing and partitioning

Enumeration is breadth-first to `depth`:
level 1 depends on the package directly,
level 2 on a level-1 package, and so on,
up to the fixpoint for `depth: all`.
Deeper levels break through their intermediaries,
so their CRAN-vs-dev comparison stays meaningful,
and their install closures pull the intermediaries in automatically.

A package's weight is what its two checks are expected to cost *here*.
The best answer is what they cost here last time —
the timings artifact below carries it per package.
Where no run has checked the package yet,
CRAN's own number stands in:
`tools::CRAN_check_results()` publishes per-package check times per flavor as
`T_total`,
the planner takes the `r-release-linux-x86_64` flavor,
and scales it by the ratio the last runs measured between CRAN's machine and
this one
(0.47 in the first calibrated run: these runners check faster than CRAN
reports).
Packages CRAN has no timing for either get the cohort median.
Every package is checked twice, but the two run at once,
so a package weighs one pair of checks plus a small fixed overhead.

That used to be conditional —
a package *without* a reusable baseline weighed double,
one with a baseline weighed single, because the baseline stood in for its old
check. Now that both halves always run, the condition is gone.
So is the doubling, and that part is easy to get backwards:
the two halves run *concurrently*,
so a package costs the shard the wall clock of the slower one,
not the sum of both.
`check_scale` is fitted from exactly that quantity —
`t_old` and `t_new` are both recorded as the pair's wall clock,
and the calibration fits `median(seconds / T_total)` from them —
so the weight already *is* the pair.
Multiplying by two would price every shard at twice its wall clock,
which buys twice the shards, each paying its own setup,
and defers packages at the deadline that would have fit.

The per-check timeout stays on CRAN's number and is not calibrated:
`max(REVDEP2_TIMEOUT_MIN_MINUTES, REVDEP2_TIMEOUT_FACTOR × T_total)`.
A timeout is a safety net for a check that has gone wrong,
so it should be generous where the estimate is merely typical —
and against the local estimate that same factor would be a third as forgiving.
The floor matters more than the factor:
19 of 770 packages in run 31048405399 were killed by a 10-minute one,
all of them compile-heavy (Stan models, mostly) and cheap by CRAN's numbers,
13 with the floor as their entire budget.
It is 20 minutes now, which covers every one of them.

### The shard count is bounded by the parallel capacity

Only `max-parallel` shards run at once (default 20),
so shards come in waves of that size.
That default is not arbitrary and raising it is not free:
GitHub caps how many jobs an account may run concurrently
(20 on the free plan, more on paid ones),
and 20 leaves room for the rest of the repository's CI.
Past that ceiling GitHub queues jobs whatever `max-parallel` says —
so a plan told it has more lanes than the account really has
does not get them, it just cuts more shards,
each paying its own setup while it waits for one.
**`max-parallel` should be the concurrency that actually exists, never more.**

Waves are what makes the shard count a real decision:
a shard after a full wave does not start any earlier for existing.
It waits for a lane, and arrives having paid another setup
(runner image, R, pandoc, TinyTeX, artifact downloads —
charged at 6 minutes until a run measures it)
plus its own dependency install.
Splitting past one wave therefore buys nothing and costs per shard,
which is what a 45-minute budget did to the 771-revdep batch:
111 shards, six waves, 6 h 16 min end to end,
for 2233 minutes of checking that one wave of 20 shards holds comfortably.

So the count is decided in two steps:

* **while one wave is enough, the budget decides.**
  `ceil(check minutes / shard-budget-minutes)`, capped at `max-parallel`.
  Below a full wave every extra shard really does start immediately,
  so cutting finer buys wall clock, and a small batch stays cheap.
* **past that, the capacity decides, in whole waves.**
  `shard-capacity-minutes` (default 80% of the shard's own deadline,
  so 240 min) is the most check time one shard may be given
  before its deadline starts deferring packages.
  The plan takes `ceil(check minutes / capacity)` shards,
  rounded up to a whole number of waves,
  and never more than the 250-leg matrix limit.

The result is `max-parallel` shards for anything that fits in one wave,
`2 × max-parallel` for twice that, and so on —
the capacity is filled, and nothing is split for the sake of splitting.

Both steps count *check* minutes,
but a shard also pays its setup and its installs inside the same deadline,
and how much that is only a real partition can say
(a shard's install union is not a per-package constant).
So the greedy pass below runs, the heaviest shard's **full** estimate is
compared against `REVDEP2_DEADLINE_MINUTES`,
and a shard count that cannot hold it grows by another whole wave
and partitions again.
The 20% between `shard-capacity-minutes` and the deadline is the room
this check normally finds sufficient;
the re-partition is what happens when it is not.

### When even the matrix is not enough

A matrix holds at most 256 legs, so `max-shards` caps at 250,
and 250 shards × 240 check minutes is the ceiling of one run:
about 60 000 check minutes.
Past that the plan **refuses to start**, with the numbers that make the case
and the ways out — rather than dispatching a run
that spends hours to report half its packages as `deferred`.

That ceiling is about the matrix, not about patience.
At 20 lanes, 250 shards is thirteen waves;
a batch anywhere near the limit is a multi-day run long before it is
an impossible one, and the wave count in the plan summary is what says so.

The way out it recommends is `part`:

```sh
gh workflow run revdep2.yaml -f part=1/3
gh workflow run revdep2.yaml -f part=2/3
gh workflow run revdep2.yaml -f part=3/3
```

Each part is an ordinary, independent run with its own report.
The cut is made on the weight-ordered package list, dealt round robin,
so the parts are of similar size and no coordination is needed:
every part re-derives the same order from the same CRAN metadata,
and a part that is still too big refuses in turn and names a bigger `G`.
Later parts start warmer than the first,
because baselines and prebuilt libraries are shared through the usual
artifacts.
The plan prints the `G` it needs, so the number is never guessed.

**What a split does not buy is wall clock.**
Run back to back or at the same time, the parts draw on the same account
concurrency, so the total time is what it always was —
plus one more preflight per part.
What it buys is a run that fits: shards inside their deadline,
a report per part rather than one that lands hours late and half `deferred`,
and a retry granularity that is a part rather than the whole set.
That is also why the refusal is the only place `part` is recommended:
a batch that fits should stay one run.

For scale, the largest set anyone here runs — `tibble`'s,
planned at the default 20 lanes:

* 2398 strong revdeps, 14 035 check minutes on CRAN's numbers:
  60 shards in three waves, ~13 h;
  40 shards in two waves, ~7 h, once the 0.47 measured scale applies.
* 3032 with `which: most` (Suggests included), 18 515 check minutes:
  80 shards in four waves, ~17 h;
  40 shards in two waves, ~9 h, calibrated.

Both are well inside the refusal, which is about the matrix limit —
but neither is short, and shard *count* is not what makes them long.
Three things bound such a run before the shard count does:

* **the lanes.** Wall clock is roughly total work ÷ concurrency,
  and concurrency is the account's ceiling
  (20 concurrent jobs on a free plan, more on paid ones).
  Nothing in this plan changes that number:
  splitting into more shards, or into `part` runs, only adds setups.
* **the preflight**, which installs the shared part of the dependency
  universe in one job before any shard starts, and is not parallel at all.
  Keeping it to what more than one shard needs is why it is the shared part
  and not all 4406 packages.
* **the heaviest single package**, which is never split across shards.
  `duckdb` alone is a 171-minute leg of the `most` plan on CRAN's numbers;
  no shard count gets under it, and the refusal names such a package
  rather than recommending a split that cannot help.

The capacity-bound plans above also sit close to their deadline by design
(the `most` one is planned at ~91% of it):
filling the capacity is what keeps the wave count down,
and a shard that overruns anyway defers the rest for `retry-run`
rather than losing it.
`shard-capacity-minutes` is the dial to lower if that trade reads wrong.

Assignment is greedy, in two phases:

1. **Round-robin the heavyweights.**
   The `K` heaviest packages are dealt one per shard,
   so no two giants end up queued behind each other.
2. **Marginal-cost placement for the rest.**
   Every remaining package, heaviest first,
   goes to the shard where
   `load + weight + install_seconds × |dependencies the shard does not yet have|`
   is smallest.
   The install penalty (default 2.5 s per package, from a warm binary cache)
   is what pulls packages with overlapping dependency trees together,
   so a shard's install phase is amortised over packages that share it.

### Calibration: the plan learns from the last runs

Three constants drive everything above,
and all three used to be guesses:
how fast a check runs here, what a shard costs before it checks anything,
and what one more dependency costs to install.
Guesses compound in the wrong direction —
an overestimate of the check load asks for more shards than the capacity can
run,
and every one of those shards costs a setup it never earns back.

So every run now measures itself.
Each shard records what its phases cost
(`timing.json`: unpack, install, checks, and its own wall time),
the collector adds what the shards' *jobs* took —
read off the API, because the minutes before the driver starts
are invisible from inside it and are precisely the price of one more shard —
and publishes the lot as `revdep2-timings`,
a small artifact next to the report the way `revdep2-lib-index`
sits next to the library.

The next plan takes the youngest few of those
(`REVDEP2_MEASURED_MAX_RUNS`, default 3, within
`REVDEP2_MEASURED_MAX_AGE_DAYS`, default 60, same platform),
and reduces them to medians:

| Constant | Measured as | Fallback |
| --- | --- | --- |
| check scale | check seconds here ÷ `T_total` | 1 |
| setup per shard | job minutes − driver minutes | 6 min |
| install per dependency | install minutes ÷ packages installed | 2.5 s |

Per-package measurements win over the scaled CRAN number wherever a run has
one;
the scale only prices the packages nobody has checked here yet.
Pooling several runs rather than trusting the newest
keeps a small retry run — which measures a handful of packages —
from redefining the constants on its own.
`REVDEP2_CHECK_SCALE`, `REVDEP2_SETUP_MINUTES` and `REVDEP2_INSTALL_SECONDS`
override the measurement where a human knows better,
and a fresh repository with no measured run at all
simply plans on CRAN's numbers and the fallbacks,
which is what the workflow did before.

### Why greedy, not an exact optimisation

The exact problem is makespan minimisation with sequence-dependent setup
costs — bin packing crossed with a coverage objective —
which is NP-hard in both halves,
and the classic greedy (LPT: longest processing time first)
is already within 4/3 − 1/(3K) of the optimal makespan.
The inputs do not deserve better:
CRAN timings come from a different machine under different load,
install costs are a scalar guess,
and the actual runtime moves with cache hits and CRAN's own state.
An ILP or local-search pass could shave minutes off the plan on paper
and would still be wrong by more than that in practice —
and it would need a solver in a job whose entire budget is two minutes.
The greedy pass is O(n · K) with a bitmap per shard,
runs in well under a second for thousands of revdeps,
and its plans are inspectable
(the plan job's summary prints per-shard estimates and contents).

`each.yaml` in duckdb-r solves the mirror-image problem
(contiguous slices of a commit history, reuse via ccache adjacency);
its two-pass rebalancing exists because contiguity pins its cuts.
Here nothing is contiguous — any package can sit anywhere —
so the whole plan family collapses into the one greedy pass
and the only dial left is the budget.

## The CRAN baseline, and when it is reused

The old-version check of a revdep does not involve the dev code at all:
it is the CRAN version of this package, the revdep, and their dependencies.
Its result therefore outlives the run that produced it,
and re-checking it every run would double the bill for no information.

The collector publishes every old-version result as `revdep2-baseline`
(`baseline.json` plus one `old.rds` per package),
and the planner reuses an entry only when *everything that shaped it*
is unchanged:

| Criterion | Compared |
| --- | --- |
| revdep version | baseline vs `available.packages()` now |
| our CRAN version | baseline vs CRAN now |
| R series | baseline vs the runner's `major.minor` |
| dependency versions | md5 over the sorted `package version` lines of the revdep's whole install closure, from CRAN metadata |
| age | `checked_at` within `baseline-max-age-days` (default 30) |

The dependency fingerprint is the load-bearing one:
a tidyverse point release changes the environment an old check ran in,
and versions-of-us-and-them alone would happily reuse a result
that release just invalidated.
The age cap backstops what CRAN metadata cannot see —
the runner image, system libraries, network state.
Reuse does not refresh `checked_at`:
a result ages from the day it actually ran.
`refresh-baseline: true` ignores all of it for one run.

Baselines are looked up newest-run-first across the workflow's history
(any branch — the dev code plays no part in an old check),
in the same single walk that picks the prebuilt libraries below,
and a retried run's own report doubles as its donor.
A missing, expired, or partially unusable baseline is never an error;
the affected packages are simply checked fresh.

## Prebuilt packages, and which runs they come from

Installing the dependency universe is the other half of the bill,
and without care it is paid many times over:
every shard installs its own union,
so on a runner with no binaries to install from,
one package is compiled once in each of the shards that needs it,
every run, for a result identical each time.

So the preflight installs it once centrally and publishes what it installed.
Its library is packed into `revdep2-lib`
(one uncompressed `library.tar` — `upload-artifact` zips what it uploads,
and deflating gigabytes twice buys nothing),
next to `revdep2-lib-index`,
a small `lib.json` naming the R series, the platform,
and every package version in it.
The index is a separate artifact on purpose:
a later plan reads it to decide what a run is good for
without downloading the library it describes.

That artifact is reused twice, and the first one needs no history at all:
**every shard unpacks its own run's preflight library** —
`preflight` is a `needs` of `test`, so it is simply downloaded —
and only then falls back to earlier runs
for whatever the preflight could not supply.
This is the half that pays on the very first run:
the compile happens once in the preflight
instead of once more in each shard.

### What the preflight installs, and what it leaves alone

Not the whole universe — only what more than one shard needs.

The saving from preflighting a package
is exactly the number of shards that need it, minus one:
build it once centrally instead of once per shard.
For a package only one shard needs, that saving is zero.
It is built once either way;
all the preflight does is move that build
off a shard, where it runs twenty-wide,
and onto the critical path, where it runs alone.

On the 3434-revdep set that is not a small tail —
**1633 of 4406 packages, 37% of the preflight's work, for no saving at all.**
Leaving them to their shard is free in the strict sense:

- `REVDEP2_PREFLIGHT_MIN_SHARDS: 1` — preflight 4406, **4406 installs across the run**
- `REVDEP2_PREFLIGHT_MIN_SHARDS: 2` — preflight 2767, **4406 installs across the run**
- `REVDEP2_PREFLIGHT_MIN_SHARDS: 3` — preflight 2108, **5065 installs across the run**

Two is the default because it is the last threshold that costs nothing:
the total number of installs is identical,
and so is the number of downloads,
since a package one shard needs is fetched once whoever fetches it.
Three sheds another 659 packages from the preflight
but has each of them built twice instead of once —
a real trade, worth having as a knob
for a preflight under time pressure,
not worth defaulting to.
The proportions barely move with the shard count:
at 120 shards instead of 60 the same threshold keeps 2773 rather than 2767.

The threshold is capped at the shard count.
With a single shard every package is needed by every shard,
so the cap is what stops a small run
from publishing an empty library to the next one.

What this costs is early warning.
The preflight load-tests what it installs,
so a dependency only one shard needs
is no longer proven before the checks start —
it fails in that shard instead, as a `depfail`,
which is a result the report already knows how to carry.

It is a `needs`, but not a prerequisite.
`test` runs on `!cancelled()` past a failed preflight
and `collect` does not consult its result at all,
because the preflight buys two things —
a free rebuild for the shards, and dependency failures diagnosed early —
and neither is worth the run.
A shard installs its own union regardless,
and that union is a fraction of the universe:
in the run that made this necessary,
a median of 478 packages against 4397.
Losing the preflight makes a run slower and blinder, not void.

For the rest, the plan walks the workflow's completed runs, youngest first,
and takes libraries until it has covered
every package this run will install,
or has run out of runs:

* a run only donates while its library is younger than
  `REVDEP2_PREBUILT_MAX_AGE_DAYS` (default 14)
  and its index reports the same R series and platform —
  binaries are only portable that far;
* each donor is credited only with the packages
  no younger donor already had,
  so a run that adds nothing is never downloaded;
* at most `REVDEP2_PREBUILT_MAX_RUNS` runs donate (default 5, `0` turns
  reuse off) — every extra donor is another full library download.

What it settles lands in `plan.json` as `prebuilt.runs`,
and the preflight and every shard unpack from exactly that list —
the shards after their own run's library, for the gaps it leaves.
Every unpack takes only the packages that job needs,
and never overwrites what is already in the library
or loaded in the session
(pak and everything the job installed for itself stays untouched).

**pak still runs over the whole set afterwards.**
Unpacking is not installing:
CRAN moves between runs, and a package whose version changed
has to be built after all.
The install runs with `upgrade = TRUE` whenever anything was restored,
because the plan's dependency fingerprints — the ones that decide
baseline reuse — are computed from CRAN *now*,
and `upgrade = FALSE` would quietly freeze the donor's versions instead.
Reuse therefore skips *building* what has not changed;
it never skips resolving it.

The one failure mode reuse introduces is a stale binary:
a runner image moves under a package that was compiled against the old one.
The preflight load-tests everything it installs anyway,
so it catches exactly that — a restored package that will not load
is thrown away, rebuilt from source, and load-tested again
before it counts as a dependency failure.

## Results, artifacts, tooling

Every artifact this workflow writes:

| Artifact | Content | Lifetime |
| --- | --- | --- |
| `revdep2-plan` | `plan.json` | 30 days |
| `revdep2-pkg` | source tarball, platform binary, `meta.json` | 30 days |
| `revdep2-preflight` | `depfail.json`, `resources.log` | 30 days |
| `revdep2-lib` | `library.tar` (the preflight's installed library), `lib.json` | 14 days |
| `revdep2-lib-index` | `lib.json`: R series, platform, package versions | 30 days |
| `revdep2-results-<shard>-<attempt>` | `manifest.ndjson`, `pkgs/<p>/{old,new}.rds`, kept check output | 30 days |
| `revdep2-report` | `README.md`, `cran.md`, `manifest.json`, `problems.md` + `problems/`, `failures.md` + `failures/`, all `pkgs/` | 90 days |
| `revdep2-baseline` | `baseline.json`, `old-rds/<p>.rds` | 90 days |
| `revdep2-timings` | `timings.json`: check seconds per package, cost per shard | 90 days |

The reports are revdepcheck's own,
generated through its `results` injection point
(`cloud_report_summary()` and friends),
so `README.md` reads exactly like a local `revdep_check()`'s.

The job summary embeds that report,
with two changes that a summary needs and a file does not.
Its links are rewritten:
a summary is served from the run's own URL,
where revdepcheck's `problems.md#pkg` resolves to `/actions/runs/problems.md`
and 404s,
so package names point at CRAN instead
and the report files are named where they actually live —
the `revdep2-report` artifact of the run.
And its "Failed to check" section is replaced
by a **Could not be checked** table
listing, per package, the version, the shard,
the check counts of whichever phase ran, and *why* —
the timeout and its duration, the dependencies that would not install,
whether installation failed under the dev version only or under both.
revdepcheck cannot say any of that
because the shim it is fed for an uncomparable package carries no detail;
the manifest has it all.

The summary closes with **What this run cost** —
check speed against CRAN's numbers, shard job durations,
setup and install cost —
because those are the numbers the next plan is sized in,
and they are worth reading next to the results they came from.

To fetch a run's results:

```sh
.github/workflows/revdep2/fetch.sh            # newest completed run
.github/workflows/revdep2/fetch.sh <run-id>   # a specific one
```

It brings `timings.json` down with the report,
so a plan can be replayed against exactly what that run measured:

```sh
REVDEP2_MEASURED_DIR=revdep OUT=plan.json \
  Rscript .github/workflows/revdep2/plan.R
```

To re-check only what a run could not declare ok —
after fixing the code, after a flaky failure, after a deadline deferral:

```sh
gh workflow run revdep2.yaml -f retry-run=<run-id>
```

The retry's collector carries the donor run's untouched results over,
so its report is complete again, not a fragment.

## The report is the repository's record

`revdep/` in the checkout is where the results live between runs.
`revdepcheck::cloud_check()` wrote `README.md`, `problems.md`,
`failures.md` and `cran.md` there long before this workflow existed,
`revdep/run-broken.R` read them back to re-check what was broken,
and the analysis next to them — `problems-analysis.md`, `examples/`,
the notification scripts — is what a human adds on top.
So the collector writes the same four files, in the same format
(they come out of revdepcheck itself), plus `manifest.json`,
and commits them back to the ref that was checked.

`problems.md` and `failures.md` are *assembled* rather than written whole.
Each package with a section has its own file —
`revdep/problems/<package>.md`, `revdep/failures/<package>.md` —
and the standalone file is the concatenation of them,
in case-insensitive name order:

```sh
cat $(ls revdep/problems/*.md | LC_COLLATE=C sort -f) > revdep/problems.md
```

Case-insensitive because that is the order
revdepcheck's own single-call version produced,
so the committed report keeps the order it already had;
sorting the raw names instead moves `ECoL`, `GoodFitSBM`, `MetaNet`
and `R6causal` to the front and rewrites the whole file for nothing.
`method = "radix"` on a lowercased key rather than plain `sort()`,
because `sort()` collates in the runner's locale —
the committed order should not depend on where the collector ran.

Two things fall out of the split.
A diff names the package that changed
instead of a line range in a file thousands of lines long.
And a run only has to touch the packages it actually checked —
a retry of 27 rewrites 27 files
and leaves the other 984 exactly as the repository has them.
That last part is the point:
a run that learnt nothing about a package
no longer gets to rewrite that package's section.
The rule is one predicate in `collect.R` —
a result that is `carried`, `missing` or `deferred`,
or one that is `ok` only because the package errors under *both* versions,
keeps whatever the repository already has,
and everything else is written from this run's comparison
or deleted when there is nothing left to report.
The `file.exists` half of it makes that a preference rather than a rule:
with no section on disk there is nothing to protect,
so it is written like any other.

The `ok`-but-broken clause is worth spelling out.
`ok` means there is no *new* problem, which is what this workflow is for —
it does not mean the package works.
79 of run 31930350338's 984 `ok` results error under both versions:
55 never got as far as a check
(their dependencies would not install,
so both halves stopped at `checking package dependencies`
within a couple of seconds and agreed),
and 24 are real checks of genuinely broken packages.
A run that reproduces breakage on both sides
has not shown that a section someone wrote for that package is stale,
so it does not delete it.
This only declines to delete; nothing is added.
`problems.md` is the newly-broken list by design,
and widening it to "still broken" is revdepcheck's `all = TRUE`
and a different report.

Only those paths are staged —
the five files and the two directories.
`git add <dir>` stages removals too,
which is what retires a package the run found fixed.
The analysis and the examples beside them are human-authored,
and `pkgs/` — the raw check output, gigabytes of it —
belongs in the `revdep2-report` artifact and nowhere near a commit.

A ref that cannot receive a commit simply does not get one:
a tag, a SHA, a fork's branch.
That is a fact about the dispatch rather than a failure,
so the step says so with a `::notice::` and stops;
the report is in the artifact either way.
The same applies to a protected branch, a read-only token, or a push
that races with someone else's — the step is `continue-on-error`,
because a report that cannot be committed is still a report.
Set the repository variable `REVDEP2_COMMIT_REPORT` to `false`
to turn the commit off entirely.

### Re-checking what was broken

`packages: broken` takes the packages to check from that committed report:
`manifest.json` when this workflow wrote it (every result that is not `ok`),
and otherwise revdepcheck's own markdown —
the `# <package> (<version>)` headings of `problems.md` and `failures.md`,
plus the "Failed to check" table in `README.md`.
That is `revdep/run-broken.R`'s loop, as a dispatch input.

It is the cheap run: 39 packages rather than 771 for the report as it stands,
one wave, and every one of them a package that was wrong last time.
`retry-run: <id>` is the sibling for a run that did not finish —
the report is about *results*, a retry is about *coverage*.

## Failure modes

| Situation | Outcome |
| --- | --- |
| A revdep breaks under the dev version | `newly_broken` in manifest and report; the run stays green |
| The checked ref is a tag or a SHA | the report is not committed; a `::notice::` says so and the artifact still has it |
| The report cannot be pushed (protection, fork, race) | the step is `continue-on-error`; the run keeps its result |
| A revdep fails the same way under both versions | `ok` (no *new* problems), visible in the report's tables |
| A revdep fails to *install* under both versions | `failed` — there is nothing to compare |
| A check times out | `timeout` kills it at `max(floor, factor × its CRAN time)`; reported `timeout`, not `failed`, with the check step it died at |
| A revdep's strong dependencies cannot install | `depfail`, check not attempted, named in the shard summary |
| A revdep needs a package that is not on CRAN | both halves stop at `checking package dependencies ... ERROR` in seconds and agree, so the pair compares clean; reported `depmissing`, not `ok`, with the missing packages named |
| A dependency fails the preflight | reported in the preflight summary and `depfail.json`; shards still try their own subset |
| A pak install chunk fails | the chunk is reported and the rest still run; what is still missing is retried one package at a time |
| A pak install chunk never returns | killed at `REVDEP2_INSTALL_TIMEOUT_MINUTES`, tree and all; the next chunk starts a fresh pak |
| The installs cannot finish inside the job | no chunk is started past `REVDEP2_INSTALL_DEADLINE_MINUTES`; what did install is still load-tested, packed and published |
| A dependency's `loadNamespace()` hangs | the batch times out and is retried one package at a time, so the culprit is named as a load failure |
| pak's metadata database is empty or unreadable | detected by probe before the first install, cleared and rebuilt once; the preflight stops if that does not fix it |
| `/tmp` fills and R can no longer start | `TMPDIR` is on the big disk, so it does not; the sampler still reports `/tmp` if it ever does |
| A restored package's system library is absent | `sysreqs_check_installed()` names it and `sysreqs_fix_installed()` installs it, in both the preflight and every shard |
| A *checked* package needs a system library | the revdep is never in the library -- `R CMD check` builds it from its tarball -- so the shard resolves the members' own `SystemRequirements` with `pkg_sysreqs()` and installs what is missing before the first check |
| The preflight job itself dies | the shards run anyway and install their own unions, the collector still reports; only the free rebuild and the early diagnosis are lost |
| A shard hits its deadline | remaining packages `deferred`; finished old-halves still uploaded and baseline-fed |
| The runner stops answering the service | "The hosted runner lost communication with the server" names CPU, memory and network starvation as its causes, and a dead runner takes its `if: always()` steps with it — so both the preflight and the shards stream a resource sample every 30 s while they work, and the checks run under `nice -n 10` (and `ionice -c3` where it exists) so the agent is never the process that loses |
| A shard job dies hard | the checks run in three slices, each followed by an upload, so at most a third is lost and the rest is already in the artifact; packages a later slice never reached are `deferred`, anything with no line at all the collector reconciles against the plan as `missing`, naming the shard, and `retry-run` re-checks exactly those |
| Every shard dies | the report is still written, with every package `missing`; the artifact download is tolerated, not required |
| The batch is too big for 250 shards | the plan refuses before anything starts, and names the `part` split that fits |
| A shard is re-run | new artifact per attempt; the collector lets the later attempt win per package |
| The run is planned into a single shard | `download-artifact` unpacks a lone match into the download path itself rather than a per-artifact subdirectory, so the collector looks for a `manifest.ndjson` in both places |
| The baseline artifact is gone | planner reuses nothing, everything checked fresh |
| No run has published timings yet | the plan uses CRAN's times unscaled and the fallback constants, and errs towards more shards |
| The collector cannot read the job durations | setup stays at its default; check and install costs are still measured |
| No earlier run has a usable library | shards still unpack this run's preflight library; only the preflight itself installs from scratch |
| The preflight could not pack a library | the download step is skipped, shards fall back to the plan's donors and pak |
| A donor's library artifact expires between plan and shard | that shard installs those packages itself; the run is unaffected |
| A restored binary will not load | the preflight rebuilds it from source and re-tests; only a second failure is a `depfail` |
| CRAN bumps a dependency mid-run | shards install what resolves at their start; the recorded fingerprint is the plan's — next run re-fingerprints |
| The package is not on CRAN | plan emits zero shards, run ends green |
| `collect` finds new problems | reported in the summary and the report artifact; the run stays green |

### When a job is killed rather than failed

A job that *fails* leaves a diagnosis:
the step reports its error,
the `if: always()` steps run,
and the artifacts are uploaded.
A job that is *killed* leaves almost nothing.
`The runner has received a shutdown signal` and `exit code 143`
is the whole of it —
no post-step runs,
nothing is uploaded,
and the only record that survives
is whatever had already been streamed to the log.

The preflight is where that happens,
because it is the one job that takes on the entire dependency universe at once,
so three things are arranged to be *live* rather than after the fact:

- `watch-resources.sh` samples memory, swap, disk, load
  and the three largest processes every 30 seconds
  while the install runs,
  so a kill has a curve leading up to it
  instead of a blank.
- The R script runs under `stdbuf -oL`.
  R block-buffers stdout when it is not a terminal
  and flushes it on exit,
  which a killed process never reaches —
  that is why pak's progress used to vanish
  while the `message()` calls around it, on unbuffered stderr, came through.
- Afterwards, when there is an afterwards,
  the kernel's own OOM log is read,
  which separates "this job asked for too much memory"
  from "the host went away".

The install itself is also cut down to a size pak handles predictably.
One `pak::pkg_install()` call for a few thousand refs
resolves all of them before it installs any of them,
and that resolution is the part that stops degrading gracefully:
the run above spent ten minutes in it
without a single install starting.
So both the preflight and the shards install in chunks of
`REVDEP2_INSTALL_CHUNK` packages (400),
ordered so that every strong dependency inside the set
is installed before the package that needs it —
each chunk then resolves against a library where its dependencies already are.
The ordering is on strong dependencies only:
Suggests are in the set because a revdep's *check* needs them,
not its installation,
and they are what would make the graph cyclic.
Packages a cycle or a gap in the index leaves unordered go last, together.

That also changes what a failure costs.
Whatever earlier chunks installed is on disk
and is skipped on the next attempt,
so a chunk that dies costs a chunk rather than the job —
and the log names which one,
where a single opaque call could only go quiet.

### Nothing waits for ever

A hang is not a crash, and the difference matters:
a job that fails is over in a minute and says why,
a job that hangs holds a runner
until someone notices and cancels it.
Run 31276552027 spent 76 minutes that way —
`pak::pkg_install()` on chunk 21 of 45 never returned,
at one busy core and flat memory,
after chunks 14 and 20 had already failed
with "error in pak subprocess".
There was no loop to break;
the call simply did not come back,
and nothing in these scripts had a clock.

Now everything that calls out has one:

- **each pak install** runs in a `callr` child
  and is killed at `REVDEP2_INSTALL_TIMEOUT_MINUTES` (20).
  It is killed with `kill_tree()`, not `kill()`,
  because what wedges is pak's *own* subprocess —
  a grandchild, which outlives a plain kill of its parent.
  The child inherits stdout and stderr,
  so pak's progress still streams to the job log
  with nobody draining a pipe.
- **each load-test batch** runs under a `processx` timeout
  (`REVDEP2_LOAD_TIMEOUT_MINUTES`, 10).
  `loadNamespace()` is not a thing that necessarily returns:
  a package whose `.onLoad` waits on a lock, a port or a display
  hangs the child for good.
- **the installs as a whole** stop at
  `REVDEP2_INSTALL_DEADLINE_MINUTES` (210),
  below the job's own 300.
  That is a different question from the per-call limit:
  one bounds a single call, the other stops 45 of them
  from adding up past what the job has —
  and what it cuts off is named,
  while the packages that did install
  are still load-tested, packed and published.

Running each install in its own child buys one more thing.
A wedged pak subprocess used to poison every call after it,
which is the likeliest reason chunk 21 hung
where 14 and 20 had merely failed.
Each chunk now starts a fresh R and a fresh pak,
so a bad one is contained to itself.

### pak's repositories are pinned, and its metadata is checked

pak reads `getOption("repos")` and adds the Bioconductor repositories
the moment something needs them —
and its metadata database is keyed on that set.
In run 31282820357 the first Bioconductor package
landed in chunk 11 of 45.
The repository set went from 1 to 6,
the metadata database from 7 files to 9,
and the rebuilt database came back **empty**:
`Updated metadata database: 0 B in 9 files`,
parsed in 20 ms where a good one takes 9 seconds.
From chunk 12 on, pak could not find a single package on CRAN —
not vctrs, all 4406 of them.

Installing in chunks is what made that reachable.
One long-lived pak process holds the parsed database in memory;
45 short-lived ones each re-read it from disk,
so a set that changes under one of them poisons every one that follows.

Three things follow from that:

- **The repository set is resolved once and pinned.**
  `repo_get(bioc = TRUE)` up front, before the first install,
  and the resulting set is handed to every pak child —
  an option set in the parent is not inherited,
  and a child that resolves its own set is a child that can change it.
- **The database is assessed before it is trusted**, with `meta_list()`
  rather than by watching installs fail:
  pak is asked how many of a few packages that must exist it can see
  (`REVDEP2_METADATA_PROBE`, default `vctrs,cli,R6`).
  The probe runs in a fresh process,
  because pak keeps the parsed database in the memory of its own subprocess —
  which is precisely why the break only surfaced at the *next* chunk.
- **A broken one is cleared exactly once.**
  `meta_clean(force = TRUE)` then `meta_update()`.
  The clean is the part that matters:
  `meta_update()` alone is what produced "0 B in 9 files",
  re-validating the broken files and leaving the empty database in place.
  Once per job is deliberate —
  a database still empty after a clean rebuild is not a stale cache,
  and clearing it in a loop would spend the job hiding that.

The preflight checks before its first install and stops if it cannot be fixed,
rather than failing package by package for hours
and then publishing a cache that fails every shard the same way.
Each shard checks after restoring that cache,
which is the difference between one bad job and sixty.
A chunk that fails is retried once,
but only when the rebuild actually changed something —
against a healthy database, a failed chunk is a real failure.

### Loading is tested one package at a time, in parallel

Loading a namespace loads everything it imports, transitively,
so loading the packages *nothing else in the set depends on*
covers the whole set:
in a DAG every other package is reachable from one of those roots
by following dependents upwards.
Measured on the real universe:
**865 roots out of 2645 packages, and nothing left uncovered.**

The saving in sessions is not the point.
One session per package means one clock per package.
A package whose `.onLoad` blocks used to spend a batch's whole ten minutes
and take 39 innocent packages with it,
and the batch then had to be re-run package by package
to find out which one it was.
And independent sessions run at once,
which is what the runner's other three cores are for
(`load-test.sh`, GNU `parallel` where it exists and `xargs -P` where it does
not, `timeout` per package).

It is more total work: the roots' closures sum to about 48,000 namespace loads
against roughly 27,000 for 67 batches of 40,
because each root reloads what it shares with the others.
Against that, the batched sweep ran serially,
so four at a time should still roughly halve it.
That last part is a projection, not a measurement —
the next run's preflight timing is what settles it.
`REVDEP2_LOAD_JOBS` and `REVDEP2_LOAD_SWEEP_MINUTES` are the knobs;
the failures are re-run singly afterwards to keep their output,
and there are few of them by construction.

Every tested package gets a line, with what it cost,
in a collapsed `::group::` sorted slowest first.
That is ~500 lines the default view never shows,
against a step that otherwise says nothing at all
between "load-testing 498 packages" and the summary —
and it is the only place a package that loads *slowly* appears,
though every check of anything downstream of it pays that cost again.
The slowest few are repeated outside the group, where they are read.

### The two halves get a network port each

`parallel` picks its default PSOCK port once, when its namespace loads:

```r
ran1 <- sample.int(.Machine$integer.max - 1L, 1L) / .Machine$integer.max
port <- 11000 + 1000 * ((ran1 + unclass(Sys.time())/300) %% 1)
```

The random term is only random while the RNG stream is.
Anything that calls `set.seed()` before `parallel` first loads —
which examples, vignettes and testthat do constantly, for reproducibility —
makes it deterministic, and both halves draw the same number.
Measured: three sessions seeded with 42 gave 11181, 11183, 11183,
against 11005, 11214, 11652 unseeded.

The time term cannot separate them either.
It sweeps 1000 ports over 300 seconds — 3.3 ports per second —
so two halves that load `parallel`
within a third of a second of each other
land on the same integer port.
They start together and run the same script, so they do.
And the choice is made once per *session*, not per cluster,
so from then on every cluster either half opens races for that one port.

In run 31893156685 that cost `cia` (port 11477) and `TDApplied` (11058),
both reported `newly_broken` with nothing wrong with them.
Staggering the halves is not a fix:
the separation would have to hold at the moment each loads `parallel`,
the two drift apart by minutes over a check,
and at 300 seconds the sweep wraps back onto itself.
`R_PARALLEL_PORT`, 20000 for old and 30000 for new,
costs nothing that was not already the case —
R fixes one port per session and reuses it regardless —
and both are far from R's own 11000–12000 band.

### A shard that cannot install still reports

An install that overruns used to be given the shard's whole deadline,
on the reasoning that an install running into it
leaves no time to check anything.
That is true, and it is the wrong conclusion.
Shard 3 of run 31893156685 sat in its install step for 2 h 33 m,
was cancelled, and its 50 packages came back `missing` —
the one result that tells nobody anything.

Three things now stand between an install and that outcome:

- the install gets `REVDEP2_SHARD_INSTALL_MINUTES` of the shard's time,
  not all of it, and what it could not install becomes a depfail,
  which is a *result*;
- the check step runs on `!cancelled()` rather than `success()`,
  so a *failed* install still gets its packages accounted for;
- a check phase that finds no install state writes a manifest saying so
  for every package in the shard, rather than exiting and leaving them
  to be reported as `missing`.

**45 minutes**, and that number is measured rather than picked.
The last two runs recorded 39 shard installs:
median 9.4 minutes, p90 13.7, worst 16.6.
So the budget is 2.7× the worst install anyone has actually seen
and 15% of the shard's deadline —
loose enough that a healthy shard can never notice it,
tight enough that shard 3's 2 h 33 m
would have been cut off more than three times sooner.

It doubles where little was restored.
Every one of those 39 installs had its preflight library —
95% of the union or better, in both runs —
so a *cold* install is unmeasured,
and a preflight that dies is survivable by design
(more so now that it is a `continue-on-error` step),
so cold shards will happen.
The one thing worse than a slow install
is depfailing 50 packages that would have installed
given a few more minutes.

The per-package fallback in the install is also no longer
`requireNamespace()` in a loop.
That *loads* each package — hundreds of namespaces and their DLLs
into the driver process, and past `R_MAX_NUM_DLLS` (614)
it starts returning `FALSE` for packages that are installed,
so the loop reinstalls them —
and its deadline check only skipped the install,
after the namespace had been loaded.
Which packages are missing is a question about the filesystem,
and `missing_from()` answers it that way.

### System requirements of packages nobody installed

`PKG_SYSREQS` is on in both jobs, so pak runs `apt-get`
for the packages *it* installs —
independently on each runner, nothing shared between them.
That covers everything pak builds.

It does not cover what was unpacked rather than installed.
A shard untars this run's preflight library and the plan's donors
before pak sees anything —
170 of one shard's 436 dependencies in run 31282820357 —
and pak never resolves system requirements for a package
it was not asked to install.
It usually survives, because something else pulls the same apt package in
or the runner image already carries it.
When it does not, a restored binary cannot load its shared library,
and a shard has no load test to catch that:
it surfaces as a check failure blamed on the revdep.

So the library is asked directly rather than the install list.
`sysreqs_check_installed(library =)` names what is missing
and which packages want it — printed either way, so the gap is visible
even when there is nothing to do — and `sysreqs_fix_installed()` installs it.
Reading the library rather than a recorded apt diff
is what makes this cover donor libraries from earlier runs as well:
their apt state was never recorded anywhere,
but pak can still read what they left behind.

The preflight does this before its load test,
because a restored package whose system library is absent
fails to load for a reason that has nothing to do with the package —
without it, the package is judged stale, rebuilt from source,
and fails again the same way.
A shard does it after its installs and before its first check.

### Temporary files go on the big disk

`/tmp` on this runner image is its own filesystem of about 8 GB —
half the RAM, so a tmpfs —
while the disk `runner.temp` lives on has over 100 GB free.
Everything R does temporarily lands in `/tmp` by default:
source builds, unpacked tarballs,
and callr's own startup files.

Run 31303054725 filled it after eleven chunks.
What that looks like is not "no space left on device" anywhere useful:

```
08:19:33  /tmp 8G free                                    ← job starts
08:30:34  /tmp 2G free
08:31:12  Error in saveRDS(client_env, file = env_file, …) :
            error writing to connection
08:31:13  chunk 13 failed: ! callr subprocess failed: could not start R
```

Once callr cannot write its startup environment,
no R process starts at all,
and every chunk after that fails in about a second —
which reads like the metadata database being empty,
and is a completely different problem.
So `TMPDIR` points at `runner.temp` in both jobs,
and the sampler keeps `/tmp` in its list
whether or not anything is still using it.

### Old and new run at the same time

A shard used to make two passes: every old check, then `R CMD INSTALL` of the
dev binary over the CRAN one, then every new check.
The install in the middle is what forced them apart —
one library can only hold one version of the package under test.

Two libraries can.
`R_LIBS` is a search path,
so each check names a library holding *exactly one* package —
the CRAN release for old, the dev build for new —
in front of the shared library holding every dependency.
Nothing is installed or uninstalled between them,
so the pair runs concurrently:
`check-pair.sh` starts both `R CMD check` invocations, waits, and records
each one's log and exit status.

That is worth two things.
A package's wall clock halves, on a four-core runner
where one check keeps about one core busy.
And a package whose old check hangs still gets its new answer,
where before the old timeout meant the run learnt nothing about it at all —
the half that finished is saved, with its own check output,
even though there is no verdict to draw from one side.

The timeout is coreutils' `timeout` rather than rcmdcheck's,
which makes the distinction reliable:
exit 124 is the deadline, anything else is the check saying something.
`rcmdcheck::parse_check()` then turns each `00check.log`
into the same object `rcmdcheck()` used to return,
so the counts, `compare_checks()` and the manifest are unchanged.

For a package that is not ok, what is kept is the **difference** between the
two logs (`00check.diff`) next to the new one,
and the same diff is printed into the job log
under a foldable `::group::` heading.
The logs are thousands of lines that are identical in both,
and the handful that are not is the entire point —
so the run page can carry them for every package that is not ok
without anyone downloading an artifact to find out
that a NOTE gained a line.
`REVDEP2_DIFF_MAX_LINES` bounds what is printed (200 by default);
the whole diff is always in the artifact.

### What the halves differ in that is not the package

A diff is only worth printing if two identical results produce an empty one,
and two concurrent checks do not naturally produce identical logs.
Two things differ for reasons that have nothing to do with the package:

- **The paths.** The libraries cascade, so they differ by construction —
  `.../lib-old/...` against `.../lib-new/...` — and so do the two check
  directories, which the log names in its first line
  and quotes in every "see … for details".
- **The stage timings.** `--as-cran` used to set `_R_CHECK_TIMINGS_` to 10,
  so every stage slower than that printed its own `[user/elapsed]` pair,
  and two checks racing each other for the same four cores
  never agree on those.
  They are off now — `_R_CHECK_TIMINGS_=""` for the stamps,
  `_R_CHECK_EXAMPLE_TIMING_THRESHOLD_=99999` for the
  "Examples with CPU … > 5s" table, which is the same noise in table form.
  `neutral_log()` still strips them, because a reused baseline
  or an older artifact may carry them,
  but nothing produces them any more, so the diff a human reads
  is only what changed.
  Nothing is lost: what a stage cost is still recorded, per line
  and for *every* stage rather than only the slow ones,
  by the elapsed stamping in `check-pair.sh` —
  which is on the driver log, not on the file the halves are compared through.

Both are removed before the log is parsed *and* before it is diffed.
Measured, not assumed: rphylopic checked against the *same* igraph
on both sides differed in exactly two lines —
the log directory, and `[14s/12s]` against `[13s/11s]` —
and in none once neutralised.

This is hygiene rather than a fix for anything observed:
`compare_checks()` hashes only the *first line* of each issue,
so noise further down could never have mattered to it.
What it buys is the diff: an empty one now means
the dev version changed nothing about this check.
A package called `newly_broken` whose two logs are identical
is this harness getting it wrong, and the job log says so in as many words.

### Why a reused baseline made packages look newly broken

Run 31879790285's shard 9 reported `rphylopic`, `HospitalNetwork` and `orthGS`
as `newly_broken` with the same `1E 0W 0N` in both halves.
All three had a **reused baseline** standing in for the old half.
All eight packages in that shard that ran a fresh old check were `ok`.

The two halves were parsed by two different parsers.
A baseline from an earlier run was produced by `rcmdcheck::rcmdcheck()`,
which parses the *stream* as `R CMD check` writes it;
this run's half is `parse_check()` on the finished `00check.log`,
where R has gone back and appended the status to the line it opened.
The same failing test therefore renders two ways:

```
checking tests ...          |  checking tests ... ERROR
  Running 'testthat.R'      |    Running 'testthat.R'
 ERROR                      |  Running the tests in ... failed.
```

`compare_checks()` hashes the first line, so those are two different issues —
`81f6423…` against `23e57fe…` — and the new one matches nothing in the old.
Their `00check.diff` is eight lines, all of it the log directory:
the *logs* agree, and only the objects disagree.

Run 31879790285 finished with the whole set and the split is stark:

- of the **909** packages whose old half came from a reused baseline,
  **76** were called `newly_broken` — 8.4%;
- of the **78** that ran a fresh old check, **2** were — 2.6%,
  and both are real
  (`cranly` on `eigen_centrality(scale = FALSE)` now being a
  `deprecate_stop()`, and `vkR`).

29 of the 76 have *identical* counts in both halves,
which is the parser artefact exactly;
the other 47 differ, which is a baseline being a result
from another machine and another CRAN snapshot.
Both are the same mistake: comparing against something
that is not this run.

This is why both halves always run now.
With the pair concurrent the old check costs no wall clock,
so substituting a baseline bought nothing and cost comparability —
and a baseline is a result from another run anyway:
another machine, another CRAN snapshot, another dependency tree.
It is still read as a second opinion, and when it disagrees
with the old check just run, the shard says so
and records `baseline_agrees` in the manifest.

### What the summary shows for a package that broke

Three blocks, each with its own budget rather than sharing one:

- the **check log**, which says *what* broke and at which stage;
- **`00install.out`**, where a package that could not be installed explains
  itself. The check log only points at the file,
  which used to mean downloading the artifact to read a compiler error;
- the **`.Rout.fail` transcript**, which is the whole test run.

and — where the failure was in the examples —
the **`-Ex.Rout` transcript**, which is the same for them.

`_R_CHECK_TESTS_NLINES_=300` also widens the check log's own copy
of a failed test from R's default 13 lines —
thirteen routinely cuts off the failure itself,
which is both what a reader wants
and the part the old/new diff has to see to be worth printing.
Not unlimited, because that text is carried three times over
(the check log, the diff, the summary)
and one chatty test would otherwise bury the rest of the shard in all three.
`REVDEP2_DETAIL_MAX_LINES` (300) bounds the transcript blocks.

Bounding it costs nothing, because the complete transcript is kept beside it.
R writes `<file>.Rout.fail` for a test file that failed
and `<pkg>-Ex.Rout` for the examples,
each the whole thing whatever `_R_CHECK_TESTS_NLINES_` says —
measured: 521 lines at 13, at 300 and at 0 alike.
Both are copied into the shard artifact.
The `-Ex.Rout` one is not a `.fail` file
and so used to be dropped,
which left an examples failure with nothing but the check log's excerpt —
and examples is where most of the interesting failures are.

What is *not* kept: anything at all for a package that came out `ok`
(its check directory is deleted, deliberately —
909 of them in run 31879790285),
and the old half's own `00check.log`,
which survives only as its half of `00check.diff`.

Every line that reports a package carries its position in the shard
and an estimate for what is left:

```
protti: ok (old 0E 0W 0N, new 0E 0W 0N, 1072s for the pair, 1/51, ~5.0 h left)
```

A shard runs for hours and its log is read while it runs,
so "is this nearly done?" should not need counting lines,
and the question actually being asked is *when*.

The plan already priced every package;
what it could not know is how this runner would compare to its model.
So the remaining packages are priced in the plan's own units
and rescaled by how its estimates have held up in this shard so far —
which absorbs both a slow runner
and a systematically optimistic model,
without either having to be known in advance.
Before the first pair finishes there is nothing to rescale by
and the plan's number stands, which is why the estimate can move a long way
on the first package and very little after that.

### Spelling is not checked

It cannot say anything about igraph:
a misspelling in a revdep's DESCRIPTION is the same misspelling in both halves,
so it cancels out of every comparison the workflow makes,
and what is left is noise in a log read to find real differences.
`_R_CHECK_CRAN_INCOMING_: false` already suppresses it —
R's spelling stage lives inside `check_CRAN_incoming()` —
and `_R_CHECK_CRAN_INCOMING_USE_ASPELL_: false` says so out loud
so that `--as-cran` cannot turn it back on.

A package's *own* `tests/spelling.R` is a different thing.
Those run because `r-lib/actions/setup-r` sets `NOT_CRAN=true`,
which is what makes `skip_on_cran()` not skip.
The shards now set `NOT_CRAN=false` instead,
so they behave like CRAN's own check machines:
the point of this workflow is to find what a released igraph would break,
and a test CRAN never runs cannot break on CRAN.
That silences the spelling tests
and every other `skip_on_cran()` test with them —
a real reduction in what is exercised,
which is why it is an input rather than a constant.
Dispatch with `not-cran: true` to widen the net again.

`NOT_CRAN` is written in a step rather than in the job's `env`
because `setup-r` writes its own value into `$GITHUB_ENV`,
and a later write is what reliably overrides an earlier one.

### `\donttest` examples are not run

`--as-cran` turns on `--run-donttest`.
That is the most expensive thing a check does
and the least useful thing for this workflow:
`\donttest{}` is where packages put the examples too slow to run on CRAN,
so it is where the runners spend their hours
and where the timeouts land —
varPro's old half was killed at 1200 s
in `checking examples with --run-donttest`.
`_R_CHECK_DONTTEST_EXAMPLES_=false` turns it back off.
`\dontrun{}` is off unless asked for, and stays off.
What is left is every example a package expects to run,
which is the part a change to igraph can break.

### A timeout is not a failure

Run 31304411628 put 60 packages into `failures.md` marked "timed out",
and shard 7's log shows no sign of trouble — two of them, both stuck at
`Running 'testthat.R'` after every other check step passed in seconds.
Both things are true.
CRAN checks those 60 in a median of 275 s
and these runners measure about half CRAN's time,
so a 20-minute kill is not slowness; it is a hang.

The reporting was the wrong part.
A check killed by the clock says nothing about the package,
and in the *old* half it says nothing about our change either —
the dev version is not even on that library path.
Such a package is now `timeout` rather than `failed`,
with its own row in the summary and the check step it died at in the message.
`needs_recheck()` treats it as not-ok either way,
so `retry-run` still picks it up.

The same principle applies to everything these scripts swallow.
Fetching an artifact is an optimization,
so its failure never stops a run —
which is exactly why it has to say *which* failure it was.
An artifact that has really expired,
a `gh` that could not download it,
a truncated zip,
an `unzip` that refused it,
and a tar that ran out of disk
each name themselves now;
before, all of them printed
"no longer has a library artifact",
including the cases where the artifact was demonstrably still there.

Run ids are strings everywhere in these scripts,
never integers, and `"0"` is the "no such run" sentinel
that `plan.json` and the plan job's outputs use.
GitHub's run ids passed `.Machine$integer.max` in 2026,
so `as.integer("31048405399")` is a silent `NA`
that only surfaces as `missing value where TRUE/FALSE needed`
at the next `if`.
`run_id_chr()` and `has_run()` in `util.R` are how they are handled.

## Knobs

| Knob | Input | Variable | Default |
| --- | --- | --- | --- |
| Ref to check (branch, tag, SHA) | `ref` | — | the dispatched ref |
| Packages to check, or `broken` for the committed report's | `packages` | `REVDEP2_PACKAGES` | all revdeps |
| Where that report lives | — | `REVDEP2_REPORT_DIR` | `revdep` |
| Commit the report back to the checked branch | — | `REVDEP2_COMMIT_REPORT` | on |
| Revdep set | `which` | — | `strong` |
| Revdep depth (`1`, `2`, …, `all`) | `depth` | — | 1 |
| Retry a run | `retry-run` | — | — |
| One G-th of the revdeps, for a set too big for one run | `part` (`i/G`) | `REVDEP2_PART` | — |
| Plan only | `dry-run` | — | false |
| Run the tests CRAN skips (`skip_on_cran()`, spelling tests) | `not-cran` | `REVDEP2_NOT_CRAN` | false |
| Check-time target per shard, up to one wave | `shard-budget-minutes` | `REVDEP2_SHARD_BUDGET_MINUTES` | 45 |
| Concurrent shards, and so the wave size — set it to the concurrency the account really has, never more | `max-parallel` | `REVDEP2_MAX_PARALLEL` | 20 |
| Check minutes one shard may hold, which forces further waves | — | `REVDEP2_SHARD_CAPACITY_MINUTES` | 80% of the deadline |
| Ignore reusable baselines | `refresh-baseline` | — | false |
| Oldest reusable baseline | `baseline-max-age-days` | `REVDEP2_BASELINE_MAX_AGE_DAYS` | 30 days |
| Runs donating prebuilt packages | — | `REVDEP2_PREBUILT_MAX_RUNS` | 5 (`0` disables) |
| Oldest reusable prebuilt library | — | `REVDEP2_PREBUILT_MAX_AGE_DAYS` | 14 days |
| Runs the history walk looks at | — | `REVDEP2_HISTORY_RUNS` | 40 |
| Shards a package must be needed by before the preflight installs it | — | `REVDEP2_PREFLIGHT_MIN_SHARDS` | 2 (`1` is the whole universe) |
| Packages per `pak::pkg_install()` call | — | `REVDEP2_INSTALL_CHUNK` | 400 |
| Time limit on one `pak::pkg_install()` call | — | `REVDEP2_INSTALL_TIMEOUT_MINUTES` | 20 |
| Wall clock past which no further install is started | — | `REVDEP2_INSTALL_DEADLINE_MINUTES` | 210 |
| Time limit on one load-test batch | — | `REVDEP2_LOAD_TIMEOUT_MINUTES` | 10 |
| Packages probed to tell a usable metadata database from an empty one | — | `REVDEP2_METADATA_PROBE` | `vctrs,cli,R6` |
| Time limit on probing or rebuilding that database | — | `REVDEP2_METADATA_TIMEOUT_MINUTES` | 10 |
| Time limit on surveying or installing system requirements | — | `REVDEP2_SYSREQS_TIMEOUT_MINUTES` | 20 |
| Wall clock past which the plan warns (never refuses) | — | `REVDEP2_LONG_RUN_HOURS` | 12 h |
| Runs whose timings calibrate the cost model | — | `REVDEP2_MEASURED_MAX_RUNS` | 3 (`0` disables) |
| Oldest measurement worth trusting | — | `REVDEP2_MEASURED_MAX_AGE_DAYS` | 60 days |
| Check seconds here per CRAN second | — | `REVDEP2_CHECK_SCALE` | measured, else 1 |
| Fixed cost of one shard | — | `REVDEP2_SETUP_MINUTES` | measured, else 6 min |
| Cost of one more dependency install | — | `REVDEP2_INSTALL_SECONDS` | measured, else 2.5 s |
| Per-check timeout factor | — | `REVDEP2_TIMEOUT_FACTOR` | 1.5 × CRAN time |
| Per-check timeout floor | — | `REVDEP2_TIMEOUT_MIN_MINUTES` | 20 |
| Shard graceful deadline | — | `REVDEP2_DEADLINE_MINUTES` | 300 |
| Diff lines printed into the job log per package | — | `REVDEP2_DIFF_MAX_LINES` | 200 |
| Load tests run at once | — | `REVDEP2_LOAD_JOBS` | one per core |
| Time limit on the whole load sweep | — | `REVDEP2_LOAD_SWEEP_MINUTES` | 60 |
| Shard minutes the install may take before the checks get the rest (doubled on a cold library) | — | `REVDEP2_SHARD_INSTALL_MINUTES` | 45 |
| Transcript lines shown per install/test block in the summary | — | `REVDEP2_DETAIL_MAX_LINES` | 300 |

## Prior art

Surveyed before building this; what each contributed:

* [r-lib/revdepcheck](https://github.com/r-lib/revdepcheck) —
  the comparison model (old vs new `rcmdcheck`, `compare_checks()`),
  the report format, and the `results` injection point the collector uses.
  Its `cloud_check()` (one AWS Batch job per package, fetch, compare locally)
  is the closest architectural relative.
* [r-devel/recheck](https://github.com/r-devel/recheck) —
  CRAN-parity system libraries, binary-first dependency installs,
  and the honest framing that revdep results are diagnostics,
  too volatile for a pass/fail gate (hence check results never fail the run).
* [yihui/crandalf](https://github.com/yihui/crandalf) —
  batching revdeps across CI jobs,
  and re-checking only previously failed packages (`retry-run` here).
* [HenrikBengtsson/revdepcheck.extras](https://github.com/HenrikBengtsson/revdepcheck.extras) —
  pre-installing the dependency universe before the checks start
  (the preflight job).
* duckdb-r's `each.yaml` —
  the plan/matrix/fan-in shape, cost-balanced shards under a budget,
  graceful deadlines with deferral, per-attempt artifacts,
  and empty-matrix/fallback-output hygiene.

No published workflow was found that balances revdep shards
by CRAN check timings or by dependency overlap;
that part is new here.

## Not yet validated

1. Three of the cost model's constants are now fitted from the last runs
   (check scale, per-shard setup, per-dependency install);
   the per-package overhead (0.5 min) and the budget itself
   are still estimates.
   The fit is a median, not a regression:
   install cost in particular is charged per package
   where it plainly is not linear in the package count,
   and a shard holding twice as many packages installs a union
   that is much less than twice as large.
   The measured numbers are in each run's `revdep2-timings`,
   so a better model can be fitted whenever the linear one is seen to hurt.
2. Bioconductor revdeps are out of scope:
   enumeration, versions and fingerprints all come from CRAN metadata.
3. The report generation leans on unexported revdepcheck internals
   (`try_compare_checks()`, `rcmdcheck_error()`) via `:::`,
   with a manifest-only fallback when they drift.
4. Baselines live in artifacts, whose retention caps reuse at 90 days
   and whose availability is per-repository;
   an orphan branch (the `rcc` model) would be durable and fetchable
   but grows the repository.
5. Prebuilt-library reuse trades download for build:
   every shard fetches each donor library whole,
   because artifacts cannot be fetched in part.
   That is a clear win where the runner has no binaries to install from
   and a marginal one where it does,
   and the crossover has not been measured —
   `REVDEP2_PREBUILT_MAX_RUNS=0` turns it off if it ever stops paying.
