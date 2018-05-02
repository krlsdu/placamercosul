defmodule App.PlacaTest do
  use App.DataCase

  alias App.Placa

  describe "placamercosul" do
    alias App.Placa.PlacaMercosul

    @valid_attrs %{placa_mercosul: "some placa_mercosul"}
    @update_attrs %{placa_mercosul: "some updated placa_mercosul"}
    @invalid_attrs %{placa_mercosul: nil}

    def placa_mercosul_fixture(attrs \\ %{}) do
      {:ok, placa_mercosul} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Placa.create_placa_mercosul()

      placa_mercosul
    end

    test "list_placamercosul/0 returns all placamercosul" do
      placa_mercosul = placa_mercosul_fixture()
      assert Placa.list_placamercosul() == [placa_mercosul]
    end

    test "get_placa_mercosul!/1 returns the placa_mercosul with given id" do
      placa_mercosul = placa_mercosul_fixture()
      assert Placa.get_placa_mercosul!(placa_mercosul.id) == placa_mercosul
    end

    test "create_placa_mercosul/1 with valid data creates a placa_mercosul" do
      assert {:ok, %PlacaMercosul{} = placa_mercosul} = Placa.create_placa_mercosul(@valid_attrs)
      assert placa_mercosul.placa_mercosul == "some placa_mercosul"
    end

    test "create_placa_mercosul/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Placa.create_placa_mercosul(@invalid_attrs)
    end

    test "update_placa_mercosul/2 with valid data updates the placa_mercosul" do
      placa_mercosul = placa_mercosul_fixture()
      assert {:ok, placa_mercosul} = Placa.update_placa_mercosul(placa_mercosul, @update_attrs)
      assert %PlacaMercosul{} = placa_mercosul
      assert placa_mercosul.placa_mercosul == "some updated placa_mercosul"
    end

    test "update_placa_mercosul/2 with invalid data returns error changeset" do
      placa_mercosul = placa_mercosul_fixture()
      assert {:error, %Ecto.Changeset{}} = Placa.update_placa_mercosul(placa_mercosul, @invalid_attrs)
      assert placa_mercosul == Placa.get_placa_mercosul!(placa_mercosul.id)
    end

    test "delete_placa_mercosul/1 deletes the placa_mercosul" do
      placa_mercosul = placa_mercosul_fixture()
      assert {:ok, %PlacaMercosul{}} = Placa.delete_placa_mercosul(placa_mercosul)
      assert_raise Ecto.NoResultsError, fn -> Placa.get_placa_mercosul!(placa_mercosul.id) end
    end

    test "change_placa_mercosul/1 returns a placa_mercosul changeset" do
      placa_mercosul = placa_mercosul_fixture()
      assert %Ecto.Changeset{} = Placa.change_placa_mercosul(placa_mercosul)
    end
  end

  describe "placamotos" do
    alias App.Placa.Moto

    @valid_attrs %{placa_motos: "some placa_motos"}
    @update_attrs %{placa_motos: "some updated placa_motos"}
    @invalid_attrs %{placa_motos: nil}

    def moto_fixture(attrs \\ %{}) do
      {:ok, moto} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Placa.create_moto()

      moto
    end

    test "list_placamotos/0 returns all placamotos" do
      moto = moto_fixture()
      assert Placa.list_placamotos() == [moto]
    end

    test "get_moto!/1 returns the moto with given id" do
      moto = moto_fixture()
      assert Placa.get_moto!(moto.id) == moto
    end

    test "create_moto/1 with valid data creates a moto" do
      assert {:ok, %Moto{} = moto} = Placa.create_moto(@valid_attrs)
      assert moto.placa_motos == "some placa_motos"
    end

    test "create_moto/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Placa.create_moto(@invalid_attrs)
    end

    test "update_moto/2 with valid data updates the moto" do
      moto = moto_fixture()
      assert {:ok, moto} = Placa.update_moto(moto, @update_attrs)
      assert %Moto{} = moto
      assert moto.placa_motos == "some updated placa_motos"
    end

    test "update_moto/2 with invalid data returns error changeset" do
      moto = moto_fixture()
      assert {:error, %Ecto.Changeset{}} = Placa.update_moto(moto, @invalid_attrs)
      assert moto == Placa.get_moto!(moto.id)
    end

    test "delete_moto/1 deletes the moto" do
      moto = moto_fixture()
      assert {:ok, %Moto{}} = Placa.delete_moto(moto)
      assert_raise Ecto.NoResultsError, fn -> Placa.get_moto!(moto.id) end
    end

    test "change_moto/1 returns a moto changeset" do
      moto = moto_fixture()
      assert %Ecto.Changeset{} = Placa.change_moto(moto)
    end
  end
end
