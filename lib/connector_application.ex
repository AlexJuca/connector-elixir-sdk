defmodule Connector.Application do
  use Application

  def start(_type, _args) do
    children = [
      {Task.Supervisor, name: Connector.TaskSupervisor}
    ]

    opts = [strategy: :one_for_one, name: Connector.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
