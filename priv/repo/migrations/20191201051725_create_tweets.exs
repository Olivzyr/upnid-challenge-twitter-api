defmodule Twitter.Repo.Migrations.CreateTweets do
  use Ecto.Migration

  def change do
    create table(:tweets) do
      add :user_id, references(:users)
      add :description, :text
      add :view_count, :integer
      add :published, :boolean, default: false

      timestamps()
    end

  end
end
