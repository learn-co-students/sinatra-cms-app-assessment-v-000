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

  helpers do
    def redirect_if_not_logged_in
      if !Helpers.logged_in?(session)
        redirect "/login?error=You have to be logged in to do that"
      end
    end
  end


end
