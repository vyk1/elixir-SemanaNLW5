defmodule InmanaWeb.Router do
  use InmanaWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  # escopo -> rotas a partir dela
  scope "/api", InmanaWeb do
    # pipe_through -> define o pipeline da linha 4
    # Só aceita json
    pipe_through :api

    get "/", WelcomeController, :index

    post "/restaurants", RestaurantsController, :create

    post "/supplies", SuppliesController, :create
    get "/supplies/:id", SuppliesController, :show

    # mix phx.routes
    resources "/supplies", SuppliesController
  end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through [:fetch_session, :protect_from_forgery]
      live_dashboard "/dashboard", metrics: InmanaWeb.Telemetry
    end
  end

  if Mix.env() == :dev do
    forward "/sent_emails", Bamboo.SentEmailViewerPlug
  end
end
