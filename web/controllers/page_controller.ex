defmodule Newapp.PageController do
  use Newapp.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
