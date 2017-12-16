class ShoesController < ApplicationController

  get "/shoes/new" do
    # binding.pry
    if logged_in?
      erb :"shoes/new"
    else
      redirect :"/login"
    end
  end

  post "/shoes" do
    if params[:name] && params[:name] != ""
      newshoe = Shoe.create(name: params[:name])
      current_user.shoes << newshoe
      redirect :"/users/#{current_user.slug}"
    else
      redirect :"/shoes/new"
    end
  end


end
