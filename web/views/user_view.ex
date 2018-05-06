defmodule Newapp.UserView do
  use Newapp.Web, :view
  alias Newapp.User
  def first_name(%User{name: name}) do
    name
    |> String.split(" ")
    |> Enum.at(0)
  end
end
