defmodule Inmana do
  alias Inmana.Restaurants.Create
  # Fachada
  defdelegate create_restaurant(params), to: Create, as: :call

end
