require './config/environment'
require 'rack-flash'

class ApplicationController < Sinatra::Base

  use Rack::Flash

  configure do
    set :public_folder, 'public'
    set :views, 'application/views'
    enable :sessions
    set :session_secret, "secret"
  end

  get '/' do
    if logged_in?
      redirect to("/profile")
    else
      erb :'/application/homepage'
    end
  end

  get '/signup' do
    if logged_in?
      redirect to("/profile")
    else
      erb :'/application/signup'
    end
  end

  post '/signup' do
    if params["username"].empty? || params["email"].empty? || params["password"].empty?
      flash[:message] = "Please ensure all fields are completed. A username, email and password is required for registration."
      redirect to("/signup")
    else
      @user = User.create(username: params["username"], email: params["email"], password: params["password"])
      session[:user_id] = @user.id
    end

    if session[:user_id] == @user.id
      redirect to("/profile")
    else
      redirect to("/signup")
    end
  end

  helpers do

    def current_user
      User.find_by(id: session[:user_id])
    end

    def logged_in?
      !!session[:user_id]
    end

  end

end
