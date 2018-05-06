defmodule Newapp.Router do
  use Newapp.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Newapp.Auth, repo: Newapp.Repo
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Newapp do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/posts", PostController
    resources "/users", UserController, only: [:index, :show, :new, :create]
    resources "/sessions", SessionController, only: [:new, :create, :delete]
  end

  # Other scopes may use custom stacks.
  # scope "/api", Newapp do
  #   pipe_through :api
  # end
end
