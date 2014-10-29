require 'bundler'
Bundler.require(:default)
Dir.glob('./{helpers,models,controllers}/*.rb').each do |file|
	require file
	puts "required #{file}"
end


map('/foods'){ run FoodsController }

map('/parties'){ run PartiesController }

map('/users'){ run UsersController }

map('/sessions'){ run SessionsController }

map('/'){ run ApplicationController }
