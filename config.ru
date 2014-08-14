require './twitter_fetcher'
require './env' if File.exists?('env.rb')

run TwitterFetcher
