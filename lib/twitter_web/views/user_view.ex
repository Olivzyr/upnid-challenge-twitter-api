defmodule TwitterWeb.UserView do
  use TwitterWeb, :view
  use JaSerializer.PhoenixView

  #alias TwitterWeb.UserView

  attributes [:name, :email, :password_hash, :follow]

end
