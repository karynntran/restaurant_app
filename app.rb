require 'bundler'
Bundler.require
require 'active_support'

require_relative 'models/food.rb'
require_relative 'models/party.rb'

ActiveRecord::Base.establish_connection({
	adapter: 'postgresql',
	database: 'food_db'
})

### LANDING PAGE ###

get '/' do

end

### FOOD CRUD ###

get '/foods' do
	@foods = Food.all
	erb :'food/index'
end

get '/foods/new' do
	erb :'food/new'
end

post '/foods' do
	@food = Food.create(params[:food])
	redirect "/foods"
end

get '/foods/:id/edit' do
	@food = Food.find(params[:id])
	erb :'food/edit'
end

patch '/foods/:id' do
	food = Food.find(params[:id])
	food.update(params[:food])
	redirect "/foods/#{food.id}"
end

get '/foods/:id' do
	@food = Food.find(params[:id])
	erb :'food/show'

end

delete '/foods/:id' do
	food = Food.destroy(params[:id])
	redirect "/foods"
end

### PARTY CRUD ###

# get '/parties' do
# end

# get '/parties/new' do
# end

# post '/parties' do
# end

# get '/parties/:id/edit' do
# end

# patch '/parties/:id' do
# end

# get '/parties/:id' do
# end

# delete '/parties/:id' do
# end

# ### OTHER ###
# post '/orders' do
# 	#Creates a new order
# end

# patch '/orders/:id' do
# 	#Change item to no-charge
# end

# delete '/orders' do
# 	#Removes an order
# end

# get '/parties/:id/receipt' do
# 	#Saves the party's receipt data to a file. Displays the content of the receipt. Offer the file for download.
# end

# patch '/parties/:id/checkout' do
# 	#marks the party as paid
# end