require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "dreamteams"
  end


  get '/' do
    erb :index
    #welcome to dream teams!!!
  end

end
