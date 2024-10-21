let () =
  (* Load environment variables *)
  Dotenv.parse () |> ignore;
  Unix.environment ()
  |> Array.iter (Printf.printf "%s\n"); 

  (* Run the graphql editor *)
  Dream.run
  @@ Dream.logger
  @@ Dream.origin_referrer_check
  @@ Dream.router [
    Dream.any "/graphql" (Dream.graphql Lwt.return Gql.Schema.schema);
    Dream.get "/" (Dream.graphiql "/graphql");
  ]