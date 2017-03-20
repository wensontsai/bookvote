defmodule Bookvote.User do
  use Bookvote.Web, :model

  @derive [Poison.Encoder]

  schema "users" do
    field :username, :string
    field :email, :string
    field :token, :string

    has_many :votes, Bookvote.Vote
    # many_to_many :books, join_through: Bookvote.Vote

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:username, :email, :token])
    |> validate_required([:username, :email, :token])
    |> unique_constraint(:username)
    |> unique_constraint(:email)
    |> Poison.encode!
  end
end
