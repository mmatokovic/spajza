# Spajza

To start your Phoenix server:

  * Run `mix setup` to install and setup dependencies
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex.bat -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix



mix phx.gen.json Items Item items name:string remarks:string picture_url:string status:string disabled:boolean

mix phx.gen.json StorageAreas StorageArea storage_areas name:string description:string location:string disabled:boolean

mix phx.gen.json Inventories Inventory inventories item_id:references:items storage_area_id:references:storage_areas quantity:integer