require 'minitest_helper'

describe AdderApp::Application do
  include Rack::Test::Methods

  def app
    AdderApp::Application.new
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
