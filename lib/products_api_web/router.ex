defmodule ProductsApiWeb.Router do
  use ProductsApiWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    #plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", ProductsApiWeb do
    pipe_through :browser

    get "/", PageController, :index
    get "/inventory", InventoryController, :index

    post "/purchase", PurchaseController, :index

    resources "/products", ProductController
  end

  # Other scopes may use custom stacks.
  # scope "/api", ProductsApiWeb do
  #   pipe_through :api
  # end
end
