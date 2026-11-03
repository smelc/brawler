[![shellcheck](https://github.com/smelc/template/actions/workflows/shellcheck.yml/badge.svg)](https://github.com/smelc/template/actions/workflows/shellcheck.yml) 
[![actionlint](https://github.com/smelc/template/actions/workflows/actionlint.yml/badge.svg)](https://github.com/smelc/template/actions/workflows/actionlint.yml)
[![actionlint](https://github.com/smelc/template/actions/workflows/python.yml/badge.svg)](https://github.com/smelc/template/actions/workflows/python.yml)

## OCaml

The OCaml environment uses a directory-scoped opam switch (`_opam/`).

```shell
./scripts/setup-opam.sh        # create _opam/ and install dependencies
./scripts/fetch-stategraph.sh  # clone stategraph into vendor/stategraph
dune build @fmt                # check formatting (use --auto-promote to fix)
dune build
dune runtest
dune exec brawler-kernel
```

# Template

Install the Python environment as follows:

```shell
python3 -m venv .venv
pip install -r dev-requirements
```

The [.envrc](./.envrc) file will take care of loading it automatically afterwards.
