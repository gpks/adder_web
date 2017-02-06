require 'bundler'
require 'dotenv'

Bundler.require :default, :production

module AdderApp
  class Application < Hobbit::Base
    Dotenv.load
    Dir[File.join('lib', '**/*.rb')].each { |file| require File.expand_path(file) }
    require './app.rb'
  end
end
