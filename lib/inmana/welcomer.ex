defmodule Inmana.Welcomer do
  # Recebe um nome e uma idade do usuário
  # Se o usuário for X, recebe uma mensagem especial
  # Se usuário for maior de idade, recebe mensagem normal
  # Se usuário for menor de idade, retorna um erro
  # Nome do usuário recebe tratamento como BanaNa, Banana \n

  def welcome(%{"name" => name, "age" => age}) do
    # Pipe Operator: pega o resultado de uma fx e passa para outra
    age = String.to_integer(age)

    # console:
    # IO.inspect(age)

    name
    |> String.trim()
    |> String.downcase()
    # É raro ver ifelse em FP
    # NOTE: o valor que vem do pipe fica implícito
    |> evaluate(age)
  end

  defp evaluate("admin", 123) do
    {:ok, "SuperUser C:"}
  end

  defp evaluate(name, age) when age >= 18 do
    {:ok, "Subject #{name} is alive since approximately #{2020 - age}"}
  end

  defp evaluate(name, _age) do
    {:error, "You shall not pass, young #{name}"}
  end
end
