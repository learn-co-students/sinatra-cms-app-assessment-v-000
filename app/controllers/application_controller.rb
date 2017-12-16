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



    helper do
      def logged_in?
  			!!session[:user_id]
  		end

  		def current_user
  			User.find(session[:user_id])
  		end
    end
end
