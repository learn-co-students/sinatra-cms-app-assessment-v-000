require 'sinatra/base'
require 'sinatra/flash'

class MusiciansController < Sinatra::Base
  set :public_folder, 'public'
  set :views, 'app/views'
  set :session_secret, "secret"
  enable :sessions
  register Sinatra::Flash

  get '/signup' do
    erb :'musicians/create'
  end

  # flash notice problem
  post '/signup' do
    @musician = Musician.new(username: params[:username], password: params[:password])
    if @musician.save
      session[:id] = @musician.id
      redirect to "/musicians/#{@musician.slug}"
    else
      flash[:notice] = "Please input a password"
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
      flash[:notice] = "Please input a password"
      redirect to "/login"
    end
  end

  get '/musicians/:slug' do
    if session[:id]
      @musician = Musician.find_by_slug(params[:slug])
      erb :'musicians/show'
    end
  end

  get '/logout' do
    session.clear
    redirect to "/"
  end
end
