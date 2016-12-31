require 'bundler'

Bundler.require :default, :production

module AdderApp
  class Application < Hobbit::Base
    Dir[File.join('lib', '**/*.rb')].each { |file| require File.expand_path(file) }
    require './app.rb'
  end
end
