require './config/environment'
require 'pry'

class ApplicationController < Sinatra::Base
  configure do
    set :views, 'app/views'
    set :public_folder, 'public'
    enable :sessions
    set :session_secret, "arcticmonkeys"
  end

  get '/' do
    erb :index
  end

  helpers do
    def is_logged_in?
      session.has_key?(:id) ? true : false
    end

    def current_user
      Player.find_by_id(session[:id])
    end
  end
end