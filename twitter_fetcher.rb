require 'sinatra'
require 'sinatra/jsonp'
require 'rubygems'
require 'twitter'

class TwitterFetcher < Sinatra::Base
  helpers Sinatra::Jsonp

  @@twitter_client = Twitter::Client.new(
    :consumer_key       => ENV['consumer_key'],
    :consumer_secret    => ENV['consumer_secret'],
    :oauth_token        => ENV['oauth_token'],
    :oauth_token_secret => ENV['oauth_token_secret'],
  )

  get '/' do
    jsonp @@twitter_client.user_timeline("sseletskyy")
    # jsonp @@twitter_client.home_timeline.map(&:attrs)
  end

end
