defmodule Twitter.Management do
  @moduledoc """
  The Management context.
  """

  import Ecto.Query, warn: false
  alias Twitter.Repo

  alias Twitter.Management.User

  @doc """
  Returns the list of users.

  ## Examples

      iex> list_users()
      [%User{}, ...]

  """
  def list_users do
    Repo.all(User)
  end



  @doc """
  Gets a single user.

  Raises `Ecto.NoResultsError` if the User does not exist.

  ## Examples

      iex> get_user!(123)
      %User{}

      iex> get_user!(456)
      ** (Ecto.NoResultsError)

  """
  def get_user!(identifier), do: user_by_id_or_name(identifier)

  # Search user by id or name params
  defp user_by_id_or_name(identifier) when is_integer(identifier) do
    Repo.get!(User, identifier)
  end

  defp user_by_id_or_name(identifier) when is_binary(identifier) do
    case Integer.parse(identifier) do
      {int, ""} ->
        user_by_id_or_name(int)
      _error ->
        User
        |> where(name: ^identifier)
        |> Repo.one!()
    end
  end


  def create_user(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a user.

  ## Examples

      iex> update_user(user, %{field: new_value})
      {:ok, %User{}}

      iex> update_user(user, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_user(%User{} = user, attrs) do
    user
    |> User.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a User.

  ## Examples

      iex> delete_user(user)
      {:ok, %User{}}

      iex> delete_user(user)
      {:error, %Ecto.Changeset{}}

  """
  def delete_user(%User{} = user) do
    Repo.delete(user)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking user changes.

  ## Examples

      iex> change_user(user)
      %Ecto.Changeset{source: %User{}}

  """
  def change_user(%User{} = user) do
    User.changeset(user, %{})
  end

  alias Twitter.Management.Tweet

  @doc """
  Returns the list of tweets.

  ## Examples

      iex> list_tweets()
      [%Tweet{}, ...]

  """
  # # Filter by published status tweets
  def list_tweets(%{"status" => "published"}), do: list_tweets_by_status(true)
  def list_tweets(%{"status" => _}), do: list_tweets_by_status(false)

  # # Filter by user_id
  def list_tweets(%{"user" => user_id}), do: list_tweets_by_user(user_id)

  # # Filter by views
  def list_tweets(%{"views" => view_count}), do: list_tweets_by_view_count(view_count)

  # List all tweets for all users
  def list_tweets(_) do
    Repo.all(Tweet)
  end


  # List tweets by published status
  defp list_tweets_by_status(status) do
    Tweet
    |> Ecto.Query.preload([:user])
    |> where(published: ^status)
    |> Repo.all()
  end

  # List tweets by user
  defp list_tweets_by_user(user_id) do
    Tweet
    |> Ecto.Query.preload([:user])
    |> where(user_id: ^user_id)
    |> Repo.all()
  end

  # List tweets by view in crescent form
  defp list_tweets_by_view_count(view_count) do
    Tweet
    |> Ecto.Query.preload([:user])
    |> where([d], d.view_count >= ^view_count)
    |> Repo.all()
  end

  @doc """
  Gets a single tweet.

  Raises `Ecto.NoResultsError` if the Tweet does not exist.

  ## Examples

      iex> get_tweet!(123)
      %Tweet{}

      iex> get_tweet!(456)
      ** (Ecto.NoResultsError)

  """
  def get_tweet!(id), do: Repo.get!(Tweet, id)

  @doc """
  Creates a tweet.

  ## Examples

      iex> create_tweet(%{field: value})
      {:ok, %Tweet{}}

      iex> create_tweet(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_tweet(attrs \\ %{}) do
    %Tweet{}
    |> Tweet.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a tweet.

  ## Examples

      iex> update_tweet(tweet, %{field: new_value})
      {:ok, %Tweet{}}

      iex> update_tweet(tweet, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_tweet(%Tweet{} = tweet, attrs) do
    tweet
    |> Tweet.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Tweet.

  ## Examples

      iex> delete_tweet(tweet)
      {:ok, %Tweet{}}

      iex> delete_tweet(tweet)
      {:error, %Ecto.Changeset{}}

  """
  def delete_tweet(%Tweet{} = tweet) do
    Repo.delete(tweet)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking tweet changes.

  ## Examples

      iex> change_tweet(tweet)
      %Ecto.Changeset{source: %Tweet{}}

  """
  def change_tweet(%Tweet{} = tweet) do
    Tweet.changeset(tweet, %{})
  end
end
