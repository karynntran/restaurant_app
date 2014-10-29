class FoodsController < Sinatra::Base
  helpers Sinatra::AuthenticationHelper
  helpers Sinatra::FormHelper
  helpers Sinatra::LinkHelper
  helpers ActiveSupport::Inflector

  set :views, File.expand_path('../../views',__FILE__)

  set :public_folder, File.expand_path('../../public',__FILE__)

  enable :sessions, :method_override

  get '/' do
    authenticate!

    @foods = Food.all
    erb :'food/index'
  end

  get '/new' do
    authenticate!

    erb :'food/new'
  end

  post '/' do
    @food = Food.create(params[:food])

    if @food.valid?
      redirect '/foods'
    else
        @errors = @food.errors.full_messages
        erb :'food/new'
    end
  end

  get '/:id/edit' do
    authenticate!

    @food = Food.find(params[:id])
    erb :'food/edit'
  end

  patch '/:id' do
    authenticate!
    food = Food.find(params[:id])
    food.update(params[:food])
    redirect "/foods/#{food.id}"
  end

  get '/:id' do
    authenticate!

    @food = Food.find(params[:id])
    erb :'food/show'

  end

  delete '/:id' do
    authenticate!
    food = Food.destroy(params[:id])
    redirect "/foods"
  end

end
