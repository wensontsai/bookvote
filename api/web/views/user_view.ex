defmodule Bookvote.UserView do
  use Bookvote.Web, :view

  def render("index.json", %{users: users}) do
    %{data: render_many(users, Bookvote.UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, Bookvote.UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{id: user.id,
      username: user.username,
      email: user.email,
      token: user.token}
  end
end
