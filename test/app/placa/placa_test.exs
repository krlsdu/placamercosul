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
end
