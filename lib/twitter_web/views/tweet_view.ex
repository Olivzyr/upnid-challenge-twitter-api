defmodule TwitterWeb.TweetView do
  use TwitterWeb, :view
  use JaSerializer.PhoenixView
  #alias TwitterWeb.TweetView



  attributes [:user_id, :description, :view_count, :published, :like ]

end
