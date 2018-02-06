class ApplicationController < Sinatra::Base

  set :public_folder, 'public'
  set :views, 'app/views'
  set :session_secret, "secret"
  enable :sessions
  register Sinatra::Flash

  helpers do
    def current_user
      @current_user ||= Musician.find(session[:id])
    end

    def logged_in?
      !!session[:id]
    end
  end
end
