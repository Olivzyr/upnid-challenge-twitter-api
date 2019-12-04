defmodule Twitter.Management.Auth do
  alias Twitter.Management.{Encryption, User}

  def login(params, repo) do
    user = repo.get_by(User, email: String.downcase(params["email"]))
      case authenticate(user, params["password"]) do
      true -> {:ok, user}
      _    -> :error
    end
  end

  defp authenticate(user, password) do
    case user do
    nil -> false
    _   -> Encryption.validate_password(password, user.password_hash)
    end
  end

end
