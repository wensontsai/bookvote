defmodule Bookvote.TopicView do
  use Bookvote.Web, :view

  def render("index.json", %{topics: topics}) do
    %{data: render_many(topics, Bookvote.TopicView, "topic.json")}
  end

  def render("show.json", %{topic: topic}) do
    %{data: render_one(topic, Bookvote.TopicView, "topic.json")}
  end

  def render("topic.json", %{topic: topic}) do
    %{id: topic.id,
      name: topic.name,
      genre_id: topic.genre_id}
  end
end
