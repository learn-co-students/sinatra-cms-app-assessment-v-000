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

  get '/users/:id/delete' do
    @user = User.find(params[:id])
    if @user && current_user.id == 1
      @user.delete
      redirect '/developer'
    else
      redirect '/account'
    end
  end

  get '/users/:id/edit' do
    @user = User.find(params[:id])
    erb :"users/edit"
  end

  post '/users/:id/edit' do
    @user = User.find(params[:id])
    if @user && (@user == current_user || current_user.email == "fkmccallion@hotmail.com")
      params.each_pair do |k,v|
        if !(v.empty? || k == "id")
          case k
          when "first_name"
            @user.first_name = v
          when "last_name"
            @user.last_name = v
          when "nickname"
            @user.nickname = v
          when "title"
            @user.title = v
          when "email"
            @user.email = v
          end
        end
      end
    end
    @user.save
    if current_user.email == "fkmccallion@hotmail.com"
      redirect '/developer'
    else
      redirect '/account'
    end
  end

  get '/logout' do
    session.destroy
    redirect '/login'
  end

end
