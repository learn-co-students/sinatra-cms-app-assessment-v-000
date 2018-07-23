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
      redirect to("/account")
      erb :'/users/account'
    else
      erb :'/users/login'
    end
  end

  post '/login' do
    @user = User.find_by(username: params[:username])

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect to("/account")
    else
      redirect to("/")
    end

  end

  get '/users/:slug' do
    @user = User.find_by_slug(params[:slug])
    erb :'/users/show'
  end

  get '/logout' do
    if !logged_in?
      session.clear
      redirect to("/")
    else
      session.clear
      redirect to("/login")
    end
  end

end
