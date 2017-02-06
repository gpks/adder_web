require File.expand_path('../config/application', __FILE__)

DB = Sequel.connect(ENV["DATABASE_URL"])

run App.new
