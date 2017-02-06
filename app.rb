require 'tilt'
require 'hobbit'
require 'hobbit/contrib'
class App < AdderApp::Application
  include Hobbit::Render

  get '/sum' do
    begin
      sum = Adder[*ParamsParser.parse(request.params["values"])]
      ResultSaver.save(sum)
      ResultFetcher.fetch
      render "index", { sum: sum, results: ResultFetcher.fetch }
    rescue ParamsError
      "Provide params"
    end
  end

  get '/' do
    "Go to the /sum?values=1,2,3 url"
  end

  get '/test' do
    "My test"
  end
end
