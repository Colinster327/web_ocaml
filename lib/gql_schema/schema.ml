let schema =
  Graphql_lwt.Schema.schema [
    Users.users_query
  ]