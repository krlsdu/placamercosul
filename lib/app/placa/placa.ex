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

    IEx.pry()
    moto = Map.fetch!(placa, "placa_mercosul")

    if moto == "true" do
      placa
    else
      placa = Map.fetch!(placa, "placa_mercosul")
      placa_antiga = String.at(placa, 4)

      placa_convertida =
        String.codepoints(placa)
        |> List.replace_at(4, placa_nova.(placa_antiga))
        |> to_string

      %{"placa_mercosul" => placa_convertida}
    end
  end

  alias App.Placa.Moto

  @doc """
  Returns the list of placamotos.

  ## Examples

      iex> list_placamotos()
      [%Moto{}, ...]

  """
  def list_placamotos do
    Repo.all(Moto)
  end

  @doc """
  Gets a single moto.

  Raises `Ecto.NoResultsError` if the Moto does not exist.

  ## Examples

      iex> get_moto!(123)
      %Moto{}

      iex> get_moto!(456)
      ** (Ecto.NoResultsError)

  """
  def get_moto!(id), do: Repo.get!(Moto, id)

  @doc """
  Creates a moto.

  ## Examples

      iex> create_moto(%{field: value})
      {:ok, %Moto{}}

      iex> create_moto(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_moto(attrs \\ %{}) do
    %Moto{}
    |> Moto.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a moto.

  ## Examples

      iex> update_moto(moto, %{field: new_value})
      {:ok, %Moto{}}

      iex> update_moto(moto, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_moto(%Moto{} = moto, attrs) do
    moto
    |> Moto.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Moto.

  ## Examples

      iex> delete_moto(moto)
      {:ok, %Moto{}}

      iex> delete_moto(moto)
      {:error, %Ecto.Changeset{}}

  """
  def delete_moto(%Moto{} = moto) do
    Repo.delete(moto)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking moto changes.

  ## Examples

      iex> change_moto(moto)
      %Ecto.Changeset{source: %Moto{}}

  """
  def change_moto(%Moto{} = moto) do
    Moto.changeset(moto, %{})
  end

  def placa_mercosul_moto(moto) do
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

    IEx.pry()

    moto = Map.fetch!(moto, "placa_motos")

    placa_antiga = String.at(moto, 5)

    placa_convertida =
      String.codepoints(moto)
      |> List.replace_at(5, placa_nova.(placa_antiga))
      |> to_string

    %{"placa_motos" => placa_convertida}
  end
end
