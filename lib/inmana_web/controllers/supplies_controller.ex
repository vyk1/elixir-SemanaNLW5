defmodule InmanaWeb.SuppliesController do
  use InmanaWeb, :controller

  alias Inmana.Supply
  alias InmanaWeb.FallbackController

  # é um Handler
  action_fallback FallbackController

  def create(conn, params) do
    # Faz pattern matching
    # -> Tem suporte para multiplas condições e else
    with {:ok, %Supply{} = supply} <- Inmana.create_supply(params) do
      conn
      |> put_status(:created)
      |> render("create.json", supply: supply)
    end
  end

  def show(conn, %{"id" => uuid}) do
    with {:ok, %Supply{} = supply} <- Inmana.get_supply(uuid) do
      conn
      |> put_status(:ok)
      |> render("show.json", supply: supply)
    end
  end
end
