class UsersController < ApplicationController 

  get '/users/:id' do
    if !logged_in?
      redirect '/ships'
    end

    @user = User.find(params[:id])
    if !@user.nil? && @user == current_user
      erb :'users/show'
    else
      redirect '/ships'
    end
  end

  get '/signup' do
    if !session[:user_id]
      erb :'users/new'
    else
      redirect to '/tourists'
    end
  end

  post '/signup' do 
    if params[:username] == "" || params[:password] == ""
      redirect to '/signup'
    else
      @user = User.create(:username => params[:username], :password => params[:password])
      session[:user_id] = @user.id
      redirect '/ships'
    end
  end

  get '/login' do 
    @error_message = params[:error]
    if !session[:user_id]
      erb :'users/login'
    else
      redirect '/ships'
    end
  end

  post '/login' do
    user = User.find_by(:username => params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect "/ships"
    else
      redirect to '/signup'
    end
  end

  get '/logout' do
    if session[:user_id] != nil
      session.destroy
      redirect to '/login'
    else
      redirect to '/'
    end
  end

end