type user = {id : int; name : string option}

let static_users = [
  {id = 1; name = Some "Alice"};
  {id = 2; name = Some "Bob"};
  {id = 3; name = Some "Charlie"};
  {id = 4; name = Some "David"};
  {id = 5; name = None};
  {id = 6; name = Some "Frank"};
  {id = 7; name = Some "Grace"};
  {id = 8; name = Some "Hannah"};
  {id = 9; name = Some "Ivy"};
  {id = 10; name = None};
  {id = 11; name = Some "Karen"};
  {id = 12; name = Some "Leo"};
  {id = 13; name = Some "Mona"};
  {id = 14; name = Some "Nina"};
  {id = 15; name = Some "Oscar"};
  {id = 16; name = None};
  {id = 17; name = Some "Quinn"};
  {id = 18; name = Some "Rachel"};
  {id = 19; name = Some "Steve"};
  {id = 20; name = Some "Tina"}
]

let user: (Dream.request, user option) Graphql_lwt.Schema.typ =
  Graphql_lwt.Schema.(obj "user"
    ~fields:[
      field "id"
        ~typ:(non_null int)
        ~args:Arg.[]
        ~resolve:(fun _info user -> user.id);
      field "name"
        ~typ:(string)
        ~args:Arg.[]
        ~resolve:(fun _info user -> user.name);
    ]
  )

let users_query =
  Graphql_lwt.Schema.(
    field "users"
    ~typ: (non_null (list (non_null user)))
    ~args: Arg.[
      arg "id" ~typ:int;
      arg "name" ~typ:string
    ]
    ~resolve: (fun _info () id name ->
      match id, name with
      | None, None -> static_users
      | Some id', None ->
        (match List.find_opt (fun {id; _} -> id = id') static_users with
        | None -> []
        | Some user -> [user])
      | None, Some name' ->
        List.filter (fun {name; _} -> 
          match name with
            | Some n -> String.equal n name'
            | None -> false) static_users
      | Some id', Some name' ->
        List.filter (fun {id; name} -> 
          id = id' && match name with
            | Some n -> String.equal n name'
            | None -> false) static_users);
  ) 
