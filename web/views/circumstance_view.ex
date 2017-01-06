defmodule AballcPhoenix.CircumstanceView do
  use AballcPhoenix.Web, :view

  def render("index.json", %{circumstances: circumstances}) do
    %{data: render_many(circumstances, AballcPhoenix.CircumstanceView, "circumstance.json")}
  end

  def render("show.json", %{circumstance: circumstance}) do
    %{data: render_one(circumstance, AballcPhoenix.CircumstanceView, "circumstance.json")}
  end

  def render("circumstance.json", %{circumstance: circumstance}) do
    %{id: circumstance.id,
      id: circumstance.id,
      circumstance: circumstance.circumstance,
      name: circumstance.name}
  end
end
