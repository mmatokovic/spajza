defmodule Spajza.InventoriesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Spajza.Inventories` context.
  """

  @doc """
  Generate a inventory.
  """
  def inventory_fixture(attrs \\ %{}) do
    {:ok, inventory} =
      attrs
      |> Enum.into(%{
        quantity: 42
      })
      |> Spajza.Inventories.create_inventory()

    inventory
  end
end
