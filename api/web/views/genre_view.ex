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

  def render("genreAll.json", %{genre: genre}) do
    %{data: render_one(genre, Bookvote.GenreView, "data.json")}
  end

  def render("topic.json", %{topic: topic}) do
    %{name: topic.name}
  end

  def render("data.json", %{genre: genre}) do
    IO.inspect(genre.topics)

    # %{genre: genre.id,
    #   topics: render_many(%{topics: genre.topics}, Bookvote.GenreView, "topic.json")}
    %{genre: genre.id,
      topics: render_many(genre.topics, Bookvote.GenreView, "topic.json")}
  end

  
  # def render("book.json", %{book: book}) do
  #   %{title: book.title}
  # end

end
