require 'rack-flash'

class MusiciansController < Sinatra::Base

  set :public_folder, 'public'
  set :views, 'app/views'
  set :session_secret, "secret"
  enable :sessions
  use Rack::Flash


  get '/signup' do
    erb :'musicians/create'
  end

  post '/signup' do
    if !session[:id]
      @musician = Musician.new(username: params[:username], password: params[:password])

      if @musician.save
        flash[:message] = "Please Log In."
        redirect "/login"
      else
        flash[:message] = "Please Create a Password."
        redirect "/signup"
      end
    end
  end

  get '/login' do
    erb :'musicians/login'
  end


end
