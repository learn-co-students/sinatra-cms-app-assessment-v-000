require './config/environment'

class ApplicationController < Sinatra::Base
  configure do
    set :views, 'app/views'
    set :public_folder, 'public'
    enable :session
    set :session_secret, "arcticmonkeys"
  end

  get '/' do
    erb :index
  end
end