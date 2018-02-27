defmodule NovistoreAPI.Schema do
  @moduledoc """
  Schema
  """

  use Absinthe.Schema

  import_types NovistoreAPI.Type.Product
  import_types NovistoreAPI.Type.Review

  query do
    import_fields :product_query
  end

  mutation do
    import_fields :review_mutation
  end
end
