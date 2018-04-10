require 'rack-flash'
class ApplicationController < Sinatra::Base
  use Rack::Flash

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "people_matter"
  end

# HOME PAGE
  get '/' do
    if logged_in?
      @user= current_user
      redirect to :"/users/#{@user.id}"
    else
      erb :index
    end
  end

#SIGNUP PAGE
  get '/signup' do
    if logged_in?
      @user= current_user
      redirect to :"/users/#{@user.id}"
    else
      erb :'/users/new'
    end
  end

	post '/signup' do
    @user = User.new(params)
    if @user.save
      session[:user_id] = @user.id
      @user= current_user
      redirect to :"/users/#{@user.id}"
    else
# display error msg when reloading signup form
      erb :'/error'
  	end
	end
#LOGIN
	get '/login' do
    if logged_in?
      @user= current_user
      redirect to :"/users/#{@user.id}"
      else
        erb :'/login'
    end
  end

	post '/login' do
    user = User.find_by(:username => params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect to :"/users/#{user.id}"
    else
      erb :'/error'
    end
	end
# LOGOUT
	get '/logout' do
		session.clear
		redirect '/'
	end
# HELPERS
  helpers do

    def logged_in?
      !!session[:user_id]
    end

    def current_user
      @current_user ||= User.find(session[:user_id])
    end
  end
end
