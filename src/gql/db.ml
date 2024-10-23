let dbh : unit PGOCaml.t =
  PGOCaml.connect ~host:"localhost" ~user:"postgres" ~password:"postgres" ~database:"web_ocaml" ()
