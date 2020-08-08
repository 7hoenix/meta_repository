#!/usr/bin/env bash

set -e

function _archive {
  if [[ $# -ge 2 -a $# -le 3 ]]; then
    echo "Must include sort topic and repo url."
    echo "May also include a repo_name"
    return 1
  fi
  local topic="$1"
  local repo_url="$2"
  if [[ -z "$3" ]]; then
    local repo_name="$3"
  else
    local repo_name="$(basename "${repo_url%.git}")"
  fi
  git subtree add --prefix "$topic/$repo_name" "$repo" main
}

_archive "$@"
