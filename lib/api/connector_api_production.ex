defmodule Connector.API.Production do
  @base_uri "https://ec.nextbss.co.ao/api/v1/messages"

  def send_sms(message, mobile, options) do
    content = %{"phone_number" => mobile, "content" => message}

    body = Poison.encode!(content)

    headers = ["Content-Type": "application/json", "X-API-Key": Map.get(options, :api_key)]

    send_sms(body, headers)
  end

  defp send_sms(body, headers) do
    {:ok, pid} =
      Task.Supervisor.start_child(
        Connector.TaskSupervisor,
        fn ->
          case HTTPoison.post(@base_uri, body, headers) do
            {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
              {:ok, body}

            {:ok, %HTTPoison.Response{status_code: 400, body: body}} ->
              {:error, Poison.decode(body)}

            {:ok, %HTTPoison.Response{status_code: 401}} ->
              {:error, :invalid_api_key}

            {:ok, %HTTPoison.Response{status_code: 500}} ->
              {:error, :internal_server_error}
          end
        end
      )
  end

  def get_all_sms(options) do
    headers = ["Content-Type": "application/json", "X-API-Key": Map.get(options, :api_key)]
    case HTTPoison.get(@base_uri, headers, []) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} -> {:ok, Poison.decode(body)}
      {:ok, %HTTPoison.Response{status_code: 401}} -> {:error, :invalid_api_key}
    end
  end

  defp get_all_sms(headers, opts) do
    {:ok, pid} =
      Task.Supervisor.start_child(
        Connector.TaskSupervisor,
        fn ->
          case HTTPoison.get(@base_uri, headers, opts) do
            {:ok, %HTTPoison.Response{status_code: 200, body: body}} -> {:ok, Poison.decode(body)}
            {:ok, %HTTPoison.Response{status_code: 401}} -> {:error, :invalid_api_key}
          end
        end
      )
  end
end
