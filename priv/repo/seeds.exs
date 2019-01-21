# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     ProductsApi.Repo.insert!(%ProductsApi.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

ProductsApi.Repo.insert!(%ProductsApi.ProductList.Product{
  title: "Pizza",
  price: "5.00",
  inventory_count: 10
  })

ProductsApi.Repo.insert!(%ProductsApi.ProductList.Product{
  title: "Hot Dog",
  price: "2.50",
  inventory_count: 10
  })

ProductsApi.Repo.insert!(%ProductsApi.ProductList.Product{
  title: "Hamburger",
  price: "5.00",
  inventory_count: 0
  })

ProductsApi.Repo.insert!(%ProductsApi.ProductList.Product{
  title: "Pop",
  price: "1.00",
  inventory_count: 10
  })
