defmodule NovistoreAPI.Type.Product do
  @moduledoc false

  use Absinthe.Schema.Notation
  use Absinthe.Ecto, repo: Novistore.Repo

  alias NovistoreAPI.HandleErrors
  alias Novistore.Product

  object :product_object do
    field :id, :id
    field :title, :string
    field :description, :string
    field :price, :integer
    field :reviews, list_of(:review_object) do
      resolve assoc(:reviews)
    end
  end

  object :product_query do
    field :products, list_of(:product_object) do
      resolve &products/2
      middleware HandleErrors
    end

    field :product_by_id, :product_object do
      arg :id, non_null(:id)

      resolve &product_by_id/2
      middleware HandleErrors
    end
  end

  defp products(_args, _info) do
    IO.puts("here")
    Product.products()
  end

  defp product_by_id(%{id: id}, _info) do
    case Product.product_by_id(id) do
      nil -> {:error, :not_found}
      product -> {:ok, product}
    end
  end
end
