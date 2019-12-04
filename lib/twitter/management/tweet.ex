defmodule Twitter.Management.Tweet do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tweets" do
    field :description, :string
    field :view_count, :integer
    field :published, :boolean
    field :like, :integer

    # Create foreingKey tweet table to user table
    belongs_to :user, Twitter.Management.User

    timestamps()
  end

  @doc false
  def changeset(tweet, attrs) do
    tweet
    |> cast(attrs, [:user_id, :description, :view_count, :published, :like ])
    |> validate_required([:user_id, :description])
  end
end
