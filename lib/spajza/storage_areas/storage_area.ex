defmodule Spajza.StorageAreas.StorageArea do
  use Ecto.Schema
  import Ecto.Changeset

  schema "storage_areas" do
    field :description, :string
    field :disabled, :boolean, default: false
    field :location, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(storage_area, attrs) do
    storage_area
    |> cast(attrs, [:name, :description, :location, :disabled])
    |> validate_required([:name, :description, :location, :disabled])
  end
end
