(lang dune 3.16)

(name web_ocaml)

(generate_opam_files true)

(source
 (github Colinster327/web_ocaml))

(authors "Colinster327")

(maintainers "Colinster327")

(license MIT)

(documentation https://github.com/Colinster327/web_ocaml/blob/main/README.md)

(package
 (name web_ocaml)
 (synopsis "A test web ocaml app")
 (description
  "This project serves to practice using ocaml in a web-framework called dream")
 (depends ocaml dream dune dotenv pgocaml pgocaml_ppx)
 (tags
  (web ocaml practice)))

; See the complete stanza docs at https://dune.readthedocs.io/en/stable/reference/dune-project/index.html
