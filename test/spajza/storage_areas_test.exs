defmodule Spajza.StorageAreasTest do
  use Spajza.DataCase

  alias Spajza.StorageAreas

  describe "storage_areas" do
    alias Spajza.StorageAreas.StorageArea

    import Spajza.StorageAreasFixtures

    @invalid_attrs %{description: nil, disabled: nil, location: nil, name: nil}

    test "list_storage_areas/0 returns all storage_areas" do
      storage_area = storage_area_fixture()
      assert StorageAreas.list_storage_areas() == [storage_area]
    end

    test "get_storage_area!/1 returns the storage_area with given id" do
      storage_area = storage_area_fixture()
      assert StorageAreas.get_storage_area!(storage_area.id) == storage_area
    end

    test "create_storage_area/1 with valid data creates a storage_area" do
      valid_attrs = %{description: "some description", disabled: true, location: "some location", name: "some name"}

      assert {:ok, %StorageArea{} = storage_area} = StorageAreas.create_storage_area(valid_attrs)
      assert storage_area.description == "some description"
      assert storage_area.disabled == true
      assert storage_area.location == "some location"
      assert storage_area.name == "some name"
    end

    test "create_storage_area/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = StorageAreas.create_storage_area(@invalid_attrs)
    end

    test "update_storage_area/2 with valid data updates the storage_area" do
      storage_area = storage_area_fixture()
      update_attrs = %{description: "some updated description", disabled: false, location: "some updated location", name: "some updated name"}

      assert {:ok, %StorageArea{} = storage_area} = StorageAreas.update_storage_area(storage_area, update_attrs)
      assert storage_area.description == "some updated description"
      assert storage_area.disabled == false
      assert storage_area.location == "some updated location"
      assert storage_area.name == "some updated name"
    end

    test "update_storage_area/2 with invalid data returns error changeset" do
      storage_area = storage_area_fixture()
      assert {:error, %Ecto.Changeset{}} = StorageAreas.update_storage_area(storage_area, @invalid_attrs)
      assert storage_area == StorageAreas.get_storage_area!(storage_area.id)
    end

    test "delete_storage_area/1 deletes the storage_area" do
      storage_area = storage_area_fixture()
      assert {:ok, %StorageArea{}} = StorageAreas.delete_storage_area(storage_area)
      assert_raise Ecto.NoResultsError, fn -> StorageAreas.get_storage_area!(storage_area.id) end
    end

    test "change_storage_area/1 returns a storage_area changeset" do
      storage_area = storage_area_fixture()
      assert %Ecto.Changeset{} = StorageAreas.change_storage_area(storage_area)
    end
  end
end
