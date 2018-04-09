class ProductsController < ApplicationController

# PRODUCTS INDEX PAGE
  get '/products' do
    if logged_in?
    @user = User.find(session[:user_id])
    erb :'/products/index'
    else
# Show Error msg and redirect to Index page
# "You must be logged in to view this page"
      erb :'/error'
    end
  end
# CREATE PRODUCT
  get '/products/new' do
    if logged_in?
      @user = User.find(session[:user_id])
    erb :'/products/new'
    else
# Show Error msg and redirect to Index page
# "You must be logged in to view this page"
      erb :'/error'
    end
  end

  post '/products' do
    @product = Product.new
    @product.update(name: params[:name], description: params[:description], gender: params[:gender], size: params[:size], quantity: params[:quantity])

    if @product.save
      redirect to "/products/#{@product.id}"
    else
# Show Error msg and redirect them somewhere
      erb :'/error'
    end
  end
# EDIT PRODUCT
  get '/products/:id/edit' do
    product_id = params[:id].to_i
    @product = Product.find(product_id)
    if !!@product

      erb :'/products/edit'
    else
#raise error msg
      erb :'/error'
    end
  end

  patch '/products/:id' do
    @product = Product.find(params[:id])
    @product.update(name: params[:name], description: params[:description], size: params[:size], quantity: params[:quantity])
    params[:gender] ? @product.update(gender: params[:gender]) : nil
    if @product.save
      redirect to "/products/#{params[:id]}"
    else
      erb :'/error'
    end
  end
# SHOW PRODUCT
  get '/products/:id' do
    @product = Product.find(params[:id])
    if @product
      erb :'/products/show'
    else
#Raise error msg and reload users index page
      erb :'/error'
    end
  end
#DELETE PRODUCT

  delete '/products/:id/delete' do
    @product = Product.find_by_id(params[:id])
    @product.delete
    redirect to '/products'
  end
end
