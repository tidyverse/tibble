#!/bin/sh
# Fetch the results of a revdepx run into revdep/ and show the summary.
#
# Usage:
#   .github/workflows/revdepx/fetch.sh [<run-id>] [<dir>]
#
# Without a run id, the newest completed revdep4.yaml run is used. Needs the `gh` CLI, authenticated for the repository.

set -eu

run="${1:-}"
dir="${2:-revdep}"

if [ -z "${run}" ]; then
  # Both engines' runs, newest first; a repository that only has one of the
  # two workflows is the normal case while the other PR is unmerged, so a
  # workflow that gh cannot list is skipped, not fatal.
  run="$(
    for wf in revdep4.yaml; do
      gh run list --workflow "${wf}" --limit 20 \
        --json databaseId,status,createdAt --jq \
        '.[] | select(.status == "completed") | [.createdAt, .databaseId] | @tsv' \
        2> /dev/null || true
    done | sort -r | head -n 1 | cut -f 2
  )"
  if [ -z "${run}" ] || [ "${run}" = "null" ]; then
    echo "No completed revdep4 run found; pass a run id." >&2
    exit 1
  fi
  echo "Using newest completed run: ${run}"
fi

mkdir -p "${dir}"
gh run download "${run}" --name revdepx-report --dir "${dir}"

# What the run cost, next to what it found: this is the file the next plan
# calibrates on, and having it locally makes a dry run reproducible with
# REVDEPX_MEASURED_DIR="${dir}".
gh run download "${run}" --name revdepx-timings --dir "${dir}" ||
  echo "Run ${run} published no timings artifact." >&2

echo
echo "Results of run ${run} are in ${dir}/:"
ls "${dir}"
echo
if [ -f "${dir}/README.md" ]; then
  cat "${dir}/README.md"
fi
echo
echo "To re-check everything that is not ok:"

echo "  gh workflow run revdep4.yaml -f retry-run=${run}"
