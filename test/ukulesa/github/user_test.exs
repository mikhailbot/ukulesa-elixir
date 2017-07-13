defmodule Ukulesa.UserTest do
  use Ukulesa.DataCase

  alias Ukulesa.Github

  @create_user_attrs %{email: "some email", name: "some name", username: "some username"}

  def fixture(type, attrs \\ %{})
  def fixture(:user, attrs) do
    {:ok, user} = Github.create_user(attrs)
    user
  end

  test "get_user_by_username/1 returns an existing user" do
    user = fixture(:user, @create_user_attrs)
    assert user == Github.get_user_by_username(user.username)
  end

  test "login_or_register_from_github/1 returns a user after creating one" do
    auth_info = %{
      name: "Mikhail Delport",
      nickname: "mikhailbot",
      email: "mikhail@delport.ca",
      avatar_url: "http://awesome.avatar"
    }
    result = Github.login_or_register_from_github(auth_info)
    assert {:ok, user} = result
    assert user.email == "mikhail@delport.ca"
  end

  test "login_or_register_from_github/1 returns a user if it already exists" do
    auth_info = %{
      name: "Mikhail Delport",
      nickname: "mikhailbot",
      email: "mikhail@delport.ca",
      avatar_url: "http://awesome.avatar"
    }
    Github.login_or_register_from_github(auth_info)
    result = Github.login_or_register_from_github(auth_info)
    assert {:ok, user} = result
    assert user.email == "mikhail@delport.ca"
  end

end
