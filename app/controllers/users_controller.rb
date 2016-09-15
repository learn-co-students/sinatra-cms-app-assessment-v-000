class UsersController < ApplicationController

  get '/users/:id' do
    if !logged_in?
      redirect '/bags'
    end

    @user = User.find(params[:id])
    if !@user.nil? && @user == current_user
      redirect to '/teams/show'
    else
      redirect '/login'
    end
  end

  get '/signup' do
    if !session[:user_id]
      erb :'users/new'
    else
      redirect to '/teams/show'
    end
  end

  post '/signup' do
    if params[:username] == "" || params[:password] == ""
      redirect to '/signup'
    else
      @user = User.create(:username => params[:username], :password => params[:password])
      session[:user_id] = @user.id
      redirect '/teams/show'
    end
  end

  get '/login' do
    @error_message = params[:error]
    if !session[:user_id]
      erb :'users/login'
    else
      redirect '/teams/show'
    end
  end

  post '/login' do
    if params[:username] == "" || params[:password] == ""
      redirect to '/login'
    end
    user = User.find_by(:username => params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect "/teams/show"
    else
      redirect to '/login'
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
