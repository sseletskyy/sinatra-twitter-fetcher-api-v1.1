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
    config.consumer_key       = 'bZBJRCLwyoUDy7ZERanqRnL8T' #ENV['consumer_key']
    config.consumer_secret    = 'lrgtnsQrqHGuc1Q6XiGi8siTASqbp8o9opnlf1saqAPVf4GHzs' #ENV['consumer_secret']
    # config.bearer_token       = ENV['bearer_token']
    config.access_token        = '96135709-GN9eCgBc3w7rji2hUappdJt1mzUzqiuwR3YAKrbnR'# ENV['access_token']
    config.access_token_secret = 'QYnPINCDQv5PHV3vUWd7VNTt4gelzMnlHqIbqu9cR6NZI' #ENV['access_token_secret']
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
    File.read(File.join('public', 'index.html'))
  end

end
