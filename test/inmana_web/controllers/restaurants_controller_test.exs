defmodule InmanaWeb.RestaurantsControllerTest do
  use InmanaWeb.ConnCase
  # alias Inmana.Restaurants.Create

  describe "create/2" do
    test "when all params are valid, creates the user", %{conn: conn} do
      params = %{name: "Recomendo", email: "re@comendo.com"}

      response =
        conn
        |> post(Routes.restaurants_path(conn, :create, params))
        # json já faz assert
        |> json_response(:created)

      assert %{
               "message" => "Restaurant created",
               "restaurant" => %{
                 "email" => "re@comendo.com",
                 "id" => _id,
                 "name" => "Recomendo"
               }
             } = response
    end

    # Com erro:
    # test "when there are invalid params, returns an error", %{conn: conn} do
    #   params = %{email: "re@comendo.com"}

    #   expected_response = %{"message" => %{"name" => ["can't be blank"]}}

    #   response =
    #     conn
    #     |> post(Routes.restaurants_path(conn, :create, params))
    #     |> json_response(:bad_request)

    #   assert response == expected_response
    # end
  end
end

# para ver onde cobre/não cobre:
# mix test --cover
# lib: excoveralls
# mix coveralls.html => gera arquivo em cover/

# ex_machina: lib p/ factory de testes (build de params auto... facilitar o setup)
