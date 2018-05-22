require './config/environment'
require 'rack-flash'
class ApplicationController < Sinatra::Base
  use Rack::Flash

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret"
  end

  get '/' do
    if Helper.is_logged_in?(session)
      redirect to "/users/#{session[:user_id]}"
    else
      erb :'index'
    end
  end

  get '/login' do
    if Helper.is_logged_in?(session)
      redirect to "/users/#{session[:user_id]}"
    else
      erb :'login'
    end
  end

  get '/sign-up' do
    if Helper.is_logged_in?(session)
      redirect to "/users/#{session[:user_id]}"
    else
      erb :'sign-up'
    end
  end

  post '/sign-up' do
    if params[:email] != "" && params[:name] != "" && params[:password] != "" && User.find_by_email(params[:email]) == nil
      @user = User.create(params)
      session[:user_id] = @user.id
      redirect to "/users/#{@user.id}"
    elsif params[:email] == "" || params[:name] == "" || params[:password] == ""
      flash[:message] = "You must fill in all required fields."
      redirect to '/sign-up'
    elsif User.find_by_email(params[:email]) != nil
      flash[:message] = "An account already exists for the email you entered."
      redirect to '/login'
    end
  end

  post '/login' do
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:message] = "Welcome back."
      redirect to "/users/#{@user.id}"
    else
      flash[:message] = "The email and password your entered do not match our records."
      redirect to '/login'
    end
  end

  post '/logout' do
    session.clear
    flash[:message] = "You have successfully logged out."
    redirect to '/login'
  end
end
