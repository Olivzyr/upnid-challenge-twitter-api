defmodule TwitterWeb.UserController do
  use TwitterWeb, :controller

  alias Twitter.Management
  alias Twitter.Management.User

  action_fallback TwitterWeb.FallbackController

  def index(conn, _params) do
    users = Management.list_users()
    render(conn, "index.json-api", data: users)
  end

  def create(conn, %{"user" => user_params}) do
    with {:ok, %User{} = user} <- Management.create_user(user_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.user_path(conn, :show, user))
      |> render("show.json-api", data: user)
    end
  end

  def show(conn, %{"id" => id}) do
    user = Management.get_user!(id)
    render(conn, "show.json-api", data: user)
  end

  def update(conn, %{"id" => id, "user" => user_params}) do
    user = Management.get_user!(id)

    with {:ok, %User{} = user} <- Management.update_user(user, user_params) do
      render(conn, "show.json-api", data: user)
    end
  end

  def delete(conn, %{"id" => id}) do
    user = Management.get_user!(id)

    with {:ok, %User{}} <- Management.delete_user(user) do
      send_resp(conn, :no_content, "")
    end
  end
end
