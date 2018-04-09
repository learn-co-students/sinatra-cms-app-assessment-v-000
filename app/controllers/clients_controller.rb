class ClientsController < ApplicationController

# CLIENTS INDEX PAGE
  get '/clients' do
    if logged_in?
    @user = User.find(session[:user_id])
    erb :'/clients/index'
    else
# Show Error msg and redirect to Index page
# "You must be logged in to view this page"
      erb :'/error'
    end
  end
# CREATE CLIENT
  get '/clients/new' do
    if logged_in?
      @user = User.find(session[:user_id])
    erb :'/clients/new'
    else
# Show Error msg and redirect to Index page
# "You must be logged in to view this page"
      erb :'/error'
    end
  end

  post '/clients' do
    @client = Client.new(:first_name => params["first_name"], :last_name => params["last_name"], :aka_name => params["aka_name"], :age => params["age"], :gender => params["gender"], :need=> params["need"])
    @client.user_id = current_user.id
    @client.save
    product_array = params[:products]
    product_array.each {|product| ClientProduct.create(:client_id => @client.id, :product_id => product.to_i)}
    @user = current_user
    erb :'/clients/index'
    end

# EDIT CLIENT
  get '/clients/:id/edit' do
    client_id = params[:id].to_i
    @client = Client.find(client_id)
    @user = current_user
    if !!!@client
      #raise error msg
      erb :'/error'
    end
    if @user.clients.include?(@client)
      erb :'/clients/edit'
    else
      erb :'/error'
    end
  end


  patch '/clients/:id' do
    @client = Client.find(params[:id])
    @client.update(first_name: params[:first_name], last_name: params[:last_name], aka_name: params[:aka_name], age: params[:age], need: params[:need])
    params[:gender] ? @client.update(gender: params[:gender]) : nil
    @client.user ||= current_user
    if @client.save
      redirect to "/clients/#{params[:id]}"
    else
      erb :'/error'
    end
  end
# SHOW CLIENT
  get '/clients/:id' do
    @client = Client.find(params[:id])
    @user = current_user
    if @client
      erb :'/clients/show'
    else
#Raise error msg and reload users index page
      erb :'/error'
    end
  end
#DELETE CLIENT
  delete '/clients/:id/delete' do
    @client = Client.find_by_id(params[:id])
    @client.delete
    redirect to '/clients'
  end
end
