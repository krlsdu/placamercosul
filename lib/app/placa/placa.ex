require IEx

defmodule App.Placa do
  @moduledoc """
  The Placa context.
  """

  import Ecto.Query, warn: false
  alias App.Repo

  alias App.Placa.PlacaMercosul

  @doc """
  Returns the list of placamercosul.

  ## Examples

      iex> list_placamercosul()
      [%PlacaMercosul{}, ...]

  """
  def list_placamercosul do
    Repo.all(PlacaMercosul)
  end

  @doc """
  Gets a single placa_mercosul.

  Raises `Ecto.NoResultsError` if the Placa mercosul does not exist.

  ## Examples

      iex> get_placa_mercosul!(123)
      %PlacaMercosul{}

      iex> get_placa_mercosul!(456)
      ** (Ecto.NoResultsError)

  """
  def get_placa_mercosul!(id), do: Repo.get!(PlacaMercosul, id)

  @doc """
  Creates a placa_mercosul.

  ## Examples

      iex> create_placa_mercosul(%{field: value})
      {:ok, %PlacaMercosul{}}

      iex> create_placa_mercosul(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_placa_mercosul(attrs \\ %{}) do
    %PlacaMercosul{}
    |> PlacaMercosul.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a placa_mercosul.

  ## Examples

      iex> update_placa_mercosul(placa_mercosul, %{field: new_value})
      {:ok, %PlacaMercosul{}}

      iex> update_placa_mercosul(placa_mercosul, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_placa_mercosul(%PlacaMercosul{} = placa_mercosul, attrs) do
    placa_mercosul
    |> PlacaMercosul.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a PlacaMercosul.

  ## Examples

      iex> delete_placa_mercosul(placa_mercosul)
      {:ok, %PlacaMercosul{}}

      iex> delete_placa_mercosul(placa_mercosul)
      {:error, %Ecto.Changeset{}}

  """
  def delete_placa_mercosul(%PlacaMercosul{} = placa_mercosul) do
    Repo.delete(placa_mercosul)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking placa_mercosul changes.

  ## Examples

      iex> change_placa_mercosul(placa_mercosul)
      %Ecto.Changeset{source: %PlacaMercosul{}}

  """
  def change_placa_mercosul(%PlacaMercosul{} = placa_mercosul) do
    PlacaMercosul.changeset(placa_mercosul, %{})
  end

  def placa_mercosul(placa) do
    placa_nova = fn
      "0" -> "A"
      "1" -> "B"
      "2" -> "C"
      "3" -> "D"
      "4" -> "E"
      "5" -> "F"
      "6" -> "G"
      "7" -> "H"
      "8" -> "I"
      "9" -> "J"
    end

    placa = Map.fetch!(placa, "placa_mercosul")
    placa_antiga = String.at(placa, 4)

    placa_convertida =
      String.replace(
        placa,
        placa_antiga,
        placa_nova.(placa_antiga),
        insert_replaced: 4
      )

    %{"placa_mercosul" => placa_convertida}
  end
end
