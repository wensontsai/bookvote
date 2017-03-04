# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :bookvote,
  ecto_repos: [Bookvote.Repo]

# Configures the endpoint
config :bookvote, Bookvote.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "hg2/mrZ3q8UjgL+WTIS4Kwds9IGoWJaxLUtQgAdi8jvsWYeLHNgC516Cg13P0fcx",
  render_errors: [view: Bookvote.ErrorView, accepts: ~w(json)],
  pubsub: [name: Bookvote.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
