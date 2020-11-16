defmodule ConnectorTest do
  use ExUnit.Case

  test "it should send an sms" do
    message = "Hello, Eliane"
    mobile = "+244945955268"
    options = %{:api_key => System.get_env("EC_API_KEY")}
    assert Connector.send_sms(message, mobile, options) == :ok
  end

  test "it should not send an sms if mobile is empty" do
    message = ""
    mobile = ""
    options = %{:api_key => System.get_env("EC_API_KEY")}

    assert Connector.send_sms(message, mobile, options) ==
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
  end

  test "it should not send an sms if api_key is invalid" do
    message = ""
    mobile = "some mobile number"
    options = %{:api_key => "invalid-api-key"}
    assert Connector.send_sms(message, mobile, options) == {:error, :invalid_api_key}
  end

  test "it should not get all sms if api_key is invalid" do
    options = %{:api_key => "invalid-api-key"}
    assert Connector.get_all_sms(options) == {:error, :invalid_api_key}
  end

  test "it get all sms if api_key is valid" do
    options = %{:api_key => System.get_env("EC_API_KEY")}

    assert Connector.get_all_sms(options) ==
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
