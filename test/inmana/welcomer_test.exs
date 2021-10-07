defmodule Inmana.WelcomerTest do
  use ExUnit.Case

  alias Inmana.Welcomer

  describe "welcomer/1" do
    test "when the user is special, returns a special message" do
      params = %{"name" => "admin", "age" => "123"}
      expected_result = {:ok, "SuperUser C:"}

      result = Welcomer.welcome(params)

      assert result == expected_result
    end

    test "when the user is under 18 years, returns a message" do
      params = %{"name" => "hal", "age" => "1"}
      expected_result = {:error, "You shall not pass, young hal"}

      result = Welcomer.welcome(params)

      assert result == expected_result
    end

    test "when the user is not under 18 years, returns a message" do
      params = %{"name" => "cyboogie", "age" => "90"}
      expected_result = {:ok, "Subject cyboogie is alive since approximately 1930"}

      result = Welcomer.welcome(params)

      assert result == expected_result
    end
  end
end

# para testar: mix test
