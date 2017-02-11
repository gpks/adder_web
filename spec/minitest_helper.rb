ENV['RACK_ENV'] = 'test'
ENV['DATABASE_URL'] = 'postgres://gosia:@localhost/adder_test'

require 'bundler'
Bundler.require :default, ENV['RACK_ENV'].to_sym

require File.expand_path('../../config/application', __FILE__)
DB = Memory.set
