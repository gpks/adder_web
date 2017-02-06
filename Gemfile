source 'https://rubygems.org'

gem 'hobbit', github: 'patriciomacadden/hobbit'
gem 'hobbit-contrib', github: 'patriciomacadden/hobbit-contrib', require: 'hobbit/contrib'
gem 'adder', github: 'gpks/adder_gem'
gem 'unicorn'
gem 'bundler'
gem 'sequel'
gem 'pg'
gem 'tilt'
gem 'dotenv'
gem 'redis'

group :development do
  gem 'better_errors'
  gem 'rake'
  gem 'rvm1-capistrano3', require: false
  gem 'capistrano3-unicorn'
  gem 'capistrano-bundler'
  gem "capistrano", "~> 3.7"
end

group :test do
  gem 'minitest', require: 'minitest/autorun'
  gem 'rack-test', require: 'rack/test'
end
