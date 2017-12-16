require './config/environment'
require "./app/models/user"
require "./app/models/shoe"

class ApplicationController < Sinatra::Base

    configure do
     set :public_folder, 'public'
     set :views, 'app/views'
     enable :sessions
    end

end
