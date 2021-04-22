defmodule InmanaWeb.RestaurantsController do
  use InmanaWeb, :controller

  alias Inmana.Restaurant
  alias InmanaWeb.FallbackController

  # é um Handler
  action_fallback FallbackController

  def create(conn, params) do
    # Faz pattern matching
    # -> Tem suporte para multiplas condições e else
    with {:ok, %Restaurant{} = restaurant} <- Inmana.create_restaurant(params) do
      conn
      |> put_status(:created)
      |> render("create.json", restaurant: restaurant)
    end
  end
end
