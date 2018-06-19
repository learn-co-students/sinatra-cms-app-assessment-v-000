class UserController < ApplicationController

  get '/users/:slug' do
    @user = User.find_by_slug(params[:slug])
    erb :'/users/show'
  end

  get '/login' do
    if !logged_in?
      erb :'/users/login'
    else
      redirect '/games'
    end
  end

  post '/login' do
    user = User.find_by(:username => params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect "/games"
    else
      redirect '/signup'
    end
  end

  get '/signup' do
    if !logged_in?
      erb :'/users/create_user', locals: {message: "Please sign up before you sign in"}
    else
      redirect to '/games'
    end
  end

  post '/signup' do
    if params[:username] == "" || params[:password] == ""
      redirect to "/signup"
    else
      @user = User.new(:username => params[:username], :password => params[:password])
      @user.save
      session[:user_id] = @user.id
      redirect "/games"
    end
  end

  get "/logout" do
    if logged_in?
      session.destroy
      redirect '/login'
    else
      redirect '/'
    end
  end
end
