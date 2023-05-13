defmodule Spajza.Repo do
  use Ecto.Repo,
    otp_app: :spajza,
    adapter: Ecto.Adapters.Postgres
end
