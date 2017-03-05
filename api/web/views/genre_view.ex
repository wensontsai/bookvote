defmodule Bookvote.GenreView do
  use Bookvote.Web, :view

  def render("index.json", %{genres: genres}) do
    %{data: render_many(genres, Bookvote.GenreView, "genre.json")}
  end

  def render("show.json", %{genre: genre}) do
    %{data: render_one(genre, Bookvote.GenreView, "genre.json")}
  end

  def render("genre.json", %{genre: genre}) do
    %{id: genre.id,
      name: genre.name}
  end
end
