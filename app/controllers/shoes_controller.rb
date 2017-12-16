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
      newshoe = Shoe.create(name: params[:name], color: params[:color], brand: params[:brand])
      current_user.shoes << newshoe
      redirect :"/users/#{current_user.slug}"
    else
      redirect :"/shoes/new"
    end
  end

  get "/shoes/:slug" do

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

  get "/shoes/:slug/edit" do
    if logged_in?
      @shoe = Shoe.find_by_slug(params[:slug])
      if current_user.shoes.include?(@shoe)
        erb :"shoes/edit"
      else
        redirect :"/users/#{current_user.slug}"
      end
    else
      redirect :"/login"
    end
  end

  patch "/shoes/:slug" do
    if params[:name] != "" && params[:name] != nil
      @shoe = Shoe.find_by_slug(params[:slug])
      @shoe.update(name: params[:name], color: params[:color], brand: params[:brand])
      redirect :"/users/#{current_user.slug}"
    else
      redirect :"/shoes/#{@shoe.slug}/edit"
    end
  end


end
