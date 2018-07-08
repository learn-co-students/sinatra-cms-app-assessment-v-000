require "pry"
require "rack-flash"
class UserController < ApplicationController
  use Rack::Flash

  get '/users/:slug' do
      @user = User.find_by_slug(params[:slug])
      erb :'users/show'
    end

    get '/signup' do
      if !logged_in?
          flash[:message] = "Please sign up before you sign in"
        erb :'users/create_user'
      else
        redirect to '/games'
      end
    end

    post '/signup' do
      if params[:username] == "" || params[:password] == ""
        redirect to '/signup'
      else
        @user = User.new(:username => params[:username], :password => params[:password])
        @user.save
        session[:user_id] = @user.id
        redirect to '/games'
      end
    end

    get '/login' do
      if !logged_in?
        erb :'users/login'
      else
        redirect '/games'
      end
    end

    post '/login' do
      user = User.find_by(:username => params[:username])
      if user && user.authenticate(params[:username]) && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect "/games"
      else
        redirect to '/signup'
      end
    end

    get '/logout' do
      if logged_in?
        session.clear
        redirect to '/login'
      else
        redirect to '/'
      end
    end

    get '/home' do
      if logged_in?
        redirect to '/games'
      end
    end
  end
