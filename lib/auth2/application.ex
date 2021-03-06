defmodule Auth2.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Auth2.Repo,
      # Start the Telemetry supervisor
      Auth2Web.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Auth2.PubSub},
      # Start the Endpoint (http/https)
      Auth2Web.Endpoint
      # Start a worker by calling: Auth2.Worker.start_link(arg)
      # {Auth2.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Auth2.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    Auth2Web.Endpoint.config_change(changed, removed)
    :ok
  end
end
