require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'application/views'
    enable :sessions
    set :session_secret, "secret"
  end

  get '/' do
    erb :'/application/homepage'
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
