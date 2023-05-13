defmodule Spajza.Repo.Migrations.CreateStorageAreas do
  use Ecto.Migration

  def change do
    create table(:storage_areas) do
      add :name, :string
      add :description, :string
      add :location, :string
      add :disabled, :boolean, default: false, null: false

      timestamps()
    end
  end
end
