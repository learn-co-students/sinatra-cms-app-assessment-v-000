require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    #set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "password_security"
  end

  get '/' do
    @orgs = Organization.all
    @cats = Category.all
    erb :'/index'
  end

  get '/developer' do
    @users = User.all
    @orgs = Organization.all
    @cats = Category.all
    erb :'/users/developer'
  end

  helpers do

    def logged_in?
      !!session[:user_id]
    end

    def current_user
      User.find(session[:user_id])
    end

  end

end
