require File.expand_path('../config/application', __FILE__)

connection_string = 'postgres://gosia:@localhost/adder_development'
puts ENV["DATABASE_URL"]
DB = Sequel.connect(ENV["DATABASE_URL"] || connection_string)

run App.new
