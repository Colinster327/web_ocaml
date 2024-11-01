let () =
  (* Run the graphql editor *)
  Dream.run
  @@ Dream.logger
  @@ Dream.origin_referrer_check
  @@ Dream.router [
    Dream.any "/graphql" (Dream.graphql Lwt.return Lib.schema);
    Dream.get "/" (Dream.graphiql "/graphql");
  ]
