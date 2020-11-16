defmodule Connector.API.Mock do
  def send_sms(_message, "", _options),
    do:
      {:error,
       {:ok,
        %{
          "errors" => [
            %{
              "code" => "103",
              "source" => %{"pointer" => "phone_number"},
              "status" => "400",
              "title" => "number can't be empty"
            }
          ]
        }}}

  def send_sms("", "some mobile number", _options = %{:api_key => "invalid-api-key"}), do: {:error, :invalid_api_key}

  def send_sms(_message, _mobile, _options), do: :ok
end
