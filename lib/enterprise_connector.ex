defmodule EnterpriseConnector do
  @moduledoc """
  Documentation for `EnterpriseConnector`.
  """

  @doc """
  send_sms.

  ## Examples

      iex> EnterpriseConnector.send_sms("hey")
      :ok

  """
  @spec send_sms(string) :: :ok | {:error, string}
  def send_sms(message) do
    :ok
  end
end
