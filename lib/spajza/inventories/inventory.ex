defmodule Spajza.Inventories.Inventory do
  use Ecto.Schema
  import Ecto.Changeset

  schema "inventories" do
    field :quantity, :integer
    field :item_id, :id
    field :storage_area_id, :id

    timestamps()
  end

  @doc false
  def changeset(inventory, attrs) do
    inventory
    |> cast(attrs, [:quantity])
    |> validate_required([:quantity])
  end
end
