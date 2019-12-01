defmodule TwitterWeb.TweetView do
  use TwitterWeb, :view
  alias TwitterWeb.TweetView

  def render("index.json", %{tweets: tweets}) do
    %{data: render_many(tweets, TweetView, "tweet.json")}
  end

  def render("show.json", %{tweet: tweet}) do
    %{data: render_one(tweet, TweetView, "tweet.json")}
  end

  def render("tweet.json", %{tweet: tweet}) do
    %{id: tweet.id,
      description: tweet.description,
      view_count: tweet.view_count,
      published: tweet.published,
      user_id: tweet.user_id}
  end
end
