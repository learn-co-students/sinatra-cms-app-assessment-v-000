class UsersController < ApplicationController

# USERS INDEX
  get '/users' do
    if logged_in?
      @user = current_user
      erb :'/users/index'
    else
      erb :'/error'
    end
  end
# EDIT USER
  get '/users/:id/edit' do
    if logged_in?
      @user = current_user
      erb :'/users/edit'
    else
      erb :'/error'
    end
  end

  patch '/users/:id' do
    @user = current_user
    @user.update(first_name: params[:first_name], last_name: params[:last_name], email: params[:email])
    @user.errors.full_messages
    if @user.save
      redirect to "/users/#{@user.id}"
    else
      erb :'/error'
    end
  end
# USER SHOW PAGE
  get '/users/:id' do
    @user = User.find(params[:id])
    if @user
      erb :'/users/show'
    else
#Raise error msg and reload users index page
      erb :'/error'
    end
  end
# DELETE USER
# # Need to also find references in Client.all and ClientProduct.all and remove them!!
  delete '/users/:id/delete' do
    if logged_in?
      @user.destroy
    else
      redirect to '/login'
    end
  end
end
