defmodule ProductsApi.ProductListTest do
  use ProductsApi.DataCase

  alias ProductsApi.ProductList

  describe "products" do
    alias ProductsApi.ProductList.Product

    @valid_attrs %{inventory_count: 42, price: "some price", title: "some title"}
    @update_attrs %{inventory_count: 43, price: "some updated price", title: "some updated title"}
    @invalid_attrs %{inventory_count: nil, price: nil, title: nil}

    def product_fixture(attrs \\ %{}) do
      {:ok, product} =
        attrs
        |> Enum.into(@valid_attrs)
        |> ProductList.create_product()

      product
    end

    test "list_products/0 returns all products" do
      product = product_fixture()
      assert ProductList.list_products() == [product]
    end

    test "get_product!/1 returns the product with given id" do
      product = product_fixture()
      assert ProductList.get_product!(product.id) == product
    end

    test "create_product/1 with valid data creates a product" do
      assert {:ok, %Product{} = product} = ProductList.create_product(@valid_attrs)
      assert product.inventory_count == 42
      assert product.price == "some price"
      assert product.title == "some title"
    end

    test "create_product/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = ProductList.create_product(@invalid_attrs)
    end

    test "update_product/2 with valid data updates the product" do
      product = product_fixture()
      assert {:ok, %Product{} = product} = ProductList.update_product(product, @update_attrs)
      assert product.inventory_count == 43
      assert product.price == "some updated price"
      assert product.title == "some updated title"
    end

    test "update_product/2 with invalid data returns error changeset" do
      product = product_fixture()
      assert {:error, %Ecto.Changeset{}} = ProductList.update_product(product, @invalid_attrs)
      assert product == ProductList.get_product!(product.id)
    end

    test "delete_product/1 deletes the product" do
      product = product_fixture()
      assert {:ok, %Product{}} = ProductList.delete_product(product)
      assert_raise Ecto.NoResultsError, fn -> ProductList.get_product!(product.id) end
    end

    test "change_product/1 returns a product changeset" do
      product = product_fixture()
      assert %Ecto.Changeset{} = ProductList.change_product(product)
    end
  end
end
