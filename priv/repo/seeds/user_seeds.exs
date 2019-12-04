alias Twitter.Repo
alias Twitter.Management.User

Repo.insert! %User{
  name: "Yan Brito Oliveira",
  email: "yan@hotmail.com",
  password: "123456789",
  password_confirmation: "123456789",
  follow: true
}

Repo.insert! %User{
  name: "Claudia Nazarena",
  email: "claudia@hotmail.com",
  password: "123456789",
  password_confirmation: "123456789",
  follow: false
}

Repo.insert! %User{
  name: "Roberto Oliveira",
  email: "roberto@hotmail.com",
  password: "123456789",
  password_confirmation: "123456789",
  follow: false
}
