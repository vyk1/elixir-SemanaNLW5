defmodule Inmana.Supplies.ExpirationNotification do
  alias Inmana.Mailer
  alias Inmana.Supplies.{ExpirationEmail, GetByExpiration}

  def send do
    data = GetByExpiration.call()

    Enum.each(data, fn {to_email, supplies} ->
      to_email
      |> ExpirationEmail.create(supplies)
      # <>_later -> async
      # ! (vulgo bang) -> retorna exceção se der algo de errado
      |> Mailer.deliver_later!()
    end)
  end
end
