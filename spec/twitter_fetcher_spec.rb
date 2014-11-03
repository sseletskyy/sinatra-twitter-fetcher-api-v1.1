require File.dirname(__FILE__) + '/spec_helper'
set :environment, :test

describe "Simple Sinatra Twitter Fetcher Test" do
  include Rack::Test::Methods

  def app
    @app ||= Sinatra::Application
    # @app ||= rspeTwitterFetcher
  end

  # Do a root test
  it "should respond to /" do
    get '/'
    last_response.should be_ok
  end
end