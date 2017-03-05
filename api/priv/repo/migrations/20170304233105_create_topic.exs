defmodule Bookvote.Repo.Migrations.CreateTopic do
  use Ecto.Migration

  def change do
    create table(:topics) do
      add :name, :string, null: false
      add :genre_id, references(:genres, on_delete: :nothing), null: false

      timestamps()
    end

  end
end
