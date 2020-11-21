use Mix.Config

config :connector, Connector.API, api: Connector.API.Mock

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
