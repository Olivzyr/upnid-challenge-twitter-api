defmodule Twitter.Management.Tweet do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tweets" do
    field :description, :string
    field :view_count, :integer
    field :published, :boolean

    # Create foreingKey tweet table to user table
    belongs_to :user, Twitter.Management.User

    timestamps()
  end

  @doc false
  def changeset(tweet, attrs) do
    tweet
    |> cast(attrs, [:description, :view_count, :published, :user_id])
    |> validate_required([:user_id, :description])
  end
end
