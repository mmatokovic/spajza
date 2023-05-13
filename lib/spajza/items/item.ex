defmodule Spajza.Items.Item do
  use Ecto.Schema
  import Ecto.Changeset

  schema "items" do
    field :disabled, :boolean, default: false
    field :name, :string
    field :picture_url, :string
    field :remarks, :string
    field :status, :string

    timestamps()
  end

  @doc false
  def changeset(item, attrs) do
    item
    |> cast(attrs, [:name, :remarks, :picture_url, :status, :disabled])
    |> validate_required([:name, :remarks, :picture_url, :status, :disabled])
  end
end
