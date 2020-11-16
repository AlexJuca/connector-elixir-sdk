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

  def send_sms("", "some mobile number", _options = %{:api_key => "invalid-api-key"}),
    do: {:error, :invalid_api_key}

  def send_sms(_message, _mobile, _options), do: :ok

  def get_all_sms(_options = %{:api_key => "invalid-api-key"}), do: {:error, :invalid_api_key}

  def get_all_sms(options) do
    {:ok,
     {:ok,
      %{
        "data" => [
          %{
            "content" => "Hello, Eliane",
            "created_at" => "2020-06-07T02:35:29.316",
            "id" => "15095c51-eded-4dea-a471-fce6b7624375",
            "number_of_messages" => 3,
            "phone_number" => "+244991739406",
            "status" => "PROCESSING"
          }
        ]
      }}}
  end
end
