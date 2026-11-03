(* Dummy entry point: parses a tiny HCL snippet with stategraph's [hcl_parser], to check that the
   build is wired up correctly. *)

let parse_hcl s =
  let lexbuf = Sedlexing.Utf8.from_string s in
  let lexer = Sedlexing.with_tokenizer Hcl_lexer.token lexbuf in
  MenhirLib.Convert.Simplified.traditional2revised Hcl_parser.main lexer

let () =
  let items = parse_hcl "answer = 42\n" in
  Printf.printf "Parsed %d top-level HCL item(s)\n" (List.length items)
