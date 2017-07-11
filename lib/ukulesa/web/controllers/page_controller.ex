defmodule Ukulesa.Web.PageController do
  use Ukulesa.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
