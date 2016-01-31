class MiscController < ApplicationController
  def home
  end

  def say
    client = Twitter::REST::Client.new do |config|
      config.consumer_key = ENV["TWITTER_KEY"]
      config.consumer_secret = ENV["TWITTER_SECRET"]
      config.access_token = current_user.oauth_token
      config.access_token_secret = current_user.oauth_secret
    end

    msg = "進捗ダメです #{root_url}"
    client.update(msg)

    redirect_to root_path
  end
end
