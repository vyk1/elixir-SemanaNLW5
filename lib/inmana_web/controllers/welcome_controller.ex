defmodule InmanaWeb.WelcomeController do
  use InmanaWeb, :controller

  alias Inmana.Welcomer

  def index(conn, params) do
    params
    |> Welcomer.welcome()
    |> handle_response(conn)
  end

  # ANTES
  # defp handle_response({:ok, message}, conn) do
  #   conn
  #   |> put_status(:ok)
  #   |> json(%{message: message})
  # end

  # defp handle_response({:error, message}, conn) do
  #   conn
  #   |> put_status(:bad_request)
  #   |> json(%{message: message})
  # end

  # DEPOIS

  defp handle_response({:ok, message}, conn), do: render_response(conn, message, :ok)

  defp handle_response({:error, message}, conn), do: render_response(conn, message, :bad_request)

  defp render_response(conn, message, status) do
    conn
    |> put_status(status)
    |> json(%{message: message})
  end
end
