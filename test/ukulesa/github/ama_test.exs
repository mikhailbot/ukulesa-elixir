defmodule Ukulesa.AmaTest do
  use Ukulesa.DataCase

  alias Ukulesa.Github

  @create_ama_attrs %{full_name: "something/ama", owner_name: "some name", owner_id: 1234, avatar_url: "http://awesome.avatar"}

  def fixture(type, attrs \\ %{})
  def fixture(:ama, attrs) do
    {:ok, ama} = Github.create_ama(attrs)
    ama
  end

  test "get_ama_by_fullname/1 returns an existing ama" do
    ama = fixture(:ama, @create_ama_attrs)
    assert ama == Github.get_ama_by_full_name(ama.full_name)
  end

  test "ignore_or_create_ama/1 returns an ama after creating one" do
    result = Github.ignore_or_create_ama(@create_ama_attrs)
    assert {:ok, ama} = result
    assert ama.full_name == "something/ama"
  end

  test "ignore_or_create_ama/1 returns a ama if it already exists" do
    Github.ignore_or_create_ama(@create_ama_attrs)
    result = Github.ignore_or_create_ama(@create_ama_attrs)
    assert {:ok, ama} = result
    assert ama.full_name == "something/ama"
  end

end
