# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :ukulesa,
  ecto_repos: [Ukulesa.Repo]

# Configures the endpoint
config :ukulesa, Ukulesa.Web.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "NqYxHYN7d8TMcFp5fgNa5se3GD9ewXs4i3KiU+lIqbyNfkjrn6IELB1V3ylWucg9",
  render_errors: [view: Ukulesa.Web.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Ukulesa.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
