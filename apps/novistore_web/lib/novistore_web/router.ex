defmodule NovistoreWeb.Router do
  use Phoenix.Router

  scope "/graphiql" do
    forward "/", Absinthe.Plug.GraphiQL,
      schema: NovistoreAPI.Schema,
      interface: :playground
  end

  scope "/" do
    forward "/", Absinthe.Plug,
      schema: NovistoreAPI.Schema
  end
end
