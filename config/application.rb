require 'bundler'

Bundler.require :default, ENV['RACK_ENV'].to_sym

module AdderApp
  class Application < Hobbit::Base
    Dir[File.join('lib', '**/*.rb')].each { |file| require File.expand_path(file) }
    require './app.rb'

    use BetterErrors::Middleware if ENV['RACK_ENV'].to_sym == :development

    map('/') { run App.new }
  end
end
