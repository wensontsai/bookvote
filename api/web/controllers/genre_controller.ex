defmodule Bookvote.GenreController do
  use Bookvote.Web, :controller

  alias Bookvote.Genre

  def index(conn, _params) do
    genres = Repo.all(Genre)
    render(conn, "index.json", genres: genres)
  end

  def create(conn, %{"genre" => genre_params}) do
    changeset = Genre.changeset(%Genre{}, genre_params)

    case Repo.insert(changeset) do
      {:ok, genre} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", genre_path(conn, :show, genre))
        |> render("show.json", genre: genre)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Bookvote.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    genre = Repo.get!(Genre, id)
    render(conn, "show.json", genre: genre)
  end

  def update(conn, %{"id" => id, "genre" => genre_params}) do
    genre = Repo.get!(Genre, id)
    changeset = Genre.changeset(genre, genre_params)

    case Repo.update(changeset) do
      {:ok, genre} ->
        render(conn, "show.json", genre: genre)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Bookvote.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    genre = Repo.get!(Genre, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(genre)

    send_resp(conn, :no_content, "")
  end
end
