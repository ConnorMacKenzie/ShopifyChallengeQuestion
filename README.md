# ProductsApi

This is my submission for the Summer 2019 Developer Intern Challenge Question.

The API is built using the Phoenix framework for elixir accompanied with a MySQL database.

### How to run the application

Sadly I was getting many errors when deploying to Heroku so the API will need to be ran locally. To do so:

* Ensure elixir is installed, it can he found [here](https://elixir-lang.org/install.html)
* Clone this repository and cd into the project
```shell
git clone https://github.com/ConnorMacKenzie/ShopifyChallengeQuestion.git
cd ShopifyChallengeQuestion
```
* Get dependencies
```shell
mix deps.get
```
* create and seed the database
```shell
mix ecto.create
mix ecto.migrate
mix run priv/repo/seeds.exs
```
* run application
```shell
mix phx.server
```

### Database

The database consists of a single table with the columns, title, price and inventory_count.

It is pre seeded with the following values.

|title    |price|inventory_count|
|---------|-----|---------------|
|pizza    |5.00 |10             |
|hot dog  |2.50 |10             |
|hamburger|5.00 |0              |
|pop      |1.00 |10             |
### Endpoints

The API has 4 endpoints and they are:

* __POST__ - __localhost:4000/purchase__
Purchase a quantity of an item granted it is in stock and there is enough stock to fulfill the order. To do so post JSON in the following format:

```json
{
"purchase": {
	"title": "hamburger",
	"quantity": 1
	}
}
```

* __GET__ - localhost:4000/inventory
This request returns all products in the database.

* __GET__ - localhost:4000/inventory?stock
This request returns all in stock products in the database.

* __GET__ - localhost:4000/inventory?title=pop
This request returns a given product based on its title.
