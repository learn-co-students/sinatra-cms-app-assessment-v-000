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
    erb :'/sleeplogs/new'
  end

end
