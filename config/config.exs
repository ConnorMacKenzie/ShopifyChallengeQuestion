# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :products_api,
  ecto_repos: [ProductsApi.Repo]

# Configures the endpoint
config :products_api, ProductsApiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "0XtLit2W+eyyOoIFdk0nEqr+letJSgqF950iwVbYcg5tuwbJav25yr2D9WMqnrCC",
  render_errors: [view: ProductsApiWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: ProductsApi.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
