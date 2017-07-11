defmodule Ukulesa.Repo.Migrations.CreateUkulesa.Github.User do
  use Ecto.Migration

  def change do
    create table(:github_users) do
      add :username, :string
      add :email, :string
      add :name, :string

      timestamps()
    end

    create unique_index(:github_users, [:username])

  end
end
