defmodule Bookvote.Repo.Migrations.CreateGenre do
  use Ecto.Migration

  def change do
    create table(:genres) do
      add :name, :string, null: false

      timestamps()
    end

  end
end
