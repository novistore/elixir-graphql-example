defmodule Novistore.Product do
  @moduledoc false

  use Ecto.Schema
  use Novistore.Storage

  import Ecto.Changeset

  alias Novistore.Repo
  alias __MODULE__

  @required ~w(title description price)a
  @optional ~w()a

  schema "products" do
    field :title, :string
    field :description, :string
    field :price, :integer

    has_many :reviews, Novistore.Review

    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, @required ++ @optional)
    |> validate_required(@required)
  end

  def products do
    {:ok, Repo.all(Product)}
  end
end
