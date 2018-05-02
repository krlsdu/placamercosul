defmodule AppWeb.MotoController do
  use AppWeb, :controller

  alias App.Placa
  alias App.Placa.Moto

  def index(conn, _params) do
    placamotos = Placa.list_placamotos()
    render(conn, "index.html", placamotos: placamotos)
  end

  def new(conn, _params) do
    changeset = Placa.change_moto(%Moto{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"moto" => moto_params}) do
    moto_params = Placa.placa_mercosul_moto(moto_params)

    case Placa.create_moto(moto_params) do
      {:ok, moto} ->
        conn
        |> put_flash(:info, "Moto created successfully.")
        |> redirect(to: moto_path(conn, :show, moto))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    moto = Placa.get_moto!(id)
    render(conn, "show.html", moto: moto)
  end

  def edit(conn, %{"id" => id}) do
    moto = Placa.get_moto!(id)
    changeset = Placa.change_moto(moto)
    render(conn, "edit.html", moto: moto, changeset: changeset)
  end

  def update(conn, %{"id" => id, "moto" => moto_params}) do
    moto = Placa.get_moto!(id)

    case Placa.update_moto(moto, moto_params) do
      {:ok, moto} ->
        conn
        |> put_flash(:info, "Moto updated successfully.")
        |> redirect(to: moto_path(conn, :show, moto))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", moto: moto, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    moto = Placa.get_moto!(id)
    {:ok, _moto} = Placa.delete_moto(moto)

    conn
    |> put_flash(:info, "Moto deleted successfully.")
    |> redirect(to: moto_path(conn, :index))
  end
end
