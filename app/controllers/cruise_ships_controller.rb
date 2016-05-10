class CruiseShipsController < ApplicationController 

  get "/ships" do
    redirect_if_not_logged_in
    @ships = CruiseShip.all
    erb :'cruise_ships/index'
  end

  get "/ships/new" do
    redirect_if_not_logged_in
    @error_message = params[:error]
    erb :'cruise_ships/new'
  end

  get "/ships/:id/edit" do
    redirect_if_not_logged_in
    @error_message = params[:error]
    @ship = CruiseShip.find(params[:id])
    erb :'cruise_ships/edit'
  end

  post "/ships/:id" do
    redirect_if_not_logged_in
    @ship = CruiseShip.find(params[:id])
    unless CruiseShip.valid_params?(params)
      redirect "/ships/#{@ship.id}/edit"
    end
    @ship.update(params.select{|k|k=="name" || k=="capacity"})
    redirect "/ships/#{@ship.id}"
  end

  get "/ships/:id" do
    redirect_if_not_logged_in
    @ship = CruiseShip.find(params[:id])
    erb :'cruise_ships/show'
  end

  post "/ships" do
    redirect_if_not_logged_in
    unless CruiseShip.valid_params?(params)
      redirect "/ships/new"
    end

    # CruiseShip.create(params)
    current_user.cruise_ships.create(params)
    redirect "/ships"
  end

 
end