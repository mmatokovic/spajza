defmodule Spajza.ItemsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Spajza.Items` context.
  """

  @doc """
  Generate a item.
  """
  def item_fixture(attrs \\ %{}) do
    {:ok, item} =
      attrs
      |> Enum.into(%{
        disabled: true,
        name: "some name",
        picture_url: "some picture_url",
        remarks: "some remarks",
        status: "some status"
      })
      |> Spajza.Items.create_item()

    item
  end
end
