defmodule App.Placa.Moto do
  use Ecto.Schema
  import Ecto.Changeset


  schema "placamotos" do
    field :placa_motos, :string

    timestamps()
  end

  @doc false
  def changeset(moto, attrs) do
    moto
    |> cast(attrs, [:placa_motos])
    |> validate_required([:placa_motos])
  end
end
