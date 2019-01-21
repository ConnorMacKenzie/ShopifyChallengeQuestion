defmodule ProductsApiWeb.InventoryController do
  use ProductsApiWeb, :controller
  alias ProductsApi.ProductList

  def index(conn, %{"title" => title} = params) do
     conn
     |> send_resp(200, get_product(title))
  end

  def index(conn, %{"stock" => nil} = params) do
     conn
     |> send_resp(200, list_products_in_stock())
  end

  def index(conn, _params) do
     conn
     |> send_resp(200, list_products())
  end

  def index(conn, _params) do
    conn
    |> put_status(400)
    |> text("Error, wrong parameters supplied!")
  end

  defp list_products do
    ProductList.list_products()
    |> Poison.encode!()
  end

  defp list_products_in_stock do
    ProductList.get_all_in_stock()
    |> Poison.encode!()
  end

  defp get_product(title) do
    ProductList.get_product_by_title(title)
    |> Poison.encode!()
  end
end
