class App < AdderApp::Application
  get '/sum' do
    begin
      Adder[*ParamsParser.parse(request.params["values"])]
    rescue ParamsError
      "Provide params"
    end
  end
end
