defmodule Inmana.Restaurant do
  use Ecto.Schema
  import Ecto.Changeset

  alias Inmana.Supply

  @primary_key {:id, :binary_id, autogenerate: true}

  @required_params [:email, :name]

  @derive {Jason.Encoder, only: @required_params ++ [:id]}

  schema "restaurants" do
    field :email, :string
    field :name, :string

    has_many :supplies, Supply

    timestamps()
  end

  # Changeset é responsável por receber, fazer casts e validações
  # a partir dele é inserido no BD
  # vem como structs (map vazio)
  # no iex: %Inmana.Restaurant{}
  def changeset(params) do
    %__MODULE__{}
    # é o this do funcional
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    # para teste:
    # alias Inmana.Restaurant
    # alias Inmana.Repo
    # changeset = Restaurant.changeset(%{name: "teste", email: "teste@teste.com"})
    # changeset |> Repo.insert()

    # %{name: "b"} |> Restaurant.changeset()
    |> validate_length(:name, min: 2)
    |> validate_format(:email, ~r/@/)
    |> unique_constraint([:email])
  end
end
