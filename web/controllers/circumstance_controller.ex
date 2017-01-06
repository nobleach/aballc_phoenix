defmodule AballcPhoenix.CircumstanceController do
  use AballcPhoenix.Web, :controller

  alias AballcPhoenix.Circumstance

  def index(conn, _params) do
    circumstances = Repo.all(Circumstance)
    render(conn, "index.json", circumstances: circumstances)
  end

  def create(conn, %{"circumstance" => circumstance_params}) do
    changeset = Circumstance.changeset(%Circumstance{}, circumstance_params)

    case Repo.insert(changeset) do
      {:ok, circumstance} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", circumstance_path(conn, :show, circumstance))
        |> render("show.json", circumstance: circumstance)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(AballcPhoenix.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    circumstance = Repo.get!(Circumstance, id)
    render(conn, "show.json", circumstance: circumstance)
  end

  def update(conn, %{"id" => id, "circumstance" => circumstance_params}) do
    circumstance = Repo.get!(Circumstance, id)
    changeset = Circumstance.changeset(circumstance, circumstance_params)

    case Repo.update(changeset) do
      {:ok, circumstance} ->
        render(conn, "show.json", circumstance: circumstance)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(AballcPhoenix.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    circumstance = Repo.get!(Circumstance, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(circumstance)

    send_resp(conn, :no_content, "")
  end
end
