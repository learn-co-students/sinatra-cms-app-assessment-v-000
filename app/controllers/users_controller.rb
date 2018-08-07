class UsersController < ApplicationController

  get '/signup' do
    if logged_in?
      redirect '/account'
    else
      erb :"users/signup"
    end
  end

  get '/login' do
    if logged_in?
      redirect '/account'
    else
      erb :"users/login"
    end
  end

  post '/signup' do
    if params[:first_name].empty? || params[:last_name].empty? || params[:email].empty? || params[:title].empty? || params[:password].empty?
      redirect '/signup'
    else
      @user = User.create(params)
      session[:user_id] = @user.id
      redirect '/account'
    end
  end

  post '/login' do
    @user = User.find_by(:email => params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect '/account'
    else
      redirect '/signup'
    end
  end

  get '/account' do
    if logged_in?
      @organization = Organization.where(:user_id => current_user.id)
      erb :"users/index"
    else
      redirect '/login'
    end
  end

  get '/logout' do
    session.destroy
    redirect '/login'
  end

end
