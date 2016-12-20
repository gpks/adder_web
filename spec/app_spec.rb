require 'minitest_helper'

describe App do
  include Rack::Test::Methods

  def app
    App.new
  end

  describe 'GET /sum' do
    it 'must provide info when no params' do
      get '/sum'
      last_response.must_be :ok?
      last_response.body.must_match /Provide params/
    end

    it 'must be ok' do
      get '/sum?values=1,2,3'
      last_response.must_be :ok?
      last_response.body.must_match /6/
    end
  end
end
