class ShoesController < ApplicationController

  get "/shoes/new" do

    if logged_in?
      erb :"shoes/new"
    else
      redirect :"/login"
    end
  end

  post "/shoes" do
    newshoe = current_user.shoes.build(name: params[:name], color: params[:color], brand: params[:brand])
    if newshoe.save
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
      if @shoe = current_user.shoes.find_by_slug(params[:slug])
        erb :"shoes/edit"
      else
        redirect :"/users/#{current_user.slug}"
      end
    else
      redirect :"/login"
    end
  end

  patch "/shoes/:slug" do
    # logged_in?
    if params[:name] != "" && params[:name] != nil
      @shoe = Shoe.find_by_slug(params[:slug]) # does show belong to current_user?
      @shoe.update(name: params[:name], color: params[:color], brand: params[:brand])
      redirect :"/users/#{current_user.slug}"
    else
      redirect :"/shoes/#{@shoe.slug}/edit"
    end
  end


  delete "/shoes/:slug/delete" do
      # binding.pry
      if logged_in?
        @shoe = Shoe.find_by_slug(params[:slug])
        if current_user.shoes.include?(@shoe)
          @shoe.delete
          redirect :"/users/#{current_user.slug}"
        else
          redirect :"/users/#{current_user.slug}"
        end
      else
        redirect :"/login"
      end
    end
end
