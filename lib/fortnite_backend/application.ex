defmodule FortniteBackend.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      FortniteBackendWeb.Telemetry,
       {Finch, name: MyAppFinch},
      FortniteBackend.Repo,
      {DNSCluster, query: Application.get_env(:fortnite_backend, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: FortniteBackend.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: FortniteBackend.Finch},
      # Start a worker by calling: FortniteBackend.Worker.start_link(arg)
      # {FortniteBackend.Worker, arg},
      # Start to serve requests, typically the last entry
      FortniteBackendWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: FortniteBackend.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    FortniteBackendWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
