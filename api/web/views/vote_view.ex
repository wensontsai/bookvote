defmodule Bookvote.VoteView do
  use Bookvote.Web, :view

  def render("index.json", %{votes: votes}) do
    %{data: render_many(votes, Bookvote.VoteView, "vote.json")}
  end

  def render("show.json", %{vote: vote}) do
    %{data: render_one(vote, Bookvote.VoteView, "vote.json")}
  end

  def render("vote.json", %{vote: vote}) do
    %{id: vote.id,
      book_id: vote.book_id,
      user_id: vote.user_id,
      up_voted: vote.up_voted}
  end
end
