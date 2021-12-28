defmodule Auth2.Repo do
  use Ecto.Repo,
    otp_app: :auth2,
    adapter: Ecto.Adapters.Postgres
end
