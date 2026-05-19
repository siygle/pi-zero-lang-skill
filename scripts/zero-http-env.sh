#!/usr/bin/env bash
set -euo pipefail

if command -v brew >/dev/null 2>&1 && brew --prefix curl >/dev/null 2>&1; then
  curl_prefix="$(brew --prefix curl)"
  export CPATH="$curl_prefix/include:${CPATH:-}"
  export LIBRARY_PATH="$curl_prefix/lib:${LIBRARY_PATH:-}"
  export LD_LIBRARY_PATH="$curl_prefix/lib:${LD_LIBRARY_PATH:-}"
fi

exec "${ZERO_BIN:-/tmp/zero-test/bin/zero}" "$@"
