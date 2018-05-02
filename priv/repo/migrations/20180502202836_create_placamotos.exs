defmodule App.Repo.Migrations.CreatePlacamotos do
  use Ecto.Migration

  def change do
    create table(:placamotos) do
      add :placa_motos, :string

      timestamps()
    end

  end
end
