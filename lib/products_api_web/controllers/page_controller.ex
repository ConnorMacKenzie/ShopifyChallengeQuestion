defmodule ProductsApiWeb.PageController do
  use ProductsApiWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
