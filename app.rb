require 'tilt'
require 'hobbit'
require 'hobbit/contrib'
class App < AdderApp::Application
  include Hobbit::Render

  get '/sum' do
    begin
      sum = Adder[*ParamsParser.parse(request.params["values"])]
      results = DB[:results]
      results.insert(
        result: sum
      )
      render "index", { sum: sum, results: results.reverse_order(:id).limit(5) }
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
