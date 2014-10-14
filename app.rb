require 'bundler'
Bundler.require
require 'activesupport'

require_relative 'models/food.rb'
require_relative 'models/party.rb'

ActiveRecord::Base.establish_connection({
	adapter: 'postgresql',
	database: ''
})

