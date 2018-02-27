defmodule Novistore.Storage do
  @moduledoc false

  defmacro __using__(_) do
    mod_name = __CALLER__.module |> Module.split() |> List.last()
    fun_name = Macro.underscore(mod_name)

    quote bind_quoted: [mod_name: mod_name, fun_name: fun_name] do
      @doc """
      Create a new #{mod_name}
      """
      def unquote(:"create_#{fun_name}")(params) do
        changeset = __MODULE__.changeset(struct(__MODULE__), params)

        Novistore.Repo.insert(changeset)
      end

      @doc """
      Update an existing #{mod_name}
      """
      def unquote(:"update_#{fun_name}")(%{__struct__: unquote(__MODULE__)} = struct, params) do
        changeset = __MODULE__.changeset(struct, params)

        Novistore.Repo.update(changeset)
      end

      @doc """
      Delete an existing #{mod_name}
      """
      def unquote(:"delete_#{fun_name}")(%{__struct__: unquote(__MODULE__)} = struct) do
        Novistore.Repo.delete(struct)
      end

      @doc """
      Find an existing #{mod_name} by ID
      """
      def unquote(:"#{fun_name}_by_id")(id), do: Novistore.Repo.get(__MODULE__, id)

      defoverridable [
        {:"create_#{fun_name}", 1},
        {:"update_#{fun_name}", 2},
        {:"delete_#{fun_name}", 1},
        {:"#{fun_name}_by_id", 1}
      ]
    end
  end
end
