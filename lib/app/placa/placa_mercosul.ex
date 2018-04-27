defmodule App.Placa.PlacaMercosul do
  use Ecto.Schema
  import Ecto.Changeset


  schema "placamercosul" do
    field :placa_mercosul, :string

    timestamps()
  end

  @doc false
  def changeset(placa_mercosul, attrs) do
    placa_mercosul
    |> cast(attrs, [:placa_mercosul])
    |> validate_required([:placa_mercosul])
  end
end
