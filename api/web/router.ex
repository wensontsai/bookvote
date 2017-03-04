defmodule Bookvote.Router do
  use Bookvote.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", Bookvote do
    pipe_through :api
  end
end
