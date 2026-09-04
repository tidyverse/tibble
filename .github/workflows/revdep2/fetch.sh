#!/bin/sh
# Fetch the results of a revdep2 run into revdep/ and show the summary.
#
# Usage:
#   .github/workflows/revdep2/fetch.sh [<run-id>] [<dir>]
#
# Without a run id, the newest completed revdep2 run of the current repository
# is used. Needs the `gh` CLI, authenticated for the repository.

set -eu

run="${1:-}"
dir="${2:-revdep}"

if [ -z "${run}" ]; then
  run="$(gh run list --workflow revdep2.yaml --limit 20 \
    --json databaseId,status --jq \
    '[.[] | select(.status == "completed")][0].databaseId')"
  if [ -z "${run}" ] || [ "${run}" = "null" ]; then
    echo "No completed revdep2 run found; pass a run id." >&2
    exit 1
  fi
  echo "Using newest completed revdep2 run: ${run}"
fi

mkdir -p "${dir}"
gh run download "${run}" --name revdep2-report --dir "${dir}"

# What the run cost, next to what it found: this is the file the next plan
# calibrates on, and having it locally makes a dry run reproducible with
# REVDEP2_MEASURED_DIR="${dir}".
gh run download "${run}" --name revdep2-timings --dir "${dir}" ||
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
echo "  gh workflow run revdep2.yaml -f retry-run=${run}"
