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

  @doc """
  get all sms.

  ## Examples

      iex> Connector.get_all_sms(%{:api_key => "your-api-key"})
      :ok

  """
  @spec get_all_sms(map) :: :ok | {:error, String.t()}
  def get_all_sms(options) do
    Connector.API.get_all_sms(options)
  end
end
