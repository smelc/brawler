(** What a kind must provide: equality, ordering and printing, as derived by ppx_deriving. *)
module type KIND = sig
  type t [@@deriving eq, ord, show]
end

type expr =
  | String of string
  | Int of int
  | Bool of bool
  | Interpolation of string
  | Sequence of expr list
[@@deriving eq, ord, show]

module Expr_map = CCMap.Make (struct
  type t = expr

  let compare = compare_expr
end)

module Make (Kind : KIND) = struct
  type block = {
    kind : Kind.t;
    name : string;
    map : map;
  }

  and value =
    | Value_Expr of expr
    | Value_block of block

  and map = value Expr_map.t

  type module_ = { blocks : block list }
end

let foo = ()
