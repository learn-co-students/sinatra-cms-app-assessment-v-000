require 'rack-flash'
require 'pry'

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
    @musician = Musician.new(username: params[:username], password: params[:password])
    if @musician.save
      session[:id] = @musician.id
      redirect to "/musicians/#{@musician.slug}"
    else
      flash[:message] = "Please Create a Password."
      redirect to "/signup"
    end
  end

  get '/login' do
    erb :'musicians/login'
  end

  post '/login' do
    @musician = Musician.find_by(:username => params[:username])

    if @musician && @musician.authenticate(params[:password])
        session[:id] = @musician.id
        redirect to "/musicians/#{@musician.slug}"
    else
        flash[:message] = "Put the bong down.  Please Try Again."
        redirect to "/login"
    end
  end

  get '/musicians/:slug' do
    @musician = Musician.find_by_slug(params[:slug])
    erb :'musicians/show'
  end

end
