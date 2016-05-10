class TouristsController < ApplicationController 
  get "/tourists" do
    redirect_if_not_logged_in 
    @tourists = Tourist.all
    erb :'tourists/index'
  end

  get "/tourists/new" do
    redirect_if_not_logged_in 
    @error_message = params[:error]
    erb :'tourists/new'
  end

  get "/tourists/:id/edit" do
    redirect_if_not_logged_in 
    @error_message = params[:error]
    @tourist = Tourist.find(params[:id])
    erb :'tourists/edit'
  end

  post "/tourists/:id" do
    redirect_if_not_logged_in 
    @tourist = Tourist.find(params[:id])
    unless Tourist.valid_params?(params)
      redirect "/tourists/#{@tourist.id}/edit"
    end
    @tourist.update(params.select{|k|k=="name" || k=="nationality" || k=="cruise_ship_id"})
    redirect "/tourists/#{@tourist.id}"
  end

  get "/tourists/:id" do
    redirect_if_not_logged_in 
    @tourist = Tourist.find(params[:id])
    erb :'tourists/show'
  end

  post "/tourists" do
    redirect_if_not_logged_in 
    unless Tourist.valid_params?(params)
      redirect "/tourists/new"
    end
    # @user = User.find(params[:id])

    @tourist = Tourist.create(params)
    redirect "/tourists"
  end
end