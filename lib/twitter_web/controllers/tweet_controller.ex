defmodule TwitterWeb.TweetController do
  use TwitterWeb, :controller

  alias Twitter.Management
  alias Twitter.Management.Tweet

  action_fallback TwitterWeb.FallbackController

  # Filter by published status tweets
  def index(conn, %{"status" => "published"}) do
    tweets = Management.list_tweets_by_status(true)
    render(conn, "index.json-api", data: tweets)
  end

  def index(conn, %{"status" => _status}) do
    tweets = Management.list_tweets_by_status(false)
    render(conn, "index.json-api", data: tweets)
  end
  ###################################################

  # Filter by user_id
  def index(conn, %{"user" => user_id}) do
    tweets = Management.list_tweets_by_user(user_id)
    render(conn, "index.json-api", data: tweets)
  end

  # Filter by views
  def index(conn, %{"views" => view_count}) do
    tweets = Management.list_tweets_by_view_count(view_count)
    render(conn, "index.json-api", data: tweets)
  end


  # Return all tweets for all users
  def index(conn, _params) do
    tweets = Management.list_tweets()
    render(conn, "index.json-api", data: tweets)
  end

  def create(conn, %{"tweet" => tweet_params}) do
    with {:ok, %Tweet{} = tweet} <- Management.create_tweet(tweet_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.tweet_path(conn, :show, tweet))
      |> render("show.json-api", data: tweet)
    end
  end

  def show(conn, %{"id" => id}) do
    tweet = Management.get_tweet!(id)
    render(conn, "show.json-api", data: tweet)
  end

  def update(conn, %{"id" => id, "tweet" => tweet_params}) do
    tweet = Management.get_tweet!(id)

    with {:ok, %Tweet{} = tweet} <- Management.update_tweet(tweet, tweet_params) do
      render(conn, "show.json-api", data: tweet)
    end
  end

  def delete(conn, %{"id" => id}) do
    tweet = Management.get_tweet!(id)

    with {:ok, %Tweet{}} <- Management.delete_tweet(tweet) do
      send_resp(conn, :no_content, "")
    end
  end
end
