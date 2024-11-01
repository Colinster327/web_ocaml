let schema = 
  Graphql_lwt.Schema.schema ~mutations:[
    Types.Users.create_user;
  ] [
    Types.Users.query_user;
    Types.Users.query_users;
  ]
