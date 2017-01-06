defmodule AballcPhoenix.Contact do
  use AballcPhoenix.Web, :model

  @primary_key false # to avoid unnecessary IO scanning
  @derive {Poison.Encoder, except: [:__meta__]}
  # @derive {Poison.Encoder, only: [:firstname, :lastname]}

  schema "contacts" do
    field :id, :binary_id
    field :firstname, :string
    field :lastname, :string
    field :email, :string
    field :phone, :string
    field :primary_contact_method, :string
    field :mentor, :string
    # and so on depending on the columns in your table
  end
end
