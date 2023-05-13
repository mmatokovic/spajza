defmodule Spajza.Repo.Migrations.CreateInventories do
  use Ecto.Migration

  def change do
    create table(:inventories) do
      add :quantity, :integer
      add :item_id, references(:items, on_delete: :nothing)
      add :storage_area_id, references(:storage_areas, on_delete: :nothing)

      timestamps()
    end

    create index(:inventories, [:item_id])
    create index(:inventories, [:storage_area_id])
  end
end
