ExUnit.start()

Application.put_env(:connector, Connector.API, api: Connector.API.Mock)
{:ok, _} = Application.ensure_all_started(:connector)
