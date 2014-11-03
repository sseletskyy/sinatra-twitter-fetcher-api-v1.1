require 'rubygems'
require 'sinatra'
require 'sinatra/jsonp'
require 'twitter'
# require 'slim'

# require 'net/http'
# require 'uri'


class TwitterFetcher < Sinatra::Base
  helpers Sinatra::Jsonp

  @@twitter_client = Twitter::REST::Client.new do |config|
    config.consumer_key       = ENV['consumer_key']
    config.consumer_secret    = ENV['consumer_secret']
    # config.bearer_token       = ENV['bearer_token']
    config.access_token        = ENV['access_token']
    config.access_token_secret = ENV['access_token_secret']
  end

  get '/tweets' do
    result = @@twitter_client.user_timeline("katyperry")
    # result.each do |item|
      # puts item.attrs
      # puts '--------'
    # end
    jsonp result.map(&:attrs)
  end

  # set :public_folder, 'public'
  # get "/" do
  #   redirect '/index.html'
  # end
  get '/' do
    # AngularJS app
    File.read(File.join('public', 'index.html'))
  end

end
