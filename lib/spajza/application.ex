defmodule Spajza.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      SpajzaWeb.Telemetry,
      # Start the Ecto repository
      Spajza.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Spajza.PubSub},
      # Start Finch
      {Finch, name: Spajza.Finch},
      # Start the Endpoint (http/https)
      SpajzaWeb.Endpoint
      # Start a worker by calling: Spajza.Worker.start_link(arg)
      # {Spajza.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Spajza.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    SpajzaWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
