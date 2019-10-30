require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/" do
    erb :welcome
  end

  get "/login" do
      erb :login
    end

  get "/hello" do
    @user = User.find_by(params[:id])
    @sneakers = Sneaker.find_by(params[:user_id])
      erb :hello
    end

  post "/login" do
    @user = User.find_by(params[:id])
    if @user
      session[:user_id] = @user.id && session[:user_password] = @user.password
      redirect "/hello"
    end
  end

  get "/logout" do
    session.clear

    redirect to "/"
  end

end
