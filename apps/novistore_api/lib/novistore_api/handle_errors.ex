defmodule NovistoreAPI.HandleErrors do
  @moduledoc false

  @behaviour Absinthe.Middleware

  alias Absinthe.Resolution

  def call(%{errors: [:not_found]} = resolution, _config) do
    error = %{
      code: "resource_not_found",
      message: "We were unable to find what you are looking for",
      hint: "We could not find the resource that you queried, maybe it does not exist or the shop has no access to it."
    }

    Resolution.put_result(resolution, {:error, error})
  end

  def call(%{errors: [%Ecto.Changeset{} = changeset]} = resolution, _opts) do
    Resolution.put_result(resolution, {:error, transform_errors(changeset)})
  end

  def call(resolution, _config) do
    resolution
  end

  defp transform_errors(%Ecto.Changeset{} = changeset) do
    changeset
    |> changeset.__struct__.traverse_errors(&format_error/1)
    |> Enum.map(fn {field, errors} ->
      Enum.map(errors, &Map.put(&1, :field, field))
    end)
    |> List.flatten()
  end

  defp format_error({msg, opts}) do
    message = Enum.reduce(opts, msg, fn {key, value}, acc ->
      String.replace(acc, "%{#{key}}", inspect(value))
    end)

    Enum.into(opts, %{message: message})
  end
end
