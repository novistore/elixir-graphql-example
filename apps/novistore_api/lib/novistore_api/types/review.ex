defmodule NovistoreAPI.Type.Review do
  @moduledoc false

  use Absinthe.Schema.Notation
  use Absinthe.Ecto, repo: Novistore.Repo

  alias NovistoreAPI.HandleErrors
  alias Novistore.Review

  object :review_object do
    field :id, :id
    field :email, :string
    field :title, :string
    field :body, :string
    field :product, :product_object do
      resolve assoc(:product)
    end
  end

  input_object :review_input_object do
    field :email, :string
    field :title, :string
    field :body, :string
    field :product_id, :string
  end

  object :review_mutation do
    field :create_review, :review_object do
      arg :input, non_null(:review_input_object)

      resolve &create_review/2
      middleware HandleErrors
    end
  end

  defp create_review(%{input: input}, _info) do
    Review.create_review(input)
  end
end
