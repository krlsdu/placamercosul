require IEx

defmodule AppWeb.PlacaMercosulController do
  use AppWeb, :controller

  alias App.Placa
  alias App.Placa.PlacaMercosul

  def index(conn, _params) do
    placamercosul = Placa.list_placamercosul()
    render(conn, "index.html", placamercosul: placamercosul)
  end

  def new(conn, _params) do
    changeset = Placa.change_placa_mercosul(%PlacaMercosul{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"placa_mercosul" => placa_mercosul_params}) do
    placa_mercosul_params = Placa.placa_mercosul(placa_mercosul_params)

    case Placa.create_placa_mercosul(placa_mercosul_params) do
      {:ok, placa_mercosul} ->
        conn
        |> put_flash(:info, "Placa mercosul created successfully.")
        |> redirect(to: placa_mercosul_path(conn, :show, placa_mercosul))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    placa_mercosul = Placa.get_placa_mercosul!(id)
    render(conn, "show.html", placa_mercosul: placa_mercosul)
  end

  def edit(conn, %{"id" => id}) do
    placa_mercosul = Placa.get_placa_mercosul!(id)
    changeset = Placa.change_placa_mercosul(placa_mercosul)
    render(conn, "edit.html", placa_mercosul: placa_mercosul, changeset: changeset)
  end

  def update(conn, %{"id" => id, "placa_mercosul" => placa_mercosul_params}) do
    placa_mercosul = Placa.get_placa_mercosul!(id)

    case Placa.update_placa_mercosul(placa_mercosul, placa_mercosul_params) do
      {:ok, placa_mercosul} ->
        conn
        |> put_flash(:info, "Placa mercosul updated successfully.")
        |> redirect(to: placa_mercosul_path(conn, :show, placa_mercosul))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", placa_mercosul: placa_mercosul, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    placa_mercosul = Placa.get_placa_mercosul!(id)
    {:ok, _placa_mercosul} = Placa.delete_placa_mercosul(placa_mercosul)

    conn
    |> put_flash(:info, "Placa mercosul deleted successfully.")
    |> redirect(to: placa_mercosul_path(conn, :index))
  end
end
