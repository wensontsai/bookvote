defmodule Bookvote.Vote do
  use Bookvote.Web, :model

  schema "votes" do
    # field :book_id, :integer
    # field :user_id, :integer
    field :up_voted, :boolean, default: false

    belongs_to :user, Bookvote.User
    belongs_to :book, Bookvote.Book

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:book_id, :user_id, :up_voted])
    |> validate_required([:book_id, :user_id, :up_voted])
  end
end
