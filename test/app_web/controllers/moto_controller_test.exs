defmodule AppWeb.MotoControllerTest do
  use AppWeb.ConnCase

  alias App.Placa

  @create_attrs %{placa_motos: "some placa_motos"}
  @update_attrs %{placa_motos: "some updated placa_motos"}
  @invalid_attrs %{placa_motos: nil}

  def fixture(:moto) do
    {:ok, moto} = Placa.create_moto(@create_attrs)
    moto
  end

  describe "index" do
    test "lists all placamotos", %{conn: conn} do
      conn = get conn, moto_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Placamotos"
    end
  end

  describe "new moto" do
    test "renders form", %{conn: conn} do
      conn = get conn, moto_path(conn, :new)
      assert html_response(conn, 200) =~ "New Moto"
    end
  end

  describe "create moto" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, moto_path(conn, :create), moto: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == moto_path(conn, :show, id)

      conn = get conn, moto_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Moto"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, moto_path(conn, :create), moto: @invalid_attrs
      assert html_response(conn, 200) =~ "New Moto"
    end
  end

  describe "edit moto" do
    setup [:create_moto]

    test "renders form for editing chosen moto", %{conn: conn, moto: moto} do
      conn = get conn, moto_path(conn, :edit, moto)
      assert html_response(conn, 200) =~ "Edit Moto"
    end
  end

  describe "update moto" do
    setup [:create_moto]

    test "redirects when data is valid", %{conn: conn, moto: moto} do
      conn = put conn, moto_path(conn, :update, moto), moto: @update_attrs
      assert redirected_to(conn) == moto_path(conn, :show, moto)

      conn = get conn, moto_path(conn, :show, moto)
      assert html_response(conn, 200) =~ "some updated placa_motos"
    end

    test "renders errors when data is invalid", %{conn: conn, moto: moto} do
      conn = put conn, moto_path(conn, :update, moto), moto: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Moto"
    end
  end

  describe "delete moto" do
    setup [:create_moto]

    test "deletes chosen moto", %{conn: conn, moto: moto} do
      conn = delete conn, moto_path(conn, :delete, moto)
      assert redirected_to(conn) == moto_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, moto_path(conn, :show, moto)
      end
    end
  end

  defp create_moto(_) do
    moto = fixture(:moto)
    {:ok, moto: moto}
  end
end
