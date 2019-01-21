defmodule ProductsApi.Repo do
  use Ecto.Repo,
    otp_app: :products_api,
    adapter: Ecto.Adapters.MySQL
end
