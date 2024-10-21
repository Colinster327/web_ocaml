let load_key key =
  match Sys.getenv_opt key with
  | Some x -> x
  | None -> failwith @@ key ^ " is not in environment"

let dbh : unit PGOCaml.t =
 PGOCaml.connect ~host:"localhost" ~user:"postgres" ~password:"postgres" ~database:"web_ocaml" ()

let schema =
  Graphql_lwt.Schema.schema ~mutations: [
    Users.create_user;
  ] [
    Users.query_user;
    Users.query_users;
  ]