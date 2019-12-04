alias Twitter.Repo
alias Twitter.Management.User

Repo.insert! %User{
  name: "Yan Brito Oliveira",
  email: "yan@hotmail.com",
  password_hash: Argon2.hash_pwd_salt("123456789"),
  follow: false
}

Repo.insert! %User{
  name: "Claudia Nazarena",
  email: "claudia@hotmail.com",
  password_hash: Argon2.hash_pwd_salt("123456789"),
  follow: false
}

Repo.insert! %User{
  name: "Roberto Oliveira",
  email: "roberto@hotmail.com",
  password_hash: Argon2.hash_pwd_salt("123456789"),
  follow: false
}
