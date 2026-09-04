#!/usr/bin/env bash
# Drain one shard's check queue: every reverse dependency old half then new
# half, one container per check, several packages at once.
#
# Usage:
#   queue.sh <queue-file> <workdir> <old-lib> <new-lib> <manifest-path> <deadline-epoch>
#
# The queue file has one package per line, tab-separated, sorted
# heaviest-first by the caller (shard.R):
#
#   name  tarball-abs-path  timeout_sec  weight_minutes
#
# The list is consumed from both ends at once. Worker 1 takes the next line
# from the top -- the heaviest package still unclaimed -- and the remaining
# workers take from the bottom, lightest first. The heaviest checks are the
# ones that decide when the shard finishes: started late, one of them becomes
# the straggler discovered last, running alone after everything else has
# drained (the classic LPT lesson). Started first, it runs for its hour while
# the swarm of cheap packages drains in parallel from the other end, and the
# two ends meet in the middle. One heavy lane is enough: a second one only
# helps when the two heaviest packages together outlast everything else
# combined, and the plan's shard balancing already makes that unlikely.
#
# A claim is two cursor integers in one state file, moved under an flock --
# a few arithmetic operations, so the critical section is tiny and no check
# ever holds the lock. Every claim lands in claimed.log (epoch, worker, lane,
# line number, package) for forensics.
#
# Deadline: before claiming, a worker prices the candidate at
# weight_minutes * 60 * 1.3 -- the plan's own estimate plus the shard
# driver's trailing margin -- and stops claiming once now plus that crosses
# the deadline. The candidate stays unclaimed; shard.R writes it a `deferred`
# line when it reads the manifest back. The very first claim across all
# workers is always attempted, so a mis-budgeted shard still makes progress
# instead of repeating its mistake on every retry (the same rule as the shard
# driver's own out_of_time()); the flag for it lives in the locked state file
# because the exemption must be claimed exactly once. The lanes defer
# independently, which is the point of having two: the heavy lane prices the
# heaviest remaining package and may stop while the light lanes, pricing the
# lightest, keep draining.
#
# Per package: check-half.sh old, then check-half.sh new -- both halves
# always run fresh; a stored old result is compare-one.R's second opinion,
# never a substitute -- then compare-one.R, which parses,
# compares, salvages and appends the package's manifest line itself under
# <manifest-path>.lock. Every failure past a claim still produces a manifest
# line: compare-one.R crashing gets a second run with --error; that failing
# gets a hardcoded printf JSON line; a worker dying outright is caught by the
# final sweep, which writes lines for anything claimed but unreported. A
# claimed package can never vanish silently.
#
# Environment:
#   REVDEPX_WORKERS          worker count (default: nproc)
#   REVDEPX_IMAGE            image ref, required by check-half.sh
#   REVDEPX_MEMORY_PER_CHECK per-container memory cap; default computed as
#                            (MemTotal - 2 GiB) / workers, floored at 2 GiB;
#                            exported to check-half.sh as REVDEPX_MEMORY
#   BASELINE_DIR, PLAN, SHARD    forwarded to compare-one.R
#   REVDEPX_OUR_CRAN_VERSION, REVDEPX_OUR_DEV_VERSION
#                            what the prepare phase installed; forwarded to
#                            compare-one.R and stamped on fallback lines
#   REVDEPX_CHECK_HALF, REVDEPX_COMPARE_ONE
#                            override the two collaborators' paths (tests)
# plus whatever check-half.sh forwards into the container (_R_CHECK_* and
# friends), which this script passes through untouched.
#
# Leaves in <workdir>: claimed.log and queue-state.json for shard.R's
# accounting, one directory per claimed package, and .queue/ with the cursor
# state. stdout is reserved for data and currently carries nothing;
# everything human goes to stderr, so the two streams can be captured
# separately, as in load-test.sh. Always exits 0 once draining has started:
# which packages failed, and how, is the manifest's business, not the
# shell's.

set -u

if [ "$#" -ne 6 ]; then
  echo "usage: queue.sh <queue-file> <workdir> <old-lib> <new-lib>" \
    "<manifest-path> <deadline-epoch>" >&2
  exit 2
fi

queue_file=$1
workdir=$2
old_lib=$3
new_lib=$4
manifest=$5
deadline=$6

# The claim protocol is flock or nothing: without it the cursor updates race
# and two workers can check the same package. CI runners always have it; a
# laptop that does not gets a loud refusal here instead of a silently
# unserialized queue.
if ! command -v flock > /dev/null 2>&1; then
  echo "queue.sh: flock is not available; the claim protocol cannot run safely" >&2
  exit 2
fi

if [ ! -r "${queue_file}" ]; then
  echo "queue.sh: queue file not readable: ${queue_file}" >&2
  exit 2
fi
case ${deadline} in
  '' | *[!0-9]*)
    echo "queue.sh: deadline must be epoch seconds, got: ${deadline}" >&2
    exit 2
    ;;
esac

# The two collaborators, resolved once into variables so that a test can
# point them at stubs and exercise the queue mechanics without docker or R
# package checks.
script_dir=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)
CHECK_HALF=${REVDEPX_CHECK_HALF:-${script_dir}/../revdepx/check-half.sh}
COMPARE_ONE=${REVDEPX_COMPARE_ONE:-${script_dir}/compare-one.R}

workers=${REVDEPX_WORKERS:-}
if ! [[ ${workers} =~ ^[0-9]+$ ]] || (( workers < 1 )); then
  workers=$(nproc 2> /dev/null || echo 4)
fi

# One memory cap for every check container, sized so that the workers
# together leave the host 2 GiB for docker, this script and the runner agent.
# The floor matters more than the division: below 2 GiB real packages die
# compiling, so the cap stays at 2 GiB even where workers x 2 GiB
# oversubscribes the machine -- then the kernel OOM-kills one container,
# which check-half.sh records against that one package, rather than this
# script quietly checking less in parallel than it was asked to.
if [ -n "${REVDEPX_MEMORY_PER_CHECK:-}" ]; then
  export REVDEPX_MEMORY=${REVDEPX_MEMORY_PER_CHECK}
else
  mem_total_kib=$(awk '/^MemTotal:/ { print $2 }' /proc/meminfo 2> /dev/null || true)
  if [[ ${mem_total_kib:-} =~ ^[0-9]+$ ]]; then
    head_room_kib=$((2 * 1024 * 1024))
    floor_kib=$((2 * 1024 * 1024))
    avail_kib=$((mem_total_kib - head_room_kib))
    if (( avail_kib < 0 )); then avail_kib=0; fi
    per_kib=$((avail_kib / workers))
    if (( per_kib < floor_kib )); then per_kib=${floor_kib}; fi
    export REVDEPX_MEMORY="$((per_kib / 1024))m"
  else
    echo "[queue] cannot read MemTotal; REVDEPX_MEMORY stays ${REVDEPX_MEMORY:-unset}" >&2
  fi
fi

# Queue bookkeeping. claimed.log and queue-state.json sit at the top of the
# work directory, where shard.R's accounting expects them; the mutable state
# hides in .queue/, which no CRAN package can be named after.
state_dir=${workdir}/.queue
state_file=${state_dir}/state
state_lock=${state_dir}/state.lock
done_count=${state_dir}/done
fallback_count=${state_dir}/fallback
claimed_log=${workdir}/claimed.log
manifest_lock=${manifest}.lock
pkgs_dir=$(dirname -- "${manifest}")/pkgs

mkdir -p "${workdir}" "${state_dir}" "${pkgs_dir}"
: > "${done_count}"
: > "${fallback_count}"
: > "${claimed_log}"
touch "${manifest}"

# The queue, read once into memory; the workers inherit the array. Line
# numbers are positions in this file, so it must not have interior blank
# lines (shard.R writes none); a trailing one is tolerated.
mapfile -t queue_lines < "${queue_file}"
while (( ${#queue_lines[@]} > 0 )) && [ -z "${queue_lines[-1]//[[:space:]]/}" ]; do
  unset 'queue_lines[-1]'
done
total=${#queue_lines[@]}
width=${#total}

# Cursors: head at the heavy end, tail at the light end, and the
# claimed-anything flag for the first-claim exemption. Queue empty when the
# head passes the tail.
printf '1 %d 0\n' "${total}" > "${state_file}"

started_at=$(date -u '+%Y-%m-%dT%H:%M:%SZ')
started_epoch=${EPOCHSECONDS}

log() { printf '%s\n' "$*" >&2; }

# Strip anything that could break the hand-rolled JSON below. Package names
# are [A-Za-z0-9.] on CRAN and versions [0-9.-]; anything beyond that in
# these fields is already a driver bug, so dropping characters beats trying
# to quote them.
json_safe() { printf '%s' "${1//[^A-Za-z0-9._-]/}"; }

json_num() {
  if [[ ${1:-} =~ ^[0-9]+([.][0-9]+)?$ ]]; then printf '%s' "$1"; else printf '0'; fi
}

json_num_or_null() {
  if [[ ${1:-} =~ ^[0-9]+([.][0-9]+)?$ ]]; then printf '%s' "$1"; else printf 'null'; fi
}

# Appends under the same lock compare.R's write_manifest_line takes, so the
# two writers interleave whole lines, never bytes.
append_manifest_line() {
  {
    flock -x 8
    printf '%s\n' "$1" >> "${manifest}"
  } 8>> "${manifest_lock}"
}

# The last-resort manifest line, for when not even `compare-one.R --error`
# could run: a hardcoded template carrying every schema field, so the
# collector sees a well-formed `error` entry instead of a claimed package
# silently vanishing. The interpolated messages are fixed strings from this
# script, and the name/version fields are sanitised above, so nothing here
# can break the JSON.
write_fallback_line() {
  local name=$1 tarball=$2 weight=$3 t_old=$4 t_new=$5 message=$6
  local base=${tarball##*/} version=''
  if [[ ${base} == "${name}_"*.tar.gz ]]; then
    version=${base#"${name}_"}
    version=${version%.tar.gz}
  fi
  # The plan may have offered a second opinion for this package; this
  # last-resort writer cannot know, and false is the harmless default.
  local planned=false
  local shard=${SHARD:-0}
  if ! [[ ${shard} =~ ^[0-9]+$ ]]; then shard=0; fi
  local line
  printf -v line '{"package":"%s","version":"%s","level":0,"shard":%s,"weight_minutes":%s,"t_total":0,"dep_fingerprint":null,"baseline_planned":%s,"baseline_agrees":null,"result":"error","status":"","status_old":"","status_new":"","new_issues":0,"t_old":%s,"t_new":%s,"old_checked_at":null,"message":"%s","our_cran_version":"%s","our_dev_version":"%s"}' \
    "$(json_safe "${name}")" \
    "$(json_safe "${version}")" \
    "${shard}" \
    "$(json_num "${weight}")" \
    "${planned}" \
    "$(json_num_or_null "${t_old}")" \
    "$(json_num_or_null "${t_new}")" \
    "${message}" \
    "$(json_safe "${REVDEPX_OUR_CRAN_VERSION:-}")" \
    "$(json_safe "${REVDEPX_OUR_DEV_VERSION:-}")"
  append_manifest_line "${line}"
  printf '.' >> "${fallback_count}"
}

# One claim: take the next line from this worker's end, under the lock. Sets
# CLAIM_STATUS to claimed, defer or empty, plus CLAIM_NO/CLAIM_LINE/CLAIM_SEQ
# when there is a candidate. The defer decision happens inside the lock
# because it depends on which candidate the cursors point at; the
# first-claim exemption is a flag in the same state file for the same reason.
claim() {
  local worker_id=$1 lane=$2
  CLAIM_STATUS=empty
  CLAIM_NO=0
  CLAIM_LINE=''
  CLAIM_SEQ=0
  {
    flock -x 9
    local h t claimed
    read -r h t claimed < "${state_file}"
    if (( h <= t )); then
      local n
      if [ "${lane}" = heavy ]; then n=${h}; else n=${t}; fi
      local line=${queue_lines[n - 1]}
      local name weight
      IFS=$'\t' read -r name _ _ weight _ <<< "${line}"
      # weight_minutes * 60 * 1.3 = weight * 78: the plan's estimate with the
      # shard driver's trailing margin, in whole minutes rounded up (bash has
      # no floats) and floored at one, matching shard.R's out_of_time().
      local wi=${weight%%.*}
      if [[ ${weight} == *.* ]] && [ -n "${wi}" ]; then wi=$((wi + 1)); fi
      if ! [[ ${wi} =~ ^[0-9]+$ ]]; then wi=1; fi
      if (( wi < 1 )); then wi=1; fi
      if [ "${claimed}" = 1 ] && (( EPOCHSECONDS + wi * 78 > deadline )); then
        CLAIM_STATUS=defer
        CLAIM_NO=${n}
        CLAIM_LINE=${line}
      else
        if [ "${lane}" = heavy ]; then h=$((h + 1)); else t=$((t - 1)); fi
        printf '%d %d 1\n' "${h}" "${t}" > "${state_file}"
        printf '%s\t%d\t%s\t%d\t%s\n' \
          "${EPOCHSECONDS}" "${worker_id}" "${lane}" "${n}" "${name}" \
          >> "${claimed_log}"
        CLAIM_STATUS=claimed
        CLAIM_NO=${n}
        CLAIM_LINE=${line}
        CLAIM_SEQ=$(((h - 1) + (total - t)))
      fi
    fi
  } 9>> "${state_lock}"
}

# One claimed package, start to manifest line. Returns nonzero only when the
# driver itself broke mid-package; the caller then writes the fallback line.
process_claim() {
  local worker_id=$1 lane=$2 line_no=$3 line=$4
  local name tarball timeout_sec weight rest
  IFS=$'\t' read -r name tarball timeout_sec weight rest <<< "${line}"
  if [ -z "${name}" ]; then
    log "[queue w${worker_id} ${lane}] line ${line_no} is blank; skipping"
    return 0
  fi
  if ! [[ ${timeout_sec} =~ ^[0-9]+$ ]]; then
    log "[queue w${worker_id} ${lane}] ${name}: timeout '${timeout_sec}' is not seconds; using 1200"
    timeout_sec=1200
  fi

  local pkg_work=${workdir}/${name}
  rm -rf "${pkg_work}"
  mkdir -p "${pkg_work}"

  # The version actually being checked, from the tarball's own name; CRAN can
  # move on between planning and checking.
  local base=${tarball##*/} version=''
  if [[ ${base} == "${name}_"*.tar.gz ]]; then
    version=${base#"${name}_"}
    version=${version%.tar.gz}
  fi

  # The halves, one after the other: this engine's whole point. Timed here,
  # around each call, because the halves are separate processes now and their
  # true per-half seconds are what the manifest and the next plan's cost
  # model get. check-half.sh always exits 0 by contract; a nonzero exit means
  # the harness around the container broke, and compare-one.R reading the
  # half's absent status file turns that into this one package's error line.
  local t_old='' t_new='' started status
  started=${EPOCHSECONDS}
  status=0
  "${CHECK_HALF}" old "${tarball}" "${pkg_work}" "${old_lib}" "${timeout_sec}" 1>&2 ||
    status=$?
  t_old=$((EPOCHSECONDS - started))
  if (( status != 0 )); then
    log "[queue w${worker_id} ${lane}] ${name}: check-half.sh old exited ${status} (its contract says 0); reading what is there"
  fi
  started=${EPOCHSECONDS}
  status=0
  "${CHECK_HALF}" new "${tarball}" "${pkg_work}" "${new_lib}" "${timeout_sec}" 1>&2 ||
    status=$?
  t_new=$((EPOCHSECONDS - started))
  if (( status != 0 )); then
    log "[queue w${worker_id} ${lane}] ${name}: check-half.sh new exited ${status} (its contract says 0); reading what is there"
  fi

  local args=(
    --name "${name}"
    --version "${version}"
    --workdir "${pkg_work}"
    --manifest "${manifest}"
    --pkgs-dir "${pkgs_dir}"
    --baseline-dir "${BASELINE_DIR:-}"
    --plan "${PLAN:-plan.json}"
    --shard "${SHARD:-0}"
    --timeout "${timeout_sec}"
    --t-old "${t_old}"
    --t-new "${t_new}"
    --cran-version "${REVDEPX_OUR_CRAN_VERSION:-}"
    --dev-version "${REVDEPX_OUR_DEV_VERSION:-}"
  )
  local verdict=ok rc=0
  Rscript "${COMPARE_ONE}" "${args[@]}" 1>&2 || rc=$?
  if (( rc != 0 )); then
    # compare-one.R died mid-comparison. Run it again in --error mode, which
    # skips the parsing and comparing and only writes the line; if even that
    # fails, the printf template cannot.
    local msg="driver error: compare-one.R failed (exit ${rc})"
    verdict=error-line
    log "[queue w${worker_id} ${lane}] ${name}: ${msg}; writing an error line"
    local rc2=0
    Rscript "${COMPARE_ONE}" "${args[@]}" --error "${msg}" 1>&2 || rc2=$?
    if (( rc2 != 0 )); then
      verdict=fallback
      log "[queue w${worker_id} ${lane}] ${name}: compare-one.R --error failed too (exit ${rc2}); writing the fallback line"
      write_fallback_line "${name}" "${tarball}" "${weight}" \
        "${t_old}" "${t_new}" "${msg}"
    fi
  fi

  # The running count, load-test.sh style: single-byte appends to an O_APPEND
  # descriptor do not interleave, so the number is exact without a lock. It
  # is a progress indicator, not data.
  printf '.' >> "${done_count}"
  local finished parts total_s
  finished=$(wc -c < "${done_count}")
  total_s=$((t_old + t_new))
  parts="old ${t_old}s + new ${t_new}s"
  printf '[queue w%d %-5s %*d/%d] %s %s in %ds (%s)\n' \
    "${worker_id}" "${lane}" "${width}" "${finished}" "${total}" \
    "${name}" "${verdict}" "${total_s}" "${parts}" >&2
  return 0
}

worker() {
  local worker_id=$1 lane=light claims=0
  if (( worker_id == 1 )); then lane=heavy; fi
  while :; do
    claim "${worker_id}" "${lane}"
    case ${CLAIM_STATUS} in
      empty)
        log "[queue w${worker_id} ${lane}] queue empty after ${claims} claim(s)"
        return 0
        ;;
      defer)
        local dname dweight
        IFS=$'\t' read -r dname _ _ dweight _ <<< "${CLAIM_LINE}"
        log "[queue w${worker_id} ${lane}] stopping: ${dname} (line ${CLAIM_NO}, ~${dweight} min) will not finish before the deadline; leaving it for the deferred tail"
        return 0
        ;;
      claimed)
        claims=$((claims + 1))
        local cname
        IFS=$'\t' read -r cname _ <<< "${CLAIM_LINE}"
        log "[queue w${worker_id} ${lane}] claim ${CLAIM_SEQ}/${total}: ${cname} (line ${CLAIM_NO})"
        # The subshell is this worker's per-package safety net: `set -u`
        # kills a shell outright and a function cannot catch that for its
        # caller, but a process boundary can. Whatever ends the package's
        # flow in there, the worker writes the fallback line and moves on to
        # the next claim rather than dying with work left in the queue.
        local rc=0
        (process_claim "${worker_id}" "${lane}" "${CLAIM_NO}" "${CLAIM_LINE}") ||
          rc=$?
        if (( rc != 0 )); then
          local fname ftarball fweight
          IFS=$'\t' read -r fname ftarball _ fweight _ <<< "${CLAIM_LINE}"
          log "[queue w${worker_id} ${lane}] ${fname}: worker error (exit ${rc}); writing the fallback line"
          write_fallback_line "${fname}" "${ftarball}" "${fweight}" \
            '' '' "driver error: worker failed unexpectedly (exit ${rc})"
          printf '.' >> "${done_count}"
        fi
        ;;
    esac
  done
}

log "[queue] ${total} package(s), ${workers} worker(s) (w1 heavy, $((workers - 1)) light), ${REVDEPX_MEMORY:-no} memory cap per check, deadline in $(((deadline - EPOCHSECONDS) / 60)) min"

pids=()
for ((i = 1; i <= workers; i++)); do
  worker "${i}" &
  pids+=($!)
done

# Wait for every worker by pid: a worker that dies entirely -- OOM-killed, a
# bug -- must be seen, not merely absent.
worker_failures=0
for ((i = 0; i < ${#pids[@]}; i++)); do
  rc=0
  wait "${pids[i]}" || rc=$?
  if (( rc != 0 )); then
    worker_failures=$((worker_failures + 1))
    log "[queue] WORKER $((i + 1)) DIED (exit ${rc}); anything it claimed but did not report gets a fallback line in the sweep"
  fi
done

# The sweep: by now every claim must have a manifest line. A worker killed
# between its claim and its write is the one path the per-package ladders
# above cannot cover, so it is covered here, from the records: claimed.log
# knows what was taken, the manifest knows what was reported. jsonlite and
# the printf template both put "package" first on the line, so the name comes
# out without a JSON parser.
manifest_names=$(sed -n 's/^{"package":"\([^"]*\)".*/\1/p' "${manifest}" | sort -u)
while IFS=$'\t' read -r _ _ _ line_no cname; do
  if [ -z "${cname}" ]; then continue; fi
  if ! grep -qxF -- "${cname}" <<< "${manifest_names}"; then
    cline=${queue_lines[line_no - 1]}
    IFS=$'\t' read -r sname starball _ sweight _ <<< "${cline}"
    log "[queue] ${cname}: claimed (line ${line_no}) but never reported; writing the fallback line"
    write_fallback_line "${sname}" "${starball}" "${sweight}" '' '' \
      'driver error: worker exited before reporting this package'
  fi
done < "${claimed_log}"

claims=$(grep -c . "${claimed_log}" || true)
completed=$(wc -c < "${done_count}")
fallback_lines=$(wc -c < "${fallback_count}")
deferred=$((total - claims))
finished_at=$(date -u '+%Y-%m-%dT%H:%M:%SZ')

# The shard driver's accounting: what was taken, what was finished, what was
# never claimed (those get `deferred` manifest lines from shard.R, not from
# here -- the queue only ever writes lines for packages it claimed).
printf '{"workers":%d,"claims":%d,"completed":%d,"fallback_lines":%d,"deferred_at_exit":%d,"started_at":"%s","finished_at":"%s"}\n' \
  "${workers}" "${claims}" "${completed}" "${fallback_lines}" "${deferred}" \
  "${started_at}" "${finished_at}" > "${workdir}/queue-state.json"

log "[queue] done: ${claims} claimed, ${completed} completed, ${deferred} deferred, ${fallback_lines} fallback line(s), ${worker_failures} worker death(s), $((EPOCHSECONDS - started_epoch))s"

exit 0
