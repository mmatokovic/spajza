defmodule SpajzaWeb.StorageAreaController do
  use SpajzaWeb, :controller

  alias Spajza.StorageAreas
  alias Spajza.StorageAreas.StorageArea

  action_fallback SpajzaWeb.FallbackController

  def index(conn, _params) do
    storage_areas = StorageAreas.list_storage_areas()
    render(conn, :index, storage_areas: storage_areas)
  end

  def create(conn, %{"storage_area" => storage_area_params}) do
    with {:ok, %StorageArea{} = storage_area} <- StorageAreas.create_storage_area(storage_area_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/storage_areas/#{storage_area}")
      |> render(:show, storage_area: storage_area)
    end
  end

  def show(conn, %{"id" => id}) do
    storage_area = StorageAreas.get_storage_area!(id)
    render(conn, :show, storage_area: storage_area)
  end

  def update(conn, %{"id" => id, "storage_area" => storage_area_params}) do
    storage_area = StorageAreas.get_storage_area!(id)

    with {:ok, %StorageArea{} = storage_area} <- StorageAreas.update_storage_area(storage_area, storage_area_params) do
      render(conn, :show, storage_area: storage_area)
    end
  end

  def delete(conn, %{"id" => id}) do
    storage_area = StorageAreas.get_storage_area!(id)

    with {:ok, %StorageArea{}} <- StorageAreas.delete_storage_area(storage_area) do
      send_resp(conn, :no_content, "")
    end
  end
end
