defmodule Connector.API.Production do
  @base_uri "https://ec.nextbss.co.ao/api/v1/messages"

  def send_sms(message, mobile, options) do
    content = %{"phone_number" => mobile, "content" => message}

    body = Poison.encode!(content)
    IO.puts(body)

    headers = ["Content-Type": "application/json", "X-API-Key": Map.get(options, :api_key)]

    case HTTPoison.post(@base_uri, body, headers) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} -> :ok
      {:ok, %HTTPoison.Response{status_code: 400, body: body}} -> {:error, Poison.decode(body)}
      {:ok, %HTTPoison.Response{status_code: 401}} -> {:error, :invalid_api_key}
      {:ok, %HTTPoison.Response{status_code: 500}} -> {:error, :internal_server_error}
    end
  end
end
