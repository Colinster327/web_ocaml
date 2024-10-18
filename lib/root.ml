let root = 
  Dream.run
  @@ Dream.logger
  @@ Dream.origin_referrer_check
  @@ Dream.router [
    Dream.any "/graphql" (Dream.graphql Lwt.return Gql_schema.Schema.schema);
    Dream.get "/" (Dream.graphiql "/graphql");
  ]