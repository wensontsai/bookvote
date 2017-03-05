defmodule Bookvote.BookTest do
  use Bookvote.ModelCase

  alias Bookvote.Book

  @valid_attrs %{author: "some content", cover_img: "some content", isbn: "some content", title: "some content", topic_id: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Book.changeset(%Book{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Book.changeset(%Book{}, @invalid_attrs)
    refute changeset.valid?
  end
end
