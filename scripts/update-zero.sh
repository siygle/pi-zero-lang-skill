#!/usr/bin/env bash
set -euo pipefail

repo="${ZERO_REPO:-/tmp/zero-repo}"
out="${ZERO_BIN:-/tmp/zero-test/bin/zero}"

if [[ ! -d "$repo/.git" ]]; then
  echo "Zero repo not found: $repo" >&2
  exit 1
fi

cd "$repo"
git pull --ff-only
make -C native/zero-c
mkdir -p "$(dirname "$out")"
cp "$repo/.zero/bin/zero" "$out"
"$out" version
