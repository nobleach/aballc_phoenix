defmodule AballcPhoenix.Circumstance do
  use AballcPhoenix.Web, :model

  schema "circumstances" do
    field :id, :string
    field :circumstance, :string
    field :name, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:id, :circumstance, :name])
    |> validate_required([:id, :circumstance, :name])
  end
end
