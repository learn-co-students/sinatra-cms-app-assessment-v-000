require './config/environment'
require "./app/models/user"
require "./app/models/shoe"

class ApplicationController < Sinatra::Base

    configure do
     set :public_folder, 'public'
     set :views, 'app/views'
     enable :sessions
     set :session_secret, "secret"
    end

    get "/" do
      erb :index
    end

    get "/signup" do
      if logged_in?
        redirect :"/shoes"
      else
        erb :signup
      end
    end

    post "/signup" do
      @user = User.new(username: params[:username], password: params["password"])
      if params[:username] == "" || params[:password] == ""
        erb :signup
      else
        if @user.save
          session[:user_id] = @user.id
          redirect :"/users/#{@user.slug}"
        else
          erb :signup
        end
      end
    end


    get "/login" do
      if logged_in?
        redirect :"/users/#{current_user.slug}"
      else
        erb :login
      end
    end

    post "/login" do
      user = User.find_by(username: params["username"])
      if user && user.authenticate(params["password"])
        session[:user_id] = user.id
        redirect :"/users/#{current_user.slug}"
      else
        redirect :"/login"
      end
    end

    get "/logout" do
      if logged_in?
        session.clear
        redirect :"/login"
      else
        redirect :"/"
      end
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
