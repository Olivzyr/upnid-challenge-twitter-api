defmodule TwitterWeb.TweetView do
  use TwitterWeb, :view
  use JaSerializer.PhoenixView
  #alias TwitterWeb.TweetView



  attributes [:description, :view_count, :published, :user_id]

end
