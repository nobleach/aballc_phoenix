# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :aballc_phoenix,
  ecto_repos: [AballcPhoenix.Repo]

# Configures the endpoint
config :aballc_phoenix, AballcPhoenix.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "YstaGz+cs5SbAsVY6S7ngdWFZvqlN9wKZ+xGYzEoWZBwS9V0JlVmZNSzYBXcUabu",
  render_errors: [view: AballcPhoenix.ErrorView, accepts: ~w(html json)],
  pubsub: [name: AballcPhoenix.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
