defmodule AballcPhoenix.Repo.Migrations.CreateCircumstance do
  use Ecto.Migration

  def change do
    create table(:circumstances) do
      add :id, :string
      add :circumstance, :string
      add :name, :string

      timestamps()
    end

  end
end
