class SessionsController < Sinatra::Base
  helpers Sinatra::AuthenticationHelper

  set :views, File.expand_path('../../views',__FILE__)

  set :public_folder, File.expand_path('../../public',__FILE__)

  enable :sessions, :method_override

###ROUTES###

  get '/new' do
    erb :'sessions/new'
  end

  post '/' do
    redirect '/sessions/new' unless user = User.find_by({username: params[:username]})
    if user.password == params[:password]
      session[:current_user] = user.id
      redirect '/'
    else
      redirect '/users/new'
    end
  end

  delete '/' do
    authenticate!
    session[:current_user] = nil
    redirect '/'
  end

end