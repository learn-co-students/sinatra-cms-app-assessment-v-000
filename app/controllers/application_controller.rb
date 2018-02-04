require 'pry'

class ApplicationController < Sinatra::Base

  set :public_folder, 'public'
  set :views, 'app/views'
  set :session_secret, "secret"
  enable :sessions
  register Sinatra::Flash

  get '/' do
    if !logged_in?
      @musician = nil
      #needs to be here for the layout erb to load
    else
      @musician = current_user
    end
    erb :'application/root'
  end

  helpers do
    def current_user
      @current_user ||= Musician.find(session[:id])
    end

    def logged_in?
      if session[:id]
        true
      else
        false
      end
    end
  end
end
