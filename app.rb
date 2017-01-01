class App < AdderApp::Application
  get '/sum' do
    begin
      Adder[*ParamsParser.parse(request.params["values"])]
    rescue ParamsError
      "Provide params"
    end
  end

  get '/' do
    "Go to the /sum?values=1,2,3 url"
  end

  get '/app' do
    "My app"
  end
end
