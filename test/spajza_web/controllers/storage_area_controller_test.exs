defmodule SpajzaWeb.StorageAreaControllerTest do
  use SpajzaWeb.ConnCase

  import Spajza.StorageAreasFixtures

  alias Spajza.StorageAreas.StorageArea

  @create_attrs %{
    description: "some description",
    disabled: true,
    location: "some location",
    name: "some name"
  }
  @update_attrs %{
    description: "some updated description",
    disabled: false,
    location: "some updated location",
    name: "some updated name"
  }
  @invalid_attrs %{description: nil, disabled: nil, location: nil, name: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all storage_areas", %{conn: conn} do
      conn = get(conn, ~p"/api/storage_areas")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create storage_area" do
    test "renders storage_area when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/storage_areas", storage_area: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/storage_areas/#{id}")

      assert %{
               "id" => ^id,
               "description" => "some description",
               "disabled" => true,
               "location" => "some location",
               "name" => "some name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/storage_areas", storage_area: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update storage_area" do
    setup [:create_storage_area]

    test "renders storage_area when data is valid", %{conn: conn, storage_area: %StorageArea{id: id} = storage_area} do
      conn = put(conn, ~p"/api/storage_areas/#{storage_area}", storage_area: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/storage_areas/#{id}")

      assert %{
               "id" => ^id,
               "description" => "some updated description",
               "disabled" => false,
               "location" => "some updated location",
               "name" => "some updated name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, storage_area: storage_area} do
      conn = put(conn, ~p"/api/storage_areas/#{storage_area}", storage_area: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete storage_area" do
    setup [:create_storage_area]

    test "deletes chosen storage_area", %{conn: conn, storage_area: storage_area} do
      conn = delete(conn, ~p"/api/storage_areas/#{storage_area}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/storage_areas/#{storage_area}")
      end
    end
  end

  defp create_storage_area(_) do
    storage_area = storage_area_fixture()
    %{storage_area: storage_area}
  end
end
