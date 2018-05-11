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
    erb :'index'
  end

  get '/login' do
    erb :'login'
  end

  get '/sign-up' do
    erb :'sign-up'
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
end
