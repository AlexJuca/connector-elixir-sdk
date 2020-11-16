defmodule Connector.API do
  @api Application.get_env(:connector, Connector.API)[:api]

  def send_sms(message, mobile, options) do
    @api.send_sms(message, mobile, options)
  end
end
