defmodule Ukulesa.Github.User do
  @moduledoc """
  Github user schema
  """

  use Ecto.Schema

  schema "github_users" do
    field :email, :string
    field :name, :string
    field :username, :string

    timestamps()
  end
end
