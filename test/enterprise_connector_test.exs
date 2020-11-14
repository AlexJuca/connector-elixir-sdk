defmodule EnterpriseConnectorTest do
  use ExUnit.Case
  doctest EnterpriseConnector

  test "it should send an sms" do
    message = "Hello"
    assert EnterpriseConnector.send_sms(message) == :ok
  end
end
