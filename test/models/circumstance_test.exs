defmodule AballcPhoenix.CircumstanceTest do
  use AballcPhoenix.ModelCase

  alias AballcPhoenix.Circumstance

  @valid_attrs %{circumstance: "some content", id: "some content", name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Circumstance.changeset(%Circumstance{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Circumstance.changeset(%Circumstance{}, @invalid_attrs)
    refute changeset.valid?
  end
end
