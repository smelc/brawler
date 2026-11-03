#!/usr/bin/env bash
#
# Creates the directory-scoped opam switch (_opam/) and installs dependencies.

set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

if [[ ! -d _opam ]]; then
  opam switch create . --no-install --packages=ocaml-base-compiler.5.5.1 -y
fi

opam install . --deps-only --with-test --with-dev-setup -y
