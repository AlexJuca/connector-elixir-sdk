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
end
