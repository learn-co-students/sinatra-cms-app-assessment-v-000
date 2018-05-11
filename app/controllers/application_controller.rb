require './config/environment'
require 'rack-flash'
class ApplicationController < Sinatra::Base
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
    if params[:name] != "" && params[:email] != "" && params[:password] != ""
      @user = User.create(params)
      session[:user_id] = @user.id
    end
  end
end
