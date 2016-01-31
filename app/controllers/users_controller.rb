class UsersController < ApplicationController
  def say
    line = params[:line]

    client = Twitter::REST::Client.new do |config|
      config.consumer_key = ENV["TWITTER_KEY"]
      config.consumer_secret = ENV["TWITTER_SECRET"]
      config.access_token = current_user.oauth_token
      config.access_token_secret = current_user.oauth_secret
    end

    msg = "#{line} #{root_url}"
    tweet = client.update(msg)
    redirect_to tweet.uri.to_s
  end
end
