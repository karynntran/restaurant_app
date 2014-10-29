class ApplicationController < Sinatra::Base
  helpers Sinatra::AuthenticationHelper
  helpers Sinatra::FormHelper
  helpers Sinatra::LinkHelper
  helpers ActiveSupport::Inflector

  ActiveRecord::Base.establish_connection({
    adapter: 'postgresql',
    database: 'restaurant_db'
  })

  set :views, File.expand_path('../../views',__FILE__)

  set :public_folder, File.expand_path('../../public',__FILE__)

  enable :sessions, :method_override



###routes###

  get '/' do
    current_user
    erb :home, :layout => false
  end

  delete '/orders' do
    authenticate!

    party = Party.find(params[:party][:id])
    Order.destroy(params[:order][:id])
    redirect "/parties/#{party.id}"
  end

end