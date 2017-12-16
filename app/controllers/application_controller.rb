require './config/environment'
require "./app/models/user"
require "./app/models/shoe"

class ApplicationController < Sinatra::Base

    configure do
     set :public_folder, 'public'
     set :views, 'app/views'
     enable :sessions
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
      # binding.pry
      @user = User.new(username: params["username"], password: params["password"])
      if params[:username] == nil || params[:username] == ""|| params[:password] == nil || params[:password] == ""
        redirect :"/signup"
      else
        @user.save
        session[:user_id] = @user.id
        redirect :"/shoes/#{@user.slug}"
      end
    end


    get "/login" do
      if logged_in?
        redirect :"/shoes/#{current_user.slug}"
      else
        erb :login
      end
    end

    post "/login" do
      user = User.find_by(username: params["username"])
      if user && user.authenticate(params["password"])
        session[:user_id] = user.id
        redirect :"/shoes/#{current_user.slug}"
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
