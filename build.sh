#!/usr/bin/env bash
# Compiles both résumé variants to PDF using tectonic.
#
# Install tectonic once with: brew install tectonic
#
# Usage:
#   ./build.sh

set -euo pipefail
cd "$(dirname "$0")"

if ! command -v tectonic >/dev/null 2>&1; then
  echo "error: tectonic not found. Install it with: brew install tectonic" >&2
  exit 1
fi

for tex in CodyARay-Resume.tex CodyARay-Resume-Advisor.tex; do
  echo "==> Compiling $tex"
  tectonic "$tex"
done

echo "==> Done. Output:"
ls -la CodyARay-Resume.pdf CodyARay-Resume-Advisor.pdf
