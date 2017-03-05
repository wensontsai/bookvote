defmodule Bookvote.BookView do
  use Bookvote.Web, :view

  def render("index.json", %{books: books}) do
    %{data: render_many(books, Bookvote.BookView, "book.json")}
  end

  def render("show.json", %{book: book}) do
    %{data: render_one(book, Bookvote.BookView, "book.json")}
  end

  def render("book.json", %{book: book}) do
    %{id: book.id,
      title: book.title,
      author: book.author,
      isbn: book.isbn,
      topic_id: book.topic_id,
      cover_img: book.cover_img}
  end
end
