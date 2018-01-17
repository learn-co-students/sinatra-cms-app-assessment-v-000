require './config/environment'

class ApplicationController < Sinatra::Base

  set :public_folder, 'public'
  set :views, 'app/views'
  set :session_secret, "secret"
  enable :sessions
  use Rack::Flash

  get '/' do
    erb :'application/root'
  end
end
