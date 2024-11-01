open Printf

let dbh : unit PGOCaml.t =
  PGOCaml.connect ()
    ~host:"localhost" 
    ~user:"postgres" 
    ~password:"postgres"
    ~database:"web_ocaml"

let print_row i row =
  printf "row %d: [%s]\n" i
    (String.concat "; "
      (List.map (function
    | None -> "NULL"
    | Some str -> sprintf "%S" str) row))

let print_query =
  let query = "select * from users" in
  let name = "users_query" in
  PGOCaml.prepare dbh ~name ~query () |> ignore;
  let rows = PGOCaml.execute dbh ~name ~params:[] () in
  let i = ref 0 in
  List.fold_left (fun _ x -> i := !i + 1; print_row !i x) () rows