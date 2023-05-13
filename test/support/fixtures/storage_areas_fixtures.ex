defmodule Spajza.StorageAreasFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Spajza.StorageAreas` context.
  """

  @doc """
  Generate a storage_area.
  """
  def storage_area_fixture(attrs \\ %{}) do
    {:ok, storage_area} =
      attrs
      |> Enum.into(%{
        description: "some description",
        disabled: true,
        location: "some location",
        name: "some name"
      })
      |> Spajza.StorageAreas.create_storage_area()

    storage_area
  end
end
