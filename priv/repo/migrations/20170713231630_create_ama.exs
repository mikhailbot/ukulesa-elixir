defmodule Ukulesa.Repo.Migrations.CreateAma do
  use Ecto.Migration

  def change do
    create table(:amas) do
      add :name, :string
      add :full_name, :string
      add :owner_name, :string
      add :owner_id, :integer
      add :avatar_url, :string

      timestamps()
    end

    create unique_index(:amas, [:full_name])

  end
end
