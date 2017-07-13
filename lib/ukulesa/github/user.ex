defmodule Ukulesa.Github.User do
  @moduledoc """
  Github user schema
  """

  use Ecto.Schema

  schema "github_users" do
    field :email, :string
    field :name, :string
    field :username, :string
    field :avatar_url, :string
    field :sent_welcome_email, :boolean
    field :notification_schedule, :integer, default: 1
    field :last_notified, :naive_datetime
    timestamps()
  end
end
