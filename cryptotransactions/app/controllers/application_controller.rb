require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    enable :sessions
    set :session_secret, 'secret'
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/" do
    erb :index
  end

  def logged_in?
    !!current_user
  end

  def current_user
    @current_user ||= User.find_by(username: session[:username]) if session[:username]
  end

end
