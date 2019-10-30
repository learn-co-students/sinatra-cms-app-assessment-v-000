class UsersController < ApplicationController

  # GET: /users
  get "/users" do
    @users = User.all
    erb :"/users/index"
  end

  # GET: /users/new
  get "/users/new" do
    erb :"/users/new"
  end

  # POST: /users
  post "/users" do
    #below works with properly formatted params in HTML form
    @user = User.new(params[:user]) #create new user
    @user.save
    session[:user_id] = @user.id
    redirect '/users'
    # redirect "/users"
  end

  # GET: /users/5
  get "/users/:id" do
    #gets params from url
    @user = User.find(params[:id]) #define instance variable for view
    erb :"users/show" #show single user view
  end

  # GET: /users/5/edit
  get "/users/:id/edit" do
    #get params from url
    @user = User.find(params[:id]) #define intstance variable for view
    erb :"/users/edit"
  end

  # PATCH: /users/5
  patch "/users/:id" do
    @user = User.find(params[:id]) #define variable to edit

    @user.assign_attributes(params[:user]) #assign new attributes

    if @user.save #saves new user or returns false if unsuccessful
      redirect '/users' #redirect back to users index page
    else
      erb :'users/edit' #show edit user view again(potentially displaying errors)
    end
    # redirect "/users/:id"
  end

  # DELETE: /users/5/delete
  delete "/users/:id/delete" do
    #get params from url
    @user = User.find(params[:id]) #define user to delete

    @user.destroy #delete user
    redirect "/users"
  end
end
