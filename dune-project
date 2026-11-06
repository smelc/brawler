(lang dune 3.16)

(using menhir 2.1)

(generate_opam_files true)

(package
 (name brawler-kernel)
 (synopsis "Brawler kernel")
 (depends
  (ocaml-base-compiler
   (= 5.5.1))
  (dune
   (= 3.24.2))
  ; Dependencies of the stategraph libraries we build from vendor/stategraph.
  ; Versions follow stategraph's code/opam.pins.
  (containers
   (= 3.18))
  (menhir
   (= 20240715))
  (menhirLib
   (= 20240715))
  (ppx_deriving
   (= 6.1.1))
  (ppx_deriving_yojson
   (= 3.10.0))
  (sedlex
   (= 3.4))
  (yojson
   (= 2.2.2))
  (qcheck
   (and
    :with-test
    (= 0.91)))
  ; Dev tools, following stategraph's devcontainer (docker/stategraph/Dockerfile).
  ; ocamlformat ships the RPC mode used by ocaml-lsp-server, so no ocamlformat-rpc.
  (ocamlformat
   (and
    :with-dev-setup
    (= 0.29.0)))
  (ocaml-lsp-server
   (and
    :with-dev-setup
    (= 1.27.0)))))
