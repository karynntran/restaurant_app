require 'bundler'
Bundler.require
require 'active_support'
require 'pry'

require_relative 'models/food.rb'
require_relative 'models/party.rb'
require_relative 'models/order.rb'

ActiveRecord::Base.establish_connection({
	adapter: 'postgresql',
	database: 'restaurant_db'
})

### LANDING PAGE ###

get '/' do
	erb :index
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

	if @food.valid?
		redirect '/foods'
	else
	    @errors = @food.errors.full_messages
	    erb :'food/new'
	end
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

get '/parties' do
	@parties = Party.all
	erb :'party/index'
end

get '/parties/new' do
	erb :'party/new'
end

post '/parties' do
	@party = Party.create(params[:party])
	redirect "/parties"
end

get '/parties/:id/edit' do
	@party = Party.find(params[:id])
	erb :'party/edit'
end

patch '/parties/:id' do
	party = Party.find(params[:id])
	party.update(params[:party])
	redirect "/parties/#{party.id}"
end

get '/parties/:id' do
	@party = Party.find(params[:id])
	@orders = Order.where(party_id: params[:id])
	erb :'party/show'
end

delete '/parties/:id' do
	party = Party.destroy(params[:id])
	redirect "/parties"
end

### ORDER FROM PARTIES###
get '/parties/:id/orders' do
	erb :'orders/index'
end

get '/parties/:id/orders/new' do
	@foods = Food.all
	@party = Party.find(params[:id])
	erb :'orders/new'
end

post '/parties/:id/orders' do
	@party = Party.find(params[:id])
	order = Order.create(params[:order])
	redirect "/parties/#{@party.id}"
end

# patch '/orders/:id' do
# 	# @order = Order.find(params[:id])
# 	# @order.update(params[:order])
# 	redirect "/parties/#{party.id}"
# end

delete '/orders' do
	party = Party.find(params[:party][:id])
	Order.destroy(params[:order][:id])
	redirect "/parties/#{party.id}"
end

# get '/parties/:id/receipt' do
# 	# @party = Party.find(params[:id])

# 	# file = File.open('receipt.txt', 'w')

# 	# @orders = Order.where(party_id: params[:id])
# 	# @orders.each do |order|
# 	# 	file.write([order.food.name, order.food.price])
# 	# end
# 	# file.close
# 	# erb :'party/receipt'

# 	#Saves the party's receipt data to a file. Displays the content of the receipt. Offer the file for download.
# end

# patch '/parties/:id/checkout' do
# 	#marks the party as paid
# end