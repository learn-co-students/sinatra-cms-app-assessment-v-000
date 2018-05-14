class UsersController < ApplicationController

  get '/users/:id' do
    if Helper.current_user(session) == User.find_by_id(params[:id])
      @user = User.find_by_id(params[:id])
      @logs = @user.sleeplogs
      @sleep_only_logs = @logs.where(kind: "sleep")
      erb :'users/show'
    elsif Helper.is_logged_in?(session)
      redirect to "/users/#{session[:user_id]}"
    else
      flash[:message] = "You must be logged in to view your account page."
      redirect to '/'
    end
  end

end
