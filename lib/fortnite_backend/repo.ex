defmodule FortniteBackend.Repo do
  use Ecto.Repo,
    otp_app: :fortnite_backend,
    adapter: Ecto.Adapters.Postgres
end
