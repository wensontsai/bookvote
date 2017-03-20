defmodule Bookvote.Genre do
  use Bookvote.Web, :model

  @derive [Poison.Encoder]

  schema "genres" do
    field :name, :string

    has_many :topics, Bookvote.Topic

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name])
    |> validate_required([:name])
    |> Poison.encode!
  end
end
