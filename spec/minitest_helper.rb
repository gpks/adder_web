ENV['RACK_ENV'] = 'test'

require 'bundler'
Bundler.require :default, ENV['RACK_ENV'].to_sym
DB = Sequel.connect('postgres://gosia:@localhost/adder_test')

require File.expand_path('../../config/application', __FILE__)
