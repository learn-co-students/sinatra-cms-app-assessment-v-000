class UsersController < ApplicationController

  get '/users/new' do
    erb :'/users/create_user'
  end

  post '/users' do
    @user = User.create(username: params[:username], email: params[:email], password: params[:password])

    redirect to("/users/#{@user.slug}")
  end

  get '/login' do
    if logged_in?
      redirect to("/profile")
      erb :'/users/profile'
    else
      erb :'/users/login'
    end
  end

  post '/login' do
    @user = User.find_by(username: params[:username])

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect to("/profile")
    else
      redirect to("/")
    end

  end

  get '/profile' do
    if logged_in?
      @user = User.find_by(id: session[:user_id])
      erb :'/users/profile'
    else
      redirect to("/login")
    end
  end

  get '/users/:slug' do
    @user = User.find_by_slug(params[:slug])
    erb :'/users/profile'
  end

  get '/logout' do
    if !logged_in?
      redirect to("/")
    else
      session.clear
      redirect to("/login")
    end
  end

end
