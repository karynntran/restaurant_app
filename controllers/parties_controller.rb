class PartiesController < Sinatra::Base
  helpers Sinatra::AuthenticationHelper
  helpers Sinatra::FormHelper
  helpers Sinatra::LinkHelper
  helpers ActiveSupport::Inflector

  set :views, File.expand_path('../../views',__FILE__)

  set :public_folder, File.expand_path('../../public',__FILE__)

  enable :sessions, :method_override

  ### PARTY CRUD ###

  get '/' do
    authenticate!

    @parties = Party.all
    @current_parties = Party.where(paid: false)
    @paid_parties = Party.where(paid: true)
    erb :'party/index'
  end

  get '/new' do
    authenticate!

    erb :'party/new'
  end

  post '/' do
    authenticate!
    @party = Party.create(params[:party])
    redirect "/parties"
  end

  get '/:id/edit' do
    authenticate!

    @party = Party.find(params[:id])
    erb :'party/edit'
  end

  patch '/:id' do
    authenticate!
    party = Party.find(params[:id])
    party.update(params[:party])
    redirect "/parties/#{party.id}"
  end

  get '/:id' do
    authenticate!

    @party = Party.find(params[:id])
    @orders = Order.where(party_id: params[:id])

    @paid_status = @party.paid ? "Paid" : "Not Paid"

    begin
      @party.add_food_for_paid
    rescue Party::AddNewFoodforPaid => e
      @error = e
    end

    erb :'party/show'
  end

  delete '/:id' do
    authenticate!
    party = Party.destroy(params[:id])
    redirect "/parties"
  end

  patch '/:id/checkout' do
    authenticate!
    party = Party.find(params[:id])
    party.update(params[:paid])
  end

  ### ORDER FROM PARTIES###
  get '/:id/orders' do
    authenticate!

    erb :'orders/index'
  end

  get '/:id/orders/new' do
    authenticate!

    @foods = Food.all
    @party = Party.find(params[:id])
    erb :'orders/new'
  end

  post '/:id/orders' do
    authenticate!
    @party = Party.find(params[:id])
    order = Order.create(params[:order])
    redirect "/parties/#{@party.id}"
  end



  #####RECEIPTS AND CHECKOUT ######

  get '/:id/receipt' do
    authenticate!

    @party = Party.find(params[:id])
    @orders = Order.where(party_id: params[:id])
    @food = Order.where(id: params[:id])

    file = File.open('receipt.txt', 'w')

    @orders.each do |order|
      file.write([order.food.name, order.food.price])
    end
    file.close

    erb :'party/receipt'
  end
end