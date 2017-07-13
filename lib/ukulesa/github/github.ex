defmodule Ukulesa.Github do
  @moduledoc """
  The boundary for Github content
  """

  import Ecto.{Query, Changeset}, warn: false
  alias Ukulesa.Repo

  alias Ukulesa.Github.User

  @doc """
  Creates a user.
  ## Examples
      iex> create_user(%{field: value})
      {:ok, %User{}}
      iex> create_user(%{field: bad_value})
      {:error, %Ecto.Changeset{}}
  """
  def create_user(attrs \\ %{}) do
    %User{}
    |> user_changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Gets a single user.
  Raises `Ecto.NoResultsError` if the User does not exist.
  ## Examples
      iex> get_user!(123)
      %User{}
      iex> get_user!(456)
      ** (Ecto.NoResultsError)
  """
  def get_user!(id), do: Repo.get!(User, id)

  def get_user_by_username(username), do: Repo.get_by(User, %{username: username})

  def login_or_register_from_github(%{nickname: nickname, name: name, email: email, avatar_url: avatar_url}) do
    case get_user_by_username(nickname) do
      nil ->
        create_user(%{email: email, name: name, username: nickname, avatar_url: avatar_url})
      user ->
        {:ok, user}
    end
  end

  defp user_changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:username, :email, :name, :avatar_url])
    |> validate_required([:username, :email, :name])
    |> unique_constraint(:username)
  end
end
