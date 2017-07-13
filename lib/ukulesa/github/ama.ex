defmodule Ukulesa.Github.Ama do
  @moduledoc """
  Github user schema
  """

  use Ecto.Schema

  schema "amas" do
    field :name, :string
    field :full_name, :string
    field :owner_name, :string
    field :owner_id, :integer
    field :avatar_url, :string
    timestamps()
  end
end
