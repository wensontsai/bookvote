defmodule Bookvote.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :username, :string, null: false
      add :email, :string, null: false
      add :token, :string, null: false

      timestamps()
    end

  end
end
