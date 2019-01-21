defmodule ProductsApi.Repo.Migrations.CreateProducts do
  use Ecto.Migration

  def change do
    create table(:products) do
      add :title, :string
      add :price, :string
      add :inventory_count, :integer

      timestamps()
    end

  end
end
