defmodule Twitter.Management.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :name, :string
    field :email, :string
    field :password_hash, :string
    field :follow, :boolean


    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :email, :password, :follow])
    |> validate_required([:name, :email, :password_hash])
    |> unique_constraint(:email)
  end
end
