defmodule Bookvote.Repo.Migrations.CreateVote do
  use Ecto.Migration

  def change do
    create table(:votes) do
      add :book_id, references(:books, on_delete: :nothing), null: false
      add :user_id, references(:users, on_delete: :nothing), null: false
      add :up_voted, :boolean, default: false, null: false

      timestamps()
    end

  end
end
