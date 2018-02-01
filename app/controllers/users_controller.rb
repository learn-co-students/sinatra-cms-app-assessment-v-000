class UsersController < ApplicationController

  get '/signup' do
    if logged_in?
      redirect to '/workouts'
    else
      erb :'users/signup'
    end
  end

  post '/signup' do
    if params["username"]=="" || params["email"]=="" || params["password"]==""
     redirect to "/signup"
    else
      @user = User.create(:username => params[:username], :email => params[:email], :password => params[:password])
       session[:user_id] = @user.id
       redirect to '/workouts'
    end
  end

  get '/login' do
    if logged_in?
      redirect to '/workouts'
    else
      erb :'users/login'
    end
  end

  post '/login' do
    @user=User.find_by(username: params[:username])
      if @user && @user.authenticate(params[:password])
        session[:user_id]=@user.id
        redirect to '/workouts'
      else
         redirect to '/login'
       end
  end

  get '/logout' do
    if logged_in?
      session.clear
      redirect to '/login'
    end
    redirect to '/'
  end

  get '/users/:slug' do
    @user=User.find_by_slug(params[:slug])
      erb :'users/show'
  end


end
