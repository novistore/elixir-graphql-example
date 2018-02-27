defmodule Novistore.Review do
  @moduledoc false

  use Ecto.Schema
  use Novistore.Storage

  import Ecto.Changeset

  @required ~w(title body email product_id)a
  @optional ~w()a

  schema "reviews" do
    field :title, :string
    field :body, :string
    field :email, :string

    belongs_to :product, Novistore.Product

    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, @required ++ @optional)
    |> validate_required(@required)
    |> assoc_constraint(:product)
  end
end
