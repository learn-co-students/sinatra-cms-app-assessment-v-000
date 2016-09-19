class UsersController < ApplicationController

  get '/users/:id' do
    if !logged_in?
      redirect '/teams'
    end

    @user = User.find(params[:id])
    if !@user.nil? && @user == current_user
      redirect to '/teams'
    else
      redirect '/login'
    end
  end

  get '/signup' do
    @error_message = params[:error]
    if !session[:user_id]
      erb :'users/new'
    else
      redirect to '/teams'
    end
  end

  post '/signup' do
    if params[:username] == "" || params[:password] == ""
      redirect "/signup?error=invalid username/password"
    else
      @user = User.create(:username => params[:username], :password => params[:password])
      session[:user_id] = @user.id
      redirect '/teams'
    end
  end

  get '/login' do
    @error_message = params[:error]
    if !session[:user_id]
      erb :'users/login'
    else
      redirect '/teams'
    end
  end

  post '/login' do
    if params[:username] == "" || params[:password] == ""
      redirect "/login?error=Invalid username/password"
    end
    user = User.find_by(:username => params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect "/teams"
    else
      redirect "/login?error=invalid username/password"
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
