defmodule Bookvote.Repo.Migrations.CreateBook do
  use Ecto.Migration

  def change do
    create table(:books) do
      add :title, :string, null: false
      add :author, :string, null: false
      add :isbn, :string
      add :topic_id, references(:topics, on_delete: :nothing), null: false
      add :cover_img, :string

      timestamps()
    end

  end
end
