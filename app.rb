# require 'bundler'
# Bundler.require
# require 'active_support'
# require 'pry'

# #### MODELS ###
# require_relative 'models/food.rb'
# require_relative 'models/party.rb'
# require_relative 'models/order.rb'
# require_relative 'models/user.rb'

# #### HELPERS ###

# require_relative 'helpers/link_helper'
# require_relative 'helpers/form_helper'
# helpers ActiveSupport::Inflector

# #### CONNECTION ###

# require_relative 'connection'

# get '/console' do
# 	binding.pry
# end

# # ### LANDING PAGE ###

# # get '/' do
# # 	erb :home
# # end

# ### SIGN IN ###

# # get '/users/new' do
# # 	@users = User.all
# # 	erb :'users/new'
# # end

# # ### FOOD CRUD ###

# # get '/foods' do
# # 	@foods = Food.all
# # 	erb :'food/index'
# # end

# # get '/foods/new' do
# # 	erb :'food/new'
# # end

# # post '/foods' do
# # 	@food = Food.create(params[:food])

# # 	if @food.valid?
# # 		redirect '/foods'
# # 	else
# # 	    @errors = @food.errors.full_messages
# # 	    erb :'food/new'
# # 	end
# # end

# # get '/foods/:id/edit' do
# # 	@food = Food.find(params[:id])
# # 	erb :'food/edit'
# # end

# # patch '/foods/:id' do
# # 	food = Food.find(params[:id])
# # 	food.update(params[:food])
# # 	redirect "/foods/#{food.id}"
# # end

# # get '/foods/:id' do
# # 	@food = Food.find(params[:id])
# # 	erb :'food/show'

# # end

# # delete '/foods/:id' do
# # 	food = Food.destroy(params[:id])
# # 	redirect "/foods"
# # end

# ### PARTY CRUD ###

# get '/parties' do
# 	@parties = Party.all
# 	@current_parties = Party.where(paid: false)
# 	@paid_parties = Party.where(paid: true)
# 	erb :'party/index'
# end

# get '/parties/new' do
# 	erb :'party/new'
# end

# post '/parties' do
# 	@party = Party.create(params[:party])
# 	redirect "/parties"
# end

# get '/parties/:id/edit' do
# 	@party = Party.find(params[:id])
# 	erb :'party/edit'
# end

# patch '/parties/:id' do
# 	party = Party.find(params[:id])
# 	party.update(params[:party])
# 	redirect "/parties/#{party.id}"
# end

# get '/parties/:id' do
# 	@party = Party.find(params[:id])
# 	@orders = Order.where(party_id: params[:id])

# 	@paid_status = @party.paid ? "Paid" : "Not Paid"

# 	begin
# 		@party.add_food_for_paid
# 	rescue Party::AddNewFoodforPaid => e
# 		@error = e
# 	end

# 	erb :'party/show'
# end

# delete '/parties/:id' do
# 	party = Party.destroy(params[:id])
# 	redirect "/parties"
# end

# patch '/parties/:id/checkout' do
# 	party = Party.find(params[:id])
# 	party.update(params[:paid])
# end

# ### ORDER FROM PARTIES###
# get '/parties/:id/orders' do
# 	erb :'orders/index'
# end

# get '/parties/:id/orders/new' do
# 	@foods = Food.all
# 	@party = Party.find(params[:id])
# 	erb :'orders/new'
# end

# post '/parties/:id/orders' do
# 	@party = Party.find(params[:id])
# 	order = Order.create(params[:order])
# 	redirect "/parties/#{@party.id}"
# end

# delete '/orders' do
# 	party = Party.find(params[:party][:id])
# 	Order.destroy(params[:order][:id])
# 	redirect "/parties/#{party.id}"
# end

# #####RECEIPTS AND CHECKOUT ######

# get '/parties/:id/receipt' do
# 	@party = Party.find(params[:id])
# 	@orders = Order.where(party_id: params[:id])
# 	@food = Order.where(id: params[:id])

# 	file = File.open('receipt.txt', 'w')

# 	@orders.each do |order|
# 		file.write([order.food.name, order.food.price])
# 	end
# 	file.close

# 	erb :'party/receipt'
# end



