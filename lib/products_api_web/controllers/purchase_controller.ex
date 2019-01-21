defmodule ProductsApiWeb.PurchaseController do
  use ProductsApiWeb, :controller
  alias ProductsApi.ProductList

  def index(conn, %{"purchase" => purchase_params}) do
    conn
    |> put_status(200)
    |> json(purchase_item(purchase_params))
  end

  def index(conn, _params) do
    conn
    |> put_status(400)
    |> json(%{"error" => "Wrong parameters"})
  end

  defp purchase_item(%{"title" => title, "quantity" => quantity}) do
    product = ProductList.get_product_by_title(title) |> Enum.at(0)
    inventory = product.inventory_count
    if inventory <= 0 do
      %{"error" => "Out of stock"}
    else
      if inventory - quantity < 0 do
        %{"error" => "Not enough stock"}
      else
        {:ok, _} = ProductList.update_product(product, %{"inventory_count" => inventory - quantity})
        %{"success" => "#{quantity} items of #{title} purchased"}
      end
    end
  end
end
