class UsersController < ApplicationController
  use Rack::Flash

  get '/signup' do
    if logged_in?
      redirect to '/workouts'
    else
      erb :'users/signup'
    end
  end

  post '/signup' do
    if params["username"]=="" || params["email"]=="" || params["password"]==""
       flash[:error] = "Make sure you fill out every input field."
     redirect to "/signup"
    else
      @user = User.create(:username => params[:username], :email => params[:email], :password => params[:password])
       session[:user_id] = @user.id
       flash[:success] = "You have successfully signed up!"
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
    if params["username"]=="" || params["password"]==""
       flash[:error] = "Make sure you fill out every input field."
       redirect to "/login"
    end

    @user=User.find_by(username: params[:username])
      if @user && @user.authenticate(params[:password])
        session[:user_id]=@user.id
        flash[:success] = "You have successfully signed in!"
        redirect to '/workouts'
      else
         redirect to '/login'
       end
  end

  get '/logout' do
    if logged_in?
      session.clear
      flash[:success] = "You have logged out!"
      redirect to '/'
    end
    redirect to '/'
  end

  get '/users/:username' do
      @user=User.find_by(username: params[:username])
      if logged_in?
        erb :'users/index'
       else
        redirect to '/login'
    end
  end

  post '/search' do
    @user=User.find_by(username: params[:search])
    if logged_in?
      if @user
        redirect to "/users/#{@user.username}"
      else
        redirect to '/workouts'
      end
    else
      redirect to '/login'
    end
  end
end
