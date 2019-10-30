class SneakersController < ApplicationController

  # GET: /sneakers
  get "/sneakers" do
    @sneakers = Sneaker.all
    erb :"/sneakers/index.html"
  end

  # GET: /sneakers/new
  get "/sneakers/new" do
    @users = User.all
    erb :"/sneakers/new.html"
  end

  # POST: /sneakers
  post "/sneakers" do
    #below works with properly formatted params in HTML form
    @sneaker = Sneaker.new(params[:sneaker]) #create new sneaker

    if @sneaker.save #saves new sneaker or returns false if unsuccessful
      redirect '/sneakers' #redirect back to sneakers index page
    else
      erb :'sneakers/new' # show new sneakers view again(potentially displaying errors)
    end
  #   redirect "/sneakers"
  end

  # GET: /sneakers/5
  get "/sneakers/:id" do
    #gets params from url

    @sneaker = Sneaker.find(params[:id]) #define instance variable for view

    erb :'sneakers/show' #show single sneaker view

    end
  #   erb :"/sneakers/show.html"
  end

  # GET: /sneakers/5/edit
  get "/sneakers/:id/edit" do
    #get params from url
    @sneaker = Sneaker.find(params[:id]) #define intstance variable for view

    erb :'sneakers/edit' #show edit sneaker view

  end
  #   erb :"/sneakers/edit.html"


  # PATCH: /sneakers/5
  patch "/sneakers/:id" do
    #get params from url
    @sneaker = Sneaker.find(params[:id]) #define variable to edit

    @sneaker.assign_attributes(params[:sneaker]) #assign new attributes

    if @sneaker.save #saves new sneaker or returns false if unsuccessful
      redirect '/sneakers' #redirect back to sneakers index page
    else
      erb :'sneakers/edit' #show edit sneaker view again(potentially displaying errors)
  end
  #   redirect "/sneakers/:id"

  # DELETE: /sneakers/5/delete
  delete "/sneakers/:id/delete" do
    #get params from url
    @sneaker = Sneaker.find(params[:id]) #define sneaker to delete

    @sneaker.destroy #delete sneaker

    redirect '/sneakers' #redirect back to sneakers index page

  end

end
  #   redirect "/sneakers"
  # end
