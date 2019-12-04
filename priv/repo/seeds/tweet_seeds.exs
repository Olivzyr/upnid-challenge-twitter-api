alias Twitter.Repo
alias Twitter.Management.Tweet

Repo.insert! %Tweet{
  user_id: 1,
  description: "Alguém poderia me ensinar elixir?",
  view_count: 20,
  published: true,
  like: 1
}

Repo.insert! %Tweet{
  user_id: 2,
  description: "Gostaria de uma xicara de café?",
  view_count: 5,
  published: true,
  like: 1
}

Repo.insert! %Tweet{
  user_id: 3,
  description: "Alguem me ensina java!!!",
  view_count: 15,
  published: true,
  like: 1
}

Repo.insert! %Tweet{
  user_id: 1,
  description: "Eu finalmente estou programando em elixir!!!",
  view_count: 1,
  published: true,
  like: 1
}
