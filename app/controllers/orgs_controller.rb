class OrgsController < ApplicationController

  get '/orgs' do
    erb :"orgs/index"
  end

  get '/orgs/new' do
    if logged_in?
      erb :"orgs/new"
    else
      redirect '/login'
    end
  end

  get '/orgs/:id/show' do
    @org = Organization.find(params[:id])
    @org.aggregate_rank = @org.aggregate_rank + 1
    @org.daily_rank = @org.daily_rank + 1
    @org.save
    erb :"orgs/show"
  end

  get '/orgs/:id/edit' do
    @org = Organization.find(params[:id])
    # In the case that a category no longer exists
    if Category.exists?(@org.category_id)
      @cat = Category.find(@org.category_id)
    else
      @org.category_id = nil
      @org.save
    end

    erb :"orgs/edit"
  end

  get '/orgs/:id/delete' do
    if logged_in?
      @org = Organization.find(params[:id])
      if @org && @org.user == current_user
        @org.delete
      elsif @org && current_user.email == "fkmccallion@hotmail.com"
        @org.delete
      end
      redirect '/account'
    else
      redirect '/login'
    end
  end

  post '/orgs/new' do

    @org = Organization.new("name" => params[:name],
      "address" => params[:address],
      "phone" => params[:phone],
      "email" => params[:email],
      "website" => params[:website],
      "description" => params[:description],
      "account" => params[:account],
      "aggregate_rank" => 1,
      "daily_rank" => 1,
      "city" => params[:city],
      "state" => params[:state],
      "zip" => params[:zip])

    @org.user_id = current_user.id

    # If both an existing category is selected and a new one is entered - the new category will take precedence
    if !params["category"]["name"].empty?
      cat = Category.find_by(:name => params[:category][:name])
      if cat
        @org.category_id = cat.id
      else
        cat = Category.create("name" => params[:category][:name])
        @org.category_id = cat.id
      end
    elsif params.key?("category_id")
      @org.category_id = params["category_id"]
    end

    @org.save

    redirect '/account'
  end

  post '/orgs/:id/edit' do
    @org = Organization.find(params[:id])
    if @org && @org.user == current_user
      params.each_pair do |k,v|
        if !(v.empty? || k == "id" || k =="category")
          case k
          when "name"
            @org.name = v
          when "address"
            @org.address = v
          when "phone"
            @org.phone = v
          when "email"
            @org.email = v
          when "website"
            @org.website = v
          when "description"
            @org.description = v
          when "city"
            @org.city = v
          when "state"
            @org.state = v
          when "zip"
            @org.zip = v
          when "account"
            @org.account = v
          end
        end
      end
    end

    # If both an existing category is selected and a new one is entered - the new category will take precedence
    if !params["category"]["name"].empty?
      cat = Category.find_by(:name => params[:category][:name])
      if cat
        @org.category_id = cat.id
      else
        cat = Category.create("name" => params[:category][:name])
        @org.category_id = cat.id
      end
    elsif params.key?("category_id")
      @org.category_id = params["category_id"]
    end

    @org.save

    redirect '/account'
  end

end
