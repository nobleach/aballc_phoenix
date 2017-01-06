defmodule AballcPhoenix.CircumstanceControllerTest do
  use AballcPhoenix.ConnCase

  alias AballcPhoenix.Circumstance
  @valid_attrs %{circumstance: "some content", id: "some content", name: "some content"}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, circumstance_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    circumstance = Repo.insert! %Circumstance{}
    conn = get conn, circumstance_path(conn, :show, circumstance)
    assert json_response(conn, 200)["data"] == %{"id" => circumstance.id,
      "id" => circumstance.id,
      "circumstance" => circumstance.circumstance,
      "name" => circumstance.name}
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, circumstance_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, circumstance_path(conn, :create), circumstance: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Circumstance, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, circumstance_path(conn, :create), circumstance: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    circumstance = Repo.insert! %Circumstance{}
    conn = put conn, circumstance_path(conn, :update, circumstance), circumstance: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Circumstance, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    circumstance = Repo.insert! %Circumstance{}
    conn = put conn, circumstance_path(conn, :update, circumstance), circumstance: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    circumstance = Repo.insert! %Circumstance{}
    conn = delete conn, circumstance_path(conn, :delete, circumstance)
    assert response(conn, 204)
    refute Repo.get(Circumstance, circumstance.id)
  end
end
