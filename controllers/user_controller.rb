class UsersController < Sinatra::Base
  helpers Sinatra::AuthenticationHelper

  set :views, File.expand_path('../../views',__FILE__)

  set :public_folder, File.expand_path('../../public',__FILE__)

  enable :sessions, :method_override

###ROUTES###

  get '/new' do
    @users = User.all
    erb :'users/new'
  end

  post '/' do
    user = User.new(params[:user])
    user.password = params[:password]
    user.save!
    redirect '/sessions/new'
  end

end