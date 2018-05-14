class UsersController < ApplicationController

  get '/users/:id' do
    if Helper.current_user(session) == User.find_by_id(params[:id])
      @user = User.find_by_id(params[:id])
      @logs = @user.sleeplogs
      @sleep_only_logs = @logs.where(kind: "sleep")
      #@sleep_only_logs = []
      #@logs.each do |log|
      #  if log.kind == 'sleep'
      #    @sleep_only_logs << log
      #  end
      #end
      erb :'users/show'
    else
      flash[:message] = "You must be logged in to view your account page."
      redirect to '/'
    end
  end

end
