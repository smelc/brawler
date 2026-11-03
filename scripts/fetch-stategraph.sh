#!/usr/bin/env bash
# Sparse-clones https://github.com/stategraph/stategraph into vendor/stategraph,
# at a pinned commit. Only the paths listed in STATEGRAPH_PATHS are checked
# out, so that dune only sees (and only needs the dependencies of) what we use.
#
# The checkout is non-cone on purpose: stategraph's root dune-project must not be
# checked out, because private libraries (such as hcl_parser) are only visible
# from within their own dune project. Without it, the checked-out libraries
# belong to our project.
#
# To bump stategraph, change STATEGRAPH_REV and rerun this script.

set -euo pipefail

STATEGRAPH_URL="https://github.com/stategraph/stategraph.git"
STATEGRAPH_REV="1926150861abc4f48e7b12b857bbe9e4e88d250c"
STATEGRAPH_PATHS=(
  /LICENSE
  /code/src/hcl_lexer/
  /code/src/hcl_parser/
  /code/src/hcl_parser_value/
)

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
DEST="$ROOT/vendor/stategraph"

if [[ ! -d "$DEST/.git" ]]; then
  mkdir -p "$DEST"
  git -C "$DEST" init -q
  git -C "$DEST" remote add origin "$STATEGRAPH_URL"
fi

git -C "$DEST" sparse-checkout set --no-cone "${STATEGRAPH_PATHS[@]}"

if [[ "$(git -C "$DEST" rev-parse -q --verify HEAD || true)" != "$STATEGRAPH_REV" ]]; then
  git -C "$DEST" fetch -q --depth 1 origin "$STATEGRAPH_REV"
  git -C "$DEST" -c advice.detachedHead=false checkout -q "$STATEGRAPH_REV"
fi

echo "vendor/stategraph is at $STATEGRAPH_REV"
