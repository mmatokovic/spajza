defmodule SpajzaWeb.StorageAreaJSON do
  alias Spajza.StorageAreas.StorageArea

  @doc """
  Renders a list of storage_areas.
  """
  def index(%{storage_areas: storage_areas}) do
    %{data: for(storage_area <- storage_areas, do: data(storage_area))}
  end

  @doc """
  Renders a single storage_area.
  """
  def show(%{storage_area: storage_area}) do
    %{data: data(storage_area)}
  end

  defp data(%StorageArea{} = storage_area) do
    %{
      id: storage_area.id,
      name: storage_area.name,
      description: storage_area.description,
      location: storage_area.location,
      disabled: storage_area.disabled
    }
  end
end
