# ProductsApi

This is my submission for the Summer 2019 Developer Intern Challenge Question.

The API is built using the Phoenix framework for elixir accompanied with a MySQL database.

### Database

The database consists of a single table with the columns, title, price and inventory_count.

### Endpoints

The API has 4 endpoints and they are:

* __POST__ - __/purchase__
Purchase a quantity of an item granted it is in stock and there is enough stock to fulfill the order. To do so post JSON in the following format:

```json
{
"purchase": {
	"title": "hamburger",
	"quantity": 1
	}
}
```

* __GET__ - __/inventory___
This request returns all products in the database.

* __GET__ - __/inventory?stock___
This request returns all in stock products in the database.

* __GET__ - __/inventory?title=pop___
This request returns a given product based on its title.
