class App < AdderApp::Application
  require 'Adder'
  get '/sum' do
    Adder[*ParamsParser.parse(request.params)]
  end
end
