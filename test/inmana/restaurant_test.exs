defmodule Inmana.RestaurantTest do
  # p/ testes com bd e changesets
  # sandbox!
  use Inmana.DataCase
  # é possível testar de forma assíncrona:
  # use async: true

  alias Inmana.Restaurant
  alias Ecto.Changeset

  describe "changeset/1" do
    test "when all params are valid, returns a valid changeset" do
      params = %{name: "Recomendo", email: "re@comendo.com"}

      response = Restaurant.changeset(params)

      # asserção via pattern matching
      assert %Changeset{
               changes: %{
                 name: "Recomendo",
                 email: "re@comendo.com"
               },
               valid?: true
             } = response
    end

    test "when there are invalid params, returns an invalid changeset" do
      params = %{name: "r", email: ""}

      expected_response = %{
        email: ["can't be blank"],
        name: ["should be at least 2 character(s)"]
      }

      response = Restaurant.changeset(params)

      # asserção via pattern matching
      assert %Changeset{valid?: false} = response

      # força aparecer os erros
      # assert errors_on(response) == "xxx"
      assert errors_on(response) == expected_response
    end
  end
end
