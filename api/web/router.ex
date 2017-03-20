defmodule Bookvote.Router do
  use Bookvote.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", Bookvote do
    pipe_through :api

    # post "/sessions", SessionController, :create
    # delete "/sessions", SessionController, :delete
    # post "/sessions/refresh", SessionController, :refresh

    # resources "/auth", AuthController
    resources "/users", UserController
    resources "/books", BookController
    resources "/votes", VoteController

    resources "/genres", GenreController
    resources "/topics", TopicController

    get "/genreAll/:name", GenreController, :genreAll
  end
end
