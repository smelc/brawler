(** Kernel types instantiated for HCL. *)

module Kind = struct
  type t =
    | Providers
    | Local
    | Resource
  [@@deriving eq, ord, show]
end

include Types.Make (Kind)
