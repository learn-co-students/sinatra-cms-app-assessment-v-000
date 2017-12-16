class ShoesController < ApplicationController

  get "/shoes/new" do

    if logged_in?
      erb :"shoes/new"
    else
      redirect :"/login"
    end
  end

  post "/shoes" do
        # binding.pry
    if params[:name] && params[:name] != ""
      newshoe = Shoe.create(name: params[:name])
      current_user.shoes << newshoe
      redirect :"/users/#{current_user.slug}"
    else
      redirect :"/shoes/new"
    end
  end

  get "/shoes/:slug" do
    binding.pry
    if logged_in?
      @shoe = Shoe.find_by_slug(params[:slug])
      if current_user.shoes.include?(@shoe)
        erb :"shoes/show"
      else
        redirect :"/users/#{current_user.slug}"
      end
    else
      redirect :"/login"
    end
  end

end
