defmodule Bookvote.GenreControllerTest do
  use Bookvote.ConnCase

  alias Bookvote.Genre
  @valid_attrs %{name: "some content"}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, genre_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    genre = Repo.insert! %Genre{}
    conn = get conn, genre_path(conn, :show, genre)
    assert json_response(conn, 200)["data"] == %{"id" => genre.id,
      "name" => genre.name}
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, genre_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, genre_path(conn, :create), genre: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Genre, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, genre_path(conn, :create), genre: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    genre = Repo.insert! %Genre{}
    conn = put conn, genre_path(conn, :update, genre), genre: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Genre, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    genre = Repo.insert! %Genre{}
    conn = put conn, genre_path(conn, :update, genre), genre: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    genre = Repo.insert! %Genre{}
    conn = delete conn, genre_path(conn, :delete, genre)
    assert response(conn, 204)
    refute Repo.get(Genre, genre.id)
  end
end
