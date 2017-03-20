defmodule Bookvote.Topic do
  use Bookvote.Web, :model

  @derive [Poison.Encoder]

  schema "topics" do
    field :name, :string
    # field :genre_id, :integer

    belongs_to :genre, Bookvote.Genre
    has_many :books, Bookvote.Book
    
    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :genre_id])
    |> validate_required([:name, :genre_id])
    |> Poison.encode!
  end
end
