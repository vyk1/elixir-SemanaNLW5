defmodule Inmana.Restaurants.Create do
  alias Inmana.{Repo, Restaurant}

  # alias Inmana.Restaurant.Create
  # params = %{name: "BdLixo", email: "balde@lixo.fenda"}
  # Create.call(params) // ok
  # Create.call(params) // error

  def call(params) do
    params
    |> Restaurant.changeset()
    |> Repo.insert()
    |> handle_insert()
  end

  defp handle_insert({:ok, %Restaurant{}} = result), do: result

  defp handle_insert({:error, result}), do: {:error, %{result: result, status: :bad_request}}
end
