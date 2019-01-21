defmodule ProductsApi.ProductList.Product do
  use Ecto.Schema
  import Ecto.Changeset

  @derive {Poison.Encoder, only: [:inventory_count, :price, :title]}
  schema "products" do
    field :inventory_count, :integer
    field :price, :string
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(product, attrs) do
    product
    |> cast(attrs, [:title, :price, :inventory_count])
    |> validate_required([:title, :price, :inventory_count])
  end
end
