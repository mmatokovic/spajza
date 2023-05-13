defmodule Spajza.Repo.Migrations.CreateItems do
  use Ecto.Migration

  def change do
    create table(:items) do
      add :name, :string
      add :remarks, :string
      add :picture_url, :string
      add :status, :string
      add :disabled, :boolean, default: false, null: false

      timestamps()
    end
  end
end
