class UsersController < ApplicationController

  get '/users/:id' do
    if Helper.current_user(session) == User.find_by_id(params[:id])
      erb :'users/show'
    else
      flash[:message] = "You must be logged in to view your account page."
      redirect to '/'
    end
  end

  get '/sleeplogs/new' do
    if Helper.is_logged_in?(session)
      erb :'/sleeplogs/new'
    else
      flash[:message] = "You must be logged in to add a log."
      redirect to '/'
    end
  end

  post '/sleeplogs/index' do
    @log = Sleeplog.create(params)
    @user = User.find_by_id(session[:user_id])
    @user.sleeplogs << @log
    binding.pry
    redirect to '/'
  end

end
