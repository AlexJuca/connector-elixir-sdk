defmodule Connector do
  @moduledoc """
  Documentation for `Connector`.
  """

  @doc """
  send_sms.

  ## Examples

      iex> Connector.send_sms("hey", "+244944568978", %{:api_key => "your-api-key"})
      :ok

  """
  @spec send_sms(String.t(), String.t(), map) :: :ok | {:error, String.t()}
  def send_sms(message, mobile, options) do
    Connector.API.send_sms(message, mobile, options)
  end
end
