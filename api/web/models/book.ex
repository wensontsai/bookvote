defmodule Bookvote.Book do
  use Bookvote.Web, :model

  schema "books" do
    field :title, :string
    field :author, :string
    field :isbn, :string
    # field :topic_id, :integer
    field :cover_img, :string

    belongs_to :topic, Bookvote.Topic
    has_many :votes, Bookvote.Vote
    # many_to_many :users, join_through: Bookvote.Vote

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title, :author, :isbn, :topic_id, :cover_img])
    |> validate_required([:title, :author, :isbn, :topic_id, :cover_img])
  end
end
