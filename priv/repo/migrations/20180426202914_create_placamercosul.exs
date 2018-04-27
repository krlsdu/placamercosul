defmodule App.Repo.Migrations.CreatePlacamercosul do
  use Ecto.Migration

  def change do
    create table(:placamercosul) do
      add :placa_mercosul, :string

      timestamps()
    end

  end
end
