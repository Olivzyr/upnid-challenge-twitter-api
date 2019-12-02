defmodule Twitter.ManagementTest do
  use Twitter.DataCase

  alias Twitter.Management

  describe "users" do
    alias Twitter.Management.User

    @valid_attrs %{name: "some name", tweet: "some tweet"}
    @update_attrs %{name: "some updated name", tweet: "some updated tweet"}
    @invalid_attrs %{name: nil, tweet: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Management.create_user()

      user
    end

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Management.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Management.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Management.create_user(@valid_attrs)
      assert user.name == "some name"
      assert user.tweet == "some tweet"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Management.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, %User{} = user} = Management.update_user(user, @update_attrs)
      assert user.name == "some updated name"
      assert user.tweet == "some updated tweet"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Management.update_user(user, @invalid_attrs)
      assert user == Management.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Management.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Management.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Management.change_user(user)
    end
  end

  describe "tweets" do
    alias Twitter.Management.Tweet

    @valid_attrs %{created_at: ~D[2010-04-17], description: "some description"}
    @update_attrs %{created_at: ~D[2011-05-18], description: "some updated description"}
    @invalid_attrs %{created_at: nil, description: nil}

    def tweet_fixture(attrs \\ %{}) do
      {:ok, tweet} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Management.create_tweet()

      tweet
    end

    test "list_tweets/0 returns all tweets" do
      tweet = tweet_fixture()
      assert Management.list_tweets() == [tweet]
    end

    test "get_tweet!/1 returns the tweet with given id" do
      tweet = tweet_fixture()
      assert Management.get_tweet!(tweet.id) == tweet
    end

    test "create_tweet/1 with valid data creates a tweet" do
      assert {:ok, %Tweet{} = tweet} = Management.create_tweet(@valid_attrs)
      assert tweet.created_at == ~D[2010-04-17]
      assert tweet.description == "some description"
    end

    test "create_tweet/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Management.create_tweet(@invalid_attrs)
    end

    test "update_tweet/2 with valid data updates the tweet" do
      tweet = tweet_fixture()
      assert {:ok, %Tweet{} = tweet} = Management.update_tweet(tweet, @update_attrs)
      assert tweet.created_at == ~D[2011-05-18]
      assert tweet.description == "some updated description"
    end

    test "update_tweet/2 with invalid data returns error changeset" do
      tweet = tweet_fixture()
      assert {:error, %Ecto.Changeset{}} = Management.update_tweet(tweet, @invalid_attrs)
      assert tweet == Management.get_tweet!(tweet.id)
    end

    test "delete_tweet/1 deletes the tweet" do
      tweet = tweet_fixture()
      assert {:ok, %Tweet{}} = Management.delete_tweet(tweet)
      assert_raise Ecto.NoResultsError, fn -> Management.get_tweet!(tweet.id) end
    end

    test "change_tweet/1 returns a tweet changeset" do
      tweet = tweet_fixture()
      assert %Ecto.Changeset{} = Management.change_tweet(tweet)
    end
  end
end
