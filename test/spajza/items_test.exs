defmodule Spajza.ItemsTest do
  use Spajza.DataCase

  alias Spajza.Items

  describe "items" do
    alias Spajza.Items.Item

    import Spajza.ItemsFixtures

    @invalid_attrs %{disabled: nil, name: nil, picture_url: nil, remarks: nil, status: nil}

    test "list_items/0 returns all items" do
      item = item_fixture()
      assert Items.list_items() == [item]
    end

    test "get_item!/1 returns the item with given id" do
      item = item_fixture()
      assert Items.get_item!(item.id) == item
    end

    test "create_item/1 with valid data creates a item" do
      valid_attrs = %{disabled: true, name: "some name", picture_url: "some picture_url", remarks: "some remarks", status: "some status"}

      assert {:ok, %Item{} = item} = Items.create_item(valid_attrs)
      assert item.disabled == true
      assert item.name == "some name"
      assert item.picture_url == "some picture_url"
      assert item.remarks == "some remarks"
      assert item.status == "some status"
    end

    test "create_item/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Items.create_item(@invalid_attrs)
    end

    test "update_item/2 with valid data updates the item" do
      item = item_fixture()
      update_attrs = %{disabled: false, name: "some updated name", picture_url: "some updated picture_url", remarks: "some updated remarks", status: "some updated status"}

      assert {:ok, %Item{} = item} = Items.update_item(item, update_attrs)
      assert item.disabled == false
      assert item.name == "some updated name"
      assert item.picture_url == "some updated picture_url"
      assert item.remarks == "some updated remarks"
      assert item.status == "some updated status"
    end

    test "update_item/2 with invalid data returns error changeset" do
      item = item_fixture()
      assert {:error, %Ecto.Changeset{}} = Items.update_item(item, @invalid_attrs)
      assert item == Items.get_item!(item.id)
    end

    test "delete_item/1 deletes the item" do
      item = item_fixture()
      assert {:ok, %Item{}} = Items.delete_item(item)
      assert_raise Ecto.NoResultsError, fn -> Items.get_item!(item.id) end
    end

    test "change_item/1 returns a item changeset" do
      item = item_fixture()
      assert %Ecto.Changeset{} = Items.change_item(item)
    end
  end
end
