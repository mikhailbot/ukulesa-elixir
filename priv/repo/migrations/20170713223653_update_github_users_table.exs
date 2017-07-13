defmodule Ukulesa.Repo.Migrations.UpdateGithubUsersTable do
  use Ecto.Migration

  def change do
    alter table(:github_users) do
      add :avatar_url, :string
      add :sent_welcome_email, :boolean
      add :notification_schedule, :integer, default: 1
      add :last_notified, :naive_datetime
    end

  end
end
