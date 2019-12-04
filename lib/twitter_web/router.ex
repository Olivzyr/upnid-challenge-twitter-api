defmodule TwitterWeb.Router do
  use TwitterWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end


  pipeline :json_api do
      plug :accepts, ["json-api"]
      plug JaSerializer.Deserializer
    end

    scope "/", TwitterWeb do
    pipe_through :browser

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  scope "/api", TwitterWeb do
    pipe_through :api

    resources "/tweets", TweetController, only: [:index, :create]

    get "/tweets/:id", TweetController, :show
    put "/tweets/:id/like", TweetController, :update

    ## Routers for sessions ##
    get "/login", SessionController, :new
    post "/login", SessionController, :create
    delete "/logout", SessionController, :delete

    resources "/users", UserController


  end
end
