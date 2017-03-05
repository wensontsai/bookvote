defmodule Bookvote.VoteTest do
  use Bookvote.ModelCase

  alias Bookvote.Vote

  @valid_attrs %{book_id: 42, up_voted: true, user_id: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Vote.changeset(%Vote{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Vote.changeset(%Vote{}, @invalid_attrs)
    refute changeset.valid?
  end
end
