defmodule AppWeb.PlacaMercosulControllerTest do
  use AppWeb.ConnCase

  alias App.Placa

  @create_attrs %{placa_mercosul: "AHA0005"}
  @update_attrs %{placa_mercosul: "some updated placa_mercosul"}
  @invalid_attrs %{placa_mercosul: nil}

  def fixture(:placa_mercosul) do
    {:ok, placa_mercosul} = Placa.create_placa_mercosul(@create_attrs)
    placa_mercosul
  end

  describe "index" do
    test "lists all placamercosul", %{conn: conn} do
      conn = get(conn, placa_mercosul_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Placamercosul"
    end
  end

  describe "new placa_mercosul" do
    test "renders form", %{conn: conn} do
      conn = get(conn, placa_mercosul_path(conn, :new))
      assert html_response(conn, 200) =~ "New Placa mercosul"
    end
  end

  describe "create placa_mercosul" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, placa_mercosul_path(conn, :create), placa_mercosul: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == placa_mercosul_path(conn, :show, id)

      conn = get(conn, placa_mercosul_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Placa mercosul"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, placa_mercosul_path(conn, :create), placa_mercosul: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Placa mercosul"
    end
  end

  describe "edit placa_mercosul" do
    setup [:create_placa_mercosul]

    test "renders form for editing chosen placa_mercosul", %{
      conn: conn,
      placa_mercosul: placa_mercosul
    } do
      conn = get(conn, placa_mercosul_path(conn, :edit, placa_mercosul))
      assert html_response(conn, 200) =~ "Edit Placa mercosul"
    end
  end

  describe "update placa_mercosul" do
    setup [:create_placa_mercosul]

    test "redirects when data is valid", %{conn: conn, placa_mercosul: placa_mercosul} do
      conn =
        put(
          conn,
          placa_mercosul_path(conn, :update, placa_mercosul),
          placa_mercosul: @update_attrs
        )

      assert redirected_to(conn) == placa_mercosul_path(conn, :show, placa_mercosul)

      conn = get(conn, placa_mercosul_path(conn, :show, placa_mercosul))
      assert html_response(conn, 200) =~ "some updated placa_mercosul"
    end

    test "renders errors when data is invalid", %{conn: conn, placa_mercosul: placa_mercosul} do
      conn =
        put(
          conn,
          placa_mercosul_path(conn, :update, placa_mercosul),
          placa_mercosul: @invalid_attrs
        )

      assert html_response(conn, 200) =~ "Edit Placa mercosul"
    end
  end

  describe "delete placa_mercosul" do
    setup [:create_placa_mercosul]

    test "deletes chosen placa_mercosul", %{conn: conn, placa_mercosul: placa_mercosul} do
      conn = delete(conn, placa_mercosul_path(conn, :delete, placa_mercosul))
      assert redirected_to(conn) == placa_mercosul_path(conn, :index)

      assert_error_sent(404, fn ->
        get(conn, placa_mercosul_path(conn, :show, placa_mercosul))
      end)
    end
  end

  defp create_placa_mercosul(_) do
    placa_mercosul = fixture(:placa_mercosul)
    {:ok, placa_mercosul: placa_mercosul}
  end
end
